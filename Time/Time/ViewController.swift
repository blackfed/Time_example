//
//  ViewController.swift
//  Time
//
//  Created by Fede on 26/02/16.
//  Copyright © 2016 Fede. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Timer_tempo = 0
    var Timer_running = false
    var Timer : Foundation.Timer = Foundation.Timer()
    
    @IBOutlet weak var label_lap1: UILabel!
    @IBOutlet weak var label_lap2: UILabel!
    @IBOutlet weak var label_lap3: UILabel!
    
    @IBOutlet weak var time_label: UILabel!
    
    func count() {
        
        Timer_tempo += 1
        time_label.text = "\(Timer_tempo)"

    }
    
    
    @IBAction func Timer_start_button(_ sender: AnyObject) {
        if Timer_running == false{
        
        Timer = Foundation.Timer.scheduledTimer(timeInterval: 1, target: self, selector: ("count"), userInfo: nil, repeats: true)
        Timer_running = true
        
    }
    }
    
    @IBAction func Timer_stop_button(_ sender: AnyObject) {
        if Timer_running == true{
            Timer_tempo = 0
            time_label.text = "0"
            Timer.invalidate()
            Timer_running = false
            
        }
        
        
    }
    
    @IBAction func timer_pause_button(_ sender: AnyObject) {
        if Timer_running == true{
            Timer.invalidate()
            Timer_running = false
        }
    }

    @IBAction func lap_button(_ sender: AnyObject) {
    
        if Timer_running == true{
            if label_lap1.text == "" {
                label_lap1.text = "Lap 1: " + time_label.text! + " sec"
            } else if label_lap2.text == "" {
                label_lap2.text = "Lap 2: " + time_label.text! + " sec"
            } else if label_lap3.text == "" {
                label_lap3.text = "Lap 3: " + time_label.text! + " sec"
            } else {
                print("Non ce ne sono di vuote")
            }
        }
    
    
    }
    
    @IBAction func clear_lap_button(_ sender: AnyObject) {
        
        label_lap1.text = ""
        label_lap2.text = ""
        label_lap3.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label_lap1.text = ""
        label_lap2.text = ""
        label_lap3.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

