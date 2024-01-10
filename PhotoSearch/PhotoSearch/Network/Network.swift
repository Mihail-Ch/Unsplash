//
//  Network.swift
//  PhotoSearch
//
//  Created by Михаил Чертов on 09.01.2024.
//

import Foundation


final class Network {
    
    private func request(query: String, complition: @escaping (Data?) -> Void) {
        let session = URLSession.shared
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.unsplash.com"
        urlConstructor.path = "/search/photos"
        urlConstructor.queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "per_page", value: "50"),
            URLQueryItem(name: "query", value: "\(query)"),
            URLQueryItem(name: "client_id", value: "MKnBnqdu2FVzDqh3MosYFas1SQll_MNP-E7M15FETMM")
        ]
        
        guard let url = urlConstructor.url else { return }
        let task = session.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
            }
            DispatchQueue.main.async {
                complition(data)
            }
        }
        task.resume()
    }
    
    
    func getPhotos(query: String, complition: @escaping ([ResultsProtocol]) -> Void) {
        request(query: query) { (data) in
            guard let data = data else { return }
            do {
                let jsonResults = try JSONDecoder().decode(APIResponse.self, from: data).results
                complition(jsonResults)
            } catch {
                print(error)
            }
        }
    }
}
