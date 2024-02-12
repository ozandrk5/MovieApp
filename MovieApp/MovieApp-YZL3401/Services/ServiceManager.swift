//
//  ServiceManager.swift
//  MovieApp-YZL3401
//
//  Created by Ömer Hattab Saitoğlu on 21.01.2024.
//

import Foundation
import Alamofire

final class ServiceManager: ServiceProtocol{
    
    static let shared = ServiceManager()
    
    init(){}
    
    func fetchMovies(paramaters: [String : String]?, completion: @escaping ((Results<MovieModel>)) -> ()) {
        let url = "\(ServiceEndPoint.baseURL)?api_key=\(ServiceEndPoint.apiKey)"
        
        AF.request(url, method: .get, parameters: paramaters, headers: ServiceHelper.shared.headers).responseData { response in
            switch response.result{
            case .success(let data):
                do{
                    let result = try JSONDecoder().decode(MovieModel.self, from: data)
                    completion(.success(result))
                }catch{
                    completion(.error(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.error(Error.networkError(internal: error)))
            }
        }
    }
}
