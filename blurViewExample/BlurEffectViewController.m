//
//  BlurEffectViewController.m
//  blurViewExample
//
//  Created by 王斌 on 16/4/8.
//  Copyright © 2016年 Changhong electric Co., Ltd. All rights reserved.
//

#import "BlurEffectViewController.h"

@interface BlurEffectViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation BlurEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configBlurEffect];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configBlurEffect{
    
    // 原始图片 self.imageView
    
    // 为了更好的看到UIVisualEffectView的即时渲染效果添加平移手势 此处通过 storyBoard 添加
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
//    [self.imageView addGestureRecognizer:pan];
    
    // 创建模糊View
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.layer.cornerRadius = 10.0f;
    effectView.layer.masksToBounds = YES;
    effectView.frame = CGRectMake(80, 300, 160, 80);
    [self.view addSubview:effectView];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:effectView.bounds];
    label.text = @"Blur Effect";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:20];
    //    [effectView.contentView addSubview:label];
    // 在创建的模糊View的上面再添加一个子模糊View
    UIVisualEffectView *subEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)effectView.effect]];
    
    subEffectView.frame = effectView.bounds;
    
    [effectView.contentView addSubview:subEffectView];
    
    [subEffectView.contentView addSubview:label];
}

- (IBAction)panGesture:(UIPanGestureRecognizer *)sender {
    
    CGPoint point = [sender translationInView:sender.view];
    sender.view.center = CGPointMake(sender.view.center.x + point.x,
                                      sender.view.center.y + point.y);
    [sender setTranslation:CGPointZero inView:sender.view];

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
