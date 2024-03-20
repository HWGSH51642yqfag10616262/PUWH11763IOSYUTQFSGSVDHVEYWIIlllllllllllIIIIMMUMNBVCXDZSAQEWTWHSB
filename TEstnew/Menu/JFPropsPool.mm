#import "JFPropsPool.h"
#import "More.h"

@implementation JFPropsPool

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
- (id)create
{
    return [[JFProps alloc] init];
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
