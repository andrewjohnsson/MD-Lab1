//
//  SecondViewController.swift
//  MD_Lab1
//
//  Created by Andrew Johnsson on 04.02.16.
//  Copyright © 2016 gingercode. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var pageArea: UIWebView!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var fwdBtn: UIBarButtonItem!
    @IBOutlet weak var homeBtn: UIBarButtonItem!
    
    @IBAction func back(sender: AnyObject) { pageArea.goBack() }
    
    @IBAction func forward(sender: AnyObject) { pageArea.goForward() }

    @IBAction func home(sender: AnyObject) { pageArea.loadRequest(NSURLRequest(URL: NSURL(string: "about:blank")!)) }
    
    @IBAction func visitPage(sender: AnyObject) {
        if(!field.text!.isEmpty && field.text!.containsString(".")){
            var urlString = field.text!
            if (field.text!.containsString("http://") != true){
                urlString = "http://" + field.text!
            }
            pageArea.loadRequest(NSURLRequest(URL: NSURL(string: urlString)!))
        }else{
            let query = "https://www.google.com/search?q="+field.text!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            pageArea.loadRequest(NSURLRequest(URL: NSURL(string: query)!))
        }
        enableButtons()
        field.endEditing(true)
    }
    
    func enableButtons(){
        backBtn.enabled = true
        fwdBtn.enabled = true
        homeBtn.enabled = true
    }
    
    override func viewDidLoad() {
        pageArea.loadRequest(NSURLRequest(URL: NSURL(string: "about:blank")!))
        field.autoresizingMask = .FlexibleWidth
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
