//Created By Yaqout 2023
//menu here change to your design
#import "DrawEsp.h"
#import "UpdateEsp.h"
#import "More.h"
#import "JFPlayerPool.h"
#import "JFPropsPool.h"
#import "JFCommon.h"
#import "DrawMenu.h"
#import "GJSYMessage.h"
#import "DrawLoot.h"
#import "esplogo.h"
#import "HeeeNoScreenShotView.h"
#import "mahoa.h"
#import "WHToast.h"
// #import "login.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

NSUserDefaults *check = [NSUserDefaults standardUserDefaults];

@interface JFOverlayView ()
@property (nonatomic, strong) UILabel *NumberLabel;
@property (nonatomic, strong) UILabel *Alert;
@property (nonatomic, strong) CAShapeLayer *TheLineLayer;
@property (nonatomic, strong) CAShapeLayer *TheBoneGreenLayer;
@property (nonatomic, strong) CAShapeLayer *TheBoneRedLayer;
@property (nonatomic, strong) CAShapeLayer *TheBoneyellowLayer;
@property (nonatomic, strong) CAShapeLayer *TheBotWhiteLayer;
@property (nonatomic, strong) CAShapeLayer *TheBotGrayLayer;
@property (nonatomic, strong) NSTimer *DataTimer;
@property (nonatomic, strong) NSTimer *DataTimer1;
@end

static GJSYMessage *fwnameteamdis[70];
static DrawLoot *TheDrawLoot[70];
UIWindow *MainWindow;
UIButton *BackWindow;
UIButton *Menu;
UIScrollView *WindowMenu;
UIScrollView *WindowMenu1;
UIScrollView *WindowMenub;
UIButton *pageLogin;
UIButton *buttonLogin;
UIButton *pageESP;
UILabel *ishooter;
UIButton *buttonESP;
UIView *menuView;
UIButton *DrawESPButton;
UIButton *DrawINFOButton;
UIButton *DrawBONEButton;
UIButton *DrawRAYSButton;
UIButton *DrawBOXButton;
UIButton *DrawWORNINGButton;
UIButton *DrawBOTButton;
UISlider *test;
UILabel* countBoxSizeLabel;
UILabel* draw;
UILabel* line;
UILabel* bone;
UILabel* info;
UILabel* box;
UILabel* arrow;
UIImage* espImage;
UIImage* aimImage;
UIImage* miImage;
UIImage* moImage;
UIImage* seImage;
UILabel* aimbot;
UILabel* aimbotscope;
UILabel* aimnotk;
UILabel* aimnoia;
UILabel* aimfov;
UILabel* bigx;
UILabel* norecoil;
UILabel* nospread;
UILabel* instahit;
UILabel* speedfire;
UILabel* fastsw;
UILabel* speedpla;
UILabel* drawloot;
UILabel* car;
UILabel* weapon;
UILabel* armor;
UILabel* scop;
UILabel* drug;
UILabel* bullet;
UILabel* alert;
UIVisualEffect *testt;
UILabel* hide;
UILabel* reset;

UIButton *pageMEMORY;
UIButton *buttonMEMORY;
UIButton *MemoryMAGICButton;
UIButton *MemoryFastMoveButton;
UIButton *pageMORE;
UIButton *buttonMORE;
UIButton *MemoryiPadViewButton;
UIButton *MemoryFastDropButton;
UIButton *MemorySupperJumpButton;
UIButton *MemoryAimbotButton;
UIButton *MemoryNoRecoilButton;
UIButton *MemoryFlyinPlaneButton;
UIButton *MemoryBigXButton;
UILabel *dateForm;
UILabel *labelisht;
UILabel *bateryDevi;
NSDateFormatter *dateU;
NSDateFormatter *timeR;
UIDevice *myDevice;
UILabel *Ttime;
NSDateFormatter *ttime;

UITextField *loginKey;
UIButton *loginButton;
UIButton *clearButton;
UILabel *loginLabel;
UIButton *paste;
DrawMenuSlider *EspDis;
DrawMenuSlider *AimFOV;
DrawMenuSlider *AutoDis;
DrawMenuSlider *LootDis;
UIButton *Logo;
DrawMenuSwitch *AimScope;
DrawMenuSwitch *AimKnocked;

DrawMenuSwitch *AimFov;
DrawMenuSwitch *FierAuto;
DrawMenuSwitch *NoRecoil;
DrawMenuSwitch *NoSpread;
DrawMenuSelect *AimPart;
DrawMenuSelect *rePart;
DrawMenuSwitch *Instahit;
DrawMenuSwitch *SpeedFire;
DrawMenuSwitch *FastSwitch;
DrawMenuSwitch *Speed;
DrawMenuSwitch *Magic;
DrawMenuSwitch *JumpP;
DrawMenuSwitch *StartEsp;
//DrawMenuSwitch *LineEsp;
//DrawMenuSwitch *BoneEsp;
//DrawMenuSwitch *BoneEsp;
//DrawMenuSwitch *TextEsp;
//DrawMenuSwitch *BoxEsp;
//DrawMenuSwitch *Arrow;
DrawMenuSwitch *StartAim;

DrawMenuSwitch *DrawLootSW;
DrawMenuSwitch *LootCar;
DrawMenuSwitch *LootWeapon;
DrawMenuSwitch *LootArmor;
DrawMenuSwitch *LootScope;
DrawMenuSwitch *LootDrug;
DrawMenuSwitch *LootBullet;
DrawMenuSwitch *LootGrenade;

DrawMenuSwitch *HideHack;
DrawMenuSwitch *GuestReset;

UIButton *closeMenu;
CAShapeLayer *AimFovS;
UIButton *AutoFier;
UIButton *dropdownButton;
UIView *dropdownList;
HeeeNoScreenShotView *hide1;

#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^


@implementation JFOverlayView
- (instancetype)initWithFrame:(CGRect)frame {
if (self = [super initWithFrame:frame]) {

self.backgroundColor = [UIColor clearColor];
self.userInteractionEnabled = NO;
MainWindow = [UIApplication sharedApplication].keyWindow;

self.isStartTimer = false;
self.isShowMenu = false;
self.isLineEsp = false;
self.isBoneEsp = false;
self.isTextEsp = false;
self.isBoxEsp = false;
self.isArrow = false;

self.isAimbot = false;
self.Autofire = false;
self.isAimbotscope = false;
self.isNorecoil = false;
self.NoSpread = false;
self.isNearDeathNotAim = false;
self.isAINotAim = false;
self.isAimFov = false;

self.isShowProps = false;
self.isShowPropsVehicle = false;
self.isShowPropsWeapon = false;
self.isShowPropsArmor = false;
self.isShowPropsSight = false;
self.isShowPropsEarlyWarning = false;
self.isShowPropsBullet = false;
self.isShowPropsDrug = false;

self.BPc = false;
self.BoxWith = false;
self.Pistol = false;
// self.isTeamMateEsp = false;

self.propsDistance = 500;
self.aimbotPart = 6;
self.rcontrol = 10;
self.aimbotRadius = 200;
self.espDistance = 400;
self.AutoDis = 100;
self.AutoFierPoint = CGPointMake(0, 0);
self.AutoFierON = false;

self.DataTimer = [NSTimer timerWithTimeInterval:1.0f/60 target:self selector:@selector(Draw) userInfo:nil repeats:YES];
[[NSRunLoop currentRunLoop] addTimer:self.DataTimer forMode:NSRunLoopCommonModes];

self.DataTimer1 = [NSTimer timerWithTimeInterval:1.0f/1 target:self selector:@selector(ClearData) userInfo:nil repeats:YES];
[[NSRunLoop currentRunLoop] addTimer:self.DataTimer1 forMode:NSRunLoopCommonModes];

for (NSInteger i = 0; i < 70; i++) {
fwnameteamdis[i] = [[GJSYMessage alloc] init];
fwnameteamdis[i].hidden = YES;
[self addSubview:fwnameteamdis[i]];

TheDrawLoot[i] = [[DrawLoot alloc] init];
TheDrawLoot[i].hidden = YES;
[self addSubview:TheDrawLoot[i]];
}

AimFovS = [CAShapeLayer layer];
[AimFovS setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake([UIScreen mainScreen].bounds.size.width/2-self.aimbotRadius*2/2 , [UIScreen mainScreen].bounds.size.height/2-self.aimbotRadius*2/2, self.aimbotRadius*2, self.aimbotRadius*2)] CGPath]];
[AimFovS setStrokeColor:[UIColor clearColor].CGColor];
[AimFovS setFillColor:[[UIColor clearColor] CGColor]];
[self.layer addSublayer:AimFovS];

[self addSubview:self.NumberLabel];
[self addSubview:self.Alert];
[self.layer addSublayer:self.TheLineLayer];
[self.layer addSublayer:self.TheBoneGreenLayer];
[self.layer addSublayer:self.TheBoneRedLayer];
[self.layer addSublayer:self.TheBoneyellowLayer];
[self.layer addSublayer:self.TheBotWhiteLayer];
[self.layer addSublayer:self.TheBotGrayLayer];
}


self.Open = [UIButton buttonWithType:UIButtonTypeRoundedRect];
self.Open.frame = CGRectMake(0, 0, 30, 30);
self.Open.backgroundColor = [UIColor clearColor];

UITapGestureRecognizer *TapOpen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OpenMenu)];
TapOpen.numberOfTapsRequired = 1;
TapOpen.numberOfTouchesRequired = 1;
[self.Open addGestureRecognizer:TapOpen];
//self.Open.enabled = NO;
[MainWindow addSubview:self.Open];
    [self data];

    
// BackWindow = [[UIButton alloc] init];
// BackWindow.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
// BackWindow.backgroundColor = [UIColor clearColor];
// BackWindow.alpha = 0.0f;
// [BackWindow addTarget:self action:@selector(CloseMenu) forControlEvents:UIControlEventTouchUpInside];
// [MainWindow addSubview:BackWindow];

menuView = [[UIView alloc]init];
menuView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 8.6 - 10, 30, [UIScreen mainScreen].bounds.size.width / 1.3  + 20, 325);
menuView.center = MainWindow.center;
menuView.layer.masksToBounds = YES;
menuView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.75];

// testt = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterialDark];
// UIVisualEffectView *test1;
// test1 = [[UIVisualEffectView alloc] initWithEffect:testt];
// test1.frame = menuView.bounds;
//test.cornerRadius = 5;
menuView.layer.cornerRadius = 20;
//test1.layer.cornerRadius = 10;
// [menuView addSubview:test1];
// CAKeyframeAnimation *colorsAnimation = [CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
//     colorsAnimation.values = [NSArray arrayWithObjects: (id)[UIColor colorWithRed: 0.88 green: 0.96 blue: 0.77 alpha: 1.00].CGColor,
//                           (id)[UIColor colorWithRed: 0.70 green: 0.07 blue: 0.09 alpha: 1.00].CGColor, nil];
// colorsAnimation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.25],[NSNumber numberWithFloat:1.0], nil];
// colorsAnimation.calculationMode = kCAAnimationLinear;
// colorsAnimation.removedOnCompletion = NO;
// colorsAnimation.fillMode = kCAFillModeForwards;
// colorsAnimation.duration = 60;


