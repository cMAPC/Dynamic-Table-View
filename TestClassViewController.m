//
//  TestClassViewController.m
//  Dynamic Table View
//
//  Created by Mihaela Pacalau on 9/28/16.
//  Copyright © 2016 Marcel Spinu. All rights reserved.
//

#import "TestClassViewController.h"

@interface TestClassViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TestClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage* image = [UIImage imageNamed:@"image1.jpg"];
    
//    CGRect imageViewFrame = self.prototypeCell.cellImage.frame;
//    NSLog(@"%f", imageViewFrame.size.width);
    
    UIImage* testImage = [self imageWithImage:image scaledToWidth:self.imageView.frame.size.width];
    [self.imageView setImage:testImage];
}

-(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width
{
    float oldWidth = sourceImage.size.width;
    float scaleFactor = i_width / oldWidth;
    
    float newHeight = sourceImage.size.height / scaleFactor;
    float newWidth = oldWidth / scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
