//
//  FetchData.swift
//  NewsAPI
//
//  Created by Finn Gilligan (student LM) on 12/12/24.
//

import Foundation

struct FetchData {
    var response: Response = Response()
    mutating func getData() async -> String{
        let URLString = "https://newsapi.org/v2/everything?q=space&apiKey=9ec3e24bf7e24b4392201d0a539829b9"
        
        guard let url = URL(string: URLString) else {return " "}
        
        let(data, _) = try! await URLSession.shared.data(from: url)
        
        response = try! JSONDecoder().decode(Response.self, from: data)
        
        let dataString = String(data: data, encoding: .utf8)
        return(dataString ?? " ")
    }
}

struct Response: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article] = []
}

struct Article: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: URL?
}

extension Article: Identifiable {
    var id: String {title ?? " "}
}
