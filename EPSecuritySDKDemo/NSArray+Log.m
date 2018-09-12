//
//  NSArray+Log.m
//  FineChat
//
//  Created by shi on 2017/1/22.
//  Copyright © 2017年 shiweiyin. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * mStr = [[NSMutableString alloc] initWithString:@"(\n"];
    for (id objc in self) {
        [mStr appendFormat:@"\t%@,\n",objc];
    }
    [mStr deleteCharactersInRange:NSMakeRange(mStr.length - 1, 1)];
    
    [mStr appendString:@")"];
    
    return mStr;
}

- (NSString *)description
{
    NSMutableString * mStr = [[NSMutableString alloc] initWithString:@"(\n"];
    for (id objc in self) {
        [mStr appendFormat:@"\t%@,\n",objc];
    }
    [mStr deleteCharactersInRange:NSMakeRange(mStr.length - 2, 1)];
    
    [mStr appendString:@")"];
    
    return mStr;
}

@end
