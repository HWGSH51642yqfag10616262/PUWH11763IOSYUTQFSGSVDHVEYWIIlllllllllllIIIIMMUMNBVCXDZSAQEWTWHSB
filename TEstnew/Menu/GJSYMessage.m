//messege label edit here
#import "GJSYMessage.h"
#
@interface GJSYMessage()

@end

@implementation GJSYMessage

-(instancetype)initWithFrame:(CGRect)frame
{
self=[super initWithFrame:frame];
if (self) {
_infoBar = [[UIView alloc] initWithFrame:CGRectMake(0, -10, 100, 20)];
    _infoBar.backgroundColor = [UIColor colorWithRed: 0.44 green: 0.00 blue: 0.00 alpha: 0.60];
_infoBar.layer.masksToBounds=YES;
    _infoBar.layer.borderWidth = 1.0f;
    _infoBar.layer.cornerRadius = 5;
    _infoBar.layer.borderColor = [UIColor whiteColor].CGColor;
    _infoBar.transform = CGAffineTransformMakeScale(1.0, 1.0);
[self addSubview:_infoBar];


    _xueBar = [[UIView alloc] initWithFrame:CGRectMake(0, 22, 100, 2)];
_xueBar.backgroundColor = [UIColor greenColor];
_xueBar.layer.masksToBounds = true;
    _xueBar.transform = CGAffineTransformMakeScale(1.0, 1.0);
[_infoBar addSubview:_xueBar];



    _teamLb = [[UILabel alloc]initWithFrame:CGRectMake(5, -3, 30, 15)];;
_teamLb.textAlignment=NSTextAlignmentLeft;
    _teamLb.textColor = [UIColor colorWithRed: 0.88 green: 0.73 blue: 0.20 alpha: 1.00];
_teamLb.layer.cornerRadius = 1;
_teamLb.layer.masksToBounds = true;
_teamLb.font = [UIFont fontWithName:@"GillSans-Bold" size:6];
[_infoBar addSubview:_teamLb];

    _flagLb = [[UILabel alloc]initWithFrame:CGRectMake(5, 2.5, 30, 15)];
_flagLb.textAlignment=NSTextAlignmentLeft;
_flagLb.textColor = [UIColor blackColor];
_flagLb.font = [UIFont boldSystemFontOfSize:7];
_flagLb.layer.cornerRadius = 0;
_flagLb.layer.masksToBounds = true;
_flagLb.adjustsFontSizeToFitWidth = true;
_flagLb.backgroundColor = UIColor.clearColor;
[_infoBar addSubview:_flagLb];


    _stateLb = [[UILabel alloc]initWithFrame:CGRectMake(2, 1, 60, 24)];
_stateLb.textAlignment=NSTextAlignmentLeft;
_stateLb.textColor = [UIColor whiteColor];
_stateLb.layer.cornerRadius = 0;
_stateLb.layer.masksToBounds = true;
_stateLb.adjustsFontSizeToFitWidth = true;
_stateLb.font = [UIFont fontWithName:@"GillSans-Bold" size:5];
[_infoBar addSubview:_stateLb];



_nameLb = [[UILabel alloc]initWithFrame:CGRectMake(15, -1, 70, 20)];
_nameLb.textColor = [UIColor whiteColor];
_nameLb.textAlignment=NSTextAlignmentCenter;
_nameLb.adjustsFontSizeToFitWidth = true;
_nameLb.backgroundColor = [UIColor clearColor];
    _nameLb.font = [UIFont fontWithName:@"GillSans-Bold" size:8];
[_infoBar addSubview:_nameLb];



          _disLb = [[UILabel alloc]initWithFrame:CGRectMake(0, -20, 100, 10)];
          _disLb.textAlignment=NSTextAlignmentCenter;
          _disLb.textColor = [UIColor whiteColor];
          _disLb.font = [UIFont boldSystemFontOfSize:7];
          _disLb.backgroundColor = [UIColor clearColor];
          _disLb.adjustsFontSizeToFitWidth = true;
          [self addSubview:_disLb];





_idPlayer = [[UILabel alloc]initWithFrame:CGRectMake(-2, 6, 100, 20)];
_idPlayer.textAlignment=NSTextAlignmentCenter;
    _idPlayer.textColor = [UIColor colorWithRed: 0.88 green: 0.73 blue: 0.20 alpha: 1.00];
    _idPlayer.font = [UIFont fontWithName:@"GillSans-Bold" size:5];
_idPlayer.backgroundColor = [UIColor clearColor];
[_infoBar addSubview:_idPlayer];

_ammo = [[UILabel alloc]initWithFrame:CGRectMake(80, 5, 20, 20)];
_ammo.textAlignment=NSTextAlignmentCenter;
_ammo.textColor = [UIColor whiteColor];
_ammo.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:5];
[_infoBar addSubview:_ammo];


_isarm = [[UILabel alloc]initWithFrame:CGRectMake(-2, 0, 100, 20)];
_isarm.textAlignment=NSTextAlignmentRight;
_isarm.textColor = [UIColor colorWithRed: 0.92 green: 0.71 blue: 0.20 alpha: 1.00];
_isarm.adjustsFontSizeToFitWidth = true;
_isarm.backgroundColor = [UIColor clearColor];
_isarm.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:6];
[_infoBar addSubview:_isarm];

