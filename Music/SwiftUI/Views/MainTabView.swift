//
//  MainTabView.swift
//  Music
//
//  Created by Chhailong on 29/5/24.
//

import SwiftUI


struct MainTabView: View {
    var body: some View {
        TabView {
            ListenNowView()
                .tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("Listen Now")
                }
            SampleTab("Browse", "square.grid.2x2.fill")
            SampleTab("Radio", "dot.radiowaves.left.and.right")
            NavigationStack {
                MusicLibraryView()
            }
            .tabItem {
                Image(systemName: "play.square.stack")
                Text("Library")
            }
            SampleTab("Search", "magnifyingglass")
        }
        .tint(.mint)
        
    }
    
    @ViewBuilder
    func SampleTab(_ title: String, _ icon: String) -> some View {
        Text(title)
            .tabItem {
                Image(systemName: icon)
                Text(title)
            }
//            .toolbarBackground(.visible, for: .tabBar)
//            .toolbarBackground(.ultraThickMaterial, for: .tabBar)
    }
}
