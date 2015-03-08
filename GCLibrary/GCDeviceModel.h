//
//  GCDeviceModel.h
//  GCLibrary
//
//  Created by Gustavo Couto on 2015-02-23.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDeviceModel : NSObject

+ (NSString *) platformRawString;
+ (NSString *) platformNiceString;

@end