//        _idPlayer.hidden = true;
//        _isarm.hidden = true;
//        _flagLb.hidden = true;
//        _infoBar.hidden = true;
//        _teamLb.hidden = true;


}
return self;
}

#pragma mark----Devloped By IShooter Team
+(instancetype)GJSYMessageWithName:(NSString *) name
xue:(CGFloat) xue
team:(CGFloat)team
dis:(CGFloat) dis
curammo:(CGFloat)curammo
state:(uint64_t)state
isArms:(int)isArms
idpl:(NSString *)idpl
//currevive:(int)currevive

isFlag:(NSString *)isFlag;
{
GJSYMessage *fwnameteamdis = [[GJSYMessage alloc] init];
fwnameteamdis.frame = CGRectMake(0, -13, 100, 30);
fwnameteamdis.layer.masksToBounds=YES;
fwnameteamdis.name=name;
fwnameteamdis.team=team;
fwnameteamdis.dis=dis;
fwnameteamdis.idpl=idpl;
//    fwnameteamdis.currevive=currevive;

fwnameteamdis.isArms=isArms;
fwnameteamdis.state=state;
fwnameteamdis.isFlag=isFlag;
fwnameteamdis.curammo=curammo;


return fwnameteamdis;
}
#pragma mark--给属性重新赋值
//-(void)setCurrevive:(int)currevive
//{
//    _revlb.text = [NSString stringWithFormat:@" rev %d",currevive];
//}
-(void)setIdpl:(NSString *)idpl
{
_idPlayer.text=[NSString stringWithFormat:@"ID:%@",idpl];
}
-(void)setCurammo:(CGFloat)curammo
{
if ((curammo >0)) {

_ammo.text= [NSString stringWithFormat:@"%ld",(long)curammo];
} else {

_ammo.text= @"";
}
}
- (void)setIsArms:(int)isArms
{
_isarm.text =[NSString stringWithFormat:@"%d",isArms];
switch (isArms) {
case 0:
_isarm.text =@"Fist";
break;
case 101001:
_isarm.text =@"AKM";

break;
case 101002:
_isarm.text =@"M16A-4";
break;

case 101003:
_isarm.text =@"SCAR-L";
break;
case 101004:
_isarm.text =@"M416";
break;
case 101005:
_isarm.text =@"Groza";
break;
case 101006:
_isarm.text =@"AUG";
break;
case 101007:
_isarm.text =@"QBZ";
break;
case 101008:
_isarm.text =@"M762";
break;
case 101009:
_isarm.text =@"Mk47";
break;
case 103001:
_isarm.text =@"Kar98k";
break;
case 103002:
_isarm.text =@"M24";
break;
case 103003:
_isarm.text =@"AWM";
break;
case 103004:
_isarm.text =@"SKS";
break;
case 103005:
_isarm.text =@"VSS";
break;
case 103006:
_isarm.text =@"Mini14";
break;
case 103007:
_isarm.text =@"MK-14";
break;
case 103008:
_isarm.text =@"Win94";
break;
case 103009:
_isarm.text =@"SLR";
break;
case 102001:
_isarm.text =@"Uzi";
break;
case 102002:
_isarm.text =@"UMP9";
break;
case 102003:
_isarm.text =@"Vector";
break;
case 102004:
_isarm.text =@"Tommy";
break;
case 102005:
_isarm.text =@"Bison";
break;
case 102007:
_isarm.text =@"MP5K";
break;
case 104001:
_isarm.text =@"S686";
break;
case 104002:
_isarm.text =@"S1897";
break;
case 104003:
_isarm.text =@"S12K";
break;
case 104004:
_isarm.text =@"DBS";
break;
case 104006:
_isarm.text =@"SawedOff";
break;
case 106001:
_isarm.text =@"P92";
break;
case 106002:
_isarm.text =@"P1911";
break;
case 106003:
_isarm.text =@"R1895";
break;
case 106004:
_isarm.text =@"P18C";
break;
case 106005:
_isarm.text =@"R45";
break;
default:
break;
}
}