// CAKeyframeAnimation *sizeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
// sizeAnimation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],
// [NSNumber numberWithFloat:5.0], nil];
// sizeAnimation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:3.0], nil];
// sizeAnimation.calculationMode = kCAAnimationLinear;
// sizeAnimation.removedOnCompletion = NO;
// sizeAnimation.fillMode = kCAFillModeForwards;
// sizeAnimation.duration = 3.0f;

// [menuView.layer   addAnimation:colorsAnimation forKey:nil];
// [menuView.layer   addAnimation:sizeAnimation forKey:nil];
    
[MainWindow  addSubview:menuView];
menuView.hidden = true;

    // DrawMenuSelect *EnPart = [[DrawMenuSelect alloc] initWithFrame:CGRectMake(300, 0, 370, 35)];
    // [EnPart SetSelect:@"Language" Names:[NSArray arrayWithObjects:@"EN", @"AR", nil]];
    // EnPart.Select.selectedSegmentIndex = 0;
    // [EnPart.Select addTarget:self action:@selector(enlung:) forControlEvents:UIControlEventValueChanged];
    // [menuView addSubview:EnPart];

    // Create a UIButton that will act as the dropdown button
dropdownButton = [UIButton buttonWithType:UIButtonTypeCustom];
dropdownButton.frame = CGRectMake(560, 0, 150, 35);
[dropdownButton setTitle:@"Select Language" forState:UIControlStateNormal];
[dropdownButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
[dropdownButton addTarget:self action:@selector(dropdownButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
// Set the background color of the button to a highlighted color
dropdownButton.backgroundColor = [UIColor redColor];
// Set corner radius for button
dropdownButton.layer.cornerRadius = 10.0;

// Set border color for button
dropdownButton.layer.borderColor = [UIColor whiteColor].CGColor;

// Set border width for button
dropdownButton.layer.borderWidth = 2.0;

// Create a UIView that will hold the dropdown list
dropdownList = [[UIView alloc] initWithFrame:CGRectMake(620, 40, 45, 150)];
dropdownList.layer.cornerRadius = 6.0;
// Set border color for button
dropdownList.layer.borderColor = [UIColor blackColor].CGColor;
dropdownList.backgroundColor = [UIColor whiteColor];
dropdownList.layer.borderWidth = 1;
dropdownList.layer.borderColor = [UIColor blackColor].CGColor;
dropdownList.hidden = YES;

// Add the dropdown options to the dropdown list
NSArray *options = @[@"EN", @"AR", @"CN", @"VN"];
for (NSString *option in options) {
    UIButton *optionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    optionButton.frame = CGRectMake(-77, dropdownList.subviews.count * 40, 200, 40);
    [optionButton setTitle:option forState:UIControlStateNormal];
    [optionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [optionButton addTarget:self action:@selector(optionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [dropdownList addSubview:optionButton];
}

// Add the dropdown button and list to the view
// [menuView addSubview:dropdownButton];
// [menuView addSubview:dropdownList];


    buttonLogin = [[UIButton alloc]init];
    buttonLogin.frame = CGRectMake(540, 40, 70, 50);
    buttonLogin.backgroundColor = [UIColor colorWithRed: 0.36 green: 0.88 blue: 0.90 alpha: 1.00];
    buttonLogin.layer.cornerRadius = 15;
    [buttonLogin setTitle:@"ESP" forState:UIControlStateNormal];
    [buttonLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttonLogin.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:10];
    [buttonLogin addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:buttonLogin];

    pageLogin = [[UIButton alloc]init];
    pageLogin.frame = CGRectMake(15, 30, 470, 250);
    pageLogin.backgroundColor = [UIColor colorWithRed: 0.36 green: 0.88 blue: 0.90 alpha: 1.00];
    pageLogin.layer.cornerRadius = 20;
    [menuView addSubview:pageLogin];

    WindowMenub = [[UIScrollView alloc] init];
    WindowMenub.frame = CGRectMake(0, 0, 470, 300);
    WindowMenub.contentSize = CGSizeMake(330, 240);
    WindowMenub.backgroundColor = [UIColor clearColor];
    [WindowMenub setShowsVerticalScrollIndicator:NO];
    [pageLogin addSubview:WindowMenub];


DrawMenuSwitch *StartEsp = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(60, 0, 370, 35)];
draw = [[UILabel alloc]init];
draw.text = @"DRAW ESP";
draw.frame = CGRectMake(0, 0, 250, 44);
draw.font = [UIFont boldSystemFontOfSize:10];
draw.textColor = [UIColor whiteColor];
[WindowMenub addSubview:draw];
//[StartEsp SetSwitch];
[StartEsp.Switch addTarget:self action:@selector(isStartTimer:) forControlEvents:UIControlEventTouchUpInside];
[WindowMenub addSubview:StartEsp];
//UILabel *logintime = [[UILabel alloc]init];
//logintime.frame = CGRectMake(15, 20, 250, 20);

DrawMenuSwitch *LineEsp = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(180, 0, 370, 35)];
line = [[UILabel alloc]init];
line.text = @"LINES";
line.frame = CGRectMake(135, 0, 250, 44);
line.font = [UIFont boldSystemFontOfSize:10];
line.textColor = [UIColor whiteColor];
[WindowMenub addSubview:line];
[LineEsp.Switch addTarget:self action:@selector(isLineEsp:) forControlEvents:UIControlEventTouchUpInside];
[WindowMenub addSubview:LineEsp];

DrawMenuSwitch *BoneEsp = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(280, 0, 370, 35)];
bone = [[UILabel alloc]init];
bone.text = @"BONE";
bone.frame = CGRectMake(245, 0, 250, 44);
bone.font = [UIFont boldSystemFontOfSize:10];
bone.textColor = [UIColor whiteColor];
[WindowMenub addSubview:bone];
[BoneEsp.Switch addTarget:self action:@selector(isBoneEsp:) forControlEvents:UIControlEventTouchUpInside];
[WindowMenub addSubview:BoneEsp];

DrawMenuSwitch *TextEsp = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(375, 0, 370, 35)];
info = [[UILabel alloc]init];
info.text = @"INFO";
info.frame = CGRectMake(345, 0, 250, 44);
info.font = [UIFont boldSystemFontOfSize:10];
info.textColor = [UIColor whiteColor];
[WindowMenub addSubview:info];
[TextEsp.Switch addTarget:self action:@selector(isTextEsp:) forControlEvents:UIControlEventTouchUpInside];
[WindowMenub addSubview:TextEsp];

DrawMenuSwitch *BoxEsp = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(60, 45, 370, 35)];
box = [[UILabel alloc]init];
box.text = @"BOX-3D";
box.frame = CGRectMake(0, 45, 250, 44);
box.font = [UIFont boldSystemFontOfSize:10];
box.textColor = [UIColor whiteColor];
[WindowMenub addSubview:box];
[BoxEsp.Switch addTarget:self action:@selector(isBoxEsp:) forControlEvents:UIControlEventTouchUpInside];
[WindowMenub addSubview:BoxEsp];

DrawMenuSwitch *Arrow = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(180, 45, 370, 35)];
arrow = [[UILabel alloc]init];
arrow.text = @"ARROW";
arrow.frame = CGRectMake(135, 45, 250, 44);
arrow.font = [UIFont boldSystemFontOfSize:10];
arrow.textColor = [UIColor whiteColor];
[WindowMenub addSubview:arrow];
[Arrow.Switch addTarget:self action:@selector(isArrow:) forControlEvents:UIControlEventTouchUpInside];
[WindowMenub addSubview:Arrow];

HideHack = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(300, 45, 370, 35)];
hide = [[UILabel alloc]init];
hide.text = @"Hide Hack";
hide.frame = CGRectMake(245, 45, 250, 44);
hide.font = [UIFont boldSystemFontOfSize:10];
hide.textColor = [UIColor whiteColor];
[WindowMenub addSubview:hide];
[HideHack.Switch addTarget:self action:@selector(isHideHack:) forControlEvents:UIControlEventTouchUpInside];
[WindowMenub addSubview:HideHack];


EspDis = [[DrawMenuSlider alloc] initWithFrame:CGRectMake(0, 210, 370, 35)];
[EspDis SetSlider:@"DIS:400.0M" Max:400 Min:100];
EspDis.Slider.value = 400;
[EspDis.Slider addTarget:self action:@selector(espDistance:) forControlEvents:UIControlEventValueChanged];
[WindowMenub addSubview:EspDis];


buttonESP = [[UIButton alloc]init];
buttonESP.frame = CGRectMake(540, 100, 70, 50);
buttonESP.backgroundColor =  [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
buttonESP.layer.cornerRadius = 15;
[buttonESP setTitle:@"AIM-BOT" forState:UIControlStateNormal];
[buttonESP setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
buttonESP.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:10];
[buttonESP addTarget:self action:@selector(espAction) forControlEvents:UIControlEventTouchUpInside];
[menuView addSubview:buttonESP];

// pageESP = [[UIButton alloc]init];
// pageESP.frame = CGRectMake(15, 40, 470, 250);
// pageESP.backgroundColor = [UIColor colorWithRed: 0.48 green: 0.16 blue: 0.16 alpha: 1.00];
// pageESP.layer.cornerRadius = 20;
// [menuView addSubview:pageESP];


// WindowMenu = [[UIScrollView alloc] init];
// WindowMenu.frame = CGRectMake(0, 0, 470, 250);
// WindowMenu.contentSize = CGSizeMake(330, 630);
// WindowMenu.backgroundColor = [UIColor clearColor];
// [WindowMenu setShowsVerticalScrollIndicator:NO];
// [pageESP addSubview:WindowMenu];
    
StartAim = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(60, 90, 370, 35)];
aimbot = [[UILabel alloc]init];
aimbot.text = @"Aim";
aimbot.frame = CGRectMake(0, 90, 250, 44);
aimbot.font = [UIFont boldSystemFontOfSize:10];
aimbot.textColor = [UIColor whiteColor];
aimbot.hidden = true;
[WindowMenub addSubview:aimbot];
[StartAim.Switch addTarget:self action:@selector(isAimbot:) forControlEvents:UIControlEventTouchUpInside];
StartAim.hidden = true;
[WindowMenub addSubview:StartAim];

