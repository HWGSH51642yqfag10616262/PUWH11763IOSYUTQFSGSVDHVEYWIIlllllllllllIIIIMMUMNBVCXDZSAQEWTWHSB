#import "GJSYBD.h"
#
@interface GJSYBD()

@end

@implementation GJSYBD

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        UIView *bdinfoBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        bdinfoBar.backgroundColor = [UIColor clearColor];  
        bdinfoBar.layer.masksToBounds=YES;
        bdinfoBar.layer.cornerRadius = 20;
//        bdinfoBar.layer.borderWidth=1;
        bdinfoBar.layer.borderColor = UIColor.clearColor.CGColor;
        bdinfoBar.alpha = 0.80;
        [self addSubview:bdinfoBar];
        _bddisLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        _bddisLb.textAlignment=NSTextAlignmentCenter;
        _bddisLb.textColor = [UIColor whiteColor];
        
        _bddisLb.hidden = true;
        
        _bddisLb.font = [UIFont boldSystemFontOfSize:35];
        [bdinfoBar addSubview:_bddisLb];
        
//
//        _teamLb = [[UILabel alloc]initWithFrame:CGRectMake(5, 15, 30, 30)];
//        _teamLb.textAlignment=NSTextAlignmentCenter;
//        _teamLb.textColor = [UIColor blackColor];
//        _teamLb.font = [UIFont boldSystemFontOfSize:9];
//        [bdinfoBar addSubview:_teamLb];
        
        
    }
    return self;
}
#pragma mark----实现类方法
+(instancetype)GJSYMessageWithName:(NSString *) name
                                dis:(CGFloat) dis;
{
    GJSYBD *bdquandis = [[GJSYBD alloc] init];
    bdquandis.frame = CGRectMake(0, 0, 40, 40);
    bdquandis.layer.masksToBounds=YES;
    bdquandis.dis=dis;
//    bdquandis.team=team;
    return bdquandis;
}
#pragma mark--给属性重新赋值


@end



