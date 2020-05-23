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
    func request<T: Decodable>(offset: String, completion: @escaping (Result<T, Error>) -> Void)
    func request<T: Decodable>(offset: String) -> Single<T>
}

final class APICore: APIProvider {
    
    func request<T>(offset: String) -> (PrimitiveSequence<SingleTrait, T>) where T : Decodable {
        return rx.request(offset: offset)
    }
    
    func request<T>(offset: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        guard let request = makeRequest(offset: offset) else { return }
        
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
    
    private func makeRequest(offset: String) -> URLRequest? {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = Path.marvelBase
        components.path = Path.charactersPath
        components.queryItems = [
            URLQueryItem(name: "apikey", value: Path.publicKey),
            URLQueryItem(name: "ts", value: Path.ts),
            URLQueryItem(name: "hash", value: Path.hash),
            URLQueryItem(name: "limit", value: "20"),
            URLQueryItem(name: "offset", value: offset),
        ]
        
        guard let url = components.url else { return nil }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        return request
    }
    
}

// MARK: Turn APICore Reactive

extension APICore: ReactiveCompatible {}

extension Reactive where Base == APICore {
    func request<T: Decodable>(offset: String) -> Single<T> {
        return Single.create { [weak base] single -> Disposable in
            base?.request(offset: offset, completion: { (result: Result<T, Error>) in
                switch result {
                case .success(let value):
                    return single(.success(value))
                case .failure(let error):
                    return single(.error(error))
                }
            })
            
            return Disposables.create { }
        }
    }
}