-(void)setState:(uint64_t)state
{
//    _stateLb.text=[NSString stringWithFormat:@"%llu",state];

switch (state) {
case 8:
_stateLb.text= @"IDLE";

break;
case 9://walking
_stateLb.text= @"WALK";

break;
case 11://running
_stateLb.text= @"RUN";

break;
case 16:
case 17:
case 19://crouch
_stateLb.text= @"CROUCH";

break;
case 32:
case 33:
case 35://snake
_stateLb.text= @"CRAWING";

break;
// Standing Jump
case 72:
case 73:
case 75://jump
_stateLb.text= @"JUMP";

break;
case 96:
_stateLb.text = @"PARMENE";
break;
case 136:
case 137:
case 144:
case 145:
case 160:
case 649:
case 1160:
case 1161:
case 1169:
_stateLb.text = @"SHOOTING";
break;
case 264:
case 272:
case 273:
case 288:
case 265:
case 329://reloading
_stateLb.text= @"RELOADING";

break;
case 520:
case 544:
case 656:
case 521:
case 528://Aiming
_stateLb.text= @"AIMING";
break;
case 2056:
_stateLb.text = @"CHENGE WEAPONE";
break;
case 65552:
case 65544:
_stateLb.text = @"HEALING";

break;

case 4194304:
case 4194305:
case 4194306:
case 4194307: //swim
_stateLb.text= @"SWIM";

break;
case 1680:
case 1672:
case 1673:
case 1544:
case 1545:
case 1033:
case 1032:
_stateLb.text = @"PEEK";

break;
case 262152:
case 262144:
_stateLb.text = @"DEAD";

break;

case 131070:
case 131071:
case 131072:
case 131073:
case 131074:
case 131075://knocked
_stateLb.text= @"knocked";

break;
// In Plane
case 33554440:
case 524296:
case 1048584://driving
_stateLb.text= @"DRIVING";

break;

case 32784://reviving
_stateLb.text= @"REVIVE";

break;

case 16392:
case 16393:
case 16401:
case 16416:
case 16417:
case 16457:
case 16400:
case 17401:
case 17417:
case 17424:
case 17425://Throwing
_stateLb.text= @"THROW";

break;
case 16777224:
_stateLb.text= @"CLIMB";

break;

case 8200://Punching
_stateLb.text= @"PUNCH";

break;
case 268435464:
_stateLb.text= @"EMOT";

break;
default:
break;
}

}



