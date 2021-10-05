//
//  MovieBoxMVVMTests.swift
//  MovieBoxMVVMTests
//
//  Created by Ebubekir Sezer on 12.06.2021.
//

import XCTest
@testable import MovieBoxMVMM
@testable import MovieBoxAPI

class MovieBoxMVVMTests: XCTestCase {
    // Test Kısmına bakılması lazım
    
    private var view: MockView!
    private var viewModel: MovieListViewModel!
    private var service: MockTopMoviesService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        service = MockTopMoviesService()
        viewModel = MovieListViewModel(service: service)
        view = MockView()
        viewModel.delegate = view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        //Given
        let movie = Movie(artistName: "Eubekir", releaseDate: Date(), name: "Ebubekir", copyright: nil, image: "", genres: [])
        let movie2 = Movie(artistName: "Sezer", releaseDate: Date(), name: "Sezer", copyright: nil, image: "", genres: [])

        service.movies = [movie, movie2]
        
        //When
        viewModel.load()
        
        // Then
        switch view.outpots.first {
        case .updateTitle(_):
            break
        default:
            XCTFail("First output should be update title")
        }
        
        XCTAssertEqual(view.outpots.first, .setLoading(true))
        XCTAssertEqual(view.outpots.first, .setLoading(false))
        XCTAssertEqual(view.outpots.first, .showMovieList([]))
    }
}

private class MockView: MovieListViewModelDelegate {
    
    var outpots: [MovieListViewModelOutput] = []
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        outpots.append(output)
    }
}

private final class MockTopMoviesService: TopmoviesServiceProtocol {
    
    var movies: [Movie] = []

    func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void) {
        completion(.success(TopMoviesResponse(results: movies)))
    }
}
