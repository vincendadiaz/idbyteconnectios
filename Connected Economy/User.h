//
//  User.h
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/19/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface User : MTLModel <MTLJSONSerializing>

@property (nonatomic) NSUInteger resourceId;
@property (strong, nonatomic) NSString *facebook;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *job;
@property (strong, nonatomic) NSString *email;

@property (strong, nonatomic) NSString *jobPosition;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *twitter;

@property (strong, nonatomic) NSURL *photo;
@end
