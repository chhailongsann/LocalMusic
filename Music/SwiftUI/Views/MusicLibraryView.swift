//
//  MusicLibraryView.swift
//  Music
//
//  Created by Chhailong on 17/11/23.
//

import SwiftUI

struct MusicLibraryView: View {
    
    var loading = true
    @State var items: [LibraryItem] = [
        .init(icon: "music.note.list",              title: "Playlists"),
        .init(icon: "music.mic",                    title: "Artists"),
        .init(icon: "square.stack",                 title: "Albums"),
        .init(icon: "music.note",                   title: "Songs"),
        .init(icon: "music.note.tv",                title: "Music Videos"),
        .init(icon: "guitars",                      title: "Genres"),
        .init(icon: "person.2.crop.square.stack",   title: "Compilations"),
        .init(icon: "music.quarternote.3",          title: "Composers"),
        .init(icon: "arrow.down.circle",            title: "Downloaded")
    ]
    
    @State var songs = [Song]()
    
    var gridItem: [GridItem] = [
        .init(.flexible(minimum: 80, maximum: 200)),
        .init(.flexible(minimum: 80, maximum: 200))
    ]
    
    var body: some View {
            List {
                ForEach(items) { item in
                    
                    NavigationLink(destination: LibraryDetailView(item: item)) {
                        Label(item.title, systemImage: item.icon)
                    }.tint(.accentColor)
                }
                LazyVGrid(columns: gridItem, spacing: 20) {
                                ForEach(songs) { song in
                                    AlbumView(song: song)
                                }
                            }
                            .padding(.horizontal)
//                ForEach(songs) { song in
//                    AlbumView(song: song)
//                        .overlay {
//                            Button {
//                                NotificationCenter.default.post(name: .playTrack, object: song)
//                            } label: {
//                                EmptyView()
//                            }
//                            .opacity(0)
//                        }
//                }
            }
            .navigationTitle("Library")
            .listStyle(.plain)
            .onAppear {
                if self.songs.isEmpty {
                    Task {
                        await AssetsLoader.shared.loadAllTracks { tracks, error in
                            if let tracks = tracks {
                                self.songs = tracks
                                
                            }
                            if let error = error {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
        }
    }
    
    @ViewBuilder
    func LibraryDetailView(item: LibraryItem) -> some View {
        switch item.title {
            //            case "Playlists":
            //            break
            //            case "Artists":
            //            break
            //            case "Albums":
            //            break
        case "Songs":
            SongListView()
                .navigationTitle(item.title)
            //            case "Music Videos":
            //            break
            //            case "Genres":
            //            break
            //            case "Compilations":
            //            break
            //            case "Composers":
            //            break
            //            case "Downloaded":
            //            break
        default:
            Text("")
        }
    }
}



struct AlbumView: View {
    let song: Song
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if let imageData = song.artwork?.imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            Text(song.title ?? "Unknown")
                .font(.body)
            Text(song.artist ?? "Unknown")
                .foregroundStyle(.gray)
                .font(.body)
        }
    }
}

#Preview {
    MusicLibraryView()
}
