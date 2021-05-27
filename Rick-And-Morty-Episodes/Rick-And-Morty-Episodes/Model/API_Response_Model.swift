//
//  API_Response_Model.swift
//  nostoryboard
//
//  Created by Christelle Nieves on 5/26/21.
//

import UIKit

struct Response: Codable {
    var info: ResponseInfo
    var results: [Episode]
}

struct ResponseInfo: Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct Episode: Codable, Equatable {
    var id: Int
    var name: String
    var air_date: String
    var episode: String
}
