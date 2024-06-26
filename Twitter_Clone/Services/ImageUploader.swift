//
//  ImageUploader.swift
//  Twitter_Clone
//
//  Created by Jinu on 25/06/2024.
//

import SwiftUI

struct ImageUploader {
    
    static func uploadImage(paramName: String, fileName: String, image: UIImage, urlPath: String) {
        guard let url = URL(string: "http://localhost:3000/\(urlPath)") else {
            print("Invalid URL")
            return
        }
        
        let boundary = UUID().uuidString
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 60 // Increase timeout interval to 60 seconds
        sessionConfig.timeoutIntervalForResource = 60
        let session = URLSession(configuration: sessionConfig)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        // Authentication
        guard let token = UserDefaults.standard.string(forKey: "jsonwebtoken") else {
            print("No token found")
            return
        }
        
        urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        // Ensure Content-Type matches the type of data being sent (jpeg or png)
        urlRequest.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        // Specify the paramName and fileName in Content-Disposition
        body.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        // Adjust Content-Type based on image format (jpeg or png)
        body.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!) // adjust if uploading jpeg
        
        if let imageData = image.pngData() {
            body.append(imageData)
        } else {
            print("Could not get PNG data from image")
            return
        }
        
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        urlRequest.httpBody = body
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error uploading image: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("No valid HTTP response")
                return
            }
            
            DispatchQueue.main.async {
                if httpResponse.statusCode == 200 {
                    print("Upload successful")
                    // Handle successful upload
                } else {
                    print("Error with the response, unexpected status code: \(httpResponse.statusCode)")
                    // Handle error based on status code
                }
            }
        }
        
        task.resume()
    }
}
