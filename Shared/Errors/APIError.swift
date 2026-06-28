//
//  APIError.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 6/28/26.
//

import Foundation

enum APIError: LocalizedError {
    case badRequest
    case noData
    
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad request"
        case .noData:
            return "No data"
        }
    }
}
