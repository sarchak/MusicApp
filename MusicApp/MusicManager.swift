//
//  MusicManager.swift
//  MusicApp
//
//  Created by Shrikar Archak on 6/17/15.
//  Copyright © 2015 Shrikar Archak. All rights reserved.
//

import Foundation
import Alamofire


class MusicManager {
    var musicTracks: [MusicTrack] = []
    let session = NSURLSession.sharedSession()
    func getMusicTracks(onComplete : (results :[MusicTrack]) -> Void) {
        
        Alamofire.request(.GET, URLString: "https://itunes.apple.com/search?term=pop").responseJSON { (request, response, data , error) -> Void in
            print(error)
            if let tmpdata = data {
                for entry in tmpdata.valueForKey("results") as! [NSDictionary] {
                    let musicTrack = MusicTrack(data: entry)
                    self.musicTracks.append(musicTrack)
                }
                print(self.musicTracks.count)
                onComplete(results: self.musicTracks)
            }            
        }
    }

}