AimScope = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(180, 90, 370, 35)];
AimScope.Switch.enabled = NO;
aimbotscope = [[UILabel alloc]init];
aimbotscope.text = @"Scope";
aimbotscope.frame = CGRectMake(135, 90, 250, 44);
aimbotscope.font = [UIFont boldSystemFontOfSize:10];
aimbotscope.textColor = [UIColor whiteColor];
aimbotscope.hidden = true;
[WindowMenub addSubview:aimbotscope];
[AimScope.Switch addTarget:self action:@selector(isAimbotscope:) forControlEvents:UIControlEventTouchUpInside];
AimScope.hidden = true;
[WindowMenub addSubview:AimScope];

AimKnocked = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(280, 90, 370, 35)];
AimKnocked.Switch.enabled = NO;
aimnotk = [[UILabel alloc]init];
aimnotk.text = @"Knock";
aimnotk.frame = CGRectMake(245, 90, 250, 44);
aimnotk.font = [UIFont boldSystemFontOfSize:10];
aimnotk.textColor = [UIColor whiteColor];
aimnotk.hidden = true;
[WindowMenub addSubview:aimnotk];
[AimKnocked.Switch addTarget:self action:@selector(isNearDeathNotAim:) forControlEvents:UIControlEventTouchUpInside];
AimKnocked.hidden = true;
[WindowMenub addSubview:AimKnocked];

_AimisAi = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(400, 90, 370, 35)];
_AimisAi.Switch.enabled = NO;
aimnoia = [[UILabel alloc]init];
aimnoia.text = @"FOV-MET";
aimnoia.frame = CGRectMake(345, 90, 250, 44);
aimnoia.font = [UIFont boldSystemFontOfSize:10];
aimnoia.textColor = [UIColor whiteColor];
aimnoia.hidden = true;
[WindowMenub addSubview:aimnoia];
[_AimisAi.Switch addTarget:self action:@selector(isAINotAim:) forControlEvents:UIControlEventTouchUpInside];
_AimisAi.hidden = true;
[WindowMenub addSubview:_AimisAi];

AimFov = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(60, 135, 370, 35)];
AimFov.Switch.enabled = NO;
aimfov = [[UILabel alloc]init];
aimfov.text = @"Show Fov";
aimfov.frame = CGRectMake(0, 135, 250, 44);
aimfov.font = [UIFont boldSystemFontOfSize:10];
aimfov.textColor = [UIColor whiteColor];
aimfov.hidden = true;
[WindowMenub addSubview:aimfov];
[AimFov.Switch addTarget:self action:@selector(isAimFov:) forControlEvents:UIControlEventTouchUpInside];
AimFov.hidden = true;
[WindowMenub addSubview:AimFov];

AimFOV = [[DrawMenuSlider alloc] initWithFrame:CGRectMake(120, 135, 370, 35)];
[AimFOV SetSlider:@"Fov :200" Max:700 Min:30];
AimFOV.Slider.value = 200;
[AimFOV.Slider addTarget:self action:@selector(aimbotRadius:) forControlEvents:UIControlEventValueChanged];
AimFOV.hidden = true;
[WindowMenub addSubview:AimFOV];


AimPart = [[DrawMenuSelect alloc] initWithFrame:CGRectMake(280, 135, 200, 35)];
[AimPart SetSelect:@"Aim-Part" Names:[NSArray arrayWithObjects:@"Head", @"Neck", @"Body", nil]];
AimPart.Select.selectedSegmentIndex = 0;
[AimPart.Select addTarget:self action:@selector(AimPart:) forControlEvents:UIControlEventValueChanged];
AimPart.hidden = true;
[WindowMenub addSubview:AimPart];




buttonMEMORY = [[UIButton alloc]init];
buttonMEMORY.frame = CGRectMake(540, 160, 70, 50);
buttonMEMORY.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
buttonMEMORY.layer.cornerRadius = 15;
[buttonMEMORY setTitle:@"ITEMS" forState:UIControlStateNormal];
[buttonMEMORY setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
buttonMEMORY.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:10];

[buttonMEMORY addTarget:self action:@selector(memoryAction)forControlEvents:UIControlEventTouchUpInside];
[menuView addSubview:buttonMEMORY];

// pageMEMORY = [[UIButton alloc]init];
// pageMEMORY.frame = CGRectMake(15, 40, 470, 250);
// pageMEMORY.backgroundColor = [UIColor colorWithRed: 0.48 green: 0.16 blue: 0.16 alpha: 1.00];
// pageMEMORY.layer.cornerRadius = 20;
// [menuView addSubview:pageMEMORY];

// WindowMenu1 = [[UIScrollView alloc] init];
// WindowMenu1.frame = CGRectMake(0, 0, 470, 250);
// WindowMenu1.contentSize = CGSizeMake(330, 400);
// WindowMenu1.backgroundColor = [UIColor clearColor];
// [WindowMenu1 setShowsVerticalScrollIndicator:NO];
// [pageMEMORY addSubview:WindowMenu1];



DrawLootSW = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(60, 180, 370, 35)];
drawloot = [[UILabel alloc]init];
drawloot.text = @"Draw ITEM";
drawloot.frame = CGRectMake(0, 180, 250, 44);
drawloot.font = [UIFont boldSystemFontOfSize:10];
drawloot.textColor = [UIColor whiteColor];
drawloot.hidden = true;
[WindowMenub addSubview:drawloot];
[DrawLootSW.Switch addTarget:self action:@selector(isShowProps:) forControlEvents:UIControlEventTouchUpInside];
DrawLootSW.hidden = true;
[WindowMenub addSubview:DrawLootSW];

LootBullet = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(180, 180, 370, 35)];
bullet = [[UILabel alloc]init];
bullet.text = @"Bullet";
bullet.frame = CGRectMake(135, 180, 250, 44);
bullet.font = [UIFont boldSystemFontOfSize:10];
bullet.textColor = [UIColor whiteColor];
bullet.hidden = true;
[WindowMenub addSubview:bullet];
[LootBullet.Switch addTarget:self action:@selector(isLootBullet:) forControlEvents:UIControlEventTouchUpInside];
LootBullet.hidden = true;
[WindowMenub addSubview:LootBullet];

LootWeapon = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(280, 180, 370, 35)];
weapon = [[UILabel alloc]init];
weapon.text = @"Weapon";
weapon.frame = CGRectMake(235, 180, 250, 44);
weapon.font = [UIFont boldSystemFontOfSize:10];
weapon.textColor = [UIColor whiteColor];
weapon.hidden = true;
[WindowMenub addSubview:weapon];
[LootWeapon.Switch addTarget:self action:@selector(isLootWeapon:) forControlEvents:UIControlEventTouchUpInside];
LootWeapon.hidden = true;
[WindowMenub addSubview:LootWeapon];

LootCar = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(380, 180, 370, 35)];
car = [[UILabel alloc]init];
car.text = @"Car";
car.frame = CGRectMake(335, 180, 250, 44);
car.font = [UIFont boldSystemFontOfSize:10];
car.textColor = [UIColor whiteColor];
car.hidden= true;
[WindowMenub addSubview:car];
[LootCar.Switch addTarget:self action:@selector(isLootCar:) forControlEvents:UIControlEventTouchUpInside];
LootCar.hidden = true;
[WindowMenub addSubview:LootCar];



// LootArmor = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(0, 135, 370, 35)];
// armor = [[UILabel alloc]init];
// armor.text = @"ESP ARMOR";
// armor.frame = CGRectMake(30, 135, 250, 44);
// armor.font = [UIFont boldSystemFontOfSize:10];
// armor.textColor = [UIColor whiteColor];
// [WindowMenu1 addSubview:armor];
// [LootArmor.Switch addTarget:self action:@selector(isLootArmor:) forControlEvents:UIControlEventTouchUpInside];
// [WindowMenu1 addSubview:LootArmor];

// LootScope = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(0, 180, 370, 35)];
// scop = [[UILabel alloc]init];
// scop.text = @"ESP SCOPE";
// scop.frame = CGRectMake(30, 180, 250, 44);
// scop.font = [UIFont boldSystemFontOfSize:10];
// scop.textColor = [UIColor whiteColor];
// [WindowMenu1 addSubview:scop];
// [LootScope.Switch addTarget:self action:@selector(isLootScope:) forControlEvents:UIControlEventTouchUpInside];
// [WindowMenu1 addSubview:LootScope];

// LootDrug = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(0, 225, 370, 35)];
// drug = [[UILabel alloc]init];
// drug.text = @"ESP HEALTH";
// drug.frame = CGRectMake(30, 225, 250, 44);
// drug.font = [UIFont boldSystemFontOfSize:10];
// drug.textColor = [UIColor whiteColor];
// [WindowMenu1 addSubview:drug];
// [LootDrug.Switch addTarget:self action:@selector(isLootDrug:) forControlEvents:UIControlEventTouchUpInside];
// [WindowMenu1 addSubview:LootDrug];



// LootGrenade = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(0, 315, 370, 35)];
// alert = [[UILabel alloc]init];
// alert.text = @"ESP Grenead Alert!";
// alert.frame = CGRectMake(30, 315, 250, 44);
// alert.font = [UIFont boldSystemFontOfSize:10];
// alert.textColor = [UIColor whiteColor];
// [WindowMenu1 addSubview:alert];
// [LootGrenade.Switch addTarget:self action:@selector(isLootGrenade:) forControlEvents:UIControlEventTouchUpInside];
// [WindowMenu1 addSubview:LootGrenade];

//LootDis = [[DrawMenuSlider alloc] initWithFrame:CGRectMake(0, 360, 370, 35)];
//[LootDis SetSlider:@"Dis :500.000000" Max:500 Min:100];
//LootDis.Slider.value = 500;
//[LootDis.Slider addTarget:self action:@selector(propsDistance:) forControlEvents:UIControlEventValueChanged];
//[WindowMenu1 addSubview:LootDis];



buttonMORE = [[UIButton alloc]init];
buttonMORE.frame = CGRectMake(650, 270, 50, 50);
buttonMORE.backgroundColor = [UIColor colorWithRed: 0.93 green: 0.18 blue: 0.29 alpha: 1.00];
buttonMORE.layer.cornerRadius = 15;
NSString *powerOffSymbol = @"\u23FB";
[buttonMORE setTitle:[NSString stringWithFormat:@"%@", powerOffSymbol] forState:UIControlStateNormal];
[buttonMORE setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
buttonMORE.titleLabel.font = [UIFont fontWithName:@"Apple Color Emoji" size:20];

[buttonMORE addTarget:self action:@selector(CloseMenu)forControlEvents:UIControlEventTouchUpInside];
[menuView addSubview:buttonMORE];

pageMORE = [[UIButton alloc]init];
pageMORE.frame = CGRectMake(15, 40, 470, 250);
pageMORE.backgroundColor = [UIColor colorWithRed: 0.48 green: 0.16 blue: 0.16 alpha: 1.00];
pageMORE.layer.cornerRadius= 20;
[menuView addSubview:pageMORE];



// GuestReset = [[DrawMenuSwitch alloc] initWithFrame:CGRectMake(0, 45, 370, 35)];
// reset = [[UILabel alloc]init];
// reset.text = @"Guest-Reset";
// reset.frame = CGRectMake(30, 45, 250, 44);
// reset.font = [UIFont boldSystemFontOfSize:10];
// reset.textColor = [UIColor whiteColor];
// [pageMORE addSubview:reset];
// [GuestReset.Switch addTarget:self action:@selector(isGuestReset:) forControlEvents:UIControlEventTouchUpInside];
// [pageMORE addSubview:GuestReset];




buttonMEMORY.layer.borderWidth = 0.0f;
buttonLogin.layer.borderWidth = 0.0f;
buttonESP.layer.borderWidth = 0.0f;
buttonMORE.layer.borderWidth = 0.0f;
pageMEMORY.hidden = true;
pageMORE.hidden = true;
pageESP.hidden = true;
pageLogin.hidden = false;
return self;
}

