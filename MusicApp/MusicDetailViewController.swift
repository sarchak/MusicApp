//
//  MusicDetailViewController.swift
//  MusicApp
//
//  Created by Shrikar Archak on 6/20/15.
//  Copyright © 2015 Shrikar Archak. All rights reserved.
//

import UIKit
import AVFoundation
import Spring

protocol MusicDetailViewControllerDelegate {
    func getNext() -> MusicTrack
    func getPrev() -> MusicTrack
}

class MusicDetailViewController: UIViewController {

    var delegate : MusicDetailViewControllerDelegate?
    var musicTrack: MusicTrack!
    
    @IBOutlet weak var bkImageView: UIImageView!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    var isPlaying : Bool = false
    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }

    func load(){
        let imagedata = NSData(contentsOfURL: NSURL(string: musicTrack.artworkUrl)!)
        if let tmpdata = imagedata {
            bkImageView.image = UIImage(data: tmpdata)
            posterImageView.image = UIImage(data: tmpdata)
        }
        
        player = AVPlayer(URL: NSURL(string: musicTrack.previewUrl)!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func play(sender: AnyObject) {
        isPlaying = !isPlaying

        if(isPlaying){

            self.playButton.setImage(UIImage(named: "pause"), forState: UIControlState.Normal)
            player?.play()
        } else {
            self.playButton.setImage(UIImage(named: "play"), forState: UIControlState.Normal)
            player?.pause()
        }
    }
    

    @IBAction func next(sender: AnyObject) {
        self.musicTrack = delegate?.getNext()
        load()
        if(isPlaying){
            self.player?.play()
        }
    }
 
    @IBAction func prev(sender: AnyObject) {
        self.musicTrack = delegate?.getPrev()
        load()
        if(isPlaying){
            self.player?.play()
        }

    }
    
}
