//
//  APIManager.swift
//  MusicVideo
//
//  Created by kevin keaveney on 29/02/2016.
//  Copyright © 2016 TopForm. All rights reserved.
//  more

import Foundation

class APIManager {
    
    
    func loadData(urlString: String, completion: [Video] -> Void) {
        
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
            if error != nil {
                
                print(error?.localizedDescription)
                
            } else {
                
                print(data)
                do {
                    
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary,
                        feed = json["feed"] as? JSONDictionary,
                        entries = feed["entry"] as? JSONArray {
                        
                       var videos = [Video]()
                       for entry in entries {
                            let entry = Video(data: entry as! JSONDictionary)
                            videos.append(entry)
                        }
                            
                        let i = videos.count
                        print("iTunesAPIManager - total Count -> \(i)")
                        print("")
                       
                    let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                    dispatch_async(dispatch_get_global_queue(priority, 0), { () -> Void in
                        completion(videos)
                    })
                        
                    }
                } catch {
                    
                        print ("error in NSJSONSerialisation")
                    }
                }
            }
                task.resume()
        }
    
}
    
    
    
    
    
    
    


