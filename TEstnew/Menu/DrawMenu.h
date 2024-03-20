#import <UIKit/UIKit.h>

@interface DrawMenuSwitch : UIButton
@property (nonatomic, strong) UIButton *WindowSwitch;
@property (nonatomic, strong) UILabel *NameSwitch;
@property (nonatomic, strong) UISwitch *Switch;
- (void)SetSwitch:(NSString *)Name;
@end

@interface DrawMenuSlider : UIButton
@property (nonatomic, strong) UIButton *WindowSlider;
@property (nonatomic, strong) UILabel *NameSlider;
@property (nonatomic, strong) UISlider *Slider;
- (void)SetSlider:(NSString *)Name Max:(CGFloat)Max Min:(CGFloat)Min;
@end

@interface DrawMenuSelect : UIButton
@property (nonatomic, strong) UIButton *WindowSelect;
@property (nonatomic, strong) UILabel *NameSelect;
@property (nonatomic, strong) UISegmentedControl *Select;
- (void)SetSelect:(NSString *)Name Names:(NSArray *)Names;
@end
