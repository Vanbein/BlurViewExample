//
//  CoreImageViewController.m
//  blurViewExample
//
//  Created by 王斌 on 16/4/8.
//  Copyright © 2016年 Changhong electric Co., Ltd. All rights reserved.
//

#import "CoreImageViewController.h"

@interface CoreImageViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *currentBlurLevel;

@end

@implementation CoreImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView.image = [UIImage imageNamed:@"wall"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updateBlur:(UISlider *)sender {
    
    self.currentBlurLevel.text = [NSString stringWithFormat:@"%f", sender.value];
    
    self.imageView.image = [self blurryImage:[UIImage imageNamed:@"wall"] withMaskImage:[UIImage imageNamed:@"graduallyMask"] blurLevel:sender.value];

}

// 使用Core Image进行模糊
// Core Image很早在Mac系统中得到应用，后来这个Framework也开始应用到iOS，
// 不过直到iOS6.0才开始支持模糊。这个API调用起来很方便简洁。
// coreImage是苹果用来简化图片处理的框架
- (UIImage *)blurryImage:(UIImage *)image withMaskImage:(UIImage *)maskImage blurLevel:(CGFloat)blur {
    
    // 创建属性
    CIImage *ciImage = [[CIImage alloc] initWithImage:image];
    
    //更多滤镜效果，见官方列表 https://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGaussianBlur
    // 滤镜效果 高斯模糊
//    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
//    [filter setValue:cimage forKey:kCIInputImageKey];
//    // 指定模糊值 默认为10, 范围为0-100
//    [filter setValue:[NSNumber numberWithFloat:blur] forKey:@"inputRadius"];
    
    /**
     *  滤镜效果 VariableBlur
     *  此滤镜模糊图像具有可变模糊半径。你提供和目标图像相同大小的灰度图像为它指定模糊半径
     *  白色的区域模糊度最高，黑色区域则没有模糊。
     */
    CIFilter *filter = [CIFilter filterWithName:@"CIMaskedVariableBlur"];
    // 指定过滤照片
    [filter setValue:ciImage forKey:kCIInputImageKey];
    CIImage *mask = [CIImage imageWithCGImage:maskImage.CGImage] ;
    // 指定 mask image
    [filter setValue:mask forKey:@"inputMask"];
    // 指定模糊值  默认为10, 范围为0-100
    [filter setValue:[NSNumber numberWithFloat:blur] forKey: @"inputRadius"];
    
    // 生成图片
    CIContext *context = [CIContext contextWithOptions:nil];
    // 创建输出
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    // 下面这一行的代码耗费时间内存最多,可以开辟线程处理然后回调主线程给imageView赋值
    //result.extent 指原来的大小size
//    NSLog(@"%@",NSStringFromCGRect(result.extent));
//    CGImageRef outImage = [context createCGImage: result fromRect: result.extent];
    
    CGImageRef outImage = [context createCGImage: result fromRect:CGRectMake(0, 0, 320.0 * 2, 334.0 * 2)];
    UIImage * blurImage = [UIImage imageWithCGImage:outImage];
    
    return blurImage;
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
