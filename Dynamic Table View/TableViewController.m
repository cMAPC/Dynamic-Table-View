//
//  Created by Mihaela Pacalau on 9/26/16.
//  Copyright © 2016 Marcel Spinu. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCellController.h"
#import "TableViewCellData.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* listOfElements;

@end

NSString* indentifier = @"cell";


@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableWithCustomCell];
    [self loadDataForTableView];
    
}

-(void)initTableWithCustomCell {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCellController" bundle:nil] forCellReuseIdentifier:indentifier];
}

-(void)loadDataForTableView {

    TableViewCellData* cellData1 = [TableViewCellData new];
    cellData1.notificationText = @"This is first cell textThis is second cell text";
    cellData1.imagee = [UIImage imageNamed:@"image1.jpg"];
    
    TableViewCellData* cellData2 = [TableViewCellData new];
    cellData2.notificationText = @"This is second cell textThis is second cell textThis is second cell textThis is second cell textThis is second cell text";
    cellData2.imagee = [UIImage imageNamed:@"image4.jpg"];
    
    TableViewCellData* cellData3 = [TableViewCellData new];
    cellData3.notificationText = @"If the linebreakmode doesnt work foryou, another option is to actually calculate the length your string is going to take and if it is going to be longer than the label size, add yourself.If the linebreakmode doesnt work foryou, another option is to actually calculate the length your string is going to take and if it is going to be longer than the label size, add yourself.";
    cellData3.imagee = [UIImage imageNamed:@"image3.jpg"];
    
    self.listOfElements = [NSArray arrayWithObjects:cellData1, cellData2, cellData3, nil];
//    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection");
    return [self.listOfElements count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TableViewCellController* cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    [self configureCell:cell forRowAtIndexPath:indexPath];

    NSLog(@"cellForRowAtIndexPath");
    return cell;
    
//    [self configureCell:self.prototypeCell forRowAtIndexPath:indexPath];
//    
//    return self.prototypeCell;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    [self configureCell:self.prototypeCell forRowAtIndexPath:indexPath];
    NSLog(@"%@", self.prototypeCell.cellText.text);
    [self.prototypeCell layoutIfNeeded];
    
    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];

    CGFloat labelSize = [self getHeightForText:self.prototypeCell.cellText.text withFont:self.prototypeCell.cellText.font andWidth:self.prototypeCell.cellText.frame.size.width];
    
//    UIImage* img = [self imageWithImage:self.prototypeCell.cellImage.image scaledToWidth:self.prototypeCell.cellImage.image.size.width];
    //    CGSize sizee = self.prototypeCell.cellImage.image.size;
//    CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
//    self.prototypeCell.cellImage.frame = rect;
//    NSLog(@"%f", img.size.height);
    
//    CGFloat ratio = self.prototypeCell.cellImage.image.size.width / self.prototypeCell.cellImage.image.size.height;
//    CGSize actualSize;
//    actualSize.width = self.prototypeCell.cellImage.frame.size.width;
//    actualSize.height = actualSize.width*ratio;
//
//    NSLog(@"%f", actualSize.height);
//    
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(actualSize.width, actualSize.height), NO, 0.0);
//    [self.prototypeCell.cellImage.image drawInRect:CGRectMake(0, 0, actualSize.width, actualSize.height)];
//    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    self.prototypeCell.cellImage.image= resizedImage;
    
   
    
    
//    CGRect frame = self.prototypeCell.cellImage.frame;
//    frame.size = actualSize;
//    CGRect newFrame = CGRectMake(self.prototypeCell.cellImage.frame.size.width, 0, actualSize.width, actualSize.height);
//    [self.prototypeCell remakeFrame:newFrame];
//    
//    self.prototypeCell.cellImage.image = [self setProfileImage:self.prototypeCell.cellImage.image onImageView:self.prototypeCell.cellImage];
//    
//    [self.prototypeCell layoutIfNeeded];
    UIImage* image = self.prototypeCell.cellImage.image;
    CGRect imageViewFrame = self.prototypeCell.cellImage.frame;
//    NSLog(@"%f", imageViewFrame.size.width);
    
    UIImage* testImage = [self imageWithImage:image scaledToWidth:imageViewFrame.size.width];
//    [self.prototypeCell.cellImage setImage:testImage];
//    NSLog(@"Width = %f Height = %f", testImage.size.width, testImage.size.height);
    
//    return  self.prototypeCell.cellImage.image.size.height;
    
    if (testImage.size.height + labelSize + 20 > 450) {
        return 400;
    }
    NSLog(@"heightForRowAtIndexPath");
    return testImage.size.height + labelSize + 20;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(TableViewCellController *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    UIImage* image = cell.cellImage.image;
    CGRect imageViewFrame = cell.cellImage.frame;
//    NSLog(@"%f", imageViewFrame.size.width);
    
    UIImage* testImage = [self imageWithImage:image scaledToWidth:imageViewFrame.size.width];
    [cell.cellImage setImage:testImage];
//    NSLog(@"Width = %f Height = %f", testImage.size.width, testImage.size.height);
    NSLog(@"willDisplayCell");
}


- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if ([cell isKindOfClass:[TableViewCellController class]])
//    {
        TableViewCellController *textCell = (TableViewCellController *)cell;
        textCell.cellText.text = [[self.listOfElements objectAtIndex:indexPath.row]notificationText];
        textCell.cellText.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];

    
        textCell.cellImage.image = [[self.listOfElements objectAtIndex:indexPath.row]imagee];
   
//    }
}

- (TableViewCellController *)prototypeCell
{
    if (!_prototypeCell)
    {
        _prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:indentifier];
    }
    return _prototypeCell;
}








#pragma mark - Utilities 

-(float) getHeightForText:(NSString*) text withFont:(UIFont*) font andWidth:(float) width{
    CGSize constraint = CGSizeMake(width , 20000.0f);
    CGSize title_size;
    float totalHeight;
    
    SEL selector = @selector(boundingRectWithSize:options:attributes:context:);
    if ([text respondsToSelector:selector]) {
        title_size = [text boundingRectWithSize:constraint
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{ NSFontAttributeName : font }
                                        context:nil].size;
        
        totalHeight = ceil(title_size.height);
    } else {
        title_size = [text sizeWithFont:font
                      constrainedToSize:constraint
                          lineBreakMode:NSLineBreakByWordWrapping];
        totalHeight = title_size.height ;
    }
    
    CGFloat height = MAX(totalHeight, 40.0f);
    return height;
}


-(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width
{
    float oldWidth = sourceImage.size.width;
    float scaleFactor = i_width / oldWidth;
    
    float newHeight = sourceImage.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



- (UIImage*)setProfileImage:(UIImage *)imageToResize onImageView:(UIImageView *)imageView
{
    CGFloat width = imageToResize.size.width;
    CGFloat height = imageToResize.size.height;
    float scaleFactor;
//    if(width > height)
//    {
        scaleFactor = width / height;
//    }
//    else
//    {
//        scaleFactor = imageView.frame.size.width / width;
//    }
    
    CGSize size = [imageView sizeThatFits:imageView.frame.size];
    
    CGSize actualSize;
    actualSize.height = imageView.frame.size.height;
    actualSize.width = size.width;
    
    CGRect frame = imageView.frame;
    frame.size = actualSize;
    [imageView setFrame:frame];
    
    ////////////
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width * scaleFactor, height * scaleFactor), NO, 0.0);
    [imageToResize drawInRect:CGRectMake(0, 0, width * scaleFactor, height * scaleFactor)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resizedImage;
}

@end
