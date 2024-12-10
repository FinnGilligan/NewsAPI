//
//  ContentView.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var json = "Loading..."
    var body: some View {
        VStack {
            Text(json)
        }
        .task {
            let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=science&q=space&apiKey=9ec3e24bf7e24b4392201d0a539829b9")!
                let (data, _) = try! await URLSession.shared.data(from: url)
                json = String(decoding: data, as: UTF8.self)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
