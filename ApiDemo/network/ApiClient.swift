//
//  ApiClient.swift
//  ApiDemo
//
//  Created by Milu Ann George on 28/11/23.
//

import Foundation

class APIClient: NetworkHandler {
    func requestData(from endpoint: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: URL(string: endpoint)!) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "HTTPError", code: 0, userInfo: nil)))
                return
            }
        
            if let data = data {
                completion(.success(data))
            }
        }
        
        task.resume()
    }
}

//The APIClient class conforms to the NetworkHandler protocol.
//It implements the requestData(from:completion:) method required by the protocol.

//INSIDE REQUEST DATA METHOD:
//It uses URLSession.shared to create a data task with the specified endpoint.

//When the task completes, it checks for errors (network issues, invalid URLs, etc.).

//If there’s an error, it calls the completion closure with the error wrapped in .failure.

//If the response status code is within the success range (200-299), it calls the completion closure with the received data wrapped in .success.

//If the response status code is not within the success range, it creates an error (in this case, an NSError) and calls the completion closure with the error wrapped in .failure.
