//
//  AuthServices.swift
//  twitter-clone (iOS)
//
//  Created by Jinu on 23/06/2024.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}

enum AutheticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}
public class AuthServices {
    
    public static var requestDomain = ""
    
    static func login(email: String,password: String, completion: @escaping(_ result: Result<Data?, AutheticationError>)-> Void) {
        let urlString =  URL(string: "http://localhost:3000/users/login")!
        makeRequest(urlString: urlString, reqBody: ["email": email, "password": password]) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let failure):
                completion(.failure(.invalidCredentials))
            }
        }
        
    }
    
    static func register(email: String,username: String, password: String, name : String,completion: @escaping(_ result: Result<Data?, AutheticationError>) -> Void) {
        let urlString =  URL(string: "http://localhost:3000/users")!
        
        makeRequest(urlString: urlString, reqBody: ["email": email,"username":username, "password": password, "name": name]) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.invalidCredentials))
            }
        }
    }
    
    static func makeRequest(urlString: URL,reqBody: [String : Any],completion : @escaping(_ result:Result <Data?, NetworkError>) -> Void) {
        
        
        let session = URLSession.shared
        
        var request = URLRequest(url: urlString)
        
        request.httpMethod = "POST"
        
        do {
            request.httpBody  = try JSONSerialization.data(withJSONObject: reqBody,options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else{
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                if let json  = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    completion(.success(data))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }
        
        task.resume()
    }
    // Fetch User function
    
    static func fetchUser(id: String, completion: @escaping(_ result: Result<Data, AutheticationError>)-> Void) {
        let urlString = URL(string: "http://localhost:3000/users/\(id)")!
        var urlRequest = URLRequest(url: urlString)
        let session = URLSession.shared
        
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            guard  error == nil else { return }
            
            guard let data = data else {
                completion(.failure(.invalidCredentials))
                return
            }
            
          
            
            do {
                if let json  = try JSONSerialization.jsonObject(with: data,options: .mutableContainers) as? [String : Any] {
                    completion(.success(data))
                }
            } catch {
                
                completion(.failure(.invalidCredentials))
                return
            }
        }
        task.resume()
    }
    
    static func makePatchRequestWithAuth(urString: URL, reqBody: [String: Any],completion: @escaping(_ result : Result<Data?, NetworkError>) -> Void) {
        
        let session = URLSession.shared
        
        var request = URLRequest(url: urString)
        
        request.httpMethod = "PATCH"
        
        do {
            request.httpBody  = try JSONSerialization.data(withJSONObject: reqBody,options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }
        
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else{ return }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                if let json  = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String : Any]  {
                    
                }
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodingError))
            }
            completion(.success(data))
        }
        task.resume()
    }
}
