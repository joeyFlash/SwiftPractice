//
//  ViewController.swift
//  DownloadWebContent
//
//  Created by Joseph Hernandez on 4/17/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://www.stackoverflow.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
        {
            (data,response,error)in
            
            if(error == nil)
            {
                var urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print(urlContent)
                
                dispatch_async(dispatch_get_main_queue())
                {
                    self.webView.loadHTMLString(urlContent! as String, baseURL: nil)
                }
            }
            
        }
        task.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

