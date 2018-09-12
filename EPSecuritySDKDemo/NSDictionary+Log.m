//
//  NSDictionary+Log.m
//  FineChat
//
//  Created by shi on 2017/1/22.
//  Copyright © 2017年 shiweiyin. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * mStr = [[NSMutableString alloc] initWithString:@"{\n"];
    for (id objc in self) {
        [mStr appendFormat:@"\t%@ = %@;\n",objc,self[objc]];
    }
    
    [mStr appendString:@"}"];
    
    return mStr;
}

- (NSString *)description
{
    NSMutableString * mStr = [[NSMutableString alloc] initWithString:@"{\n"];
    for (id objc in self) {
        [mStr appendFormat:@"\t%@ = %@;\n",objc,self[objc]];
    }
    
    [mStr appendString:@"}"];
    
    return mStr;
}

@end
