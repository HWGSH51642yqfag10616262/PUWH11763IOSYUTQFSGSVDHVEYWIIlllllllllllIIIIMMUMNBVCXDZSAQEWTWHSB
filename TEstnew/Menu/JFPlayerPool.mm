#import "JFPlayerPool.h"
#import "More.h"

@implementation JFPlayerPool

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

//
//  Created BY 2U on 2021/6/31
//  B.Y QQ  654153159
//  仅供学习交流

- (JFPlayer *)getObjFromPool
{
    JFPlayer *player = [super getObjFromPool];
    player.isBestAimTarget = false;
    return player;
}

- (id)create
{
    return [[JFPlayer alloc] init];
}

- (BOOL)validate:(id)obj
{
    return obj != nil;
}

- (void)recycObj:(id)obj
{
    obj = nil;
}

@end
