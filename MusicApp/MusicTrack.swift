//
//  MusicTrack.swift
//  MusicApp
//
//  Created by Shrikar Archak on 6/17/15.
//  Copyright © 2015 Shrikar Archak. All rights reserved.
//

import Foundation

struct MusicTrack {
    var artistName: String
    var trackName : String
    var previewUrl: String
    var artworkUrl : String
    var thumbnail  : String
    init(data : NSDictionary){
        artistName = data["artistName"] as! String
        trackName = data["trackName"] as! String
        previewUrl = data["previewUrl"] as! String
        artworkUrl = (data["artworkUrl100"] as! String).stringByReplacingOccurrencesOfString("100x100", withString: "640x480")
        thumbnail =  data["artworkUrl100"] as! String
    }
}