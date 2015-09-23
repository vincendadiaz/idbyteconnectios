//
//  IDBytesManager.h
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/18/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface IDBytesManager : NSObject

-(AFHTTPRequestOperationManager *)requestManager;

@property (strong,nonatomic) NSString* token;
@property (strong,nonatomic) NSString* email;
+(IDBytesManager *) sharedInstance;
- (void)saveCache;
- (NSDictionary*)loadCache;
-(void)logOut;


@end
