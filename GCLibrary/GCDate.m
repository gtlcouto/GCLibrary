//
//  GCDateFormatter.m
//  GCLibrary
//
//  Created by Gustavo Couto on 2015-03-07.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import "GCDate.h"

@implementation GCDate

/*
 Function: getDateArrayForInterval:anInterval:fromDate:toDate
 Arguments: NSInterger * interval(interval in minutes) / NSDate * fromDate(usually current date) / NSDate * toDate(endDate)
 Returns: NSArray * containing times formatted in intervals based on interval argument
 Description: Gets Raw string from platformRawString and converts it into readable string
 */
+(NSArray *)getDateArrayFromOpenHour:(NSDate *)openDate toDate:(NSDate *)toDate
{
    if ([openDate timeIntervalSinceDate:[NSDate date]] < 0) {
        //array to be populated and returned by this function
        NSMutableArray * dateArray = [NSMutableArray new];
        //change interval from minutes to seconds
        NSInteger intervalInSeconds = 30 * 60;
        //Get Rounded Up date
        NSDate * theDate = [NSDate date];
        //get time in seconds from toTate since current date
        NSTimeInterval timeIntervalFromToDateSinceNow = [toDate timeIntervalSinceDate:[GCDate roundMinuteDateForCurrentTime]];
        NSInteger timeIntervalFromToDateSinceNowInt = timeIntervalFromToDateSinceNow;
        //getNumber of dateBased one date
        NSInteger count = timeIntervalFromToDateSinceNowInt / intervalInSeconds;

        for (long x = count; x>0; x--) {
            if (x == count) {
                theDate = [GCDate createIncreasedDateDateWithRoundedDate:theDate];
                [dateArray addObject:theDate];
            } else
            {
                theDate = [GCDate increaseDateByInterval:theDate];
                [dateArray addObject:theDate];
            }


        }
        NSLog(@"%@", dateArray);
        return dateArray;
     } else
     {
         return nil;
     }
}


+ (NSDate*) createDateWithHour:(NSInteger)hour andMinutes:(NSInteger)minutes {
    NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* dateComponents = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:[NSDate date]];

    [dateComponents setHour:hour];
    [dateComponents setMinute:minutes];
    [dateComponents setSecond:00];

    return [gregorian dateFromComponents:dateComponents];
}

//Increases current time by multiples of 30 minutes
// if 5:14 -> 5:30
// if 5:15 -> 6:00
// if 5:30 -> 6:00
// if 5:44 -> 6:00
// if 5:45 -> 6:30
+ (NSDate *) createIncreasedDateDateWithRoundedDate:(NSDate *)roundedDate {
    NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* dateComponents = [gregorian components:(NSCalendarUnitMinute| NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:[NSDate date]];

    if (dateComponents.minute < 15) {
        [dateComponents setMinute:30];
        [dateComponents setSecond:0];
    }
    else if (dateComponents.minute < 45) {
        [dateComponents setHour:++dateComponents.hour];
        [dateComponents setMinute:00];
        [dateComponents setSecond:0];
    }
    else if (dateComponents.minute >= 45) {
        [dateComponents setMinute:30];
        [dateComponents setSecond:0];
        [dateComponents setHour:++dateComponents.hour];
    }


    return [gregorian dateFromComponents:dateComponents];
}

//Increases current time by multiples of 30 minutes
// if 5:14 -> 5:30
// if 5:15 -> 6:00
// if 5:30 -> 6:00
// if 5:44 -> 6:00
// if 5:45 -> 6:30
+ (NSDate *) increaseDateByInterval:(NSDate *)date {
    NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* dateComponents = [gregorian components:(NSCalendarUnitMinute| NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:date];

    if (dateComponents.minute == 00) {
        [dateComponents setMinute:30];
    }
    else if (dateComponents.minute == 30) {
        [dateComponents setHour:++dateComponents.hour];
        [dateComponents setMinute:00];
    }
    else {
        NSLog(@"something real wrong here");
    }


    return [gregorian dateFromComponents:dateComponents];
}




//Rounds up current hour and minutes
// if 5:14 -> 5:00
// if 5:15 -> 5:30
// if 5:45 -> 6:00
+(NSDate *) roundMinuteDateForCurrentTime
{
    NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* dateComponents = [gregorian components:(NSCalendarUnitMinute| NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear) fromDate:[NSDate date]];

    if (dateComponents.minute < 15) {
        [dateComponents setMinute:0];
        [dateComponents setSecond:0];
    }
    else if (dateComponents.minute >= 15) {
        [dateComponents setMinute:30];
        [dateComponents setSecond:0];
    }
    else if (dateComponents.minute >= 45) {
        [dateComponents setMinute:0];
        [dateComponents setSecond:0];
        [dateComponents setHour:++dateComponents.hour];
    }

    return [gregorian dateFromComponents:dateComponents];
}

@end