// Implement the dropdown button tapped method to show/hide the dropdown list
- (void)dropdownButtonTapped:(UIButton *)sender {
    sender.selected = !sender.selected;
    dropdownList.hidden = !sender.selected;
}
NSString *selectedOption;
// Implement the option button tapped method to select an option and update the dropdown button title
- (void)optionButtonTapped:(UIButton *)sender {
    dropdownButton.selected = NO;
    dropdownList.hidden = YES;
    [dropdownButton setTitle:sender.titleLabel.text forState:UIControlStateNormal];
    // Update the selected option
    selectedOption = sender.titleLabel.text;
    if ([selectedOption isEqualToString:@"EN"]) {
draw.text = @"ESP";
line.text = @"LINES";
bone.text = @"SKELTON";
info.text = @"TEXT";
box.text = @"BOX-3D";
arrow.text = @"ALERT'S";
aimbot.text = @"Aim-bot";
aimbotscope.text = @"Aimbot-Scope";
aimnotk.text = @"NO-Knocked";
aimnoia.text = @"NO-isAI";
aimfov.text = @"Fov";
bigx.text = @"EffectX";
norecoil.text = @"StableGun";
nospread.text = @"NoSpread";
instahit.text = @"instahit";
speedfire.text = @"Speed-Fire";
    speedpla.text = @"Speed-Prone";
fastsw.text = @"Fast-SwitchWeapon";
drawloot.text = @"ITEMS";
car.text = @"CAR";
weapon.text = @"GUNS";
armor.text = @"ARMOR";
scop.text = @"SCOPE";
drug.text = @"HEALTH";
bullet.text = @"AMMO";
alert.text = @"Grenead-ALERT!";
hide.text = @"Hide-Hack";
reset.text = @"Reset-Guest";
} else if ([selectedOption isEqualToString:@"AR"]) {
draw.text = @"رسم";
line.text = @"خطوط";
bone.text = @"هيكل";
info.text = @"معلومات";
box.text = @"صندوق";
arrow.text = @"أسهم";
aimbot.text = @"أيمبوت";
aimbotscope.text = @"أيمبوت سكوب";
aimnotk.text = @"تجاهل النوك";
aimnoia.text = @"تجاهل البوت";
aimfov.text = @"دائرة الأيمبوت";
bigx.text = @"تأثير دمج";
norecoil.text = @"ثبات";
nospread.text = @"عدم تناثر";
    instahit.text = @"طلقة سريعة";
    speedfire.text = @"رمي سريع";
    fastsw.text = @"تبديل سلاح سريع";
    speedpla.text = @"زحف سريع";
drawloot.text = @"كشف عناصر";
car.text = @"سيارات";
weapon.text = @"أسلحة";
armor.text = @"دروع";
scop.text = @"سكوب";
drug.text = @"أدوية";
bullet.text = @"ذخيرة";
alert.text = @"تحذير قنابل";
hide.text = @"وضع الستريم";
reset.text = @"ترسيت القيست";
} else if ([selectedOption isEqualToString:@"CN"]) {
draw.text = @"ESP";
 line.text = @"线条";
 bone.text = @"骷髅";
 info.text = @"文本";
 box.text = @"BOX 3D";
 arrow.text = @"警报";
 aimbot.text = @"Aimbot";
 aimbotscope.text = @"Aimbot 瞄准镜";
 aimnotk.text = @"NO Knocked";
 aimnoia.text = @"NO 是 AI";
 aimfov.text = @"Fov";
 bigx.text = @"效果X";
 norecoil.text = @"稳定枪";
 nospread.text = @"无传播";
 instahit.text = @"instahit";
 speedfire.text = @"速射";
     speedpla.text = @"速度倾向";
 fastsw.text = @"快速切换武器";
 drawloot.text = @"物品";
 car.text = @"汽车";
 weapon.text = @"GUNS";
 armor.text = @"ARMOR";
 scop.text = @"范围";
 drug.text = @"健康";
 bullet.text = @"AMMO";
 alert.text = @"手榴弹警报！";
 hide.text = @"隐藏黑客";
 reset.text = @"重置访客";
} else {
draw.text = @"ESP";
   line.text = @"Chỉ Tia Địch";
   bone.text = @" xương";
   info.text = @"Tên Địch";
   box.text = @"Hộp 3D";
   arrow.text = @"Mũi Tên";
   aimbot.text = @"Aimbot";
   aimbotscope.text = @"Aimbot Scope";
   aimnotk.text = @"Không bắn Knocked";
   aimnoia.text = @"Không bắn bot";
   aimfov.text = @"Fov";
   bigx.text = @"Hiệu ứng X";
   norecoil.text = @"Không Giật";
   nospread.text = @"Không Rung";
   instahit.text = @"instahit";
   speedfire.text = @"Đạn Nhanh 1";
       speedpla.text = @"Đạn Nhanh 2";
   fastsw.text = @"Chuyển nhanh vũ khí";
   drawloot.text = @"item";
   car.text = @"Xe";
   weapon.text = @"SÚNG";
   armor.text = @"ARMOR";
   scop.text = @"Phạm vi";
   drug.text = @"Sức khỏe";
   bullet.text = @"Đạn";
   alert.text = @"Cảnh báo lựu đạn!";
   hide.text = @"Ẩn Hack";
   reset.text = @"Đặt lại";
}
}
- (void)data{

//mainWindow = [UIApplication sharedApplication].keyWindow;

NSUserDefaults*defaults = [NSUserDefaults standardUserDefaults];
[defaults synchronize];



Ttime = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 4 - 5, 30, [UIScreen mainScreen].bounds.size.width / 2  + 10, 20)];
Ttime.font = [UIFont boldSystemFontOfSize:10];
Ttime.layer.cornerRadius = 15;
Ttime.textAlignment = NSTextAlignmentCenter;

Ttime.layer.masksToBounds = true;

Ttime.text = [NSString stringWithFormat:@"Quang Blue"];

Ttime.textColor = [UIColor redColor];
    
[MainWindow addSubview:Ttime];

}

-(void)loginAction {

if(buttonLogin.layer.borderWidth == 0.0f) {

buttonLogin.layer.borderWidth = 0.1f;
// buttonESP.layer.borderWidth = 0.0f;
// buttonMEMORY.layer.borderWidth = 0.0f;
// buttonMORE.layer.borderWidth = 0.0f;

// buttonMEMORY.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
// buttonESP.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
// buttonLogin.backgroundColor = [UIColor colorWithRed: 0.36 green: 0.88 blue: 0.90 alpha: 1.00];
// buttonMORE.backgroundColor = [UIColor colorWithRed: 0.93 green: 0.18 blue: 0.29 alpha: 1.00];

// pageMEMORY.hidden = true;
// pageESP.hidden = true;
// pageMORE.hidden = true;
pageLogin.hidden = false;

}
}

-(void)espAction {

if(buttonESP.layer.borderWidth == 0.0f) {
buttonESP.layer.borderWidth = 0.1f;
buttonLogin.layer.borderWidth = 0.0f;
buttonMEMORY.layer.borderWidth = 0.0f;
buttonMORE.layer.borderWidth = 0.0f;

// buttonMEMORY.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
buttonESP.backgroundColor = [UIColor colorWithRed: 0.36 green: 0.88 blue: 0.90 alpha: 1.00];
// buttonLogin.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
// buttonMORE.backgroundColor = [UIColor colorWithRed: 0.93 green: 0.18 blue: 0.29 alpha: 1.00];

pageLogin.hidden = false;
// pageMEMORY.hidden = true;
// pageMORE.hidden = true;
// pageESP.hidden = false;

StartAim.hidden = false;
aimbot.hidden = false;
AimScope.hidden = false;
aimbotscope.hidden = false;
AimKnocked.hidden = false;
aimnotk.hidden = false;
_AimisAi.hidden = false;
aimnoia.hidden = false;
aimfov.hidden = false;
AimFov.hidden = false;
AimFOV.hidden = false;
AimPart.hidden = false;

}
else{
buttonESP.layer.borderWidth = 0.0f;
buttonESP.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
StartAim.hidden = true;
aimbot.hidden = true;
AimScope.hidden = true;
aimbotscope.hidden = true;
AimKnocked.hidden = true;
aimnotk.hidden = true;
_AimisAi.hidden = true;
aimnoia.hidden = true;
aimfov.hidden = true;
AimFov.hidden = true;
AimFOV.hidden = true;
AimPart.hidden = true;
}
}
-(void)memoryAction {

if(buttonMEMORY.layer.borderWidth == 0.0f) {

buttonMEMORY.layer.borderWidth = 0.1f;
buttonLogin.layer.borderWidth = 0.0f;
buttonESP.layer.borderWidth = 0.0f;
buttonMORE.layer.borderWidth = 0.0f;

buttonMEMORY.backgroundColor = [UIColor colorWithRed: 0.36 green: 0.88 blue: 0.90 alpha: 1.00];
// buttonESP.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
// buttonLogin.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
// buttonMORE.backgroundColor = [UIColor colorWithRed: 0.93 green: 0.18 blue: 0.29 alpha: 1.00];

pageLogin.hidden = false;
// pageESP.hidden = true;
// pageMORE.hidden = true;
// pageMEMORY.hidden = false;
drawloot.hidden = false;
DrawLootSW.hidden = false;
bullet.hidden = false;
LootBullet.hidden = false;
weapon.hidden = false;
LootWeapon.hidden = false;
car.hidden= false;
LootCar.hidden = false;

}
else{
buttonMEMORY.layer.borderWidth = 0.0f;
buttonMEMORY.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
drawloot.hidden = true;
DrawLootSW.hidden = true;
bullet.hidden = true;
LootBullet.hidden = true;
weapon.hidden = true;
LootWeapon.hidden = true;
car.hidden= true;
LootCar.hidden = true;
}



}
-(void)MOREAction {

if(buttonMORE.layer.borderWidth == 0.0f) {

buttonMORE.layer.borderWidth = 0.1f;
buttonLogin.layer.borderWidth = 0.0f;
buttonESP.layer.borderWidth = 0.0f;
buttonMEMORY.layer.borderWidth = 0.0f;

// buttonMEMORY.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
// buttonESP.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
// buttonLogin.backgroundColor = [UIColor colorWithRed: 0.96 green: 0.69 blue: 0.10 alpha: 1.00];
buttonMORE.backgroundColor = [UIColor colorWithRed: 0.93 green: 0.18 blue: 0.29 alpha: 1.00];

pageLogin.hidden = false;
// pageESP.hidden = true;
// pageMEMORY.hidden = true;
// pageMORE.hidden = FALSE;

}


}
- (void)WasDragged:(UIButton *)Button WithEvent:(UIEvent *)Event {
UITouch *Touch = [[Event touchesForView:Button] anyObject];
CGPoint PreviousLocation = [Touch previousLocationInView:Button];
CGPoint Location = [Touch locationInView:Button];
CGFloat Delta_x = Location.x - PreviousLocation.x;
CGFloat Delta_y = Location.y - PreviousLocation.y;
Button.center = CGPointMake(Button.center.x + Delta_x, Button.center.y + Delta_y);
}

