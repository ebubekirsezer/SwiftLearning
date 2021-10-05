//
//  ViewController.swift
//  GoodWeather
//
//  Created by Ebubekir Sezer on 29.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var cityNameTextField: UITextField?
    @IBOutlet private weak var temperatureLabel: UILabel?
    @IBOutlet private weak var humidityLabel: UILabel?
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityNameTextField?.rx.controlEvent(.editingDidEndOnExit)
            .asObservable()
            .map({ self.cityNameTextField?.text })
            .subscribe(onNext: { city in
                
                if let city = city {
                    if city.isEmpty {
                        self.displayWeather(nil)
                    } else {
                        self.fetchWeather(by: city)
                    }
                }
            }).disposed(by: disposeBag)
    }
    
    private func displayWeather(_ weather: Weather?) {
        
        if let weather = weather {
            self.temperatureLabel?.text = "\(weather.temp ?? 0.0) ℉"
            self.humidityLabel?.text = "\(weather.humidity) 💦"
        } else {
            self.temperatureLabel?.text = "🙈"
            self.humidityLabel?.text =  "🚫"
        }
    }
    
    private func fetchWeather(by city: String) {
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              let url = URL.urlForWeatherAPI(city: cityEncoded) else {
            return
        }
        
        let resource = Resource<WeatherResult>(url: url)
        
//        let search = URLRequest.load(resource: resource)
//            .observe(on: MainScheduler.instance)
//            .asDriver(onErrorJustReturn: WeatherResult.empty)
        
        let search = URLRequest.load(resource: resource)
            .observe(on: MainScheduler.instance)
            .retry(3)
            .catch { error in
                print(error.localizedDescription)
                return Observable.just(WeatherResult.empty)
            }.asDriver(onErrorJustReturn: WeatherResult.empty)
        
        search.map { "\($0.main?.temp ?? 0.0) ℉" }
            .drive((self.temperatureLabel?.rx.text)!)
            .disposed(by: disposeBag)
        
        search.map( { "\($0.main?.humidity ?? 0.0) 💦" })
            .drive((self.humidityLabel?.rx.text)!)
            .disposed(by: disposeBag)
        
    }
}
