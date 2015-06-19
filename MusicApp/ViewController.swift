//
//  ViewController.swift
//  MusicApp
//
//  Created by Shrikar Archak on 6/6/15.
//  Copyright (c) 2015 Shrikar Archak. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let musicManager = MusicManager()
    let session = NSURLSession.sharedSession()
    var musicTracks: [MusicTrack]!
    @IBOutlet weak var slider: UISlider!
    var player:AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()

        player = AVPlayer(URL: NSURL(string: "http://p.scdn.co/mp3-preview/dffd166162a33b2273fe6d781b31f49fbefd7460")!)
        //player?.play()
    
        musicManager.getMusicTracks { (results) -> Void in
            self.musicTracks = results
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

