//
//  ApiService.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 20.12.2022.
//

import Foundation

protocol APIServiceProtocol {
    func loadData(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void)
}

extension URLSession: APIServiceProtocol {
    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url) { (data, _, error) in
            completionHandler(data, error)
        }
        task.resume()
    }
}

class ApiService {
    
    private let session: APIServiceProtocol
    
    init(session: APIServiceProtocol = URLSession.shared) {
        self.session = session
    }
    
    func loadData<T: Decodable>(from url: URL,
                                completion: @escaping (Result<T, APIError>) -> Void) {
        session.loadData(from: url) { data, _ in
            do {
                guard let data = data else {
                    completion(.failure(.noResults))
                    return
                }
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch let error {
                print("Error: ", error)
                completion(.failure(.runtimeError(error.localizedDescription)))
            }
        }
    }
}

public enum APIError: Error, Equatable {
    case failedConnection
    case noResults
    case noInternetConnection
    case unknownError
    case runtimeError(String)
    var localizedDescription: String {
        switch self {
        case .noResults:
            return "No Result Found"
        case .noInternetConnection:
            return "No Internet Connection"
        case .unknownError:
            return "Something Happened"
        default:
            return "Something Happened"
        }
    }
}
