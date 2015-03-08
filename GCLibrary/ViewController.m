//
//  ViewController.m
//  GCLibrary
//
//  Created by Gustavo Couto on 2015-02-23.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import "ViewController.h"
#import "GCDate.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[GCDateFormatter getDateArrayForInterval:interval fromDate:[NSDate date] toDate: ]
    NSDate * openHour = [GCDate createDateWithHour:20 andMinutes:30];
    NSDate * myDate = [GCDate createDateWithHour:22 andMinutes:30];
    NSArray * myArray = [GCDate getDateArrayFromOpenHour:openHour toDate:myDate];
    NSString *dateStr;
    NSDateFormatter *dateFormatters = [[NSDateFormatter alloc] init];
    [dateFormatters setDateFormat:@"dd-MMM-yyyy hh:mm"];
    [dateFormatters setDateStyle:NSDateFormatterShortStyle];
    [dateFormatters setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatters setDoesRelativeDateFormatting:YES];
    [dateFormatters setTimeZone:[NSTimeZone systemTimeZone]];
    dateStr = [dateFormatters stringFromDate: myArray[0]];
    NSLog(@"%@", dateStr);
}


@end
