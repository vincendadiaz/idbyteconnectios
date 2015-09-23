//
//  IDBytesManager.m
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/18/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

#import "IDBytesManager.h"

@implementation IDBytesManager

+ (IDBytesManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    static IDBytesManager *_instance;
    dispatch_once(&onceToken, ^{
        _instance = [[IDBytesManager alloc] init];
    });
    return _instance;
}

- (void)setToken:(NSString *)token
{
    _token = token;
    [[self requestManager].requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
}

- (NSString *)archiveDirectory
{
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dir = [documentsDirectory stringByAppendingPathComponent:@"UserCache"];
    return dir;
}

- (void)saveCache
{
    NSString *dir = self.archiveDirectory;
    NSLog(dir);
    NSDictionary *appInfosJson = @{
        @"token":self.token,@"email":self.email};
    [appInfosJson writeToFile:dir atomically:YES];
}

- (NSDictionary*)loadCache
{
    if([[NSFileManager defaultManager] fileExistsAtPath:self.archiveDirectory])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:self.archiveDirectory];
        self.token= dict[@"token"];
        
        self.email= dict[@"email"];
        return dict;
    }
    return nil;

}

-(void)logOut
{
    if([[NSFileManager defaultManager] fileExistsAtPath:self.archiveDirectory])
    {
        NSError *e;
        [[NSFileManager defaultManager] removeItemAtPath:self.archiveDirectory error:&e];
    }
    self.token=nil;
    self.email=nil;
}

- (AFHTTPRequestOperationManager *)requestManager
{
    static dispatch_once_t onceToken;
    static AFHTTPRequestOperationManager *_requestsManager;
    dispatch_once(&onceToken, ^{
        NSString *baseURLString = @"http://139.162.17.16:8080/";
        _requestsManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:baseURLString]];
        NSOperationQueue *operationQueue = _requestsManager.operationQueue;
        [_requestsManager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [_requestsManager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWWAN:
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    [operationQueue setSuspended:NO];
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                default:
                    [operationQueue setSuspended:YES];
                    break;
            }
        }];
        [_requestsManager.reachabilityManager startMonitoring];
    });
    return _requestsManager;
}

/*- (void)clearTokens
{
    NSString *token = [SSKeychain passwordForService:BLKeychainServiceName account:BLKeychainAPNTokenAccountName];
    
    [FBSDKAccessToken setCurrentAccessToken:nil];
    [FBSDKProfile setCurrentProfile:nil];
    [[IDBytesManager requestManager].requestSerializer clearAuthorizationHeader];
}*/

@end

