//
//  ViewController.swift
//  KnightTime
//
//  Created by Nihaal Manesia on 1/27/16.
//  Copyright © 2016 N Squared Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var remainingLabel: UILabel!
    @IBOutlet weak var nextLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var autoView: UIView!
    
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
    
    
    public func timeManagement(){
        //Method created in order to use an NSTimer to run method every .5 seconds in order to refresh labels
        
        //Getting Day using NSCalendar and convert Int to String
        let calendar = NSCalendar.currentCalendar()
        let date = NSDate()
        let dateComponent =  calendar.components(NSCalendarUnit.Weekday, fromDate: date)
        let weekday = dateComponent.weekday
        let xday = weekday as NSNumber
        var stringDay : String = xday.stringValue
        
        if(stringDay=="1"){finalDay="Today is Sunday"; imageView.image = UIImage(named:"No School")}
        if(stringDay=="2"){finalDay="Today is Monday"; imageView.image = UIImage(named:"Mon")}
        if(stringDay=="3"){finalDay="Today is Tuesday"; imageView.image = UIImage(named:"Tuesday")}
        if(stringDay=="4"){finalDay="Today is Wednesday"; imageView.image = UIImage(named:"Wednesday")}
        if(stringDay=="5"){finalDay="Today is Thursday"; imageView.image = UIImage(named:"Mon")}
        if(stringDay=="6"){finalDay="Today is Friday"; imageView.image = UIImage(named:"Mon")}
        if(stringDay=="7"){finalDay="Today is Saturday"; imageView.image = UIImage(named:"No School")}
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
        
        //Finding which period it is, using hour and minute values
        //*******START OF MONDAY SCHEDULE*******//
        //MON/THUR/FRI 1st Period
        if((hour==8 && (0...44).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod=firstPeriod; finalNext="Next: "+secondPeriod}
        else if((hour==8 && (45...49).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: "+secondPeriod}
            //MON/THUR/FRI 2nd Period
        else if(((hour==8&&(50...59).contains(minute))||(hour==9&&(00...34).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod=secondPeriod; finalNext="Next: Chapel"}
        else if((hour==9 && (35...39).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: Chapel"}
            //MON/THUR/FRI Chapel/Break
        else if(((hour==9&&(40...59).contains(minute))||(hour==10&&(00...14).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Chapel/Break"; finalNext="Next: "+thirdPeriod}
        else if((hour==10 && (15...19).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: "+thirdPeriod}
            //MON/THUR/FRI 3rd Period
        else if(((hour==10&&(20...59).contains(minute))||(hour==11&&(00...04).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod=thirdPeriod; finalNext="Next: "+fourthPeriod}
        else if((hour==11 && (05...09).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: "+fourthPeriod}
            //MON/THUR/FRI 4th Period
        else if((hour==11 && (10...54).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod=fourthPeriod; finalNext="Next: "+fifthPeriodA}
        else if(hour==11 && (55...59).contains(minute) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: "+fifthPeriodA}
            //MON/THUR/FRI 5A
        else if((hour==12 && (00...44).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod=fifthPeriodA; finalNext="Next: "+fifthPeriodB}
        else if((hour==12 && (45...49).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: "+fifthPeriodB}
            //MON/THUR/FRI 5B
        else if(((hour==12&&(50...59).contains(minute))||(hour==13&&(00...34).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod=fifthPeriodB; finalNext="Next: "+sixthPeriod}
        else if((hour==13 && (35...39).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: "+sixthPeriod}
            //MON/THUR/FRI 6th Period
        else if(((hour==13&&(40...59).contains(minute))||(hour==14&&(00...24).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod=sixthPeriod; finalNext="Next: "+seventhPeriod}
        else if((hour==14 && (25...29).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: "+seventhPeriod}
            //MON/THUR/FRI 7th Period
        else if(((hour==14&&(30...59).contains(minute))||(hour==15&&(00...14).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod=seventhPeriod; finalNext="Next: Tutorials"}
        else if((hour==15 && (15...19).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: Tutorials"}
            //MON/THUR/FRI Tutorials
        else if((hour==15 && (20...59).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Tutorials"; finalNext="End of School"}
        else if((((16...24).contains(hour))||((1...6).contains(hour)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Enjoy Your Day"; finalNext="School is Over"}
            //*******END OF MONDAY SCHEDULE*******//
            
            //*******START OF TUESDAY SCHEDULE*******//
            //TUE 2nd Period
        else if(((hour==8 && (0...59).contains(minute))||(hour==9&&(00...14).contains(minute))) && (stringDay=="3")){finalPeriod=secondPeriod; finalNext="Next: Advisory"}
        else if(hour==9 && (15...19).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: Advisory"}
            //TUE ADVISORY
        else if((hour==9 && (20...39).contains(minute)) && (stringDay=="3")){finalPeriod="Advisory"; finalNext="Next: Chapel"}
        else if((hour==9 && (40...44).contains(minute)) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: Chapel"}
            //TUE Chapel/Break
        else if(((hour==9 && (45...59).contains(minute))||(hour==10&&(00...24).contains(minute))) && (stringDay=="3")){finalPeriod="Chapel/Break"; finalNext="Next: "+thirdPeriod}
        else if(hour==10 && (25...29).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: "+thirdPeriod}
            //TUE 3rd Period
        else if(((hour==10 && (30...59).contains(minute))||(hour==11&&(00...44).contains(minute))) && (stringDay=="3")){finalPeriod=thirdPeriod; finalNext="Next: "+fifthPeriodA}
        else if(hour==11 && (45...49).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: "+fifthPeriodA}
            //TUE 5A
        else if(((hour==11 && (50...59).contains(minute))||(hour==12&&(00...34).contains(minute))) && (stringDay=="3")){finalPeriod=fifthPeriodA; finalNext="Next: "+fifthPeriodB}
        else if(hour==12 && (35...39).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: "+fifthPeriodB}
            //TUE 5B
        else if(((hour==12 && (40...59).contains(minute))||(hour==13&&(00...24).contains(minute))) && (stringDay=="3")){finalPeriod=fifthPeriodB; finalNext="Next: "+firstPeriod}
        else if(hour==13 && (25...29).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: "+firstPeriod}
            //TUE 1st Period
        else if(((hour==13 && (30...59).contains(minute))||(hour==14&&(00...44).contains(minute))) && (stringDay=="3")){finalPeriod=firstPeriod; finalNext="Next: Tutorials"}
        else if(hour==14 && (45...49).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: Tutorials"}
            //TUE Tutorials
        else if(((hour==14 && (50...59).contains(minute))||(hour==15&&(00...29).contains(minute))) && (stringDay=="3")){finalPeriod="Tutorials"; finalNext="End of School"}
        else if(((hour==15 && (30...59).contains(minute))||(((16...24).contains(hour))||((1...6).contains(hour)))) && (stringDay=="3")){finalPeriod="Enjoy Your Day"; finalNext="School is Over"}
            //*******END OF TUESDAY SCHEDULE*******//
            
            //*******START OF WEDNESDAY SCHEDULE*******//
            //WED 7th Period
        else if(((hour==8 && (0...59).contains(minute))||(hour==9&&(00...14).contains(minute))) && (stringDay=="4")){finalPeriod=seventhPeriod; finalNext="Next: Chapel"}
        else if(hour==9 && (15...19).contains(minute) && (stringDay=="4")){finalPeriod="Passing Period"; finalNext="Next: Chapel"}
            //WED Chapel/Break
        else if(((hour==9 && (20...59).contains(minute))||(hour==10&&(00...24).contains(minute))) && (stringDay=="4")){finalPeriod="Chapel/Break"; finalNext="Next: "+fourthPeriod}
        else if(hour==10 && (25...29).contains(minute) && (stringDay=="4")){finalPeriod="Passing Period"; finalNext="Next: "+fourthPeriod}
            //WED 4th Break
        else if(((hour==10 && (30...59).contains(minute))||(hour==11&&(00...44).contains(minute))) && (stringDay=="4")){finalPeriod=fourthPeriod; finalNext="Next: "+fifthPeriodA}
        else if(hour==11 && (45...49).contains(minute) && (stringDay=="4")){finalPeriod="Passing Period"; finalNext="Next: "+fifthPeriodA}
            //WED 5A
        else if(((hour==11 && (50...59).contains(minute))||(hour==12&&(00...34).contains(minute))) && (stringDay=="4")){finalPeriod=fifthPeriodA; finalNext="Next: "+fifthPeriodB}
        else if(hour==12 && (35...39).contains(minute) && (stringDay=="4")){finalPeriod="Passing Period"; finalNext="Next: "+fifthPeriodB}
            //WED 5B
        else if(((hour==12 && (40...59).contains(minute))||(hour==13&&(00...24).contains(minute))) && (stringDay=="4")){finalPeriod=fifthPeriodB; finalNext="Next: "+sixthPeriod}
        else if(hour==13 && (25...29).contains(minute) && (stringDay=="4")){finalPeriod="Passing Period"; finalNext="Next: "+sixthPeriod}
            //WED 6th Period
        else if(((hour==13 && (30...59).contains(minute))||(hour==14&&(00...44).contains(minute))) && (stringDay=="4")){finalPeriod=sixthPeriod; finalNext="Next: Tutorials"}
        else if(hour==14 && (45...49).contains(minute) && (stringDay=="4")){finalPeriod="Passing Period"; finalNext="Next: Tutorials"}
            //WED Tutorials
        else if(((hour==14 && (50...59).contains(minute))||(hour==15&&(00...29).contains(minute))) && (stringDay=="4")){finalPeriod="Tutorials"; finalNext="End of School"}
        else if(((hour==15 && (30...59).contains(minute))||(((16...24).contains(hour)))||((1...6).contains(hour))) && (stringDay=="4")){finalPeriod="Enjoy Your Day"; finalNext="School is Over"}
            //*******END OF WEDNESDAY SCHEDULE*******//
            
            //*******START OF WEEKEND*******//
        else if(stringDay=="1"||stringDay=="7"){
            finalPeriod="Enjoy Your Day"
            finalNext="School is Over"
            finalRemaining="School is Out"
        }
            //*******END OF WEEKEND*******//
            
            //*******START OF MORNING*******//
        else if(hour==7 && (stringDay=="2")||(stringDay=="3")||(stringDay=="4")||(stringDay=="5")||(stringDay=="6")){finalPeriod="Good Morning"; finalNext="Start of School"}
        //*******END OF MORNING*******//
        
        //*******START OF REMAINING TIME SCHEDULE FOR MON/THUR/FRI*******//
        if(stringDay=="2"||stringDay=="5"||stringDay=="6"){
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
                //1st Period
            else if(hour==8&&minute<45){
                let thisMinute = 44-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Passing Period
            else if(hour==8&&minute>=45&&minute<50){
                let thisMinute = 49-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //2nd Period
            else if((hour==8&&minute>=50)||(hour==9&&minute<35)){
                if(hour==8&&minute>=50){
                    let thisMinute = 59-minute+35
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==9&&minute<35){
                    let thisMinute = 34-minute
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
                //Passing Period
            else if(hour==9&&minute>=35&&minute<40){
                let thisMinute = 39-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Chapel/Break
            else if((hour==9&&minute>=40)||(hour==10&&minute<15)){
                if(hour==9&&minute>=40){
                    let thisMinute = 59-minute+15
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==10&&minute<15){
                    let thisMinute = 14-minute
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
                //Passing Period
            else if(hour==10&&minute>=15&&minute<20){
                let thisMinute = 19-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //3rd Period
            else if((hour==10&&minute>=20)||(hour==11&&minute<5)){
                if(hour==10&&minute>=20){
                    let thisMinute = 59-minute+5
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==11&&minute<5){
                    let thisMinute = 4-minute
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
                //Passing Period
            else if(hour==11&&minute>=5&&minute<10){
                let thisMinute = 9-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //4th Period
            else if(hour==11&&minute>=10&&minute<55){
                let thisMinute = 54-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Passing Period
            else if(hour==11&&minute>=55){
                let thisMinute = 59-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //5A
            else if(hour==12&&minute<45){
                let thisMinute = 44-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Passing Period
            else if(hour==12&&minute>=45&&minute<50){
                let thisMinute = 49-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //5B
            else if((hour==12&&minute>=50)||(hour==13&&minute<35)){
                if(hour==12&&minute>=50){
                    let thisMinute = 59-minute+35
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==13&&minute<35){
                    let thisMinute = 34-minute
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
                //Passing Period
            else if(hour==13&&minute>=35&&minute<40){
                let thisMinute = 39-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //6th Period
            else if((hour==13&&minute>=40)||(hour==14&&minute<25)){
                if(hour==13&&minute>=40){
                    let thisMinute = 59-minute+25
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==14&&minute<25){
                    let thisMinute = 24-minute
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
                //Passing Period
            else if(hour==14&&minute>=25&&minute<30){
                let thisMinute = 29-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //7th Period
            else if((hour==14&&minute>=30)||(hour==15&&minute<15)){
                if(hour==14&&minute>=30){
                    let thisMinute = 59-minute+15
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==15&&minute<15){
                    let thisMinute = 14-minute
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
                //Passing Period
            else if(hour==15&&minute>=15&&minute<20){
                let thisMinute = 19-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Tutorials
            else if(hour==15&&minute>=20){
                let thisMinute = 59-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
            else if(hour>=16){
                finalRemaining="School is Out"
            }
        }
        //*******END OF REMAINING TIME SCHEDULE FOR MON/THUR/FRI*******//
        
        //*******START OF REMAINING TIME SCHEDULE FOR TUE*******//
        if(stringDay=="3"){
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
                //2nd Period
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
                //Advisory
            else if(hour==9&&minute>=20&&minute<40){
                let thisMinute = 39-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Passing Period
            else if(hour==9&&minute>=40&&minute<45){
                let thisMinute = 44-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //Chapel/Break
            else if((hour==9&&minute>=45)||(hour==10&&minute<25)){
                if(hour==9&&minute>=45){
                    let thisMinute = 59-minute+25
                    let thisSecond = 59-minute
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
                if(hour==10&&minute<25){
                    let thisMinute = 24-minute
                    let thisSecond = 59-second
                    finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
                }
            }
                //Passing Period
            else if(hour==10&&minute>=25&&minute<30){
                let thisMinute = 29-minute
                let thisSecond = 59-second
                finalRemaining="Remaining: "+String(thisMinute)+":"+String(thisSecond)
            }
                //3rd Period
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
                if(hour==12&&minute>=40){
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
                //1st Period
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
        //*******END OF REMAINING TIME SCHEDULE FOR TUE*******//
        
        //*******START OF REMAINING TIME SCHEDULE FOR WED*******//
        if(stringDay=="4"){
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
        
        //Use to make sure day, hour, minute, and second are all working properly
        //print(stringDay)
        //print(stringHour)
        //print(stringMinute)
        //print(stringSecond)
    }
    
    public func mondaySchedule(){
        //Method created in order to use an NSTimer to run method every .5 seconds in order to refresh labels
        
        //Getting Day using NSCalendar and convert Int to String
        let calendar = NSCalendar.currentCalendar()
        let date = NSDate()
        let dateComponent =  calendar.components(NSCalendarUnit.Weekday, fromDate: date)
        let weekday = dateComponent.weekday
        let xday = weekday as NSNumber
        var stringDay : String = xday.stringValue
        
        if(stringDay=="1"){finalDay="Today is Sunday"; imageView.image = UIImage(named:"No School")}
        if(stringDay=="2"){finalDay="Today is Monday"; imageView.image = UIImage(named:"Mon")}
        if(stringDay=="3"){finalDay="Today is Tuesday"; imageView.image = UIImage(named:"Tuesday")}
        if(stringDay=="4"){finalDay="Today is Wednesday"; imageView.image = UIImage(named:"Wednesday")}
        if(stringDay=="5"){finalDay="Today is Thursday"; imageView.image = UIImage(named:"Mon")}
        if(stringDay=="6"){finalDay="Today is Friday"; imageView.image = UIImage(named:"Mon")}
        if(stringDay=="7"){finalDay="Today is Saturday"; imageView.image = UIImage(named:"No School")}
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
        
        //Finding which period it is, using hour and minute values
        //*******START OF MONDAY SCHEDULE*******//
        //MON/THUR/FRI 1st Period
        if((hour==8 && (0...44).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="1st Period"; finalNext="Next: 2nd Period"}
        else if((hour==8 && (45...49).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: 2nd Period"}
            //MON/THUR/FRI 2nd Period
        else if(((hour==8&&(50...59).contains(minute))||(hour==9&&(00...34).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="2nd Period"; finalNext="Next: Chapel"}
        else if((hour==9 && (35...39).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: Chapel"}
            //MON/THUR/FRI Chapel/Break
        else if(((hour==9&&(40...59).contains(minute))||(hour==10&&(00...14).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Chapel/Break"; finalNext="Next: 3rd Period"}
        else if((hour==10 && (15...19).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: 3rd Period"}
            //MON/THUR/FRI 3rd Period
        else if(((hour==10&&(20...59).contains(minute))||(hour==11&&(00...04).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="3rd Period"; finalNext="Next: 4th Period"}
        else if((hour==11 && (05...09).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: 4th Period"}
            //MON/THUR/FRI 4th Period
        else if((hour==11 && (10...54).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="4th Period"; finalNext="Next: 5A"}
        else if(hour==11 && (55...59).contains(minute) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: 5A"}
            //MON/THUR/FRI 5A
        else if((hour==12 && (00...44).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="5A"; finalNext="Next: 5B"}
        else if((hour==12 && (45...49).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: 5B"}
            //MON/THUR/FRI 5B
        else if(((hour==12&&(50...59).contains(minute))||(hour==13&&(00...34).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="5B"; finalNext="Next: 6th Period"}
        else if((hour==13 && (35...39).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: 6th Period"}
            //MON/THUR/FRI 6th Period
        else if(((hour==13&&(40...59).contains(minute))||(hour==14&&(00...24).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="6th Period"; finalNext="Next: 7th Period"}
        else if((hour==14 && (25...29).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: 7th Period"}
            //MON/THUR/FRI 7th Period
        else if(((hour==14&&(30...59).contains(minute))||(hour==15&&(00...14).contains(minute)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="7th Period"; finalNext="Next: Tutorials"}
        else if((hour==15 && (15...19).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Passing Period"; finalNext="Next: Tutorials"}
            //MON/THUR/FRI Tutorials
        else if((hour==15 && (20...59).contains(minute)) && (stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Tutorials"; finalNext="End of School"}
        else if((((16...24).contains(hour))||((1...6).contains(hour)))&&(stringDay=="2"||stringDay=="5"||stringDay=="6")){finalPeriod="Enjoy Your Day"; finalNext="School is Over"}
        //*******END OF MONDAY SCHEDULE*******//
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
        
//        var userDefaults = NSUserDefaults(suiteName: "group.com.ehshouston.KnightTime")
//        userDefaults?.setObject(firstPeriod, forKey: "firstPeriod")
//        userDefaults?.synchronize()
        
        print(firstPeriod,secondPeriod,thirdPeriod,fourthPeriod,fifthPeriodA,fifthPeriodB,sixthPeriod,seventhPeriod)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

