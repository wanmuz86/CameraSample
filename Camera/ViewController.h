//
//  ViewController.h
//  Camera
//
//  Created by ME-Tech MacPro User 2 on 11/19/15.
//  Copyright © 2015 iTrain Asia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (assign, nonatomic) BOOL newMedia;

- (IBAction)useCamera:(id)sender;
- (IBAction)useCameraRoll:(id)sender;


@end

