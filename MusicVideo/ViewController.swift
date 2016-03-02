//
//  ViewController.swift
//  MusicVideo
//
//  Created by kevin keaveney on 29/02/2016.
//  Copyright © 2016 TopForm. All rights reserved.
//  test

import UIKit

class ViewController: UIViewController {
    
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
    }

   
    func didLoadData(videos: [Video]) {
        
        self.videos = videos
        
        for item in videos {
            print("name = \(item.name)")
        }
        
        for (index, item) in videos.enumerate() {
            
            print("index = \(index) + name = \(item.name)")
        }
        
    }

}

