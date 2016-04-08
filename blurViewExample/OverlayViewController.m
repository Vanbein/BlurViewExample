//
//  OverlayViewController.m
//  blurViewExample
//
//  Created by 王斌 on 16/4/7.
//  Copyright © 2016年 Changhong electric Co., Ltd. All rights reserved.
//

#import "OverlayViewController.h"

@interface OverlayViewController ()

@property (strong, nonatomic) IBOutlet FXBlurView *blurView;

@end

@implementation OverlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.hidden = YES;
    
    self.blurView.dynamic = NO;
    self.blurView.tintColor = [UIColor colorWithRed:0 green:0.5 blue:0.5 alpha:1];
    self.blurView.contentMode = UIViewContentModeBottom;
    
//     self.blurView.frame = CGRectMake(0, 568, 320, 0);
    //take snapshot, then move off screen once complete
    [self.blurView updateAsynchronously:YES completion:^{
        self.blurView.frame = CGRectMake(0, 568, 320, 0);
    }];
    

}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (BOOL)shouldAutorotate
{
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)toggleModal
{
    self.navigationController.navigationBar.hidden = !self.navigationController.navigationBar.isHidden;

    [UIView animateWithDuration:0.5 animations:^{
        BOOL open = self.blurView.frame.size.height > 200;
        self.blurView.frame = CGRectMake(0, open? 568: 143, 320, open? 0: 425);
    }];
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
