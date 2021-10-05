//
//  MovieBoxTests.swift
//  MovieBoxTests
//
//  Created by Ebubekir Sezer on 12.06.2021.
//

import XCTest
@testable import MovieBoxAPI
@testable import MovieBox

class MovieBoxTests: XCTestCase {
    
    private var service: MockService!
    private var view:  MockMovieListView!
    var controller: MovieListViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        service = MockService()
        view = MockMovieListView()
        controller = MovieListViewController()
        
        controller.customView = view
        controller.service = service
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMovieList() {
        
        //Given
        let movie = Movie(artistName: "Eubekir", releaseDate: Date(), name: "Ebubekir", copyright: nil, image: "", genres: [])
        service.movies = [movie]
        
        //When
        controller.loadViewIfNeeded()
        
        //Then
        XCTAssertEqual(view.isLoadingValues, [true, false])
        XCTAssertEqual(view.movieList?.count, 1)
        XCTAssertEqual(view.movieList?.first?.title, movie.name)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

private final class MockService: TopmoviesServiceProtocol {
    
    var movies: [Movie] = []

    func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void) {
        completion(.success(TopMoviesResponse(results: movies)))
    }
    
    
}

private final class MockMovieListView: MovieListViewProtocol {
    
    var delegate: MovieListViewDelegate?
    var movieList: [MoviePresentation]?
    var isLoadingValues: [Bool] = []
    
    func updateMovieList(_ movieList: [MoviePresentation]) {
        self.movieList = movieList
    }
    
    func setLoading(_ isLoading: Bool) {
        isLoadingValues.append(isLoading)
    }
    
    
}
