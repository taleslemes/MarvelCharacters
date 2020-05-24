//
//  APICore.swift
//  MarvelCharacters
//
//  Created by Tales Lemes on 23/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation
import RxSwift

protocol APIProvider: AnyObject {
    func request<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
}

final class APICore: APIProvider {
    
    func request<T>(url: URL, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        guard let request = makeRequest(url: url) else { return }
        
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            guard let urlResponse = urlResponse as? HTTPURLResponse else {
                completion(.failure(AppError.generic))
                return
            }
            
            switch urlResponse.statusCode {
            case 400..<600:
                completion(.failure(AppError.generic))
            default:
                guard let data = data else { return }
                
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(AppError.generic))
                }
            }
        }.resume()
    }
    
    private func makeRequest(url: URL) -> URLRequest? {
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        return request
    }
    
}
