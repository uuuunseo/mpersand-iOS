//
//  searchService.swift
//  mpersand
//
//  Created by 정윤서 on 2023/05/03.
//

import Foundation

enum SearchUserError: Error {
    case notModified
    case validationFailed
    case servieceUnavailable
}

final class Search {
    
    static let shared = Search()
    
    private init() {}
    
//    func requestPOST(login: String, id: String, image: URL, bio: String, fllow: Int, fllower: Int, completion: @escaping(Result<Void,SearchUserError>) -> Void ) {
//
//        var urlComponents = URLComponents(string: "http://api.github.com/search/users")
//
//        let usernameQuery = URLQueryItem(name: "userName", value: login)
//        let userIdQuery = URLQueryItem(name: "userId", value: id)
// }
//    }
//
//
}
