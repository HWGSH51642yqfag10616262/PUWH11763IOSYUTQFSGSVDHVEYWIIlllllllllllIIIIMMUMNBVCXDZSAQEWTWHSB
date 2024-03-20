#import <UIKit/UIKit.h>

@interface GJSYBD : UIView
@property(nonatomic,retain)UILabel *bddisLb;
@property(nonatomic,retain)UILabel *teamLb;

@property(nonatomic)CGFloat dis;
//@property(nonatomic)CGFloat team;


+(instancetype)GJSYMessageWithName:(NSString *) name
                            dis:(CGFloat) dis;
@end



