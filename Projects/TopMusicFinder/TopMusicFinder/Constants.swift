//
//  Constants.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import UIKit

struct Constants {
    static let mainStoryboard = "Main"
    static let detailStoryBoard = "Detail"
    static let loginStoryboard = "Login"
    
    static let defaultImage = "https://redzonekickboxing.com/wp-content/uploads/2017/04/default-image-620x600.jpg"
    
    static let categories: [String : String] = [
        "Apple Music" : MediaType.appleMusic,
        "iTunes Music": MediaType.iTunesMusics,
        "iOS Apps": MediaType.apps,
        "Audio Books": MediaType.audioBooks,
        "Books": MediaType.books,
        "TV Shows": MediaType.tvShows,
        "Movies": MediaType.movies,
        "iTunes U": MediaType.iTunesU,
        "Podcasts": MediaType.podcasts,
        "Music Videos": MediaType.musicVideos
    ]
    
    struct MediaType{
        static let appleMusic = "apple-music"
        static let apps = "ios-apps"
        static let iTunesMusics = "itunes-music"
        static let books = "books"
        static let movies = "movies"
        static let audioBooks = "audiobooks"
        static let tvShows = "tv-shows"
        static let iTunesU = "itunes-u"
        static let podcasts = "podcasts"
        static let musicVideos = "music-videos"
    }
    
    struct FeedType{
        static let topSongs = "top-songs"
        static let newGamesWeLove = "new-games-we-love"
        static let topFree = "top-free"
        static let topGrossing = "top-grossing"
        static let topPaid = "top-paid"
        static let topMovies = "top-movies"
        static let topAudioBooks = "top-audiobooks"
        static let topiTunesUCourses = "top-itunes-u-courses"
        static let topMusicVideos = "top-music-videos"
        static let topPodcasts = "top-podcasts"
        static let topTvEpisodes = "top-tv-episodes"
    }
    
    struct CountryCodes {
        static let turkey = "tr"
        static let germany = "de"
        static let france = "fr"
        static let unitedStates = "us"
        static let italy = "it"
        static let unitedKingdom = "gb"
    }
}
