#import <UIKit/UIKit.h>
#import "More.h"

@interface GJSYMessage : UIView
@property(nonatomic,retain)UIView *infoBar;
@property(nonatomic,retain)UILabel *nameLb;
@property(nonatomic,retain)UILabel *disLb;
@property(nonatomic,retain)UILabel *teamLb;
@property(nonatomic,retain)UIView *xueBar;
@property(nonatomic,retain)UILabel *flagLb;
@property(nonatomic,retain)UILabel *isarm;
@property(nonatomic,retain)UILabel *ammo;
@property(nonatomic,retain)UILabel *stateLb;
@property(nonatomic,retain)UILabel *idPlayer;
@property(nonatomic,retain)CAShapeLayer *delta;
@property(nonatomic,retain)UILabel *NameDisLb;
@property(nonatomic,retain)NSString *name;
@property(nonatomic)CGFloat dis;
@property(nonatomic)CGFloat xue;
@property(nonatomic)UInt8 team;
@property(nonatomic)uint64_t state;
@property(nonatomic)int isArms;
@property(nonatomic)CGFloat curammo;
@property(nonatomic,retain)NSString *isFlag;
@property(nonatomic,retain)NSString *idpl;



+(instancetype)GJSYMessageWithName:(NSString *) name
                            xue:(CGFloat) xue
                            team:(CGFloat) team
                            dis:(CGFloat) dis
                             state:(uint64_t)state
                             idpl:(NSString *) idpl
                            curammo:(CGFloat) curammo
                             isArms:(int)isArms
                              isFlag:(NSString *) isFlag;
//- (void)SetNameDis:(NSString *)NameDis Color:(UIColor *)Color Point:(CGPoint)Point;
@end



