//
//  Created by Mihaela Pacalau on 9/26/16.
//  Copyright © 2016 Marcel Spinu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCellController : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *cellText;

-(void) remakeFrame:(CGRect) newFrame;
-(void) setNewImage:(UIImage*) newImage;

@end
