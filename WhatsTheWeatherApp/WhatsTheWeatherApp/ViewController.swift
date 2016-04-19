//
//  ViewController.swift
//  WhatsTheWeatherApp
//
//  Created by Joseph Hernandez on 4/17/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userCity: UITextField!
    
    
    @IBAction func findWeather(sender: AnyObject)
    {
        let url = NSURL(string: "http://www.weather-forecast.com/locations/" + userCity.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        
        
        if(url != nil)
        {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data,response,error) -> Void in
                
                var urlError = false
                var weather = ""
                
                if(error == nil)
                {
                    var urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString!
                    
                    print(urlContent)
                    
                    var urlContentArray = urlContent?.componentsSeparatedByString("<span class=\"phrase\">")
                    print(urlContentArray![1])
                    
                    if(urlContentArray?.count > 0)
                    {
                        var weatherArray = urlContentArray![1].componentsSeparatedByString("</span>")
                        weather = weatherArray[0] as String
                        weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                    }
                }
                else
                {
                    urlError = true
                }
                
                dispatch_async(dispatch_get_main_queue())
                {
                    if(urlError == true)
                    {
                        self.showError()
                        
                    }
                    else
                    {
                        self.resultLabel.text = weather
                    }
                    
                }
            })
            
            task.resume()
        }
            
        else
        {
            showError()
        }
    }
    
    @IBOutlet var resultLabel: UILabel!
    
    func showError()
    {
       resultLabel.text = "not able to find the weather for the given city " + userCity.text! + ", Please try again!"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