- (void)WasDraggedB:(UIButton *)Button WithEventB:(UIEvent *)Event {
UITouch *Touch = [[Event touchesForView:Button] anyObject];
CGPoint PreviousLocation = [Touch previousLocationInView:Button];
CGPoint Location = [Touch locationInView:Button];
CGFloat Delta_x = Location.x - PreviousLocation.x;
CGFloat Delta_y = Location.y - PreviousLocation.y;
Button.center = CGPointMake(Button.center.x + Delta_x, Button.center.y + Delta_y);
self.AutoFierPoint = CGPointMake(Button.center.x + Delta_x, Button.center.y + Delta_y);
}

- (void)Save {
AutoFier.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.5];
AutoFier.userInteractionEnabled = NO;
self.AutoFierON = true;
}

- (void)isStartTimer:(UISwitch *)Switch {
self.isStartTimer = (Switch.isOn)?true:false;
if (Switch.isOn) {
[[NSNotificationCenter defaultCenter] postNotificationName:@"isStartTimer" object:[NSNumber numberWithBool:true]];
}
}

- (void)isLineEsp:(UISwitch *)Switch {
self.isLineEsp = (Switch.isOn)?true:false;
}

- (void)isBoneEsp:(UISwitch *)Switch {
self.isBoneEsp = (Switch.isOn)?true:false;
}

- (void)isBoxEsp:(UISwitch *)Switch {
self.isBoxEsp = (Switch.isOn)?true:false;
}

- (void)isTextEsp:(UISwitch *)Switch {
self.isTextEsp = (Switch.isOn)?true:false;
}

- (void)espDistance:(UISlider *)Slider {
float Val = Slider.value;
self.espDistance = Val;
[EspDis SetSlider:[NSString stringWithFormat:@"Dis :%.1fM", Val] Max:400 Min:100];
}

- (void)isAimbot:(UISwitch *)Switch {
self.isAimbot = (Switch.isOn)?true:false;
if (Switch.isOn) {
AimScope.Switch.enabled = YES;
AimKnocked.Switch.enabled = YES;
_AimisAi.Switch.enabled = YES;
AimFov.Switch.enabled = YES;
FierAuto.Switch.enabled = YES;
NoRecoil.Switch.enabled = YES;
NoSpread.Switch.enabled = YES;
} else {
AimScope.Switch.enabled = NO;
AimKnocked.Switch.enabled = NO;
_AimisAi.Switch.enabled = NO;
AimFov.Switch.enabled = NO;
FierAuto.Switch.enabled = NO;
NoRecoil.Switch.enabled = NO;
NoSpread.Switch.enabled = NO;
    
self.isAimbotscope = false;
self.isNearDeathNotAim = false;
// self.isAINotAim = false;
self.isAimFov = false;
self.Autofire = false;
self.isNorecoil = false;
self.NoSpread = false;
}
}

- (void)isAimbotscope:(UISwitch *)Switch {
self.isAimbotscope = (Switch.isOn)?true:false;
}

- (void)isNearDeathNotAim:(UISwitch *)Switch {
self.isNearDeathNotAim = (Switch.isOn)?true:false;
}

- (void)isAINotAim:(UISwitch *)Switch {
self.isAINotAim = (Switch.isOn)?true:false;
if(Switch.isOn) {
AimFov.enabled = false;
[AimFov.Switch setOn:NO];
[AimFovS setStrokeColor:[UIColor clearColor].CGColor];
AimFOV.Slider.value = 100;
self.aimbotRadius = 100;
// AimFOV.enabled = false;
[check setBool:YES forKey:@"aimbotfor"];

}
else{
AimFov.enabled = true;
[AimFov.Switch setOn:YES];
[AimFovS setStrokeColor:[UIColor colorWithRed: 1.00 green:0.00 blue: 0.00 alpha: 0.5].CGColor];
// AimFOV.Slider.value = 100;
// AimFOV.enabled = true;
[check setBool:NO forKey:@"aimbotfor"];

}

}

- (void)isAimFov:(UISwitch *)Switch {
self.isAimFov = (Switch.isOn)?true:false;
if (Switch.isOn) {
[AimFovS setStrokeColor:[UIColor colorWithRed: 1.00 green:0.00 blue: 0.00 alpha: 0.5].CGColor];
} else {
[AimFovS setStrokeColor:[UIColor clearColor].CGColor];
}
}

- (void)Autofire:(UISwitch *)Switch {
self.isBigx = (Switch.isOn)?true:false;
}
- (void)isArrow:(UISwitch *)Switch {
self.isArrow = (Switch.isOn)?true:false;
}
- (void)isNorecoil:(UISwitch *)Switch {
self.isNorecoil = (Switch.isOn)?true:false;
}
- (void)NoSpread:(UISwitch *)Switch {
self.NoSpread = (Switch.isOn)?true:false;
}
- (void)instahit:(UISwitch *)Switch {
self.isInstanthit = (Switch.isOn)?true:false;
}
- (void)speedfire:(UISwitch *)Switch {
self.SpeedFire = (Switch.isOn)?true:false;
}
- (void)fastswitch:(UISwitch *)Switch {
self.FastSwitchWeapon = (Switch.isOn)?true:false;
}
- (void)speedpl:(UISwitch *)Switch {
self.speedp = (Switch.isOn)?true:false;
}
- (void)aimbotRadius:(UISlider *)Slider {
float Val = Slider.value;
self.aimbotRadius = Val;
[AimFOV SetSlider:[NSString stringWithFormat:@"AimFov:%.1f", Val] Max:400 Min:30];
[AimFovS setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake([UIScreen mainScreen].bounds.size.width/2-Val*2/2 , [UIScreen mainScreen].bounds.size.height/2-Val*2/2, Val*2, Val*2)] CGPath]];
}

- (void)AutoDis:(UISlider *)Slider {
float Val = Slider.value;
self.AutoDis = Val;
[AutoDis SetSlider:[NSString stringWithFormat:@"Auto-Dis:%f", Val] Max:400 Min:10];
}

- (void)AimPart:(UISegmentedControl *)Select {
if (Select.selectedSegmentIndex == 0) {
self.aimbotPart = 6;
} else if (Select.selectedSegmentIndex == 1) {
self.aimbotPart = 5;
} else if (Select.selectedSegmentIndex == 2) {
self.aimbotPart = 4;
}
}
- (void)rePart:(UISegmentedControl *)Select {
if (Select.selectedSegmentIndex == 0) {
self.rcontrol = 10;
} else if (Select.selectedSegmentIndex == 1) {
self.rcontrol = 20;
} else if (Select.selectedSegmentIndex == 2) {
self.rcontrol = 40;
}
}
- (void)enlung:(UISegmentedControl *)Select {
if (Select.selectedSegmentIndex == 0) {
draw.text = @"ESP";
line.text = @"LINES";
bone.text = @"SKELTON";
info.text = @"TEXT";
box.text = @"BOX-3D";
arrow.text = @"ALERT'S";
aimbot.text = @"Aim-bot";
aimbotscope.text = @"Aimbot-Scope";
aimnotk.text = @"NO-Knocked";
aimnoia.text = @"NO-isAI";
aimfov.text = @"Fov";
bigx.text = @"EffectX";
norecoil.text = @"StableGun";
nospread.text = @"NoSpread";
instahit.text = @"instahit";
speedfire.text = @"Speed-Fire";
    speedpla.text = @"Speed-Prone";
fastsw.text = @"Fast-SwitchWeapon";
drawloot.text = @"ITEMS";
car.text = @"CAR";
weapon.text = @"GUNS";
armor.text = @"ARMOR";
scop.text = @"SCOPE";
drug.text = @"HEALTH";
bullet.text = @"AMMO";
alert.text = @"Grenead-ALERT!";
hide.text = @"Hide-Hack";
reset.text = @"Reset-Guest";
//[buttonESP setTitle:@"AIMBOT" forState:UIControlStateNormal];
//[buttonMEMORY setTitle:@"Matirials" forState:UIControlStateNormal];
//[buttonLogin setTitle:@"ESP" forState:UIControlStateNormal];
//[buttonMORE setTitle:@"MORE" forState:UIControlStateNormal];
} else if (Select.selectedSegmentIndex == 1) {
draw.text = @"رسم";
line.text = @"خطوط";
bone.text = @"هيكل";
info.text = @"معلومات";
box.text = @"صندوق";
arrow.text = @"أسهم";
aimbot.text = @"أيمبوت";
aimbotscope.text = @"أيمبوت سكوب";
aimnotk.text = @"تجاهل النوك";
aimnoia.text = @"تجاهل البوت";
aimfov.text = @"دائرة الأيمبوت";
bigx.text = @"تأثير دمج";
norecoil.text = @"ثبات";
nospread.text = @"عدم تناثر";
    instahit.text = @"طلقة سريعة";
    speedfire.text = @"رمي سريع";
    fastsw.text = @"تبديل سلاح سريع";
    speedpla.text = @"زحف سريع";
drawloot.text = @"كشف عناصر";
car.text = @"سيارات";
weapon.text = @"أسلحة";
armor.text = @"دروع";
scop.text = @"سكوب";
drug.text = @"أدوية";
bullet.text = @"ذخيرة";
alert.text = @"تحذير قنابل";
hide.text = @"وضع الستريم";
reset.text = @"ترسيت القيست";
//[buttonESP setTitle:@"الأيمبوت" forState:UIControlStateNormal];
//[buttonMEMORY setTitle:@"العناصر" forState:UIControlStateNormal];
//[buttonLogin setTitle:@"الكشف" forState:UIControlStateNormal];
//[buttonMORE setTitle:@"أكثر" forState:UIControlStateNormal];
}
}
- (void)isShowProps:(UISwitch *)Switch {
self.isShowProps = (Switch.isOn)?true:false;
self.BoxWith = (Switch.isOn)?true:false;
self.BPc = (Switch.isOn)?true:false;
}

