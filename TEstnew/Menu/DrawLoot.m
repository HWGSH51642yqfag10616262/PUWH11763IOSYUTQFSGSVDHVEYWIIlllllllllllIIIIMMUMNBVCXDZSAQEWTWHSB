
//#import <Foundation/Foundation.h>
#import "DrawLoot.h"
@implementation DrawLoot
- (instancetype)initWithFrame:(CGRect)frame {
self = [super initWithFrame:frame];
if (self) {
_NameDisLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 10)];
_NameDisLb.textColor = [UIColor whiteColor];
_NameDisLb.textAlignment = NSTextAlignmentCenter;
_NameDisLb.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:9];
_NameDisLb.shadowColor = [UIColor blackColor];
_NameDisLb.shadowOffset = CGSizeMake(0.9 ,0.9);
[self addSubview:_NameDisLb];
}
return self;
}

- (void)SetNameDis:(NSString *)NameDis Color:(UIColor *)Color Point:(CGPoint)Point {
self.center = Point;
_NameDisLb.textColor = Color;
_NameDisLb.text = NameDis;
}
@end
