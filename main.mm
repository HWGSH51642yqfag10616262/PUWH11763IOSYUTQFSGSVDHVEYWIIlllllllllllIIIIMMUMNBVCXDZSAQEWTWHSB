
#import <UIKit/UIKit.h>

#define UIColorFromHEX(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



#import "main.h"

#import "SCLAlertView/SCLAlertView.h"

SCLAlertView *alert;


@implementation NguyenNamFramework




static NguyenNamFramework *active;

//-----------------//

+ (void)load
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

alert = [[SCLAlertView alloc] initWithNewWindow];  

        active =  [NguyenNamFramework new];
        [active start];

    });
}


-(void)start{

alert.shouldDismissOnTapOutside = YES;//Replace with NO if you want the user to force a button in the alert

alert.customViewColor = UIColorFromHEX(0x474747);
  

alert.showAnimationType = SCLAlertViewShowAnimationSlideInToCenter;   

alert.backgroundType = SCLAlertViewBackgroundBlur;

alert.cornerRadius = 20.0f;

alert.backgroundViewColor = UIColorFromHEX(0x302d26);



//Button

//Demo Button
/*
[alert addButton:@"Name Button" actionBlock:^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"URL YOU WANT TO OPEN WHEN CLICK"] options:@{} completionHandler:nil];
}];
*/


//Example button
[alert addButton:@"القناة الرسمية Fox Store " actionBlock:^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://t.me/OSplusCO"] options:@{} completionHandler:nil];
}];

[alert addButton:@"قناة الشروحات  Fox Store" actionBlock:^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://t.me/osplus4"] options:@{} completionHandler:nil];
}];

[alert addButton:@"Hay Day Fox " actionBlock:^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://t.me/haydaymd"] options:@{} completionHandler:nil];
    }];

[alert addButton:@"متجر الاكواد Fox Store " actionBlock:^(void) {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://khalid7-d.com"] options:@{} completionHandler:nil];
    }];



//You can replace any logo link with a direct image link
NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img.upanh.tv/2024/09/10/11zon_cropped.png"]];

UIImage* customAlertImage = [UIImage imageWithData:data];  
 
[alert showCustom:alert image:customAlertImage color:[UIColor clearColor] title:@"Fox Store" subTitle:@" فوكس ستور " closeButtonTitle:nil duration:9999999999.0f];


}


@end
