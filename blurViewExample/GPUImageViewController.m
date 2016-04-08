//
//  GPUImageViewController.m
//  blurViewExample
//
//  Created by 王斌 on 16/4/8.
//  Copyright © 2016年 Changhong electric Co., Ltd. All rights reserved.
//

#import "GPUImageViewController.h"

#import "GPUImage.h"

@interface GPUImageViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *currentBlurLevel;

@end

@implementation GPUImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentBlurLevel.text = [NSString stringWithFormat:@"%f",10.0];
    self.imageView.image = [self blurryGPUImage:[UIImage imageNamed:@"Lambeau"] withBlurLevel:10.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)blurryGPUImage:(UIImage *)image withBlurLevel:(CGFloat)blur {

    // 高斯模糊
    GPUImageGaussianBlurFilter * blurFilter = [[GPUImageGaussianBlurFilter alloc] init];
    blurFilter.blurRadiusInPixels = blur;
    UIImage *blurredImage = [blurFilter imageByFilteringImage:image];
    
    return blurredImage;
}

- (IBAction)updateBlur:(UISlider *)sender {
    
    self.currentBlurLevel.text = [NSString stringWithFormat:@"%f",sender.value];
    self.imageView.image = [self blurryGPUImage:[UIImage imageNamed:@"Lambeau"] withBlurLevel:sender.value];
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
