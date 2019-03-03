//
//  WebSeviceManager.swift
//  PlayerStatistics
//
//  Created by raman singh on 12/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation
import UIKit

enum HTTPMethodType: Int {
    case POST = 0
    case GET
}

typealias WebServiceCompletionBlock = (_ data: Data?,_ error: Error?)->Void

protocol ServiceManager {
    func requestAPI(url: String,parameter: [String: AnyObject]?, httpMethodType: HTTPMethodType, completion: @escaping WebServiceCompletionBlock)
}

class WebServiceManager: ServiceManager {
    //MARK:- SingleTon
    
    static let sharedService = WebServiceManager()
    
    func requestAPI(url: String,parameter: [String: AnyObject]?, httpMethodType: HTTPMethodType, completion: @escaping WebServiceCompletionBlock) {
        
        let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        var request = URLRequest(url: URL(string: escapedAddress!)!)
        
        switch httpMethodType {
        case .POST:
            request.httpMethod = "POST"
        case .GET:
            request.httpMethod = "GET"
            
            if parameter != nil {
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameter as Any, options: .prettyPrinted)
                } catch let error {
                    print(error.localizedDescription)
                    return
                }
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if error != nil{
                    completion(nil,error)
                    return
                }
                
                if data == nil{
                    let error = NSError(domain:"", code:404, userInfo:[ NSLocalizedDescriptionKey: "Data Not Found"])
                    completion(nil, error)
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    let error = NSError(domain:"", code:httpStatus.statusCode, userInfo:[ NSLocalizedDescriptionKey: httpStatus.description])
                    completion(nil, error)
                }
                completion(data,nil)
            }
            task.resume()
        }
    }
}
