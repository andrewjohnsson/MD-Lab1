//
//  ThirdViewController.swift
//  MD_Lab1
//
//  Created by Andrew Johnsson on 04.02.16.
//  Copyright © 2016 gingercode. All rights reserved.
//

import UIKit

class ThirdViewController: UITableViewController{
    
    var names = []
    var locations = []
    
    override func viewDidLoad(){
        let plist = NSDictionary(contentsOfFile:NSBundle.mainBundle().pathForResource("Students", ofType:"plist")!)
        names = plist!["name"] as! [String]
        locations = plist!["location"] as! [String]
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("personCell")
        
        cell?.textLabel?.text =  names[indexPath.item] as? String
        cell?.detailTextLabel?.text = locations[indexPath.item] as? String
        
        return cell!
    }
}