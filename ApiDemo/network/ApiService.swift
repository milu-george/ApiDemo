//
//  ApiService.swift
//  ApiDemo
//
//  Created by Milu Ann George on 28/11/23.
//

import Foundation

class APIService {
    private let networkHandler: NetworkHandler

    init(networkHandler: NetworkHandler) {
        self.networkHandler = networkHandler
    }

    func fetchData<T: Decodable>(from endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        networkHandler.requestData(from: endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


//The APIService class is responsible for fetching data from an API.

//It has a private property called networkHandler, which is an instance of the NetworkHandler protocol. This allows the APIService to be flexible and work with different network handling implementations.

//The init method initializes the APIService with a networkHandler.

//The fetchData method is where the magic happens. It takes two parameters:
//endpoint: The URL of the API endpoint from which data needs to be fetched.
//completion: A closure that will be called once the data is fetched or an error occurs.

//INSIDE FETCH DATA:
//It uses the networkHandler to make an asynchronous request to the specified endpoint.

//When the request completes, it receives a Result<Data, Error> object.

//If the request is successful (i.e., .success), it attempts to decode the received data into a generic type T (which must conform to Decodable).

//If decoding succeeds, it calls the completion closure with the decoded data wrapped in .success.

//If decoding fails or if there’s an error during the request, it calls the completion closure with the error wrapped in .failure.
