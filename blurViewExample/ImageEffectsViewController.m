//
//  ImageEffectsViewController.m
//  blurViewExample
//
//  Created by 王斌 on 16/4/8.
//  Copyright © 2016年 Changhong electric Co., Ltd. All rights reserved.
//

#import "ImageEffectsViewController.h"
#import "UIImage+ImageEffects.h"

@interface ImageEffectsViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *blurView;
@property (strong, nonatomic) IBOutlet UIImageView *partBlurView;
@property (strong, nonatomic) IBOutlet UIImageView *grayScaleView;
@property (strong, nonatomic) IBOutlet UILabel *currentBlurLevel;

@end

@implementation ImageEffectsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blurView.image = [[UIImage imageNamed:@"WID-small"] blurImage];
    
    self.partBlurView.image = [[UIImage imageNamed:@"WID-small"] blurImageAtFrame:CGRectMake(0.0, 0.0, 155.0*2 , 235.0*4.0)];
    
    self.grayScaleView.image = [[UIImage imageNamed:@"WID-small"] grayScale];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)updateBlurLevel:(UISlider *)sender {
    
    self.currentBlurLevel.text = [NSString stringWithFormat:@"%f",sender.value];
    self.blurView.image = [[UIImage imageNamed:@"WID-small"] blurImageWithRadius:sender.value];

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
