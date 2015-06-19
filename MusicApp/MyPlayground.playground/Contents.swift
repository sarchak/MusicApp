//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let session = NSURLSession.sharedSession()
let baseURL = NSURL(string: "https://itunes.apple.com/search?term=one%20republic")
let downloadTask = session.dataTaskWithURL(baseURL!) { (data , response, error) -> Void in
    do {
        let jsonData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
        
        for entry in jsonData.valueForKey("results") as! NSArray {
            print(entry["trackName"])
        }
    }catch {
        
    }
    
    
}
downloadTask!.resume()