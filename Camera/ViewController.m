//
//  ViewController.m
//  Camera
//
//  Created by ME-Tech MacPro User 2 on 11/19/15.
//  Copyright © 2015 iTrain Asia. All rights reserved.
//

#include "ViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>


@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Camera

- (IBAction)useCamera:(id)sender {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = [NSArray arrayWithObjects:(NSString*)kUTTypeImage, nil];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
        self.newMedia = YES;
    }
    else{
        
        NSLog(@"No Camera");
        
    }
}

- (IBAction)useCameraRoll:(id)sender {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        imagePicker.mediaTypes = [NSArray arrayWithObjects:(NSString*)kUTTypeImage, nil];
    
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
        self.newMedia = NO;
    }
    else{
        
        NSLog(@"No Photo Library");
        
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([mediaType isEqualToString:(NSString*)kUTTypeImage]){
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.imageView.image = image;
        
        if (self.newMedia)
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:finishedSavingWithError:contextInfo:), nil);
    }
    else if ([mediaType isEqualToString:(NSString*)kUTTypeMovie]){
        
    }
}

-(void)image:(UIImage*)image finishedSavingWithError:(NSError*)error contextInfo:(void*)contextInfo{
    if (error){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Save failed" message:@"Failed to save image" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}
@end
