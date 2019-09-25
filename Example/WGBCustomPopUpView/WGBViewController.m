//
//  WGBViewController.m
//  WGBCustomPopUpView
//
//  Created by Wangguibin on 09/25/2019.
//  Copyright (c) 2019 Wangguibin. All rights reserved.
//

#import "WGBViewController.h"
#import "WGBRewardAlertView.h"

@interface WGBViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *titleArray;

@end 

@implementation WGBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.backgroundColor = [UIColor whiteColor];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新" attributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]}];
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    self.tableView.refreshControl = refreshControl;
    
    [self.tableView reloadData];
}

- (void)refresh{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.refreshControl endRefreshing];
    });
}

- (NSArray *)titleArray{
    return @[
        @"自定义View示例之打赏",
        @"自定义View示例之引导充值",
        @"自定义View示例之提示消息",
        @"系统弹窗封装之Alert",
        @"系统弹窗封装之Alert Easy版",
        @"系统弹窗封装之AlertSheet"
    ];
}


#pragma mark -  UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:  NSStringFromClass([UITableViewCell class])];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            [self showRewardAlertView];
        }
            break;
        case 1:
        {
            [self showGudieVIP];
        }
            break;
        case 2:
        {
            [self showTips];
        }
            break;
        case 3:
        {
            [self showSystemAlert];
        }
            break;
        case 4:
        {
            [self showSystemEasyAlert];
        }
            break;
        case 5:
        {
            [self showSystemAlertSheet];
        }
            break;
        default:
            break;
    }    
}


- (void)showRewardAlertView{
    WGBRewardAlertView *alerView = [[WGBRewardAlertView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    //弹出通用类
    WGBCustomPopUpView *pop = [[WGBCustomPopUpView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    pop.contentView = alerView;
    pop.animationType = WGBAlertAnimationTypeCenter;//WGBAlertAnimationTypeAlert
    alerView.balanceValue = 6.66;
    [alerView setCancelBlock:^{
        [pop dismiss];
    }];
    [alerView setConfirmBlock:^(BOOL canPay, NSString * _Nonnull money, NSString * _Nonnull message) {
        NSLog(@"能否支付：%@ \n 金额：%@ \n 留言：%@",canPay? @"能":@"不能",money,message);
        [pop dismiss];
    }];
    [pop show];
}

- (void)showGudieVIP{
    [WGBAlertTool showFreeTimesExpiredAlertWithCallBack:^(NSInteger index) {
        NSLog(@"下标: %ld",index);
    }];
}

- (void)showTips{
    [WGBAlertTool showCommitConfirmCheckReviewTips:@"我只是一条提示消息" callBack:^(NSInteger index) {
        NSLog(@"下标: %ld",index);
    }];
}

- (void)showSystemAlert{
    [WGBAlertTool showSystemStyleAlertSheetWithTitle:@"提示" alertMessage:@"消息消息消息消息消息消息消息消息" cancelTitle:@"取消" otherItemsTitle:@[@"确定"] preferredStyle:(UIAlertControllerStyleAlert) handler:^(NSInteger index) {
        NSLog(@"下标: %ld",index);
    }];

}

- (void)showSystemEasyAlert{
    [WGBAlertTool showSystemStyleCommonAlertTitle:@"温馨提示" messageTips:@"提示消息消息消息消息消息" leftButtonTitle:@"左按钮" rightButtonTitle:@"右按钮" leftButtonBlock:^{
        NSLog(@"左按钮回调");
    } rightButtonBlock:^{
        NSLog(@"右按钮回调");
    }];
}

- (void)showSystemAlertSheet{
    [WGBAlertTool showSystemStyleAlertSheetWithTitle:@"提示" alertMessage:@"消息消息消息消息消息消息消息消息" cancelTitle:@"取消" otherItemsTitle:@[@"确定",@"删除",@"置顶"] preferredStyle:(UIAlertControllerStyleActionSheet) handler:^(NSInteger index) {
        NSLog(@"下标: %ld",index);
    }];
    
}

@end
