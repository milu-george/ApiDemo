//
//  NetworkHandler.swift
//  ApiDemo
//
//  Created by Milu Ann George on 28/11/23.
//

import Foundation

protocol NetworkHandler {
    func requestData(from endpoint: String, completion: @escaping (Result<Data, Error>) -> Void)
}

//A protocol in Swift defines a blueprint of methods, properties, and other requirements that suit a particular task or functionality.
//In this case, the NetworkHandler protocol defines a single method:
//
//The requestData method is expected to make an asynchronous network request to the specified endpoint and call the completion closure with either the fetched data (wrapped in .success) or an error (wrapped in .failure).
