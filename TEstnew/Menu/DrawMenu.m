#import "DrawMenu.h"

@implementation DrawMenuSwitch
- (instancetype)initWithFrame:(CGRect)frame {
self = [super initWithFrame:frame];
if (self) {
    _WindowSwitch = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 470, 45)];
    _WindowSwitch.backgroundColor = [UIColor clearColor];
    [self addSubview:_WindowSwitch];
    
    _NameSwitch = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 250, 44)];
    _NameSwitch.textAlignment = NSTextAlignmentLeft;
    _NameSwitch.textColor = [UIColor whiteColor];
    [_NameSwitch setFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:15]];
    [_WindowSwitch addSubview:_NameSwitch];
    
    _Switch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 7, 60, 44)];
    [_Switch setOnTintColor:[UIColor colorWithRed: 0.89 green: 0.23 blue: 0.21 alpha: 1.00]];
    [_WindowSwitch addSubview:_Switch];
}
return self;
}

- (void)SetSwitch:(NSString *)Name {
    _NameSwitch.text = Name;
}
@end

@implementation DrawMenuSlider
- (instancetype)initWithFrame:(CGRect)frame {
self = [super initWithFrame:frame];
if (self) {
    _WindowSlider = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 470, 45)];
    _WindowSlider.backgroundColor = [UIColor clearColor];
    [self addSubview:_WindowSlider];
    
    _NameSlider = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 350, 44)];
    _NameSlider.textAlignment = NSTextAlignmentLeft;
    _NameSlider.textColor = [UIColor whiteColor];
    [_NameSlider setFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:10]];
    [_WindowSlider addSubview:_NameSlider];
    
    _Slider = [[UISlider alloc] initWithFrame:CGRectMake(60, 0, 100, 44)];
    _Slider.minimumTrackTintColor = [UIColor colorWithRed: 0.89 green: 0.23 blue: 0.21 alpha: 1.00];
    [_WindowSlider addSubview:_Slider];
}
return self;
}

- (void)SetSlider:(NSString *)Name Max:(CGFloat)Max Min:(CGFloat)Min {
    _NameSlider.text = Name;
    _Slider.maximumValue = Max;
    _Slider.minimumValue = Min;
}
@end

@implementation DrawMenuSelect
- (instancetype)initWithFrame:(CGRect)frame {
self = [super initWithFrame:frame];
if (self) {
    _WindowSelect = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 470, 45)];
    _WindowSelect.backgroundColor = [UIColor clearColor];
    [self addSubview:_WindowSelect];
    
    _NameSelect = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 350, 44)];
    _NameSelect.textAlignment = NSTextAlignmentLeft;
    _NameSelect.textColor = [UIColor whiteColor];
    [_NameSelect setFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:10]];
    [_WindowSelect addSubview:_NameSelect];
    
    _Select = [[UISegmentedControl alloc] initWithFrame:CGRectMake(50, 7, 160, 35)];
    _Select.tintColor = [UIColor colorWithRed: 0.89 green: 0.23 blue: 0.21 alpha: 1.00];
    _Select.backgroundColor = [UIColor colorWithRed: 0.20 green: 0.20 blue: 0.20 alpha: 1.00];
    NSDictionary *Attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"ChalkboardSE-Bold" size:10], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil];
    [_Select setTitleTextAttributes:Attributes forState:UIControlStateNormal];
    [_WindowSelect addSubview:_Select];
}
return self;
}

- (void)SetSelect:(NSString *)Name Names:(NSArray *)Names {
    _NameSelect.text = Name;
    [_Select initWithItems:Names];
}
@end
