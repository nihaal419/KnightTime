//
//  InterfaceController.swift
//  KnightWatch Extension
//
//  Created by Nihaal Manesia on 1/27/16.
//  Copyright © 2016 N Squared Productions. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var dayLabel: WKInterfaceLabel!
    @IBOutlet var periodLabel: WKInterfaceLabel!
    @IBOutlet var remainingLabel: WKInterfaceLabel!
    @IBOutlet var nextLabel: WKInterfaceLabel!
    
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
        
        if(stringDay=="1"){finalDay="Today is Sunday"}
        if(stringDay=="2"){finalDay="Today is Monday"}
        if(stringDay=="3"){finalDay="Today is Tuesday"}
        if(stringDay=="4"){finalDay="Today is Wednesday"}
        if(stringDay=="5"){finalDay="Today is Thursday"}
        if(stringDay=="6"){finalDay="Today is Friday"}
        if(stringDay=="7"){finalDay="Today is Saturday"}
        //set final text to the label
        dayLabel.setText(finalDay)
        
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
            
            //*******START OF TUESDAY SCHEDULE*******//
            //TUE 2nd Period
        else if(((hour==8 && (0...59).contains(minute))||(hour==9&&(00...14).contains(minute))) && (stringDay=="3")){finalPeriod="2nd Period"; finalNext="Next: Advisory"}
        else if(hour==9 && (15...19).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: Advisory"}
            //TUE ADVISORY
        else if((hour==9 && (20...39).contains(minute)) && (stringDay=="3")){finalPeriod="Advisory"; finalNext="Next: Chapel"}
        else if((hour==9 && (40...44).contains(minute)) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: Chapel"}
            //TUE Chapel/Break
        else if(((hour==9 && (45...59).contains(minute))||(hour==10&&(00...24).contains(minute))) && (stringDay=="3")){finalPeriod="Chapel/Break"; finalNext="Next: 3rd Period"}
        else if(hour==10 && (25...29).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: 3rd Period"}
            //TUE 3rd Period
        else if(((hour==10 && (30...59).contains(minute))||(hour==11&&(00...44).contains(minute))) && (stringDay=="3")){finalPeriod="3rd Period"; finalNext="Next: 5A"}
        else if(hour==11 && (45...49).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: 5A"}
            //TUE 5A
        else if(((hour==11 && (50...59).contains(minute))||(hour==12&&(00...34).contains(minute))) && (stringDay=="3")){finalPeriod="5A"; finalNext="Next: 5B"}
        else if(hour==12 && (35...39).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: 5B"}
            //TUE 5B
        else if(((hour==12 && (40...59).contains(minute))||(hour==13&&(00...24).contains(minute))) && (stringDay=="3")){finalPeriod="5B"; finalNext="Next: 1st Period"}
        else if(hour==13 && (25...29).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: 1st Period"}
            //TUE 1st Period
        else if(((hour==13 && (30...59).contains(minute))||(hour==14&&(00...44).contains(minute))) && (stringDay=="3")){finalPeriod="1st Period"; finalNext="Next: Tutorials"}
        else if(hour==14 && (45...49).contains(minute) && (stringDay=="3")){finalPeriod="Passing Period"; finalNext="Next: Tutorials"}
            //TUE Tutorials
        else if(((hour==14 && (50...59).contains(minute))||(hour==15&&(00...29).contains(minute))) && (stringDay=="3")){finalPeriod="Tutorials"; finalNext="End of School"}
        else if(((hour==15 && (30...59).contains(minute))||(((16...24).contains(hour))||((1...6).contains(hour)))) && (stringDay=="3")){finalPeriod="Enjoy Your Day"; finalNext="School is Over"}
            //*******END OF TUESDAY SCHEDULE*******//
            
            //*******START OF WEDNESDAY SCHEDULE*******//
            //WED 7th Period
        else if(((hour==8 && (0...59).contains(minute))||(hour==9&&(00...14).contains(minute))) && (stringDay=="4")){finalPeriod="7th Period"; finalNext="Next: Chapel"}
        else if(hour==9 && (15...19).contains(minute) && (stringDay=="4")){finalPeriod="Passing Period"; finalNext="Next: Chapel"}
            //WED Chapel/Break
        else if(((hour==9 && (20...59).contains(minute))||(hour==10&&(00...24).contains(minute))) && (stringDay=="4")){finalPeriod="Chapel/Break"; finalNext="Next: 4th Period"}
        else if(hour==10 && (25...29).contains(minute) && (stringDay=="4")){finalPeriod="Passing Period"; finalNext="Next: 4th Period"}
            //WED 4th Break
        else if(((hour==10 && (30...59).contains(minute))||(hour==11&&(00...44).contains(minute))) && (stringDay=="4")){finalPeriod="4th Period"; finalNext="Next: 5A"}
        else if(hour==11 && (45...49).contains(minute) && (stringDay=="4")){finalPeriod="Passing Period"; finalNext="Next: 5A"}
            //WED 5A
        else if(((hour==11 && (50...59).contains(minute))||(hour==12&&(00...34).contains(minute))) && (stringDay=="4")){finalPeriod="5A"; finalNext="Next: 5B"}
        else if(hour==12 && (35...39).contains(minute) && (stringDay=="4")){finalPeriod="Passing Period"; finalNext="Next: 5B"}
            //WED 5B
        else if(((hour==12 && (40...59).contains(minute))||(hour==13&&(00...24).contains(minute))) && (stringDay=="4")){finalPeriod="5B"; finalNext="Next: 6th Period"}
        else if(hour==13 && (25...29).contains(minute) && (stringDay=="4")){finalPeriod="Passing Period"; finalNext="Next: 6th Period"}
            //WED 6th Period
        else if(((hour==13 && (30...59).contains(minute))||(hour==14&&(00...44).contains(minute))) && (stringDay=="4")){finalPeriod="6th Period"; finalNext="Next: Tutorials"}
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
        periodLabel.setText(finalPeriod)
        nextLabel.setText(finalNext)
        remainingLabel.setText(finalRemaining)
        
        //Use to make sure day, hour, minute, and second are all working properly
        //print(stringDay)
        //print(stringHour)
        //print(stringMinute)
        //print(stringSecond)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
    }
    

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        //Created a timer in order to refresh timeManagement funtion every .5 seconds
        var timer = NSTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector:"timeManagement", userInfo:nil, repeats:true)
        
//        var userDefaults = NSUserDefaults(suiteName: "group.com.ehshouston.KnightTime")
//        userDefaults?.synchronize()
//        print(userDefaults?.stringForKey("firstPeriod"))
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
