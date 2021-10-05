//
//  VideoListView.swift
//  Africa
//
//  Created by Ebubekir Sezer on 13.08.2021.
//

import SwiftUI

struct VideoListView: View {
    
    //MARK: - PROPERTIES
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - BODY
    
    var body: some View {
        NavigationView {
            List(videos) { video in
                NavigationLink(
                    destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name),
                    label: {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    })
            } //: List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        //Shuffle Videos
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
            
        } //: Navigation
    }
}

//MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
