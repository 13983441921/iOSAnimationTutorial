//
//  FirstTableViewCell.m
//  iOSAnimationTutorial
//
//  Created by 臧其龙 on 16/5/18.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "FirstTableViewCell.h"

@interface FirstTableViewCell ()
{
    CGFloat ratio;
}

@end
@implementation FirstTableViewCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    
    return self;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        
        _leftView = [UIView new];
        _rightView = [UIView new];
        
        _leftView.backgroundColor = [UIColor colorWithRed:37.0/255 green:42.0/255 blue:43.0/255 alpha:1];
        _rightView.backgroundColor = [UIColor colorWithRed:37.0/255 green:99.0/255 blue:43.0/255 alpha:1];
        
        _leftLabel = [UILabel new];
        _rightLabel = [UILabel new];
        
        [self.contentView addSubview:_leftView];
        [self.contentView addSubview:_rightView];
        [_leftView addSubview:_leftLabel];
        [_rightView addSubview:_rightLabel];
        
        _leftView.frame = CGRectMake(0, 0, screenWidth/2 -10, 120);
        _rightView.frame = CGRectMake(screenWidth/2+20, 0, screenWidth/2 -10, 120);
        
        _leftLabel.frame = CGRectMake(0, 0, 50, 50);
        _rightLabel.frame = CGRectMake(0, 0, 50, 50);
        _leftLabel.center = CGPointMake(CGRectGetWidth(_leftView.frame)/2, 50);
        _rightLabel.center = CGPointMake(CGRectGetWidth(_rightView.frame)/2, 50);
        
        self.contentView.transform = CGAffineTransformMakeTranslation(0, screenHeight);
        ratio = ([UIScreen mainScreen].bounds.size.width/2)/110;
    }
    return  self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)startMoveWithoffsetY:(CGFloat)offsetY;
{
    CGFloat startLeftOrginx = 10;
    CGFloat startRgithOriginX = [UIScreen mainScreen].bounds.size.width/2+10;
    CGFloat xOffset = ratio * offsetY;
    
    if (xOffset >= 0) {
        _leftView.frame = CGRectMake(startLeftOrginx - xOffset, 10, CGRectGetWidth(_leftView.frame), CGRectGetHeight(_leftView.frame));
        _rightView.frame = CGRectMake(startRgithOriginX + xOffset, 10, CGRectGetWidth(_rightView.frame), CGRectGetHeight(_rightView.frame));
    }else{
        _leftView.frame = CGRectMake(startLeftOrginx, 10, CGRectGetWidth(_leftView.frame), CGRectGetHeight(_leftView.frame));
        _rightView.frame = CGRectMake(startRgithOriginX , 10, CGRectGetWidth(_rightView.frame), CGRectGetHeight(_rightView.frame));
    }
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
