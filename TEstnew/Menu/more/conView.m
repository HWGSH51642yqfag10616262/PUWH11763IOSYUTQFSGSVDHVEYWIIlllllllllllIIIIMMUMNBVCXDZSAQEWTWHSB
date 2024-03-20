////
////  conView.m
////  11
////
////  Created by zhongweiMacPro on 2021/6/17.
////
//
//#import "conView.h"
//#import "UserInfoManager.h"
//#import "vm_writeData.h"
//
//UILabel *AL8;
//UILabel *AL7;
//UILabel *AL6;
//
//UISwitch *sw6;
//UISwitch *sw7;
//UISwitch *sw8;
//
//@implementation conView
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    
//    self = [super initWithFrame:frame];
//    
//    if (self) {
//        
//  
//        
//        AL8 = [[UILabel alloc] initWithFrame:CGRectMake(0, 75, 40, 25)];
//        [AL8 setTextColor:[UIColor greenColor]];
//        AL8.textAlignment = 1;
//        AL8.text = @"加速";
//        AL8.font = [UIFont systemFontOfSize:14];
//        [self addSubview:AL8];
//        
//        sw8 = [UISwitch new];
//        [sw8 addTarget:self action:@selector(conviewClick2:) forControlEvents:UIControlEventTouchUpInside];
//        sw8.tintColor = [UIColor orangeColor];
//        sw8.transform = CGAffineTransformMakeScale(0.7, 0.7);
//        sw8.frame = CGRectMake(40, 75, 50, 50);
//        [self addSubview:sw8];
//        
//    }
//    
//    return self;
//}
//
//
//- (void)conviewClick:(UISwitch*)sw {
//   
//    if(sw.on) {
//           
//           [UserInfoManager shareUserInfoManager].isShe = YES;
//       } else {
//           [UserInfoManager shareUserInfoManager].isShe = NO;
//       }
//}
//
//
//    [NSTimer scheduledTimerWithTimeInterval:1.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        
//        if ([UserInfoManager shareUserInfoManager].jia) {
//            
//            if ([UserInfoManager shareUserInfoManager].inshe) {
//                
//                 vm_writeData(0X102D10C0C, 0x081CA04E);
//                [UserInfoManager shareUserInfoManager].inshe = NO;
//                
//            } else {
//                
//                //k
//                vm_writeData(0X102D10C0C, 0x0810281E);
//                [UserInfoManager shareUserInfoManager].inshe = YES;
//            }
//            
//            
//            
//            
//        } else {
//            
//            vm_writeData(0X102D10C0C, 0x081CA04E);
//            [UserInfoManager shareUserInfoManager].inshe = NO;
//            
//            
//        }
//        
//        
//    }];
//    
//}
//
//- (void)setjset {
//   
//    
//}
//
////[alertCtrl addAction:[UIAlertAction actionWithTitle:@"瞬击-落地开" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
////
////    bofang("瞬击开");
////
////
////
////}]];
////
////[alertCtrl addAction:[UIAlertAction actionWithTitle:@"加速开-落地开一把一退" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
////    bofang("加速开");
////
////
////
////}]];
//
//@end