- (void)isLootCar:(UISwitch *)Switch {
self.isShowPropsVehicle = (Switch.isOn)?true:false;
// [self ClearData];
}

- (void)isLootWeapon:(UISwitch *)Switch {
self.isShowPropsWeapon = (Switch.isOn)?true:false;
// self.BoxWith = (Switch.isOn)?true:false;
// self.BPc = (Switch.isOn)?true:false;
// [self ClearData];
}

- (void)isLootArmor:(UISwitch *)Switch {
self.isShowPropsArmor = (Switch.isOn)?true:false;
}

- (void)isLootScope:(UISwitch *)Switch {
self.isShowPropsSight = (Switch.isOn)?true:false;
}

- (void)isLootDrug:(UISwitch *)Switch {
self.isShowPropsDrug = (Switch.isOn)?true:false;
}

- (void)isLootBullet:(UISwitch *)Switch {
self.isShowPropsBullet = (Switch.isOn)?true:false;
// [self ClearData];
}

- (void)isLootGrenade:(UISwitch *)Switch {
self.isShowPropsEarlyWarning = (Switch.isOn)?true:false;
}

- (void)propsDistance:(UISlider *)Slider {
float Val = Slider.value;
self.propsDistance = Val;
[LootDis SetSlider:[NSString stringWithFormat:@"DISTANCE :%f", Val] Max:500 Min:100];
}

- (void)isHideHack:(UISwitch *)Switch {
[[Fucking getInstance] SetHideHack:Switch];
if(Switch.isOn){
    hide1 = [[HeeeNoScreenShotView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    hide1.userInteractionEnabled = true;
    [MainWindow addSubview:hide1];

    [self.NumberLabel removeFromSuperview];
    [self.Alert removeFromSuperview];
    [menuView removeFromSuperview];
    // [self.Open removeFromSuperview];
    [Ttime removeFromSuperview];

    [hide1 addSubview:self.NumberLabel];
    [hide1 addSubview:self.Alert];
    [hide1 addSubview:menuView];
    // [hide1 addSubview:self.Open];
    [hide1 addSubview:Ttime];

}
else{
    [self.NumberLabel removeFromSuperview];
    [self.Alert removeFromSuperview];
    [menuView removeFromSuperview];
    // [self.Open removeFromSuperview];
    [Ttime removeFromSuperview];

    [self addSubview:self.NumberLabel];
    [self addSubview:self.Alert];
    [MainWindow addSubview:menuView];
    // [MainWindow addSubview:self.Open];
    [MainWindow addSubview:Ttime];
}
}

- (void)isGuestReset:(UISwitch *)Switch {
NSArray *SecItemClasses = @[(__bridge id)kSecClassGenericPassword, (__bridge id)kSecClassInternetPassword, (__bridge id)kSecClassCertificate, (__bridge id)kSecClassKey, (__bridge id)kSecClassIdentity];
for (id SecItemClass in SecItemClasses) {
NSDictionary *Spec = @{(__bridge id)kSecClass: SecItemClass};
SecItemDelete((__bridge CFDictionaryRef)Spec);
}
exit(0);
}

- (void)OpenMenu {
    menuView.hidden = NO;
hide1.userInteractionEnabled = true;

// [UIView animateWithDuration:0.3 animations:^ {
// self.Open.alpha = 0.0f;
// BackWindow.alpha = 1.0f;
// hide1.userInteractionEnabled = true;
// }];
}

- (void)CloseMenu {
    menuView.hidden = YES;
hide1.userInteractionEnabled = false;

// [UIView animateWithDuration:0.3 animations:^ {
// BackWindow.alpha = 0.0f;
// self.Open.alpha = 1.0f;
// hide1.userInteractionEnabled = false;
// }];
}

- (void)ClearData {
for (NSInteger i = 0; i < 70; i++) {
fwnameteamdis[i].hidden = YES;
TheDrawLoot[i].hidden = YES;
}
}

- (void)Draw {
_Alert.text = @"";
[self DrawOverlay];
}

- (void)DrawOverlay {

UIBezierPath *ShowLines = [UIBezierPath bezierPath];
UIBezierPath *BoneGreen = [UIBezierPath bezierPath];
UIBezierPath *BoneRed = [UIBezierPath bezierPath];
UIBezierPath *Boneyellow = [UIBezierPath bezierPath];
UIBezierPath *BotWhite = [UIBezierPath bezierPath];
UIBezierPath *BotGray = [UIBezierPath bezierPath];
//NSInteger rjsl =0;

int HowDrawText = 0;
for (NSInteger i = 0; i < [[Fucking getInstance].playerList count]; i++) {
JFPlayer *player = [[Fucking getInstance].playerList objectAtIndex:i];
    if (player.isDead || player.type == PlayerTypeTeam) {
continue;
}
HowDrawText++;

CGFloat HeadY = player.boneData.head.Y;
CGFloat HeadX = player.boneData.head.X;
CGFloat Y = player.Box3D.s6.Y;
//CGFloat X = player.Box3D.s6.X;
if (self.isBoneEsp) {
if (player.isAI){

UIBezierPath *Bone = (player.boneVisibleData.head)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.head.X, player.boneData.head.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
Bone = (player.boneVisibleData.chest)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.pelvis.X, player.boneData.pelvis.Y)];
Bone = (player.boneVisibleData.chest)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftShoulder.X, player.boneData.leftShoulder.Y)];
Bone = (player.boneVisibleData.chest)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightShoulder.X, player.boneData.rightShoulder.Y)];
Bone = (player.boneVisibleData.leftShoulder)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.leftShoulder.X, player.boneData.leftShoulder.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftElbow.X, player.boneData.leftElbow.Y)];
Bone = (player.boneVisibleData.rightShoulder)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.rightShoulder.X, player.boneData.rightShoulder.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightElbow.X, player.boneData.rightElbow.Y)];
Bone = (player.boneVisibleData.pelvis)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.pelvis.X, player.boneData.pelvis.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftThigh.X, player.boneData.leftThigh.Y)];
Bone = (player.boneVisibleData.pelvis)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.pelvis.X, player.boneData.pelvis.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightThigh.X, player.boneData.rightThigh.Y)];
Bone = (player.boneVisibleData.leftElbow)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.leftElbow.X, player.boneData.leftElbow.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftHand.X, player.boneData.leftHand.Y)];
Bone = (player.boneVisibleData.rightElbow)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.rightElbow.X, player.boneData.rightElbow.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightHand.X, player.boneData.rightHand.Y)];
Bone = (player.boneVisibleData.leftThigh)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.leftThigh.X, player.boneData.leftThigh.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftKnee.X, player.boneData.leftKnee.Y)];
Bone = (player.boneVisibleData.rightThigh)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.rightThigh.X, player.boneData.rightThigh.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightKnee.X, player.boneData.rightKnee.Y)];
Bone = (player.boneVisibleData.leftKnee)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.leftKnee.X, player.boneData.leftKnee.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftFoot.X, player.boneData.leftFoot.Y)];
Bone = (player.boneVisibleData.rightKnee)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.boneData.rightKnee.X, player.boneData.rightKnee.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightFoot.X, player.boneData.rightFoot.Y)];
}else{
    if (player.hp == 0){
        UIBezierPath *Bone = (player.boneVisibleData.head)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.head.X, player.boneData.head.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
        Bone = (player.boneVisibleData.chest)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.pelvis.X, player.boneData.pelvis.Y)];
        Bone = (player.boneVisibleData.chest)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.leftShoulder.X, player.boneData.leftShoulder.Y)];
        Bone = (player.boneVisibleData.chest)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.rightShoulder.X, player.boneData.rightShoulder.Y)];
        Bone = (player.boneVisibleData.leftShoulder)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.leftShoulder.X, player.boneData.leftShoulder.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.leftElbow.X, player.boneData.leftElbow.Y)];
        Bone = (player.boneVisibleData.rightShoulder)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.rightShoulder.X, player.boneData.rightShoulder.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.rightElbow.X, player.boneData.rightElbow.Y)];
        Bone = (player.boneVisibleData.pelvis)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.pelvis.X, player.boneData.pelvis.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.leftThigh.X, player.boneData.leftThigh.Y)];
        Bone = (player.boneVisibleData.pelvis)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.pelvis.X, player.boneData.pelvis.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.rightThigh.X, player.boneData.rightThigh.Y)];
        Bone = (player.boneVisibleData.leftElbow)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.leftElbow.X, player.boneData.leftElbow.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.leftHand.X, player.boneData.leftHand.Y)];
        Bone = (player.boneVisibleData.rightElbow)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.rightElbow.X, player.boneData.rightElbow.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.rightHand.X, player.boneData.rightHand.Y)];
        Bone = (player.boneVisibleData.leftThigh)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.leftThigh.X, player.boneData.leftThigh.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.leftKnee.X, player.boneData.leftKnee.Y)];
        Bone = (player.boneVisibleData.rightThigh)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.rightThigh.X, player.boneData.rightThigh.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.rightKnee.X, player.boneData.rightKnee.Y)];
        Bone = (player.boneVisibleData.leftKnee)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.leftKnee.X, player.boneData.leftKnee.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.leftFoot.X, player.boneData.leftFoot.Y)];
        Bone = (player.boneVisibleData.rightKnee)?Boneyellow:BoneRed;
        [Bone moveToPoint:CGPointMake(player.boneData.rightKnee.X, player.boneData.rightKnee.Y)];
        [Bone addLineToPoint:CGPointMake(player.boneData.rightFoot.X, player.boneData.rightFoot.Y)];
    }else{
UIBezierPath *Bone = (player.boneVisibleData.head)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.head.X, player.boneData.head.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
Bone = (player.boneVisibleData.chest)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.pelvis.X, player.boneData.pelvis.Y)];
Bone = (player.boneVisibleData.chest)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftShoulder.X, player.boneData.leftShoulder.Y)];
Bone = (player.boneVisibleData.chest)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.chest.X, player.boneData.chest.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightShoulder.X, player.boneData.rightShoulder.Y)];
Bone = (player.boneVisibleData.leftShoulder)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.leftShoulder.X, player.boneData.leftShoulder.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftElbow.X, player.boneData.leftElbow.Y)];
Bone = (player.boneVisibleData.rightShoulder)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.rightShoulder.X, player.boneData.rightShoulder.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightElbow.X, player.boneData.rightElbow.Y)];
Bone = (player.boneVisibleData.pelvis)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.pelvis.X, player.boneData.pelvis.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftThigh.X, player.boneData.leftThigh.Y)];
Bone = (player.boneVisibleData.pelvis)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.pelvis.X, player.boneData.pelvis.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightThigh.X, player.boneData.rightThigh.Y)];
Bone = (player.boneVisibleData.leftElbow)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.leftElbow.X, player.boneData.leftElbow.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftHand.X, player.boneData.leftHand.Y)];
Bone = (player.boneVisibleData.rightElbow)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.rightElbow.X, player.boneData.rightElbow.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightHand.X, player.boneData.rightHand.Y)];
Bone = (player.boneVisibleData.leftThigh)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.leftThigh.X, player.boneData.leftThigh.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftKnee.X, player.boneData.leftKnee.Y)];
Bone = (player.boneVisibleData.rightThigh)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.rightThigh.X, player.boneData.rightThigh.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightKnee.X, player.boneData.rightKnee.Y)];
Bone = (player.boneVisibleData.leftKnee)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.leftKnee.X, player.boneData.leftKnee.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.leftFoot.X, player.boneData.leftFoot.Y)];
Bone = (player.boneVisibleData.rightKnee)?BoneGreen:BoneRed;
[Bone moveToPoint:CGPointMake(player.boneData.rightKnee.X, player.boneData.rightKnee.Y)];
[Bone addLineToPoint:CGPointMake(player.boneData.rightFoot.X, player.boneData.rightFoot.Y)];
    }}
