//
//  BasicViewController.m
//  blurViewExample
//
//  Created by 王斌 on 16/4/7.
//  Copyright © 2016年 Changhong electric Co., Ltd. All rights reserved.
//

#import "BasicViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>


@interface BasicViewController ()
@property (weak, nonatomic) IBOutlet FXBlurView *blurView;
@property (strong, nonatomic) IBOutlet UILabel *currentBlurLevel;

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.blurView.blurRadius = 10.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)updateBlur:(UISlider *)sender {
    
    self.currentBlurLevel.text = [NSString stringWithFormat:@"%f",sender.value];
    
    self.blurView.blurRadius = sender.value;
    
}

- (IBAction)switchDynamic:(UISwitch *)sender {
    self.blurView.dynamic = sender.on;
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
