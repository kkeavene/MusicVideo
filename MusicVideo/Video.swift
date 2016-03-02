//
//  Video.swift
//  MusicVideo
//
//  Created by kevin keaveney on 01/03/2016.
//  Copyright © 2016 TopForm. All rights reserved.
//

import Foundation

class Video {
    
    
    // Data Encapsulation
    
    private (set) var name: String
    private (set) var imageURL: String
    private (set) var videoURL: String
    private (set) var rights: String
    private (set) var price: String
    private (set) var artist: String
    private (set) var id: String
    private (set) var genre: String
    private (set) var linkToiTunes: String
    private (set) var releaseDate: String
    
    // This variable gets creted from the UI
    var imagedata: NSData?
    
    init(data: JSONDictionary) {
        
        // if we do not initialise all properties we will get error messages
        
        // Video Name
        
        if let name = data["im:name"] as? JSONDictionary,
               vName = name["label"] as? String {
               self.name = vName
        
        } else {
            
            self.name = ""
        }
        
        // The Video Image
        
        if let img = data["im:image"] as? JSONArray,
               image = img[2] as? JSONDictionary,
               immage = image["label"] as? String {
               self.imageURL = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
                
        } else {
            
            self.imageURL = ""
        }
        
        
        // The Video URL
        
        if let video = data["link"] as? JSONArray,
               vURL = video[1] as? JSONDictionary,
               Vhref = vURL["href"] as? String {
                self.videoURL = Vhref
       
        } else {
            
            self.videoURL = ""
        }
        
        
        // The Video Rights
        
        
        if let rights = data["rights"] as? JSONDictionary,
                label = rights["label"] as? String {
                self.rights = label
                    
        } else {
            
            self.rights = ""
        }
        
        
        // The Video Price
        
        
        if let price = data["im:price"] as? JSONDictionary,
               label = price["label"] as? String {
               self.price = label
                
        } else {
            
            self.price = ""
        }
        
        
        // The Video Artist
        
        
        if let artist = data["im:artist"] as? JSONDictionary,
               label = artist["label"] as? String {
               self.artist = label
                
        } else {
            
            self.artist = ""
        }
        
        
        // The Video ID
        
        if let id = data["id"] as? JSONDictionary,
               attributes = id["attributes"] as? JSONDictionary,
               imid = attributes["im:id"] as? String {
                self.id = imid
        
        } else {
            
            self.id = ""
        }
        
        
        // The Genre
        
        if let genre = data["category"] as? JSONDictionary,
               attributes = genre["attributes"] as? JSONDictionary,
               term = attributes["term"] as? String {
               self.genre = term
                
        } else {
            
            self.genre = ""
        }
        
        
        // The iTunes Link
        
        if let iTunesLink = data["id"] as? JSONDictionary,
               label = iTunesLink["label"] as? String {
               self.linkToiTunes = label
                
        } else {
            
            self.linkToiTunes = ""
        }
        
        
        // The Release Date
        
        if let releaseDate = data["im:releaseDate"] as? JSONDictionary,
               attributues = releaseDate["attributues"] as? JSONDictionary,
               label =  attributues["label"] as? String  {
               self.releaseDate = label
                
        } else {
            
            self.releaseDate = ""
        }
        
    }
        
}