//UIBezierPath *Bone = (player.boneVisibleData.head)?BoneGreen:BoneRed;


if (self.isBoxEsp) {
// 3DBox
if (player.isAI){
    
UIBezierPath *Bone = (player.boneVisibleData.head)?BotWhite:BotGray;
Bone = (player.isVisible)?BotWhite:BotGray;
[Bone moveToPoint:CGPointMake(player.Box3D.s1.X, player.Box3D.s1.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s2.X, player.Box3D.s2.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s2.X, player.Box3D.s2.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s3.X, player.Box3D.s3.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s3.X, player.Box3D.s3.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s4.X, player.Box3D.s4.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s4.X, player.Box3D.s4.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s1.X, player.Box3D.s1.Y)];

[Bone moveToPoint:CGPointMake(player.Box3D.s5.X, player.Box3D.s5.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s6.X, player.Box3D.s6.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s6.X, player.Box3D.s6.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s7.X, player.Box3D.s7.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s7.X, player.Box3D.s7.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s8.X, player.Box3D.s8.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s8.X, player.Box3D.s8.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s5.X, player.Box3D.s5.Y)];

[Bone moveToPoint:CGPointMake(player.Box3D.s1.X, player.Box3D.s1.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s5.X, player.Box3D.s5.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s2.X, player.Box3D.s2.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s6.X, player.Box3D.s6.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s3.X, player.Box3D.s3.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s7.X, player.Box3D.s7.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s4.X, player.Box3D.s4.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s8.X, player.Box3D.s8.Y)];
}else{
    if (player.hp == 0){
        
UIBezierPath *Bone = (player.boneVisibleData.head)?BoneGreen:BoneRed;
Bone = (player.isVisible)?Boneyellow:BoneRed;
[Bone moveToPoint:CGPointMake(player.Box3D.s1.X, player.Box3D.s1.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s2.X, player.Box3D.s2.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s2.X, player.Box3D.s2.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s3.X, player.Box3D.s3.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s3.X, player.Box3D.s3.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s4.X, player.Box3D.s4.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s4.X, player.Box3D.s4.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s1.X, player.Box3D.s1.Y)];

[Bone moveToPoint:CGPointMake(player.Box3D.s5.X, player.Box3D.s5.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s6.X, player.Box3D.s6.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s6.X, player.Box3D.s6.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s7.X, player.Box3D.s7.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s7.X, player.Box3D.s7.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s8.X, player.Box3D.s8.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s8.X, player.Box3D.s8.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s5.X, player.Box3D.s5.Y)];

[Bone moveToPoint:CGPointMake(player.Box3D.s1.X, player.Box3D.s1.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s5.X, player.Box3D.s5.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s2.X, player.Box3D.s2.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s6.X, player.Box3D.s6.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s3.X, player.Box3D.s3.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s7.X, player.Box3D.s7.Y)];
[Bone moveToPoint:CGPointMake(player.Box3D.s4.X, player.Box3D.s4.Y)];
[Bone addLineToPoint:CGPointMake(player.Box3D.s8.X, player.Box3D.s8.Y)];
    }else{
        UIBezierPath *Bone = (player.boneVisibleData.head)?BoneGreen:BoneRed;
        Bone = (player.isVisible)?BoneGreen:BoneRed;
        [Bone moveToPoint:CGPointMake(player.Box3D.s1.X, player.Box3D.s1.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s2.X, player.Box3D.s2.Y)];
        [Bone moveToPoint:CGPointMake(player.Box3D.s2.X, player.Box3D.s2.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s3.X, player.Box3D.s3.Y)];
        [Bone moveToPoint:CGPointMake(player.Box3D.s3.X, player.Box3D.s3.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s4.X, player.Box3D.s4.Y)];
        [Bone moveToPoint:CGPointMake(player.Box3D.s4.X, player.Box3D.s4.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s1.X, player.Box3D.s1.Y)];

        [Bone moveToPoint:CGPointMake(player.Box3D.s5.X, player.Box3D.s5.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s6.X, player.Box3D.s6.Y)];
        [Bone moveToPoint:CGPointMake(player.Box3D.s6.X, player.Box3D.s6.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s7.X, player.Box3D.s7.Y)];
        [Bone moveToPoint:CGPointMake(player.Box3D.s7.X, player.Box3D.s7.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s8.X, player.Box3D.s8.Y)];
        [Bone moveToPoint:CGPointMake(player.Box3D.s8.X, player.Box3D.s8.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s5.X, player.Box3D.s5.Y)];

        [Bone moveToPoint:CGPointMake(player.Box3D.s1.X, player.Box3D.s1.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s5.X, player.Box3D.s5.Y)];
        [Bone moveToPoint:CGPointMake(player.Box3D.s2.X, player.Box3D.s2.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s6.X, player.Box3D.s6.Y)];
        [Bone moveToPoint:CGPointMake(player.Box3D.s3.X, player.Box3D.s3.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s7.X, player.Box3D.s7.Y)];
        [Bone moveToPoint:CGPointMake(player.Box3D.s4.X, player.Box3D.s4.Y)];
        [Bone addLineToPoint:CGPointMake(player.Box3D.s8.X, player.Box3D.s8.Y)];
    }
}
}

}
if (self.isArrow) {
if (!(HeadX > 0 && HeadX - 75 < SCREEN_WIDTH && HeadY > 0 && HeadY < SCREEN_HEIGHT)) {
if(player.isAI){
UIBezierPath *Bone = (player.isVisible)?BotWhite:BotGray;
[Bone moveToPoint:player.Arrow.s1];
[Bone addLineToPoint:player.Arrow.s2];
[Bone moveToPoint:player.Arrow.s2];
[Bone addLineToPoint:player.Arrow.s3];
[Bone moveToPoint:player.Arrow.s3];
[Bone addLineToPoint:player.Arrow.s1];
}else{
UIBezierPath *Bone = (player.isVisible)?BoneGreen:BoneRed;
[Bone moveToPoint:player.Arrow.s1];
[Bone addLineToPoint:player.Arrow.s2];
[Bone moveToPoint:player.Arrow.s2];
[Bone addLineToPoint:player.Arrow.s3];
[Bone moveToPoint:player.Arrow.s3];
[Bone addLineToPoint:player.Arrow.s1];
}
}
}
if (self.isLineEsp) {
[ShowLines moveToPoint:CGPointMake(SCREEN_WIDTH*0.5, 0)];
[ShowLines addLineToPoint:CGPointMake(HeadX, HeadY - 38)];
}

if (self.isTextEsp) {
if (player.isAI == 1) {
fwnameteamdis[i].name = [NSString stringWithFormat:@"BOT"];
fwnameteamdis[i].dis = player.distance;
fwnameteamdis[i].xue = player.hp;
fwnameteamdis[i].team = player.teamNo;
fwnameteamdis[i].state=player.state;
fwnameteamdis[i].isFlag = player.flag;
fwnameteamdis[i].idpl=player.idpl;
//fwnameteamdis[i].curammo=player.curammo;
fwnameteamdis[i].isArms=player.isArm;
fwnameteamdis[i].frame = CGRectMake(HeadX-50,Y-37,80,24);
fwnameteamdis[i].hidden=NO;



}else if(player.isAI == 0){
    fwnameteamdis[i].name = player.name;
    fwnameteamdis[i].dis = player.distance;
    fwnameteamdis[i].xue = player.hp;
    fwnameteamdis[i].team = player.teamNo;
    fwnameteamdis[i].state=player.state;
    fwnameteamdis[i].isFlag = player.flag;
    fwnameteamdis[i].idpl=player.idpl;
    //fwnameteamdis[i].curammo=player.curammo;
    fwnameteamdis[i].isArms=player.isArm;
fwnameteamdis[i].frame = CGRectMake(HeadX-50,Y-37,80,24);
fwnameteamdis[i].hidden=NO;


}

if(HeadX<0||HeadX>SCREEN_WIDTH)fwnameteamdis[i].hidden = YES;
if(HeadY<0||HeadY>SCREEN_HEIGHT)fwnameteamdis[i].hidden = YES;
}
}

if (self.isStartTimer) {
_NumberLabel.text = [NSString stringWithFormat:@"ENEMIES [ %d ]", HowDrawText];
} else {
_NumberLabel.text = @"";
}

