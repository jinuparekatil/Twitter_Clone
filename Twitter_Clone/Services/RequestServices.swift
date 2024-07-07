//
//  RequestServices.swift
//  Twitter_Clone
//
//  Created by Jinu on 25/06/2024.
//

import Foundation

public class RequestServices {
    
    public static var requestDomain = ""
    
    public static func postTweet(text: String,user: String ,username: String, userId: String, completion: @escaping(_ result: [String : Any]?)-> Void) {
        
        let params = ["text": text, "userId": userId, "user": user, "username": username] as [String: Any]
        
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        do {
            request.httpBody  = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }
        
        // Authentication Part  in the HTTP request
        
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.addValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        request.addValue("Application/jsom", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            
            guard let data = data  else { return }
            
            do {
                if  let json  = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any]{
                    completion(json)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    static func fetchData(completion: @escaping(_ result: Result<Data?, NetworkError>) -> Void) {
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        request.addValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let data = data else { return }
            do {
                if  let json  = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any]{
               print(json)
                }
            } catch {
                print(error.localizedDescription)
            }
            completion(.success(data))

        }
        task.resume()
    }
    
    public static func folowingProcess(id: String,completion: @escaping(_ result: [String: Any?]) -> Void) {
        
        guard let url = URL(string: requestDomain) else {
               print("Invalid URL")
               
               return
           }
           
           var request = URLRequest(url: url)
           request.httpMethod = "PUT"
           
           guard let token = UserDefaults.standard.string(forKey: "jsonwebtoken") else {
               print("No token found")
              
               return
           }
           
           request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.addValue("application/json", forHTTPHeaderField: "Accept")
           
           let session = URLSession.shared
           let task = session.dataTask(with: request) { data, response, error in
               if let error = error {
                   print("Error in data task: \(error.localizedDescription)")
                  
                   return
               }
               
               guard let data = data else {
                   print("No data received")
                   
                   return
               }
               
               // Log the raw response data
               if let rawResponseString = String(data: data, encoding: .utf8) {
                   print("Raw response data: \(rawResponseString)")
               }
               
               // Log the response object
               if let httpResponse = response as? HTTPURLResponse {
                   print("Response status code: \(httpResponse.statusCode)")
               }
               
               do {
                   if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                       DispatchQueue.main.async {
                           completion(json)
                       }
                   } else {
                       print("JSON data is not a dictionary")
                       DispatchQueue.main.async {
                           
                       }
                   }
               } catch {
                   print("Error parsing JSON: \(error.localizedDescription)")
                   DispatchQueue.main.async {
                       
                   }
               }
           }
           
           task.resume()
    }
    
    public static func likeTweet(id: String, completion: @escaping (_ result: [String: Any]?) -> Void) {
       
        guard let url = URL(string: requestDomain) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        guard let token = UserDefaults.standard.string(forKey: "jsonwebtoken") else {
            print("No token found")
            completion(nil)
            return
        }
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error in data task: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            // Log the raw response data
            if let rawResponseString = String(data: data, encoding: .utf8) {
                print("Raw response data: \(rawResponseString)")
            }
            
            // Log the response object
            if let httpResponse = response as? HTTPURLResponse {
                print("Response status code: \(httpResponse.statusCode)")
                if httpResponse.statusCode != 200 {
                    print("Error: Unexpected status code \(httpResponse.statusCode)")
                    completion(nil)
                    return
                }
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    DispatchQueue.main.async {
                        completion(json)
                    }
                } else {
                    print("JSON data is not a dictionary")
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
        
        task.resume()
    }
    
    public static func sendNotification(userName: String, notSenderId: String, notRecieverId: String, notificationType: String,postText: String, completion: @escaping(_ result: [String: Any]?) -> Void) {
        
        var params: [String: Any] {
            return postText.isEmpty ? ["username": userName, "notSenderId": notSenderId, "notRecieverId": notRecieverId , "notificationType": notificationType] as [String: Any] : ["username": userName, "notSenderId": notSenderId, "notRecieverId": notRecieverId , "notificationType": notificationType, "postText":postText] as [String: Any]
        }
        let url = URL(string: requestDomain)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod =  "POST"
        
        do {
            request.httpBody  = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard error == nil else { return }
            
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any]{
                    completion(json)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

}
