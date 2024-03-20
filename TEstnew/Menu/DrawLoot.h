//
//  DrawLoot.h
//  libPUBGHookDylib3
//
//  Created by XyainjiQQ on 1/10/1444 AH.
//

#ifndef DrawLoot_h
#define DrawLoot_h
#import <UIKit/UIKit.h>
@interface DrawLoot : UIView
@property(nonatomic,retain)UILabel *NameDisLb;
- (void)SetNameDis:(NSString *)NameDis Color:(UIColor *)Color Point:(CGPoint)Point;
@end
#endif /* DrawLoot_h */
