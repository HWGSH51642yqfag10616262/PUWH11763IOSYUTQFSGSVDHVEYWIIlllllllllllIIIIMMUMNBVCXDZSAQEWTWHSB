
(((علاوي المنيوك AS7 الفرخ)))



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
