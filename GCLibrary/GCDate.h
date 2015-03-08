//
//  GCDateFormatter.h
//  GCLibrary
//
//  Created by Gustavo Couto on 2015-03-07.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDate : NSObject

+(NSArray *)getDateArrayFromOpenHour:(NSDate *)openDate toDate:(NSDate *)toDate;
+ (NSDate *) createDateWithHour:(NSInteger)hour andMinutes:(NSInteger)minutes;

@end
