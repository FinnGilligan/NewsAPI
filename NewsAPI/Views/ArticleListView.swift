//
//  ArticleListView.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/13/24.
//

import SwiftUI

struct ArticleListView: View {
    @Binding var viewState: ViewState
    @State var data: FetchData = FetchData()
    @Binding var articleURL: String
    
    var body: some View {
        ScrollView {
            ForEach(data.response.articles) {article in
                Button(action: {
                    articleURL = article.url ?? ""
                    viewState = .webView
                }, label: {
                    HStack {
                        AsyncImage(url: article.urlToImage) {
                            phase in
                            switch phase {
                            case.failure:
                                (Image("fnf").resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding())
                                
                            case.success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10)
                                    .padding()
                                
                            default:
                                ProgressView()
                            }
                        }
                        Text(article.title ?? "No Title")
                            .padding()
                    }
                })
                
                
            }
        }.task {
            await data.getData()
        }
    }
}

#Preview {
    ArticleListView(viewState: .constant(.articleList), articleURL: .constant(""))
}
