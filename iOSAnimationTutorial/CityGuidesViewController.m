//
//  CityGuidesViewController.m
//  iOSAnimationTutorial
//
//  Created by 臧其龙 on 16/5/18.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "CityGuidesViewController.h"
#import "FirstTableViewCell.h"

static NSString * const kFirstCell = @"kFirstCell";

@interface CityGuidesViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewTopConstraint;


@end

@implementation CityGuidesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_cityTableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:kFirstCell];
  //  self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _cityTableView.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:1 animations:^{
        self.cityTableView.transform = CGAffineTransformIdentity;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFirstCell];
    
    return  cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  120;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static CGFloat originY = 64;
    
    CGRect cellrect = [_cityTableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    CGRect convertRect = [_cityTableView convertRect:cellrect toView:_cityTableView.superview];
    
    CGFloat offsetY = originY - convertRect.origin.y;
//    CGFloat offsetY = 0;
//    if (convertRect.origin.y >=0) {
//        
//    }else{
//        
//    }
    
    FirstTableViewCell *cell = [_cityTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [cell startMoveWithoffsetY:offsetY];
    NSLog(@"cell frame is %@", NSStringFromCGRect(convertRect));
    //NSLog((@"");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
