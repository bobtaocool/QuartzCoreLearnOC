//
//  CATransform3DViewController.m
//  QuartzCoreLearnOC
//
//  Created by 陶冬波 on 2018/6/19.
//  Copyright © 2018年 陶冬波. All rights reserved.
//

#import "CATransform3DViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface CATransform3DViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;

@end

@implementation CATransform3DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // https://www.jianshu.com/p/e8d1985dccec
    // Do any additional setup after loading the view.
}
//3D旋转
- (IBAction)chang1:(UIButton *)sender {
    sender.selected=!sender.selected;
    if (sender.selected) {
        CATransform3D turenTrans = CATransform3DMakeRotation(M_PI_2/2, 0, 0, 1);
        
        self.testImageView.layer.transform =turenTrans;
    }else{
        
        self.testImageView.layer.transform=CATransform3DIdentity;
    }
    
}

//2D选择
- (IBAction)change2:(UIButton *)sender {
    
    sender.selected=!sender.selected;
    
    if (sender.selected) {

        self.testImageView.transform = CGAffineTransformMakeRotation(M_PI_2/2);
    }else{
        
        self.testImageView.transform=CGAffineTransformIdentity;
    }
}
- (IBAction)change3:(UIButton *)sender {
    
    sender.selected=!sender.selected;
    
    if (sender.selected) {
        
//        NSValue *v=[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(100, 0, 0)];
//        [self.testImageView.layer setValue:v forKeyPath:@"transform"];
        [self.testImageView.layer setValue:@(100) forKey:kCAValueFunctionRotateX];
        
//        [self.testImageView.layer setValue:@(100) forKey:@"transform.translation.y"];
//
//        [self.testImageView.layer setValue:@(100) forKey:@"transform.translation.z"];

    }else{
        
        NSValue *v=[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 0, 0)];
        [self.testImageView.layer setValue:v forKeyPath:@"transform"];
          [self.testImageView.layer setValue:@(10) forKey:@"transform.translation.x"];
        
//        [self.testImageView.layer setValue:@(10) forKey:@"transform.translation.y"];
//
//        [self.testImageView.layer setValue:@(10) forKey:@"transform.translation.z"];

        
    }

}
- (IBAction)change4:(UIButton *)sender {
    
    sender.selected=!sender.selected;
    
    if (sender.selected) {
        
          self.testImageView.layer.transform =CATransform3DMakeScale(0.5, 0.5, 1);
        
        sender.enabled= NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            self.testImageView.transform=CGAffineTransformIdentity;
            
            sender.enabled= YES;
        });
        
    }else{
        self.testImageView.layer.transform =CATransform3DMakeTranslation(10, -10, 0);
        
        sender.enabled= NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            self.testImageView.transform=CGAffineTransformIdentity;
            
             sender.enabled= YES;
        });
    }
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
