//
//  APIManager.swift
//  MusicVideo
//
//  Created by kevin keaveney on 29/02/2016.
//  Copyright © 2016 TopForm. All rights reserved.
//  more

import Foundation

class APIManager {
    
    
    func loadData(urlString: String, completion: (result: String) -> Void) {
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    completion(result: (error!.localizedDescription))
                }
            } else {
                
                print(data)
                do {
                    
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String: AnyObject] {
                        
                      //  print(json)
                       
                    let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                    dispatch_async(dispatch_get_global_queue(priority, 0), { () -> Void in
                        completion(result: "JSONSerialization Successful")
                    })
                        
                    }
                } catch {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(result: "error in NSJSONSerialisation")
                    }
                }
            }
        }
        
       
    }
    
    
    
    
    
    
    
}
