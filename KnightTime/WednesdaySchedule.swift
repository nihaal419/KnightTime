//
//  WednesdaySchedule.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 2/29/16.
//  Copyright © 2016 N Squared Productions. All rights reserved.
//

import UIKit

class WednesdaySchedule: UIViewController{
    
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var nextLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //var for final label addition
    var finalDay = ""
    var finalPeriod = ""
    var finalRemaining = ""
    var finalNext = ""
    
    //Get string values from the App Delegates, stored from Settings
    var firstPeriod = ""
    var secondPeriod = ""
    var thirdPeriod = ""
    var fourthPeriod = ""
    var fifthPeriodA = ""
    var fifthPeriodB = ""
    var sixthPeriod = ""
    var seventhPeriod = ""
    
    func timeManagement(){
        //Method created in order to use an NSTimer to run method every .5 seconds in order to refresh labels
        
        //Getting Day using NSCalendar and convert Int to String
        let calendar = NSCalendar.currentCalendar()
        let date = NSDate()
        let dateComponent =  calendar.components(NSCalendarUnit.Weekday, fromDate: date)
        let weekday = dateComponent.weekday
        let xday = weekday as NSNumber
        var stringDay : String = xday.stringValue
        
        if(stringDay=="1"){finalDay="Today is Sunday"; imageView.image = UIImage(named:"Wednesday")}
        if(stringDay=="2"){finalDay="Today is Monday"; imageView.image = UIImage(named:"Wednesday")}
        if(stringDay=="3"){finalDay="Today is Tuesday"; imageView.image = UIImage(named:"Wednesday")}
        if(stringDay=="4"){finalDay="Today is Wednesday"; imageView.image = UIImage(named:"Wednesday")}
        if(stringDay=="5"){finalDay="Today is Thursday"; imageView.image = UIImage(named:"Wednesday")}
        if(stringDay=="6"){finalDay="Today is Friday"; imageView.image = UIImage(named:"Wednesday")}
        if(stringDay=="7"){finalDay="Today is Saturday"; imageView.image = UIImage(named:"Wednesday")}
        //set final text to the label
        dayLabel.text=finalDay
        
        //individual days and period schedule and next schedule
        let components = calendar.components([.Hour,.Minute,.Second], fromDate: date)
        //hour
        var hour = components.hour
        let xhour = hour as NSNumber
        var stringHour : String = xhour.stringValue
        //minute
        var minute = components.minute
        let xminute = minute as NSNumber
        var stringMinute : String = xminute.stringValue
        //second
        let second = components.second
        let xsecond = second as NSNumber
        var stringSecond : String = xsecond.stringValue
        
        //*******START OF WEDNESDAY SCHEDULE*******//
        //WED 7th Period
        if(((hour==8 && (0...59).contains(minute))||(hour==9&&(00...14).contains(minute)))){finalPeriod=seventhPeriod; finalNext="Next: Chapel"}
        else if(hour==9 && (15...19).contains(minute)){finalPeriod="Passing Period"; finalNext="Next: Chapel"}
            //WED Chapel/Break
        else if(((hour==9 && (20...59).contains(minute))||(hour==10&&(00...24).contains(minute)))){finalPeriod="Chapel/Break"; finalNext="Next: "+fourthPeriod}
        else if(hour==10 && (25...29).contains(minute)){finalPeriod="Passing Period"; finalNext="Next: "+fourthPeriod}
            //WED 4th Break
        else if(((hour==10 && (30...59).contains(minute))||(hour==11&&(00...44).contains(minute)))){finalPeriod=fourthPeriod; finalNext="Next: "+fifthPeriodA}
        else if(hour==11 && (45...49).contains(minute)){finalPeriod="Passing Period"; finalNext="Next: "+fifthPeriodA}
            //WED 5A
        else if(((hour==11 && (50...59).contains(minute))||(hour==12&&(00...34).contains(minute)))){finalPeriod=fifthPeriodA; finalNext="Next: "+fifthPeriodB}
        else if(hour==12 && (35...39).contains(minute)){finalPeriod="Passing Period"; finalNext="Next: "+fifthPeriodB}
            //WED 5B
        else if(((hour==12 && (40...59).contains(minute))||(hour==13&&(00...24).contains(minute)))){finalPeriod=fifthPeriodB; finalNext="Next: "+sixthPeriod}
        else if(hour==13 && (25...29).contains(minute)){finalPeriod="Passing Period"; finalNext="Next: "+sixthPeriod}
            //WED 6th Period
        else if(((hour==13 && (30...59).contains(minute))||(hour==14&&(00...44).contains(minute)))){finalPeriod=sixthPeriod; finalNext="Next: Tutorials"}
        else if(hour==14 && (45...49).contains(minute)){finalPeriod="Passing Period"; finalNext="Next: Tutorials"}
            //WED Tutorials
        else if(((hour==14 && (50...59).contains(minute))||(hour==15&&(00...29).contains(minute)))){finalPeriod="Tutorials"; finalNext="End of School"}
        else if(((hour==15 && (30...59).contains(minute))||(((16...24).contains(hour)))||((1...6).contains(hour)))){finalPeriod="Enjoy Your Day"; finalNext="School is Over"}
            //*******END OF WEDNESDAY SCHEDULE*******//
        
            //*******START OF MORNING*******//
        else if(hour==7 && (stringDay=="2")||(stringDay=="3")||(stringDay=="4")||(stringDay=="5")||(stringDay=="6")){finalPeriod="Good Morning"; finalNext="Start of School"}
        //*******END OF MORNING*******//
        
            //*******START OF WEEKEND*******//
        else if(stringDay=="1"||stringDay=="7"){
            finalPeriod="Enjoy Your Day"
            finalNext="School is Over"
            finalRemaining="School is Out"
        }
        //*******END OF WEEKEND*******//
        
        //*******START OF REMAINING TIME SCHEDULE FOR WED*******//
        if(stringDay=="2"||stringDay=="3"||stringDay=="4"||stringDay=="5"||stringDay=="6"){
            //Before School
            if(hour<7){
                finalRemaining="School is Out"
            }
                //Morning of School
            else if(hour==7){
                let thisMinute = 59-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //7th Period
            else if(hour==8&&minute<15){
                let thisHour = 1
                let thisMinute = 14-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisHour)+":"+String(thisMinute)+":"+String(thisSecond)
            }
            else if(hour==8&&minute>=15){
                let thisMinute = 59-minute+15
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
            else if(hour==9&&minute<15){
                let thisMinute = 14-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Passing Period
            else if(hour==9&&minute>=15&&minute<20){
                let thisMinute = 19-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Chapel/Break
            else if(hour==9&&minute>=20&&minute<35){
                let thisHour = 1
                let thisMinute = 34-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisHour)+":"+String(thisMinute)+":"+String(thisSecond)
            }
            else if((hour==9&&minute>=35)||(hour==10&&minute<10)){
                if(hour==9&&minute>=35){
                    let thisMinute = 59-minute+35
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==10&&minute<10){
                    let thisMinute = 9-minute+15
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
            else if(hour==10&&minute<25){
                let thisMinute = 24-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Passing Period
            else if(hour==10&&minute>=25&&minute<30){
                let thisMinute = 29-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //4th Period
            else if(hour==10&&minute>=30&&minute<45){
                let thisHour = 1
                let thisMinute = 44-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisHour)+":"+String(thisMinute)+":"+String(thisSecond)
            }
            else if((hour==10&&minute>=45)||(hour==11&&minute<30)){
                if(hour==10&&minute>=45){
                    let thisMinute = 59-minute+45
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==11&&minute<30){
                    let thisMinute = 29-minute+15
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
            else if(hour==11&&minute>=30&&minute<45){
                let thisMinute = 44-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Passing Period
            else if(hour==11&&minute>=45&&minute<50){
                let thisMinute = 49-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //5A
            else if((hour==11&&minute>=50)||(hour==12&&minute<35)){
                if(hour==11&&minute>=50){
                    let thisMinute = 59-minute+35
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==12&&minute<35){
                    let thisMinute = 34-minute
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
                //Passing Period
            else if(hour==12&&minute>=35&&minute<40){
                let thisMinute = 39-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //5B
            else if((hour==12&&minute>=40)||(hour==13&&minute<25)){
                if(hour==12&&minute<=40){
                    let thisMinute = 59-minute+25
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==13&&minute<25){
                    let thisMinute = 24-minute
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
                //Passing Period
            else if(hour==13&&minute>=25&&minute<30){
                let thisMinute = 29-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //6th Period
            else if(hour==13&&minute>=30&&minute<45){
                let thisHour = 1
                let thisMinute = 44-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisHour)+":"+String(thisMinute)+":"+String(thisSecond)
            }
            else if((hour==13&&minute>=45)||(hour==14&&minute<30)){
                if(hour==13&&minute>=45){
                    let thisMinute = 59-minute+45
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==14&&minute<30){
                    let thisMinute = 29-minute+15
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
            else if(hour==14&&minute>=30&&minute<45){
                let thisMinute = 44-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Passing Period
            else if(hour==14&&minute>=45&&minute<50){
                let thisMinute = 49-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Tutorials
            else if((hour==14&&minute>=50)||(hour==15&&minute<30)){
                if(hour==14&&minute>=50){
                    let thisMinute = 59-minute+30
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==15&&minute<30){
                    let thisMinute = 29-minute
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
                //End of School
            else if((hour==15&&minute>=30)||(hour>15)){
                finalRemaining="School is Out"
            }
        }
        //*******END OF REMAINING TIME SCHEDULE FOR WED*******//
        
        //Set label text based on which IF statement is active
        periodLabel.text=finalPeriod
        nextLabel.text=finalNext
        remainingLabel.text=finalRemaining
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        var timer = NSTimer()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector:"timeManagement", userInfo:nil, repeats:true)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //Set var to saved periods
        if(appDelegate.firstPeriod == ""){
            firstPeriod = "1st Period"
        }
        else{
            firstPeriod = appDelegate.firstPeriod
        }
        if(appDelegate.secondPeriod == ""){
            secondPeriod = "2nd Period"
        }
        else{
            secondPeriod = appDelegate.secondPeriod
        }
        if(appDelegate.thirdPeriod == "")
        {
            thirdPeriod = "3rd Period"
        }
        else{
            thirdPeriod = appDelegate.thirdPeriod
        }
        if(appDelegate.fourthPeriod == ""){
            fourthPeriod = "4th Period"
        }
        else{
            fourthPeriod = appDelegate.fourthPeriod
        }
        if(appDelegate.fifthPeriodA == ""){
            fifthPeriodA = "5A"
        }
        else{
            fifthPeriodA = appDelegate.fifthPeriodA
        }
        if(appDelegate.fifthPeriodB == ""){
            fifthPeriodB = "5B"
        }
        else{
            fifthPeriodB = appDelegate.fifthPeriodB
        }
        if(appDelegate.sixthPeriod == ""){
            sixthPeriod = "6th Period"
        }
        else{
            sixthPeriod = appDelegate.sixthPeriod
        }
        if(appDelegate.seventhPeriod == ""){
            seventhPeriod = "7th Period"
        }
        else{
            seventhPeriod = appDelegate.seventhPeriod
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}