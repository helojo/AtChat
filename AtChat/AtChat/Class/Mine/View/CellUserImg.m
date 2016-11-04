//
//  CellUserImg.m
//  LifeChat
//
//  Created by zhouMR on 16/5/9.
//  Copyright © 2016年 com.sean. All rights reserved.
//

#import "CellUserImg.h"

@implementation CellUserImg

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        
        self.ivImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
        self.ivImg.layer.cornerRadius = 5;
        self.ivImg.layer.masksToBounds = TRUE;
        [self.contentView addSubview:self.ivImg];
        
        self.lbName = [[UILabel alloc]initWithFrame:CGRectMake(self.ivImg.right + 10, self.ivImg.top+3, DEVICEWIDTH-self.ivImg.right-10-10, 15)];
        self.lbName.font = [UIFont systemFontOfSize:15];
        self.lbName.text = @"上善若水";
        self.lbName.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.lbName];
    }
    return self;
}

-(void)updateData:(NSString*)userId{
    NSData *photoData = [[XmppTools sharedManager] getImageData:userId];
    
    UIImage *headImg;
    if (photoData) {
        headImg = [UIImage imageWithData:photoData];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.ivImg.image = headImg;
        });
    }
    self.lbName.text = userId;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
