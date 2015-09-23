//
//  UIImageViewBl.m
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/18/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

#import "UIImageViewIDB.h"
#import "UIImageView+AFNetworking.h"

@implementation UIImageView (IDB)

- (void)fadeImageWithURL:(NSURL *)url
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    __weak typeof(self) weakSelf = self;
    
    [self setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [UIView transitionWithView:weakSelf duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionAllowUserInteraction animations:^{
            weakSelf.image = image;
        } completion:^(BOOL finished) {
        }];
    } failure:nil];
}

- (void)fadeImageWithURLRounded:(NSURL *)url UIImageView:iv
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    __weak typeof(self) weakSelf = self;
    
    [self setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [UIView transitionWithView:weakSelf duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionAllowUserInteraction animations:^{
            weakSelf.image = image;
            [weakSelf layer].cornerRadius=[weakSelf frame].size.width / 2;
            [weakSelf layer].masksToBounds = YES;
        } completion:^(BOOL finished) {
        }];
    } failure:nil];
}




@end
