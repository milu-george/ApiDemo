//
//  ViewController.swift
//  ApiDemo
//
//  Created by Milu Ann George on 27/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiClient = APIClient()      // Creating instance of API Client
        let apiService = APIService(networkHandler: apiClient)  //creating instance of class API service that takes apiClient (an instance of APIClient) as an argument to the initializer (init).
        
//        The concept of DEPENDENCY INJECTION is crucial here:
//        Instead of creating a new APIClient instance within APIService, we provide an existing instance from outside (in this case, the apiClient).
//        This approach allows us to:
//        Swap different implementations of NetworkHandler (e.g., using a mock handler for testing).
//        Decouple the APIService from the specifics of how network requests are made.
        
        
//        The apiService now has access to the apiClient for making network requests.
//        When you call methods on apiService (e.g., fetchData), it internally uses the apiClient to perform the actual HTTP requests.
                                                            
        apiService.fetchData(from: "https://dummyjson.com/products") { (result: Result<Welcome, Error>) in
//            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    print("Received products: \(products.products)")
                    
                case .failure(let error):
                    print("Error fetching data: \(error)")
//                }
            }
        }
        
//        The line apiService.fetchData(from: "https://dummyjson.com/products") invokes the fetchData method on the apiService.
//        The method takes a single argument: the URL from which to fetch data (in this case, "https://dummyjson.com/products").
//        
//        Completion Handler (Closure):
//        The { (result: Result<Welcome, Error>) in ... } part is a trailing closure.
//        It defines what to do when the data fetching operation completes.
//            
//        The closure receives a Result<Welcome, Error> as its argument:
//        If the request succeeds, it contains a Welcome object (representing the fetched data).
//        If the request fails, it contains an Error.
//            
//              
//        Switch Statement:
//        Inside the closure, there’s a switch statement that handles the result.
//        If the result is .success, it means data was received successfully:
//        The associated value (products) is extracted.
//        The products are printed to the console.
//            
//        If the result is .failure, it means an error occurred:
//        The associated error (error) is extracted.
//        The error message is printed to the console.
//            
//            
//            
//        Dispatch Queue (Commented Out):
//        The commented-out line // DispatchQueue.main.async { ... } suggests that the code might have been originally written to handle UI updates on the main thread.
//        However, in this snippet, it’s not being used.
//            
//            
//        Overall Workflow:
//        The apiService uses its injected NetworkHandler (which is an instance of APIClient) to make the actual network request.
//            
//        When the request completes, the closure is called with either a success or a failure result.
//        The switch statement handles both cases.
//            
//            
//        Context Connection:
//        In the earlier code, we set up the apiService with the apiClient (an instance of APIClient).
//        Now, we’re using the apiService to fetch data from a specific URL.
//        The apiClient (inside apiService) handles the low-level network details.
//            
//        In summary, this code snippet demonstrates how the APIService abstracts away the network handling, allowing you to fetch data from a specified URL and handle the results in a structured way.







        
    }
    
}
