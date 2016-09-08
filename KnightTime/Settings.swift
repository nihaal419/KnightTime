//
//  Settings.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 3/1/16.
//  Copyright © 2016 N Squared Productions. All rights reserved.
//

import UIKit

public class Setttings: UITableViewController{
    
    @IBOutlet weak var PeriodOne: UITextField!
    @IBOutlet weak var PeriodTwo: UITextField!
    @IBOutlet weak var PeriodThree: UITextField!
    @IBOutlet weak var PeriodFour: UITextField!
    @IBOutlet weak var PeriodFiveA: UITextField!
    @IBOutlet weak var PeriodFiveB: UITextField!
    @IBOutlet weak var PeriodSix: UITextField!
    @IBOutlet weak var PeriodSeven: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBAction func buttonPressed(sender: AnyObject){
        //Save text from TextFields to string variables
        if(PeriodOne.text == ""){
            appDelegate.firstPeriod = "1st Period"
        }
        else{
            appDelegate.firstPeriod = PeriodOne.text!
        }
        if(PeriodTwo.text == ""){
            appDelegate.secondPeriod = "2nd Period"
        }
        else{
            appDelegate.secondPeriod = PeriodTwo.text!
        }
        if(PeriodThree.text == ""){
            appDelegate.thirdPeriod = "3rd Period"
        }
        else{
            appDelegate.thirdPeriod = PeriodThree.text!
        }
        if(PeriodFour.text == ""){
            appDelegate.fourthPeriod = "4th Period"
        }
        else{
            appDelegate.fourthPeriod = PeriodFour.text!
        }
        if(PeriodFiveA.text == ""){
            appDelegate.fifthPeriodA = "5A"
        }
        else{
            appDelegate.fifthPeriodA = PeriodFiveA.text!
        }
        if(PeriodFiveB.text == ""){
            appDelegate.fifthPeriodB = "5B"
        }
        else{
            appDelegate.fifthPeriodB = PeriodFiveB.text!
        }
        if(PeriodSix.text == ""){
            appDelegate.sixthPeriod = "6th Period"
        }
        else{
            appDelegate.sixthPeriod = PeriodSix.text!
        }
        if(PeriodSeven.text == ""){
            appDelegate.seventhPeriod = "7th Period"
        }
        else{
            appDelegate.seventhPeriod = PeriodSeven.text!
        }
        
        print(appDelegate.firstPeriod,appDelegate.secondPeriod,appDelegate.thirdPeriod,appDelegate.fourthPeriod,appDelegate.fifthPeriodA,appDelegate.fifthPeriodB,appDelegate.sixthPeriod,appDelegate.seventhPeriod)
        
        //Returns to Previous Screen
        navigationController?.popToRootViewControllerAnimated(true)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
//        var timer = NSTimer()
//        
//        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector:"timeManagement", userInfo:nil, repeats:true)
        tableView.allowsSelection = false
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
