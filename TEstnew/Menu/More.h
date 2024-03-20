#import <UIKit/UIKit.h>
#import "JFCommon.h"
#import <vector>
#import <string>
#import <Foundation/Foundation.h>
#import "GJSYMessage.h"

NS_ASSUME_NONNULL_BEGIN
@interface JFPlayer : NSObject
@property (nonatomic, assign) long base;
@property (nonatomic, assign) int teamNo;
@property (nonatomic, assign) bool isAI;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *flag;
@property (nonatomic) NSString *idpl;
@property (nonatomic) NSString *Weapon;
@property (nonatomic, assign) UInt32 playerKey;
@property (nonatomic, assign) UInt32 ME;
@property (nonatomic, assign) int isArm;
@property (nonatomic,  assign) uint64_t state;
@property (nonatomic, assign) int hp;
@property (nonatomic, assign) int hpNock;
@property (nonatomic, assign) int NearDeathBreath;
@property (nonatomic, assign) float ActorRender;
@property (nonatomic, assign) float lastRender;
@property (nonatomic, assign) int maxHp;
@property (nonatomic, assign) int signalHP;
@property (nonatomic, assign) int signalHPMax;
@property (nonatomic, assign) bool isFallDown;
@property (nonatomic, assign) bool isFallDownNock;
@property (nonatomic, assign) bool isDead;
@property (nonatomic, assign) bool isVisible;
@property (nonatomic, assign) bool isVisibleAim;
@property (nonatomic) Vector2 AimPos;
@property (nonatomic) Vector3 worldPos;
@property (nonatomic, assign) PlayerType type;
@property (nonatomic) Vector3 BoxSphereBounds;
@property (nonatomic, assign) CGRect box;
@property (nonatomic, assign) int distance;
@property (nonatomic, assign) bool isBestAimTarget;
@property (nonatomic) BoneData boneData;
@property (nonatomic) BoneVisibleData boneVisibleData;
@property (nonatomic) Box3D Box3D;
@property (nonatomic) Arrow Arrow;
@property (nonatomic) std::string statusName;

@end

@interface JFProps : NSObject
@property (nonatomic, assign) long base;
@property (nonatomic) std::string name;
@property (nonatomic, assign) PropsType type;
@property (nonatomic) Vector3 worldPos;
@property (nonatomic, assign) Vector2 screenPos;
@property (nonatomic, assign) int distance;
@property (nonatomic) Box3D Box3D;
@property (nonatomic, assign) bool isVisible;
@end
NS_ASSUME_NONNULL_END
