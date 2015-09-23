//
//  User.m
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/19/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

#import "User.h"

@implementation User
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"resourceId": @"id",
             @"photo":@"url_photo",
             @"jobPosition":@"job_position"
             };
}

+ (NSValueTransformer *)photoJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
