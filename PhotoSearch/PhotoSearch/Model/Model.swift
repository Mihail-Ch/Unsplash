//
//  Model.swift
//  PhotoSearch
//
//  Created by Михаил Чертов on 09.01.2024.
//


protocol APIResponseProtocol: Codable {
    var total: Int {get}
    var total_pages: Int {get}
    var results: [Results] {get}
}

protocol ResultsProtocol: Codable {
    var id: String {get}
    var urls: URLS {get}
}

protocol URLSProtocol: Codable {
    var regular: String {get}
}

//MARK: Model

struct APIResponse: APIResponseProtocol {
    let total: Int
    let total_pages: Int
    let results: [Results]
}

struct Results: ResultsProtocol {
    let id: String
    let urls: URLS
}

struct URLS: URLSProtocol {
    let regular: String
}

