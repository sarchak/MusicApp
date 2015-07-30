//
//  ListViewController.swift
//  MusicApp
//
//  Created by Shrikar Archak on 6/18/15.
//  Copyright © 2015 Shrikar Archak. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MusicDetailViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    let musicManager = MusicManager()
    var musicTracks: [MusicTrack]!
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        musicManager.getMusicTracks { (results) -> Void in
            self.musicTracks = results
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(musicTracks != nil){
            return musicTracks.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MusicCell = self.tableView.dequeueReusableCellWithIdentifier("musicCell") as! MusicCell
        cell.posterImage.image = nil
        let mTrack = self.musicTracks[indexPath.row]
        let imagedata = NSData(contentsOfURL: NSURL(string: mTrack.thumbnail)!)
        if let tmpdata = imagedata {
            cell.posterImage.image = UIImage(data: tmpdata)
        }
        cell.artistName.text = mTrack.artistName
        cell.trackName.text = mTrack.trackName
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detail"){
            let indexPath = self.tableView.indexPathForCell(sender as! MusicCell)
            let tmpTrack = self.musicTracks[indexPath!.row]
            print(tmpTrack.thumbnail)
            print(tmpTrack.artworkUrl)
            index = indexPath!.row
            let dvc = segue.destinationViewController as! MusicDetailViewController
            dvc.delegate = self
            dvc.musicTrack = tmpTrack
        }
    }
    
    func getNext() -> MusicTrack {
        index++;
        if(index > self.musicTracks.count){
            index = 0
        }
        print("Get Next")
        return self.musicTracks[index]
    }
    
    func getPrev() -> MusicTrack {
        index--;
        if(index < 0){
            index = self.musicTracks.count - 1
        }
        print("Get Prev")
        return self.musicTracks[index]
    }

}
