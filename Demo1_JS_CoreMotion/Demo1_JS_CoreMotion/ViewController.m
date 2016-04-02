//
//  ViewController.m
//  Demo1_JS_CoreMotion
//
//  Created by  江苏 on 16/3/15.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *myBall;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager=[[CMMotionManager alloc]init];
    [self.manager setAccelerometerUpdateInterval:1.0/60];
    [self.manager startAccelerometerUpdates];
    [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(getInfoAction) userInfo:nil repeats:YES];
}
-(void)getInfoAction{
    CMAcceleration acc=self.manager.accelerometerData.acceleration;
    NSLog(@"x=%f y=%f z=%f",acc.x,acc.y,acc.z);
    self.myBall.center=CGPointMake(self.myBall.center.x+acc.x, self.myBall.center.y-acc.y);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
