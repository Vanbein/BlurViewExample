//
//  AnimatedViewController.m
//  blurViewExample
//
//  Created by 王斌 on 16/4/7.
//  Copyright © 2016年 Changhong electric Co., Ltd. All rights reserved.
//

#import "AnimatedViewController.h"
#import "FXBlurView.h"

@interface AnimatedViewController ()
@property (strong, nonatomic) IBOutlet FXBlurView *blurView;

@end

@implementation AnimatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchBlur:(UIButton *)sender {
    
    if (self.blurView.blurRadius < 5)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.blurView.blurRadius = 40;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.blurView.blurRadius = 0;
        }];
    }

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