-(void)setFlag:(NSString *)isFlag
{

_flagLb.text=[NSString stringWithFormat:@"%@",isFlag];





if([isFlag isEqual:@"G1"]) {

_flagLb.text= @"🏁";


}else if([isFlag isEqual:@"IQ"]) {

_flagLb.text= @"🇮🇶";


}else if([isFlag isEqual:@"SA"]) {


_flagLb.text= @"🇸🇦";


}else if([isFlag isEqual:@"BH"]) {


_flagLb.text= @"🇧🇭";


}else if([isFlag isEqual:@"SY"]) {


_flagLb.text= @"🇸🇾";


}else if([isFlag isEqual:@"CA"]) {


_flagLb.text= @"🇨🇦";


}else if([isFlag isEqual:@"PK"]) {


_flagLb.text= @"🇵🇰";


}else if([isFlag isEqual:@"AF"]) {

_flagLb.text= @"🇦🇫";


}else if([isFlag isEqual:@"AL"]) {

_flagLb.text= @"🇦🇱";


}else if([isFlag isEqual:@"DZ"]) {


_flagLb.text= @"🇩🇿";


}else if([isFlag isEqual:@"AS"]) {


_flagLb.text= @"🇦🇸";


}else if([isFlag isEqual:@"AD"]) {


_flagLb.text= @"🇦🇩";


}else if([isFlag isEqual:@"AO"]) {


_flagLb.text= @"🇦🇴";


}else if([isFlag isEqual:@"AI"]) {


_flagLb.text= @"🇦🇮";


}else if([isFlag isEqual:@"AQ"]) {


_flagLb.text= @"🇦🇶";


}else if([isFlag isEqual:@"AG"]) {

_flagLb.text= @"🇦🇬";


}else if([isFlag isEqual:@"AR"]) {

_flagLb.text= @"🇦🇷";


}else if([isFlag isEqual:@"AM"]) {


_flagLb.text= @"🇦🇲";


}else if([isFlag isEqual:@"AW"]) {


_flagLb.text= @"🇦🇼";


}else if([isFlag isEqual:@"AU"]) {


_flagLb.text= @"🇦🇺";


}else if([isFlag isEqual:@"AT"]) {


_flagLb.text= @"🇦🇹";


}else if([isFlag isEqual:@"AZ"]) {


_flagLb.text= @"🇦🇿";


}else if([isFlag isEqual:@"BS"]) {


_flagLb.text= @"🇧🇸";


}else if([isFlag isEqual:@"BD"]) {

_flagLb.text= @"🇧🇩";


}else if([isFlag isEqual:@"BB"]) {

_flagLb.text= @"🇧🇧";


}else if([isFlag isEqual:@"BY"]) {


_flagLb.text= @"🇧🇾";


}else if([isFlag isEqual:@"BE"]) {


_flagLb.text= @"🇧🇪";


}else if([isFlag isEqual:@"BZ"]) {


_flagLb.text= @"🇧🇿";


}else if([isFlag isEqual:@"BJ"]) {


_flagLb.text= @"🇧🇯";


}else if([isFlag isEqual:@"BM"]) {


_flagLb.text= @"🇧🇲";


}else if([isFlag isEqual:@"BT"]) {


_flagLb.text= @"🇧🇹";


}else  if([isFlag isEqual:@"BT"]) {

_flagLb.text= @"🇧🇿";


}else if([isFlag isEqual:@"BO"]) {

_flagLb.text= @"🇧🇴";


}else if([isFlag isEqual:@"BQ"]) {


_flagLb.text= @"🇧🇶";


}else if([isFlag isEqual:@"BA"]) {


_flagLb.text= @"🇧🇦";


}else if([isFlag isEqual:@"BW"]) {


_flagLb.text= @"🇧🇼";


}else if([isFlag isEqual:@"BV"]) {


_flagLb.text= @"🇳🇴";


}else if([isFlag isEqual:@"BR"]) {


_flagLb.text= @"🇧🇷";


}else if([isFlag isEqual:@"IO"]) {


_flagLb.text= @"🇮🇴";


}else if([isFlag isEqual:@"AF"]) {

_flagLb.text= @"🇦🇫";


}else if([isFlag isEqual:@"BN"]) {

_flagLb.text= @"🇧🇳";


}else if([isFlag isEqual:@"BG"]) {


_flagLb.text= @"🇧🇬";


}else if([isFlag isEqual:@"BF"]) {


_flagLb.text= @"🇧🇫";


}else if([isFlag isEqual:@"BI"]) {


_flagLb.text= @"🇧🇮";


}else if([isFlag isEqual:@"CV"]) {


_flagLb.text= @"🇨🇻";


}else if([isFlag isEqual:@"KH"]) {


_flagLb.text= @"🇰🇭";


}else if([isFlag isEqual:@"CM"]) {


_flagLb.text= @"🇨🇲";


}else if([isFlag isEqual:@"KY"]) {

_flagLb.text= @"🇰🇾";


}else if([isFlag isEqual:@"TD"]) {

_flagLb.text= @"🇹🇩";


}else if([isFlag isEqual:@"CL"]) {


_flagLb.text= @"🇨🇱";


}else if([isFlag isEqual:@"CN"]) {


_flagLb.text= @"🇨🇳";


}else if([isFlag isEqual:@"CX"]) {


_flagLb.text= @"🇨🇽";


}else if([isFlag isEqual:@"CC"]) {


_flagLb.text= @"🇨🇨";


}else if([isFlag isEqual:@"CO"]) {


_flagLb.text= @"🇨🇴";


}else if([isFlag isEqual:@"KM"]) {


_flagLb.text= @"🇰🇲";


}else if([isFlag isEqual:@"CG"]) {

_flagLb.text= @"🇨🇬";


}else if([isFlag isEqual:@"CK"]) {

_flagLb.text= @"🇨🇰";


}else if([isFlag isEqual:@"CR"]) {


_flagLb.text= @"🇨🇷";


}else if([isFlag isEqual:@"HR"]) {


_flagLb.text= @"🇭🇷";


}else if([isFlag isEqual:@"CU"]) {


_flagLb.text= @"🇨🇺";


}else if([isFlag isEqual:@"CW"]) {


_flagLb.text= @"🇨🇼";


}else if([isFlag isEqual:@"CY"]) {


_flagLb.text= @"🇨🇾";


}else if([isFlag isEqual:@"CZ"]) {


_flagLb.text= @"🇨🇿";


}else if([isFlag isEqual:@"CI"]) {

_flagLb.text= @"🇨🇮";


}else if([isFlag isEqual:@"DK"]) {

_flagLb.text= @"🇩🇰";


}else if([isFlag isEqual:@"DJ"]) {


_flagLb.text= @"🇩🇯";


}else if([isFlag isEqual:@"DM"]) {


_flagLb.text= @"🇩🇲";


}else if([isFlag isEqual:@"DO"]) {


_flagLb.text= @"🇩🇴";


}else if([isFlag isEqual:@"EC"]) {


_flagLb.text= @"🇪🇨";


}else if([isFlag isEqual:@"EG"]) {


_flagLb.text= @"🇪🇬";


}else if([isFlag isEqual:@"SV"]) {


_flagLb.text= @"🇸🇻";


}else if([isFlag isEqual:@"GQ"]) {

_flagLb.text= @"🇬🇶";


}else if([isFlag isEqual:@"ER"]) {

_flagLb.text= @"🇪🇷";


}else if([isFlag isEqual:@"EE"]) {


_flagLb.text= @"🇪🇪";


}else if([isFlag isEqual:@"SZ"]) {


_flagLb.text= @"🇸🇿";


}else if([isFlag isEqual:@"ET"]) {


_flagLb.text= @"🇪🇹";


}else if([isFlag isEqual:@"FK"]) {


_flagLb.text= @"🇫🇰";


}else if([isFlag isEqual:@"FO"]) {


_flagLb.text= @"🇫🇴";


}else if([isFlag isEqual:@"FJ"]) {


_flagLb.text= @"🇫🇯";


}else if([isFlag isEqual:@"FI"]) {

_flagLb.text= @"🇫🇮";


}else if([isFlag isEqual:@"FR"]) {

_flagLb.text= @"🇫🇷";


}else if([isFlag isEqual:@"GF"]) {


_flagLb.text= @"🇬🇫";


}else if([isFlag isEqual:@"PF"]) {


_flagLb.text= @"🇵🇫";


}else if([isFlag isEqual:@"TF"]) {


_flagLb.text= @"🇹🇫";


}else if([isFlag isEqual:@"GA"]) {


_flagLb.text= @"🇬🇦";


}else if([isFlag isEqual:@"GM"]) {


_flagLb.text= @"🇬🇲";


}else if([isFlag isEqual:@"GE"]) {


_flagLb.text= @"🇬🇪";


}else if([isFlag isEqual:@"GH"]) {

_flagLb.text= @"🇬🇭";


}else if([isFlag isEqual:@"GI"]) {

_flagLb.text= @"🇬🇮";


}else if([isFlag isEqual:@"GR"]) {


_flagLb.text= @"🇬🇷";


}else if([isFlag isEqual:@"GL"]) {


_flagLb.text= @"🇬🇱";


}else if([isFlag isEqual:@"GD"]) {


_flagLb.text= @"🇬🇩";


}else if([isFlag isEqual:@"GP"]) {


_flagLb.text= @"🇬🇵";


}else if([isFlag isEqual:@"GU"]) {


_flagLb.text= @"🇬🇺";


}else if([isFlag isEqual:@"GT"]) {


_flagLb.text= @"🇬🇹";


}else  if([isFlag isEqual:@"GG"]) {

_flagLb.text= @"🇬🇬";


}else if([isFlag isEqual:@"GN"]) {

_flagLb.text= @"🇬🇳";


}else if([isFlag isEqual:@"GW"]) {


_flagLb.text= @"🇬🇼";


}else if([isFlag isEqual:@"GY"]) {


_flagLb.text= @"🇬🇾";


}else if([isFlag isEqual:@"HT"]) {


_flagLb.text= @"🇭🇹";


}else if([isFlag isEqual:@"VA"]) {


_flagLb.text= @"🇻🇦";


}else if([isFlag isEqual:@"HN"]) {


_flagLb.text= @"🇭🇳";


}else if([isFlag isEqual:@"HK"]) {


_flagLb.text= @"🇭🇰";


}else if([isFlag isEqual:@"HU"]) {

_flagLb.text= @"🇭🇺";


}else if([isFlag isEqual:@"JM"]) {

_flagLb.text= @"🇯🇲";


}else if([isFlag isEqual:@"JP"]) {


_flagLb.text= @"🇯🇵";


}else if([isFlag isEqual:@"JE"]) {


_flagLb.text= @"🇯🇪";


}else if([isFlag isEqual:@"JO"]) {


_flagLb.text= @"🇯🇴";


}else if([isFlag isEqual:@"KZ"]) {


_flagLb.text= @"🇰🇿";


}else if([isFlag isEqual:@"KE"]) {


_flagLb.text= @"🇰🇪";


}else if([isFlag isEqual:@"KI"]) {


_flagLb.text= @"🇰🇮";


}else if([isFlag isEqual:@"KP"]) {

_flagLb.text= @"🇰🇵";


}else if([isFlag isEqual:@"KR"]) {

_flagLb.text= @"🇰🇷";


}else if([isFlag isEqual:@"KW"]) {


_flagLb.text= @"🇰🇼";


}else if([isFlag isEqual:@"KG"]) {


_flagLb.text= @"🇰🇬";


}else if([isFlag isEqual:@"LA"]) {


_flagLb.text= @"🇱🇦";


}else if([isFlag isEqual:@"LV"]) {


_flagLb.text= @"🇱🇻";


}else if([isFlag isEqual:@"LB"]) {


_flagLb.text= @"🇱🇧";


}else if([isFlag isEqual:@"LS"]) {


_flagLb.text= @"🇱🇸";


}else if([isFlag isEqual:@"LR"]) {

_flagLb.text= @"🇱🇷";


}else if([isFlag isEqual:@"LY"]) {

_flagLb.text= @"🇱🇾";


}else if([isFlag isEqual:@"LI"]) {


_flagLb.text= @"🇱🇮";


}else if([isFlag isEqual:@"LT"]) {


_flagLb.text= @"🇱🇹";


}else if([isFlag isEqual:@"LU"]) {


_flagLb.text= @"🇱🇺";


}else if([isFlag isEqual:@"MO"]) {


_flagLb.text= @"🇲🇴";


}else if([isFlag isEqual:@"MG"]) {


_flagLb.text= @"🇲🇬";


}else if([isFlag isEqual:@"MW"]) {


_flagLb.text= @"🇲🇼";


}else if([isFlag isEqual:@"MV"]) {


_flagLb.text= @"🇲🇻";


}else if([isFlag isEqual:@"MT"]) {


_flagLb.text= @"🇲🇹";


}else if([isFlag isEqual:@"MH"]) {


_flagLb.text= @"🇲🇭";


}else if([isFlag isEqual:@"MQ"]) {


_flagLb.text= @"🇲🇶";


}else if([isFlag isEqual:@"MR"]) {


_flagLb.text= @"🇲🇷";


}else if([isFlag isEqual:@"MU"]) {

_flagLb.text= @"🇲🇺";


}else if([isFlag isEqual:@"YT"]) {

_flagLb.text= @"🇾🇹";


}else if([isFlag isEqual:@"MX"]) {


_flagLb.text= @"🇲🇽";


}else if([isFlag isEqual:@"FM"]) {


_flagLb.text= @"🇫🇲";


}else if([isFlag isEqual:@"MD"]) {


_flagLb.text= @"🇲🇩";


}else if([isFlag isEqual:@"MC"]) {


_flagLb.text= @"🇲🇨";


}else if([isFlag isEqual:@"MN"]) {


_flagLb.text= @"🇲🇳";


}else if([isFlag isEqual:@"ME"]) {


_flagLb.text= @"🇲🇪";


}else if([isFlag isEqual:@"MS"]) {

_flagLb.text= @"🇲🇸";


}else if([isFlag isEqual:@"MA"]) {

_flagLb.text= @"🇲🇦";


}else if([isFlag isEqual:@"MZ"]) {


_flagLb.text= @"🇲🇿";


}else if([isFlag isEqual:@"MM"]) {


_flagLb.text= @"🇲🇲";


}else if([isFlag isEqual:@"NA"]) {


_flagLb.text= @"🇳🇦";


}else if([isFlag isEqual:@"NR"]) {


_flagLb.text= @"🇳🇷";


}else if([isFlag isEqual:@"NP"]) {


_flagLb.text= @"🇳🇵";


}else if([isFlag isEqual:@"NL"]) {


_flagLb.text= @"🇳🇱";


}else if([isFlag isEqual:@"NC"]) {

_flagLb.text= @"🇳🇨";


}else if([isFlag isEqual:@"NZ"]) {

_flagLb.text= @"🇳🇿";


}else if([isFlag isEqual:@"NI"]) {


_flagLb.text= @"🇳🇮";


}else if([isFlag isEqual:@"NE"]) {


_flagLb.text= @"🇳🇪";


}else if([isFlag isEqual:@"NG"]) {


_flagLb.text= @"🇳🇬";


}else if([isFlag isEqual:@"NU"]) {


_flagLb.text= @"🇳🇺";


}else if([isFlag isEqual:@"NF"]) {


_flagLb.text= @"🇳🇫";


}else if([isFlag isEqual:@"MP"]) {


_flagLb.text= @"🇲🇵";


}else if([isFlag isEqual:@"NO"]) {

_flagLb.text= @"🇳🇴";


}else if([isFlag isEqual:@"OM"]) {

_flagLb.text= @"🇴🇲";


}else if([isFlag isEqual:@"PW"]) {


_flagLb.text= @"🇵🇼";


}else if([isFlag isEqual:@"PS"]) {


_flagLb.text= @"🇵🇸";


}else if([isFlag isEqual:@"PA"]) {


_flagLb.text= @"🇵🇦";


}else if([isFlag isEqual:@"PG"]) {


_flagLb.text= @"🇵🇬";


}else if([isFlag isEqual:@"PY"]) {


_flagLb.text= @"🇵🇾";


}else if([isFlag isEqual:@"PE"]) {


_flagLb.text= @"🇵🇪";


}else  if([isFlag isEqual:@"PH"]) {

_flagLb.text= @"🇵🇭";


}else if([isFlag isEqual:@"PN"]) {

_flagLb.text= @"🇵🇳";


}else if([isFlag isEqual:@"PL"]) {


_flagLb.text= @"🇵🇱";


}else if([isFlag isEqual:@"PT"]) {


_flagLb.text= @"🇵🇹";


}else if([isFlag isEqual:@"PR"]) {


_flagLb.text= @"🇵🇷";


}else if([isFlag isEqual:@"QA"]) {


_flagLb.text= @"🇶🇦";


}else if([isFlag isEqual:@"MK"]) {


_flagLb.text= @"🇲🇰";


}else if([isFlag isEqual:@"RO"]) {


_flagLb.text= @"🇷🇴";


}else if([isFlag isEqual:@"RU"]) {

_flagLb.text= @"🇷🇺";


}else if([isFlag isEqual:@"RW"]) {

_flagLb.text= @"🇷🇼";


}else if([isFlag isEqual:@"RE"]) {


_flagLb.text= @"🇷🇪";


}else if([isFlag isEqual:@"BL"]) {


_flagLb.text= @"🇧🇱";


}else if([isFlag isEqual:@"SH"]) {

_flagLb.text= @"🇸🇭";


}else if([isFlag isEqual:@"KN"]) {

_flagLb.text= @"🇰🇳";


}else if([isFlag isEqual:@"LC"]) {


_flagLb.text= @"🇱🇨";


}else if([isFlag isEqual:@"PM"]) {


_flagLb.text= @"🇵🇲";


}else if([isFlag isEqual:@"VC"]) {


_flagLb.text= @"🇻🇨";


}else if([isFlag isEqual:@"WS"]) {


_flagLb.text= @"🇼🇸";


}else if([isFlag isEqual:@"SM"]) {


_flagLb.text= @"🇸🇲";


}else if([isFlag isEqual:@"ST"]) {


_flagLb.text= @"🇸🇹";


}else if([isFlag isEqual:@"SN"]) {

_flagLb.text= @"🇸🇳";


}else if([isFlag isEqual:@"RS"]) {

_flagLb.text= @"🇷🇸";


}else if([isFlag isEqual:@"SC"]) {


_flagLb.text= @"🇸🇨";


}else if([isFlag isEqual:@"SL"]) {


_flagLb.text= @"🇸🇱";


}else if([isFlag isEqual:@"SG"]) {


_flagLb.text= @"🇸🇬";


}else if([isFlag isEqual:@"SX"]) {


_flagLb.text= @"🇸🇽";


}else if([isFlag isEqual:@"SK"]) {


_flagLb.text= @"🇸🇰";


}else if([isFlag isEqual:@"SI"]) {


_flagLb.text= @"🇸🇮";


}else if([isFlag isEqual:@"SB"]) {

_flagLb.text= @"🇸🇧";


}else if([isFlag isEqual:@"SO"]) {


_flagLb.text= @"🇸🇴";





}else if([isFlag isEqual:@"ZA"]) {


_flagLb.text= @"🇿🇦";





}else if([isFlag isEqual:@"GS"]) {


_flagLb.text= @"🇬🇸";





}else if([isFlag isEqual:@"GS"]) {


_flagLb.text= @"🇬🇸";





}else if([isFlag isEqual:@"SS"]) {


_flagLb.text= @"🇸🇸";





}else if([isFlag isEqual:@"ES"]) {


_flagLb.text= @"🇪🇸";





}else if([isFlag isEqual:@"LK"]) {


_flagLb.text= @"🇱🇰";





}else if([isFlag isEqual:@"SD"]) {


_flagLb.text= @"🇸🇩";





}else if([isFlag isEqual:@"SR"]) {


_flagLb.text= @"🇸🇷";





}else if([isFlag isEqual:@"SJ"]) {


_flagLb.text= @"🇸🇪";





}else if([isFlag isEqual:@"CH"]) {


_flagLb.text= @"🇨🇭";





}else if([isFlag isEqual:@"TW"]) {


_flagLb.text= @"🇹🇼";





}else if([isFlag isEqual:@"TJ"]) {


_flagLb.text= @"🇹🇯";





}else if([isFlag isEqual:@"TZ"]) {


_flagLb.text= @"🇹🇿";





}else if([isFlag isEqual:@"TH"]) {


_flagLb.text= @"🇹🇭";





}else if([isFlag isEqual:@"TL"]) {


_flagLb.text= @"🇹🇱";





}else if([isFlag isEqual:@"TG"]) {


_flagLb.text= @"🇹🇬";





}else if([isFlag isEqual:@"TK"]) {


_flagLb.text= @"🇹🇰";





}else if([isFlag isEqual:@"TT"]) {


_flagLb.text= @"🇹🇹";





}else if([isFlag isEqual:@"TN"]) {


_flagLb.text= @"🇹🇳";





}else if([isFlag isEqual:@"TR"]) {


_flagLb.text= @"🇹🇷";





}else if([isFlag isEqual:@"TM"]) {


_flagLb.text= @"🇹🇲";





}else if([isFlag isEqual:@"TC"]) {


_flagLb.text= @"🇹🇨";





}else if([isFlag isEqual:@"TV"]) {


_flagLb.text= @"🇹🇻";





}else if([isFlag isEqual:@"UG"]) {


_flagLb.text= @"🇺🇬";





}else if([isFlag isEqual:@"UA"]) {


_flagLb.text= @"🇺🇦";





}else if([isFlag isEqual:@"AE"]) {


_flagLb.text= @"🇦🇪";





}else if([isFlag isEqual:@"GB"]) {


_flagLb.text= @"🇬🇧";





}else if([isFlag isEqual:@"US"]) {


_flagLb.text= @"🇺🇸";





}else if([isFlag isEqual:@"UY"]) {


_flagLb.text= @"🇺🇾";





}else if([isFlag isEqual:@"UZ"]) {


_flagLb.text= @"🇺🇿";





}else if([isFlag isEqual:@"VU"]) {


_flagLb.text= @"🇻🇺";





}else if([isFlag isEqual:@"VE"]) {


_flagLb.text= @"🇻🇪";





}else if([isFlag isEqual:@"VN"]) {


_flagLb.text= @"🇻🇳";





}else if([isFlag isEqual:@"VG"]) {


_flagLb.text= @"🇻🇮";





}else if([isFlag isEqual:@"VI"]) {


_flagLb.text= @"🇻🇮";





}else if([isFlag isEqual:@"WF"]) {


_flagLb.text= @"🇼🇫";





}else if([isFlag isEqual:@"EH"]) {


_flagLb.text= @"🇪🇭";





}else if([isFlag isEqual:@"YE"]) {


_flagLb.text= @"🇾🇪";





}else if([isFlag isEqual:@"ZM"]) {


_flagLb.text= @"🇿🇲";





}else if([isFlag isEqual:@"ZW"]) {


_flagLb.text= @"🇿🇼";





}else if([isFlag isEqual:@"AX"]) {


_flagLb.text= @"🇦🇽";





}else if([isFlag isEqual:@"IS"]) {


_flagLb.text= @"🇦🇽";





}else if([isFlag isEqual:@"IN"]) {


_flagLb.text= @"🇮🇳";





}else if([isFlag isEqual:@"ID"]) {


_flagLb.text= @"🇮🇩";





}else if([isFlag isEqual:@"IR"]) {


_flagLb.text= @"🇮🇷";





}else if([isFlag isEqual:@"IM"]) {


_flagLb.text= @"🇮🇲";





}else if([isFlag isEqual:@"IE"]) {


_flagLb.text= @"🇮🇪";





}else if([isFlag isEqual:@"IL"]) {


_flagLb.text= @"🇵🇸";





}else if([isFlag isEqual:@"IT"]) {


_flagLb.text= @"🇮🇹";





}else if([isFlag isEqual:@"TO"]) {


_flagLb.text= @"🇹🇴";





}else if([isFlag isEqual:@"DE"]) {


_flagLb.text= @"🇩🇪";





}else if([isFlag isEqual:@"SE"]) {


_flagLb.text= @"🇸🇪";





}else {

_flagLb.text= @"";

}
}




-(void)setDis:(CGFloat)dis
{
_disLb.text=[NSString stringWithFormat:@"%dm",(int)dis];

}
-(void)setTeam:(CGFloat)team
{
_teamLb.text=[NSString stringWithFormat:@"%ld",(long)team];
}
-(void)setName:(NSString *)name
{
_nameLb.text=[NSString stringWithFormat:@"%@",name];
}


-(void)setXue:(CGFloat)xue
{
_xueBar.frame = CGRectMake(0, 23, xue, 2);



}



@end
