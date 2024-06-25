//
//  RequestServices.swift
//  Twitter_Clone
//
//  Created by Jinu on 25/06/2024.
//

import Foundation

public class RequestServices {
    
    public static var reqestDomain = ""
    
    public static func postTweet(text: String,user: String ,username: String, userId: String, completion: @escaping(_ result: [String : Any]?)-> Void) {
        
        let params = ["text": text, "userId": userId, "user": user, "username": username] as [String: Any]
        
        let url = URL(string: reqestDomain)!
        
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
}
