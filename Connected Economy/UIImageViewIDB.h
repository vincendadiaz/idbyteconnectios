//
//  UIImageViewBl.h
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/18/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>

@interface UIImageView (BL)
- (void)fadeImageWithURL:(NSURL *)url;
- (void)fadeImageWithURLRounded:(NSURL *)url UIImageView:iv;
@end

