//
//  Created by Mihaela Pacalau on 9/26/16.
//  Copyright © 2016 Marcel Spinu. All rights reserved.
//

#import "TableViewCellController.h"

@implementation TableViewCellController

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(void) remakeFrame:(CGRect) newFrame {
    
    self.cellImage.frame = newFrame;
}

-(void) setNewImage:(UIImage*) newImage {
    
    self.cellImage.image = newImage;
}

@end
