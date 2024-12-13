//
//  ContentView.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var viewState: ViewState = .articleList
    @State var articleURL: String = ""
    
    var body: some View {
        if viewState == .articleList {
            ArticleListView(viewState: $viewState, articleURL: $articleURL)
        }
        
        else {
            WebViewContainer(viewState: $viewState, articleURL: $articleURL)
        }
    }
}

#Preview {
    ContentView()
}
