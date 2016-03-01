//
//  ViewController.swift
//  MusicVideo
//
//  Created by kevin keaveney on 29/02/2016.
//  Copyright © 2016 TopForm. All rights reserved.
//  test

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/gb/rss/topsongs/limit=100/json", completion: didLoadData)
    }

   
    func didLoadData(result: String) {
        
        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            // do something
        }
        
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

}

