//
//  FirstTableViewCell.h
//  iOSAnimationTutorial
//
//  Created by 臧其龙 on 16/5/18.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTableViewCell : UITableViewCell
@property (strong, nonatomic) UIView *leftView;
@property (strong, nonatomic) UILabel *leftLabel;
@property (strong, nonatomic) UIView *rightView;
@property (strong, nonatomic) UILabel *rightLabel;

- (void)startMoveWithoffsetY:(CGFloat)offsetY;

@end
