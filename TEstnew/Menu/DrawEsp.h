#import <UIKit/UIKit.h>
#import "JFCommon.h"
#import "DrawMenu.h"

NS_ASSUME_NONNULL_BEGIN


@interface JFOverlayView : UIView
@property (nonatomic, assign) bool isStartTimer;
@property (nonatomic, assign) bool isShowMenu;
@property (nonatomic, assign) bool isLineEsp;
@property (nonatomic, assign) bool FastSwitchWeapon;
@property (nonatomic, assign) bool speedp;
@property (nonatomic, assign) bool isTextEsp;
@property (nonatomic, assign) bool isBoneEsp;
@property (nonatomic, assign) bool isBoxEsp;
@property (nonatomic, assign) bool isTeamMateEsp;
@property (nonatomic, assign) int espDistance;
@property (nonatomic, assign) bool Autofire;
@property (nonatomic, assign) bool isInstanthit;
@property (nonatomic, assign) bool SpeedFire;
@property (nonatomic, assign) bool NoSpread;
@property (nonatomic, assign) bool isAimbot;
@property (nonatomic, assign) bool isBigx;
@property (nonatomic, assign) bool isAimbotscope;
@property (nonatomic, assign) bool isArrow;
@property (nonatomic, assign) bool anti;
@property (nonatomic, assign) bool isBulletTrack;
@property (nonatomic, assign) bool isNorecoil;
@property (nonatomic, assign) bool isNearDeathNotAim;
@property (nonatomic, assign) bool isAINotAim;
@property (nonatomic, assign) bool isAim100;
@property (nonatomic, assign) int aimbotPart;
@property (nonatomic, assign) int rcontrol;
@property (nonatomic, assign) int amichest;
@property (nonatomic, assign) int aimbotRadius;
@property (nonatomic, assign) bool Anticheat;
@property (nonatomic, assign) bool Antich;
@property (nonatomic, assign) bool isShowProps;
@property (nonatomic, assign) bool isShowPropsVehicle;
@property (nonatomic, assign) bool isShowPropsWeapon;
@property (nonatomic, assign) bool isShowPropsArmor;
@property (nonatomic, assign) bool isShowPropsSight;
@property (nonatomic, assign) bool isShowPropsBullet;
@property (nonatomic, assign) bool isShowPropsDrug;
@property (nonatomic, assign) bool BoxWith;
@property (nonatomic, assign) bool BPc;
@property (nonatomic, assign) bool Pistol;
@property (nonatomic, assign) bool isShowPropsEarlyWarning;
@property (nonatomic, assign) int propsDistance;
@property (nonatomic, assign) int AutoDis;
@property (nonatomic, assign) bool isAimFov;
@property (nonatomic, assign) CGPoint AutoFierPoint;
@property (nonatomic, assign) bool AutoFierON;
@property (nonatomic, strong) UIButton *Open;
@property (nonatomic, strong) DrawMenuSwitch *AimisAi;

+ (JFOverlayView *)getInstance;
@end
NS_ASSUME_NONNULL_END

