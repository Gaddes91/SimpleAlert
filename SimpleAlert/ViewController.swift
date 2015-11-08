//
//  ViewController.swift
//  SimpleAlert
//
//  Created by Matthew Gaddes on 07/11/2015.
//  Copyright © 2015 Matthew Gaddes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // Link to timer label
    @IBOutlet weak var label: UILabel!
    // Link to timer button
    @IBOutlet weak var timerButton: UIButton!
    
    var seconds = 0
    var timer = NSTimer()
    
    
    func setup() {
        
        // Set value of seconds
        seconds = 60
        
        // Enable timer button
        timerButton.enabled = true
        
        // Update label to show number of seconds
        label.text = "\(seconds)"
    }
    
    
    @IBAction func ButtonPressed(sender: UIButton) {
        
        // Start timer
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractOneSecond"), userInfo: nil, repeats: true)
        
        // Prevent button from being pressed multiple times
        sender.enabled = false
    }
    
    
    // Function for use with timer
    func subtractOneSecond() {
        
        // Subtract one second
        --seconds
        
        // Update label
        label.text = "\(seconds)"
        
        // Stop timer when it reaches 0
        if seconds <= 0 {
            timer.invalidate()
            
            // Create pop-up alert - see Apple's HIG https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/Alerts.html#//apple_ref/doc/uid/TP40006556-CH14-SW2
            let popUpAlert = UIAlertController(title: "Please Update Your License", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            
            popUpAlert.addAction(UIAlertAction(title: "Enter Licence", style: UIAlertActionStyle.Default, handler: { action in self.setup() } ))
            
            popUpAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: { action in self.setup() } ))
            
            presentViewController(popUpAlert, animated: true, completion:nil)
        }
    }
    

}

