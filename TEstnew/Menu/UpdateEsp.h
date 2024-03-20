#import <UIKit/UIKit.h>
#import "DrawEsp.h"
#import <Foundation/Foundation.h>

@class JFPlayer, JFProps, JFPlayerPool, JFPropsPool;
@interface Fucking : NSObject
@property (nonatomic, assign) bool isFire;
@property (nonatomic, assign) bool isOpenScope;
@property (nonatomic, assign) bool Gunads;
@property (nonatomic, assign) bool Shoot;
@property (nonatomic, strong) JFPlayer *localPlayer;
@property (nonatomic, strong) NSMutableArray *playerList;
@property (nonatomic, strong) NSMutableArray *propsList;
//@property (nonatomic, assign) JFPlayer *lockActor;
@property (nonatomic, assign) kaddr lockActor;
@property (nonatomic, strong) JFPlayerPool *playerPool;
@property (nonatomic, strong) JFPropsPool *propsPool;
@property (nonatomic, strong) JFOverlayView *overlayView;
+ (Fucking *)getInstance;
- (void)entry;
- (void)cancelTimer;
- (void)SetHideHack:(UISwitch *)Switch;
// + (void)Lifand:(bool)Swspd;
@end
