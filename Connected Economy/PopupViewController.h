//
//  PopupViewController.h
//  Connected Economy
//
//  Created by M. Firza Pratama on 8/28/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

#ifndef PopupViewController_h
#define PopupViewController_h
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface PopupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *popUpView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImg;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

- (void)showInView:(UIView *)aView withImage:(UIImage *)image withMessage:(NSString *)message animated:(BOOL)animated;

@end


#endif /* PopupViewController_h */
