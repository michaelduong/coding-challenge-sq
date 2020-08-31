//
//  Networking.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/13/20.
//

import Foundation
import Network

enum RequestError: Error {
    case invalidJson
    case badURL
    case badRequest
    case noNetwork
}

protocol Networking {
    func execute<T: Decodable>(_ requestProvider: RequestProvider, completionHandler: @escaping (Result<T, RequestError>) -> Void)
}

class NetworkManager: Networking {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func execute<T: Decodable>(_ requestProvider: RequestProvider, completionHandler: @escaping (Result<T, RequestError>) -> Void) {
        let urlRequest = requestProvider.urlRequest
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            let monitor = NWPathMonitor()
            monitor.pathUpdateHandler = { path in
                if path.status == .unsatisfied {
                    completionHandler(.failure(.noNetwork))
                }
            }
            
            do {
                if let error = error {
                    completionHandler(.failure(RequestError.badRequest))
                    return
                }
                
                guard let data = data else {
                    completionHandler(.failure(RequestError.badRequest))
                    return
                }
                
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(decodedObject))
            } catch {
                completionHandler(.failure(RequestError.invalidJson))
            }
        }.resume()
    }
}