for (NSInteger i = 0; i < [[Fucking getInstance].propsList count]; i++) {
JFProps *props = [[Fucking getInstance].propsList objectAtIndex:i];

if (!(props.screenPos.X - 75 > 0 && props.screenPos.X - 75 < SCREEN_WIDTH && props.screenPos.Y > 0 && props.screenPos.Y < SCREEN_HEIGHT)) continue;

if(props.screenPos.X<0||props.screenPos.X>SCREEN_WIDTH)TheDrawLoot[i].hidden = YES;

if(props.screenPos.Y<0||props.screenPos.Y>SCREEN_HEIGHT)TheDrawLoot[i].hidden = YES;

if (props.type == PropsTypeWeapon && self.isShowPropsWeapon) {
[TheDrawLoot[i] SetNameDis:[NSString stringWithFormat:@"[%s %dM]", props.name.c_str(), props.distance] Color:[UIColor redColor] Point:CGPointMake(props.screenPos.X - 75, props.screenPos.Y)];
TheDrawLoot[i].hidden = NO;
}

if (props.type == Flaregun && self.Pistol) {
[TheDrawLoot[i] SetNameDis:[NSString stringWithFormat:@"[%s %dM]", props.name.c_str(), props.distance] Color:[UIColor whiteColor] Point:CGPointMake(props.screenPos.X - 75, props.screenPos.Y)];
TheDrawLoot[i].hidden = NO;
}

if (props.type == PropsTypeArmor && self.isShowPropsArmor) {
[TheDrawLoot[i] SetNameDis:[NSString stringWithFormat:@"[%s %dM]", props.name.c_str(), props.distance] Color:[UIColor greenColor] Point:CGPointMake(props.screenPos.X - 75, props.screenPos.Y)];
TheDrawLoot[i].hidden = NO;
}

if (props.type == PropsTypeSight && self.isShowPropsSight) {
[TheDrawLoot[i] SetNameDis:[NSString stringWithFormat:@"[%s %dM]", props.name.c_str(), props.distance] Color:[UIColor yellowColor] Point:CGPointMake(props.screenPos.X - 75, props.screenPos.Y)];
TheDrawLoot[i].hidden = NO;
}

if (props.type == PropsTypeBullet && self.isShowPropsBullet) {
[TheDrawLoot[i] SetNameDis:[NSString stringWithFormat:@"[%s %dM]", props.name.c_str(), props.distance] Color:[UIColor brownColor] Point:CGPointMake(props.screenPos.X - 75, props.screenPos.Y)];
TheDrawLoot[i].hidden = NO;
}

if (props.type == PropsTypeDrug && self.isShowPropsDrug) {
[TheDrawLoot[i] SetNameDis:[NSString stringWithFormat:@"[%s %dM]", props.name.c_str(), props.distance] Color:[UIColor greenColor] Point:CGPointMake(props.screenPos.X - 75, props.screenPos.Y)];
TheDrawLoot[i].hidden = NO;
}

if (props.type == PickUpListWrapperActor && self.BoxWith) {
[TheDrawLoot[i] SetNameDis:[NSString stringWithFormat:@"[%s %dM]", props.name.c_str(), props.distance] Color:[UIColor orangeColor] Point:CGPointMake(props.screenPos.X - 75, props.screenPos.Y)];
TheDrawLoot[i].hidden = NO;
}

if (props.type == AirDropBox && self.BPc) {
[TheDrawLoot[i] SetNameDis:[NSString stringWithFormat:@"[%s %dM]", props.name.c_str(), props.distance] Color:[UIColor blueColor] Point:CGPointMake(props.screenPos.X - 75, props.screenPos.Y)];
TheDrawLoot[i].hidden = NO;
}

if (props.type == PropsTypeVehicle && self.isShowPropsVehicle) {
[TheDrawLoot[i] SetNameDis:[NSString stringWithFormat:@"[%s %dM]", props.name.c_str(), props.distance] Color:[UIColor whiteColor] Point:CGPointMake(props.screenPos.X - 75, props.screenPos.Y)];
TheDrawLoot[i].hidden = NO;

UIBezierPath *CarLines = (props.isVisible)?BotWhite:BotGray;
[CarLines moveToPoint:CGPointMake(props.Box3D.s1.X, props.Box3D.s1.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s2.X, props.Box3D.s2.Y)];
[CarLines moveToPoint:CGPointMake(props.Box3D.s2.X, props.Box3D.s2.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s3.X, props.Box3D.s3.Y)];
[CarLines moveToPoint:CGPointMake(props.Box3D.s3.X, props.Box3D.s3.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s4.X, props.Box3D.s4.Y)];
[CarLines moveToPoint:CGPointMake(props.Box3D.s4.X, props.Box3D.s4.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s1.X, props.Box3D.s1.Y)];

[CarLines moveToPoint:CGPointMake(props.Box3D.s5.X, props.Box3D.s5.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s6.X, props.Box3D.s6.Y)];
[CarLines moveToPoint:CGPointMake(props.Box3D.s6.X, props.Box3D.s6.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s7.X, props.Box3D.s7.Y)];
[CarLines moveToPoint:CGPointMake(props.Box3D.s7.X, props.Box3D.s7.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s8.X, props.Box3D.s8.Y)];
[CarLines moveToPoint:CGPointMake(props.Box3D.s8.X, props.Box3D.s8.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s5.X, props.Box3D.s5.Y)];

[CarLines moveToPoint:CGPointMake(props.Box3D.s1.X, props.Box3D.s1.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s5.X, props.Box3D.s5.Y)];
[CarLines moveToPoint:CGPointMake(props.Box3D.s2.X, props.Box3D.s2.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s6.X, props.Box3D.s6.Y)];
[CarLines moveToPoint:CGPointMake(props.Box3D.s3.X, props.Box3D.s3.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s7.X, props.Box3D.s7.Y)];
[CarLines moveToPoint:CGPointMake(props.Box3D.s4.X, props.Box3D.s4.Y)];
[CarLines addLineToPoint:CGPointMake(props.Box3D.s8.X, props.Box3D.s8.Y)];
}

if (props.type == PropsTypeEarlyWarning && self.isShowPropsEarlyWarning) {
[TheDrawLoot[i] SetNameDis:[NSString stringWithFormat:@"[%s %dM]", props.name.c_str(), props.distance] Color:[UIColor redColor] Point:CGPointMake(props.screenPos.X - 75, props.screenPos.Y)];
TheDrawLoot[i].hidden = NO;
if (props.distance <= 15) {
_Alert.text = [NSString stringWithFormat:@"[%s in %dM]", props.name.c_str(), props.distance];
}
}
}
self.TheLineLayer.path = ShowLines.CGPath;

if (![self.layer.sublayers containsObject:self.TheBoneGreenLayer]) [self.layer addSublayer:self.TheBoneGreenLayer];
self.TheBoneGreenLayer.frame = self.bounds;
self.TheBoneGreenLayer.path = BoneGreen.CGPath;

if (![self.layer.sublayers containsObject:self.TheBoneRedLayer]) [self.layer addSublayer:self.TheBoneRedLayer];
self.TheBoneRedLayer.frame = self.bounds;
self.TheBoneRedLayer.path = BoneRed.CGPath;
    
    if (![self.layer.sublayers containsObject:self.TheBoneyellowLayer]) [self.layer addSublayer:self.TheBoneyellowLayer];
    self.TheBoneyellowLayer.frame = self.bounds;
    self.TheBoneyellowLayer.path = Boneyellow.CGPath;

if (![self.layer.sublayers containsObject:self.TheBotWhiteLayer]) [self.layer addSublayer:self.TheBotWhiteLayer];
self.TheBotWhiteLayer.frame = self.bounds;
self.TheBotWhiteLayer.path = BotWhite.CGPath;

if (![self.layer.sublayers containsObject:self.TheBotGrayLayer]) [self.layer addSublayer:self.TheBotGrayLayer];
self.TheBotGrayLayer.frame = self.bounds;
self.TheBotGrayLayer.path = BotGray.CGPath;

// if(HowDrawText==0)[self ClearData];

}

- (UILabel *)NumberLabel {
if (!_NumberLabel) {
UILabel *Label = [[UILabel alloc] init];
Label.frame = CGRectMake(SCREEN_WIDTH/2-SCREEN_WIDTH/2, 25, SCREEN_WIDTH, 70);
Label.text = @"";
Label.textColor = [UIColor redColor];
Label.textAlignment = NSTextAlignmentCenter;
Label.font = [UIFont boldSystemFontOfSize:18];
_NumberLabel = Label;
}
return _NumberLabel;
}

- (UILabel *)Alert {
if (!_Alert) {
UILabel *Label = [[UILabel alloc] init];
Label.frame = CGRectMake(SCREEN_WIDTH/2-SCREEN_WIDTH/2, SCREEN_HEIGHT/3.5, SCREEN_WIDTH, 100);
Label.text = @"";
Label.textColor = [UIColor redColor];
Label.textAlignment = NSTextAlignmentCenter;
Label.font = [UIFont boldSystemFontOfSize:35];
_Alert = Label;
}
return _Alert;
}

- (CAShapeLayer *)TheLineLayer {
if (!_TheLineLayer) {
CAShapeLayer *ShapeLayer = [CAShapeLayer layer];
ShapeLayer.frame = self.bounds;
ShapeLayer.strokeColor = [UIColor whiteColor].CGColor;
ShapeLayer.fillColor = [UIColor whiteColor].CGColor;
ShapeLayer.lineWidth = 0.4;
_TheLineLayer = ShapeLayer;
}
return _TheLineLayer;
}

- (CAShapeLayer *)TheBoneGreenLayer  {
if (!_TheBoneGreenLayer) {
CAShapeLayer *ShapeLayer = [CAShapeLayer layer];
ShapeLayer.frame = self.bounds;
ShapeLayer.strokeColor = [UIColor greenColor].CGColor;
ShapeLayer.fillColor = [UIColor greenColor].CGColor;
ShapeLayer.lineWidth = 1;
_TheBoneGreenLayer = ShapeLayer;
}
return _TheBoneGreenLayer;
}

- (CAShapeLayer *)TheBoneRedLayer {
if (!_TheBoneRedLayer) {
CAShapeLayer *ShapeLayer = [CAShapeLayer layer];
ShapeLayer.frame = self.bounds;
ShapeLayer.strokeColor = [UIColor redColor].CGColor;
ShapeLayer.fillColor = [UIColor redColor].CGColor;
ShapeLayer.lineWidth = 1;
_TheBoneRedLayer = ShapeLayer;
}
return _TheBoneRedLayer;
}
- (CAShapeLayer *)TheBoneyellowLayer {
if (!_TheBoneyellowLayer) {
CAShapeLayer *ShapeLayer = [CAShapeLayer layer];
ShapeLayer.frame = self.bounds;
ShapeLayer.strokeColor = [UIColor orangeColor].CGColor;
ShapeLayer.fillColor = [UIColor orangeColor].CGColor;
ShapeLayer.lineWidth = 1;
_TheBoneyellowLayer = ShapeLayer;
}
    return _TheBoneyellowLayer;
}
- (CAShapeLayer *)TheBotWhiteLayer  {
if (!_TheBotWhiteLayer) {
CAShapeLayer *ShapeLayer = [CAShapeLayer layer];
ShapeLayer.frame = self.bounds;
ShapeLayer.strokeColor = [UIColor whiteColor].CGColor;
ShapeLayer.fillColor = [UIColor whiteColor].CGColor;
ShapeLayer.lineWidth = 1;
_TheBotWhiteLayer = ShapeLayer;
}
return _TheBotWhiteLayer;
}

- (CAShapeLayer *)TheBotGrayLayer {
if (!_TheBotGrayLayer) {
CAShapeLayer *ShapeLayer = [CAShapeLayer layer];
ShapeLayer.frame = self.bounds;
    ShapeLayer.strokeColor = [UIColor colorWithRed: 0.90 green: 0.90 blue: 0.90 alpha: 0.80].CGColor;
ShapeLayer.fillColor = [UIColor colorWithRed: 0.90 green: 0.90 blue: 0.90 alpha: 0.80].CGColor;
ShapeLayer.lineWidth = 1;
_TheBotGrayLayer = ShapeLayer;
}
return _TheBotGrayLayer;
}

@end
