//
//  ResultDemo.swift
//  HotProspects
//
//  Created by Victor Rolando Sanchez Jara on 6/15/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

struct ResultDemo: View {
    // MARK: Properties
    // MARK: Body
    var body: some View {
        Text("Hello, World!")
            // Not using Result:
//            .onAppear {
//                let url = URL(string: "https://www.apple.com")!
//                URLSession.shared.dataTask(with: url) { data, response, error in
//                    if data != nil {
//                        print("We got data!")
//                    } else if let error = error {
//                        print(error.localizedDescription)
//                    }
//                }.resume()
//            }
        
        // Using Result:
            .onAppear {
                self.fetchData(from: "https://www.apple.com") { result in
                    switch result {
                        case .success(let str):
                            print("str = \(str) ~")
                        case .failure(let error):
                            switch error {
                                case .badURL:
                                    print("Bad URL")
                                case .requestFailed:
                                    print("Network problems")
                                case .unknown:
                                    print("Unknown error")
                        }
                    }
                }
            }
    }
    // MARK: Methods
    
    // Blocking
//    func fetchData(from urlString: String) -> Result<String, NetworkError> {
//        .failure(.badURL)
//    }
    
    // Non-blocking:
    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        // check the URL is OK, otherwise return with a failure
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            // the task has completed – push our work back to the main thread
            DispatchQueue.main.async {
                if let data = data {
                    // success: convert the data to a string and send it back
                    let stringData = String(decoding: data, as: UTF8.self)
                    completion(.success(stringData))
                } else if error != nil {
                    // any sort of network failure
                    completion(.failure(.requestFailed))
                } else {
                    // this ought not to be possible, yet here we are
                    completion(.failure(.unknown))
                }
            }
        }.resume()
        
        DispatchQueue.main.async {
            completion(.failure(.badURL))
        }
    }
}

struct ResultDemo_Previews: PreviewProvider {
    static var previews: some View {
        ResultDemo()
    }
}
