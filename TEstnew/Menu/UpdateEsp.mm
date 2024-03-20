//Created By Yaqout 2023
#import "UpdateEsp.h"
#import <mach-o/dyld.h>
#import <mach/mach.h>
#import <dlfcn.h>
#import <stdio.h>
#import <string>
#import "JFCommon.h"
#import "More.h"
#import "JFPlayerPool.h"
#import "JFPropsPool.h"
#import "utf.h"
//#import "meth.h"
#import "HideHack.h"
//#import "SaveData.h"
//#import "En.h"
#include <array>

#define IM_PI 3.14159265358979323846f
#define RAD2DEG( x )  ( (float)(x) * (float)(180.f / IM_PI) )
#define DEG2RAD( x ) ( (float)(x) * (float)(IM_PI / 180.f) )
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define __fastcall
NSUserDefaults *getcheck = [NSUserDefaults standardUserDefaults];

FRotator Rotation;
using namespace std;
uintptr_t Vtabel;
kaddr module;
kaddr localPlayerController;
kaddr controlRotation;
MinimalViewInfo POV;
int curammo = 0;
kaddr ownerShootWeapon;
kaddr emeCurrentWeapon;
int ShootWeaponid = 0;
float BulletFlySpeed = 0;
int recoil;
JFPlayer *bestAimPlayer = nil;
CameraCacheEntry CameraCache = CameraCacheEntry();
HideHack *aHideHack;
UIWindow *MainWindows;

namespace Offsets {
kaddr LineOfSightTo_Func = 0x104FA49D8; //lineofsite
}

bool IsValidAddress(kaddr addr) {
return addr > 0x100000000 && addr < 0x2000000000;
}

bool _read(kaddr addr, void *buffer, int len) {
if (!IsValidAddress(addr)) return false;
vm_size_t size = 0;
kern_return_t error = vm_read_overwrite(mach_task_self(), (vm_address_t)addr, len, (vm_address_t)buffer, &size);
if(error != KERN_SUCCESS || size != len)
{
return false;
}
return true;
}

bool _write(kaddr addr, void *buffer, int len)
{
if (!IsValidAddress(addr)) return false;
kern_return_t error = vm_write(mach_task_self(), (vm_address_t)addr, (vm_offset_t)buffer, (mach_msg_type_number_t)len);
if(error != KERN_SUCCESS)
{
return false;
}
return true;
}

kaddr GetRealOffset(kaddr offset) {
if (module == 0) {
return 0;
}
return (module + offset);
}

template<typename T> T Read(kaddr address) {
T data;
_read(address, reinterpret_cast<void *>(&data), sizeof(T));
return data;
}

template<typename T> void Write(kaddr address, T data) {
_write(address, reinterpret_cast<void *>(&data), sizeof(T));
}

template<typename T> T *ReadArr(kaddr address, unsigned int size) {
T data[size];
T *ptr = data;
_read(address, reinterpret_cast<void *>(ptr), (sizeof(T) * size));
return ptr;
}

string ReadStr2(kaddr address, unsigned int size) {
string name(size, '\0');
_read(address, (void *) name.data(), size * sizeof(char));
name.shrink_to_fit();
return name;
}

kaddr GetPtr(kaddr address) {
return Read<kaddr>(address);
}

long GetFuckingWorld() {
    return reinterpret_cast<long(__fastcall*)(long)>(GetRealOffset(0x1028DFEA8))(GetRealOffset(0x108C380F8)); //  GWorld
};

long GetFuckingName() {
    return reinterpret_cast<long(__fastcall*)(long)>(GetRealOffset(0x103FDF320))(GetRealOffset(0x1088A6370));// Gname
};


string getUEString(kaddr address) {
unsigned int MAX_SIZE = 100;
string uestring(ReadStr2(address, MAX_SIZE));
uestring.shrink_to_fit();
return uestring;
}

string GetFName(kaddr actorAddress) {
UInt32 FNameID = Read<UInt32>(actorAddress + 0x18);
kaddr TNameEntryArray = GetFuckingName();

kaddr FNameEntryArr = GetPtr(TNameEntryArray + ((FNameID / 0x4000) * 8));
kaddr FNameEntry = GetPtr(FNameEntryArr + ((FNameID % 0x4000) * 8));
return getUEString(FNameEntry + 0xc);
}

bool isEqual(string s1, const char* check) {
string s2(check);
return (s1 == s2);
}

bool isEqual(string s1, string s2) {
return (s1 == s2);
}

bool isContain(string str, const char* check) {
size_t found = str.find(check);
return (found != string::npos);
}

bool isPlayer(string FName) {
return isContain(FName, "BP_TrainPlayerPawn") || isContain(FName, "BP_PlayerPawn") || isContain(FName, "PlayerCharacter"); //
}
static BOOL IsPlayer(string EntityType)
{
if (EntityType.find("BP_PlayerPawn") != string::npos)
{
return TRUE;
}
if (EntityType.find("PlayerCharacter") != string::npos)
{
return TRUE;
}
else if (EntityType.find("BP_PlayerCharacter") != std::string::npos) // mod event player
{
return TRUE;
}


else if (EntityType.find("PlanET_FakePlayer") != std::string::npos) // mod event Bot

{
return TRUE;
}
else if (EntityType.find("BP_PlayerPawn_FM_C") != std::string::npos)

{
return TRUE;
}
else if (EntityType.find("BP_PlayerPawn_C") != std::string::npos)

{
return TRUE;
}
else if (EntityType.find("BP_PlayerPawn_Rune_C") != std::string::npos)

{
return TRUE;
}

else if (EntityType.find("PlayerPawn_Infec_InvisibleZombie_C") != std::string::npos)

{
return TRUE;
}

else if (EntityType.find("PlayerPawn_Infec_Human_C") != std::string::npos)

{
return TRUE;
}

else if (EntityType.find("BP_PlayerPawn_ZombieBase_C") != std::string::npos)

{
return TRUE;
}

else if (EntityType.find("BP_PlayerPawn_TDM_TPP_C") != std::string::npos)

{
return TRUE;
}
else if (EntityType.find("BP_PlayerPawn_FM_Bot_C") != std::string::npos)

{
return TRUE;
}
else if (EntityType.find("BP_PlayerCharacter_SlayTheBot_C") != std::string::npos)

{
return TRUE;
}
else if (EntityType.find("PlanET_FakePlayer_AIPawn_C") != std::string::npos)

{
return TRUE;
}
else if (EntityType.find("BP_PlayerPawn_SI_C") != std::string::npos)

{
return TRUE;
}
else if (EntityType.find("BP_PlayerPawn_Heavy_C") != std::string::npos)

{
return TRUE;
}
else if (EntityType.find("PlayerPawn_Infec_Revenger_C") != std::string::npos)

{
return TRUE;

}
else if (EntityType.find("PlayerPawn_Infec_NormalZombie_C") != std::string::npos)

{
return TRUE;
}

else if (EntityType.find("PlayerPawn_Infec_KingZombie_C") != std::string::npos)

{
return TRUE;
}
else if (EntityType.find("BP_PlayerCharacter_PlanA_C") != std::string::npos)

{

return TRUE;
}

return FALSE;

}
bool isProps(string FName) {
if (isContain(FName, "VH_Scooter_")) {
return true;
}
if (isContain(FName, "VH_Motorcycle_")) {
return true;
}
if (isContain(FName, "VH_MotorcycleCart_")) {
return true;
}
if (isContain(FName, "BP_VH_Tuk_")) {
return true;
}
if (isContain(FName, "BP_VH_Buggy_")) {
return true;
}
if (isContain(FName, "PickUp_0")) {
return true;
}
if (isContain(FName, "Mirado_")) {
return true;
}
if (isContain(FName, "VH_Dacia_")) {
return true;
}
if (isContain(FName, "AquaRail_")) {
return true;
}
if (isContain(FName, "BP_VH_CoupeRB_")) {
return true;
}
if (isContain(FName, "VH_MiniBus_")) {
return true;
}
if (isContain(FName, "VH_BRDM_")) {
return true;
}
if (isContain(FName, "VH_UAZ")) {
return true;
}
if (isContain(FName, "BP_Rifle_VAL_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_Rifle_AKM_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_Rifle_M416_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_Rifle_SCAR_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_Rifle_QBZ_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_Sniper_Kar98k_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_Sniper_Mini14_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_Rifle_M762_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_Rifle_M762_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_MachineGun_Vector_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_MachineGun_Uzi_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_MachineGun_TommyGun_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_MachineGun_UMP9_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_Sniper_AWM_C")) {
return true;
}
if (isContain(FName, "BP_Sniper_AWM_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_Sniper_M24_Wrapper_C")) {
return true;
}
if (isContain(FName, "BP_Sniper_Kar98k_Wrapper_C")) {
return true;
}
if (isContain(FName, "PickUp_BP_Helmet_Lv2_C") || isEqual(FName, "PickUp_BP_Helmet_Lv2_A_C") || isEqual(FName, "PickUp_BP_Helmet_Lv2_B_C")) {
return true;
}
if (isContain(FName, "PickUp_BP_Armor_Lv2_C") || isEqual(FName, "PickUp_BP_Armor_Lv2_A_C") || isEqual(FName, "PickUp_BP_Armor_Lv2_B_C")) {
return true;
}
if (isContain(FName, "PickUp_BP_Bag_Lv2_C") || isEqual(FName, "PickUp_BP_Bag_Lv2_A_C") || isEqual(FName, "PickUp_BP_Bag_Lv2_B_C")) {
return true;
}
if (isContain(FName, "PickUp_BP_Helmet_Lv3_C") || isEqual(FName, "PickUp_BP_Helmet_Lv3_A_C") || isEqual(FName, "PickUp_BP_Helmet_Lv3_B_C")) {
return true;
}
if (isContain(FName, "PickUp_BP_Armor_Lv3_C") || isEqual(FName, "PickUp_BP_Armor_Lv3_A_C") || isEqual(FName, "PickUp_BP_Armor_Lv3_B_C")) {
return true;
}
if (isContain(FName, "BP_MZJ_3X_Pickup_C")) {
return true;
}
if (isContain(FName, "BP_MZJ_4X_Pickup_C")) {
return true;
}
if (isContain(FName, "BP_MZJ_6X_Pickup_C")) {
return true;
}
if (isContain(FName, "BP_QK_Mid_Compensator_Pickup_C")) {
return true;
}
if (isContain(FName, "BP_QK_Large_Compensator_Pickup_C")) {
return true;
}
if (isContain(FName, "BP_QT_UZI_Pickup_C")) {
return true;
}
if (isContain(FName, "BP_QT_A_Pickup_C")) {
return true;
}
if (isContain(FName, "BP_WB_LightGrip_Pickup_C")) {
return true;
}
if (isContain(FName, "BP_Ammo_762mm_Pickup_C")) {
return true;
}
if (isContain(FName, "BP_Ammo_556mm_Pickup_C")) {
return true;
}
if (isContain(FName, "Injection_Pickup_C")) {
return true;
}
if (isContain(FName, "Firstaid_Pickup_C")) {
return true;
}
if (isContain(FName, "Drink_Pickup_C")) {
return true;
}
if (isContain(FName, "PickUpListWrapperActor")) {
return true;
}
if (isContain(FName, "BP_AirDropBox_C")) {
return true;
}
if (isContain(FName, "BP_Pistol_Flaregun_Wrapper_C")) {
return true;
}
if (isContain(FName, "ProjGrenade_BP_C")) {
return true;
}
if (isContain(FName, "BP_Grenade_Shoulei_C")) {
return true;
}
if (isContain(FName, "BP_Grenade_Burn_C")) {
return true;
}
return false;
}

string getVehicleWithFName(string FName) {
if (isContain(FName, "VH_Scooter_")) {
return "Scooter";
}
if (isContain(FName, "VH_Motorcycle_")) {
return "Motorcycle";
}
if (isContain(FName, "VH_MotorcycleCart_")) {
return "MotorcycleCart";
}
if (isContain(FName, "BP_VH_Tuk_")) {
return "TukTuk";
}
if (isContain(FName, "BP_VH_Buggy_")) {
return "Buggy";
}
if (isContain(FName, "PickUp_0")) {
return "PickUp";
}
if (isContain(FName, "Mirado_")) {
return "Mirado";
}
if (isContain(FName, "VH_Dacia_")) {
return "Dacia";
}
if (isContain(FName, "AquaRail_")) {
return "AquaRail";
}
if (isContain(FName, "BP_VH_CoupeRB_")) {
return "CoupeRB";
}
if (isContain(FName, "VH_MiniBus_")) {
return "MiniBus";
}
if (isContain(FName, "VH_BRDM_")) {
return "BRDM";
}
if (isContain(FName, "VH_UAZ")) {
return "UAZ";
}
return "";
}

string getWeaponWithFName(string FName) {
if (isContain(FName, "BP_Rifle_VAL_Wrapper_C")) {
return "VAL";
}
if (isContain(FName, "BP_Rifle_AKM_Wrapper_C")) {
return "AKM";
}
if (isContain(FName, "BP_Rifle_M416_Wrapper_C")) {
return "M416";
}
if (isContain(FName, "BP_Rifle_SCAR_Wrapper_C")) {
return "SCAR-L";
}
if (isContain(FName, "BP_Rifle_QBZ_Wrapper_C")) {
return "QBZ";
}
if (isContain(FName, "BP_Sniper_Kar98k_Wrapper_C")) {
return "Kar98k";
}
if (isContain(FName, "BP_Sniper_Mini14_Wrapper_C")) {
return "Mini14";
}

if (isContain(FName, "BP_Rifle_M762_Wrapper_C")) {
return "M762";
}
if (isContain(FName, "BP_Rifle_Mk14_Wrapper_C")) {
return "Mk14";
}
if (isContain(FName, "BP_Sniper_SLR_Wrapper_C")) {
return "SLR Sniper";
}
if (isContain(FName, "BP_Sniper_SKS_Wrapper_C")) {
return "SKS Sniper";
}
if (isContain(FName, "BP_Sniper_Kar98k_Wrapper_C")) {
return "Kar98k Sniper";
}
if (isContain(FName, "BP_Sniper_VSS_Wrapper_C")) {
return "VSS Sniper";
}
if (isContain(FName, "BP_Rifle_M16A4_Wrapper_C")) {
return "M16A4";
}

if (isContain(FName, "BP_Rifle_Mk47_Wrapper_C")) {
return "Mk47";
}
if (isContain(FName, "BP_Rifle_G3_Wrapper_C")) {
return "G3";
}
if (isContain(FName, "BP_Rifle_QBZ_Wrapper_C")) {
return "QBZ";
}
if (isContain(FName, "BP_Rifle_Groza_Wrapper_C")) {
return "Groza";
}
if (isContain(FName, "BP_Rifle_AUG_Wrapper_C")) {
return "AUG";
}
if (isContain(FName, "BP_ShotGun_S12K_Wrapper_C")) {
return "S12K ShotGun";
}

if (isContain(FName, "BP_Rifle_DP28_Wrapper_C")) {
return "DP28";
}
if (isContain(FName, "BP_Sniper_AWM_Wrapper_C")) {
return "AWM Sniper";
}
if (isContain(FName, "BP_Rifle_M249_Wrapper_C")) {
return "M249";
}
if (isContain(FName, "BP_Rifle_G36_Wrapper_C")) {
return "G36";
}
if (isContain(FName, "BP_ShotGun_DP12_Wrapper_C")) {
return "DP12 ShotGun";
}

if (isContain(FName, "BP_ShotGun_S686_Wrapper_C")) {
return "S686 ShotGun";
}
if (isContain(FName, "BP_ShotGun_S1897_Wrapper_C")) {
return "S1897 ShotGun";
}
if (isContain(FName, "BP_ShotGun_SawedOff_Wrapper_C")) {
return "SawedOff ShotGun";
}
if (isContain(FName, "BP_MachineGun_PP19_Wrapper_C")) {
return "PP19";
}
if (isContain(FName, "BP_MachineGun_TommyGun_Wrapper_C")) {
return "TommyGu";
}
if (isContain(FName, "BP_MachineGun_MP5K_Wrapper_C")) {
return "MP5K";
}

if (isContain(FName, "BP_MachineGun_UMP9_Wrapper_C")) {
return "UMP9";
}
if (isContain(FName, "BP_MachineGun_Vector_Wrapper_C")) {
return "Vector";
}
if (isContain(FName, "BP_MachineGun_Uzi_Wrapper_C")) {
return "Uzi";
}
return "";
}

string getArmorWithFName(string FName) {
if (isContain(FName, "PickUp_BP_Helmet_Lv2_C") || isEqual(FName, "PickUp_BP_Helmet_Lv2_A_C") || isEqual(FName, "PickUp_BP_Helmet_Lv2_B_C")) {
return "Helmet_Lv2";
}
if (isContain(FName, "PickUp_BP_Armor_Lv2_C") || isEqual(FName, "PickUp_BP_Armor_Lv2_A_C") || isEqual(FName, "PickUp_BP_Armor_Lv2_B_C")) {
return "Armor_Lv2";
}
if (isContain(FName, "PickUp_BP_Bag_Lv2_C") || isEqual(FName, "PickUp_BP_Bag_Lv2_A_C") || isEqual(FName, "PickUp_BP_Bag_Lv2_B_C")) {
return "Bag_Lv2";
}
if (isContain(FName, "PickUp_BP_Helmet_Lv3_C") || isEqual(FName, "PickUp_BP_Helmet_Lv3_A_C") || isEqual(FName, "PickUp_BP_Helmet_Lv3_B_C")) {
return "Helmet_Lv3";
}
if (isContain(FName, "PickUp_BP_Armor_Lv3_C") || isEqual(FName, "PickUp_BP_Armor_Lv3_A_C") || isEqual(FName, "PickUp_BP_Armor_Lv3_B_C")) {
return "Armor_Lv3";
}

return "";
}

string getSightWithFName(string FName) {
if (isContain(FName, "BP_MZJ_3X_Pickup_C")) {
return "3X";
}
if (isContain(FName, "BP_MZJ_4X_Pickup_C")) {
return "4X";
}

if (isContain(FName, "BP_MZJ_6X_Pickup_C")) {
return "6X";
}
return "";
}

string getBulletWithFName(string FName) {
if (isContain(FName, "BP_Ammo_762mm_Pickup_C")) {
return "[Ammo]762";
}
if (isContain(FName, "BP_Ammo_556mm_Pickup_C")) {
return "[Ammo]556";
}

if (isContain(FName, "BP_Ammo_9mm_Pickup_C")) {
return "[Ammo]9mm";
}
if (isContain(FName, "BP_Ammo_12Guage_Pickup_C")) {
return "[Ammo]12Guage";
}
if (isContain(FName, "BP_Ammo_45ACP_Pickup_C")) {
return "[Ammo]45ACP";
}
if (isContain(FName, "BP_Ammo_300Magnum_Pickup_C")) {
return "[Ammo]300Magnum";
}
if (isContain(FName, "BP_Ammo_Bolt_Pickup_C")) {
return "[Ammo]Bolt";
}
return "";
}

string getDrugWithFName(string FName) {
if (isContain(FName, "Injection_Pickup_C")) {
return "Injection";
}
if (isContain(FName, "Firstaid_Pickup_C")) {
return "Firstaid";
}

if (isContain(FName, "Drink_Pickup_C")) {
return "Drink";
}
return "";
}

string getBoxWithFName(string FName) {
if (isContain(FName, "PickUpListWrapperActor")) {
return "Box";
}
return "";
}
string getBPcWithFName(string FName) {
if (isContain(FName, "BP_AirDropBox_C")) {
return "AirDrop";
}
return "";
}

string getWrapperWithFName(string FName) {
if (isContain(FName, "BP_Pistol_Flaregun_Wrapper_C")) {
return "Flaregun";
}
return "";
}

string getEarlyWarningWithFName(string FName) {
if (isContain(FName, "BP_Grenade_Shoulei_C")) {
return "Grenade";
}
if (isContain(FName, "BP_Grenade_Burn_C")) {
return "Burn";
}
return "";
}

Vector3 MatrixToVector(FMatrix matrix) {
return Vector3(matrix[3][0], matrix[3][1], matrix[3][2]);
}

FMatrix MatrixMulti(FMatrix m1, FMatrix m2) {
FMatrix matrix = FMatrix();
for (int i = 0; i < 4; i++) {
for (int j = 0; j < 4; j++) {
for (int k = 0; k < 4; k++) {
matrix[i][j] += m1[i][k] * m2[k][j];
}
}
}
return matrix;
}

FMatrix TransformToMatrix(FTransform transform) {
FMatrix matrix;

matrix[3][0] = transform.Translation.X;
matrix[3][1] = transform.Translation.Y;
matrix[3][2] = transform.Translation.Z;

float x2 = transform.Rotation.x + transform.Rotation.x;
float y2 = transform.Rotation.y + transform.Rotation.y;
float z2 = transform.Rotation.z + transform.Rotation.z;

float xx2 = transform.Rotation.x * x2;
float yy2 = transform.Rotation.y * y2;
float zz2 = transform.Rotation.z * z2;

matrix[0][0] = (1.0f - (yy2 + zz2)) * transform.Scale3D.X;
matrix[1][1] = (1.0f - (xx2 + zz2)) * transform.Scale3D.Y;
matrix[2][2] = (1.0f - (xx2 + yy2)) * transform.Scale3D.Z;

float yz2 = transform.Rotation.y * z2;
float wx2 = transform.Rotation.w * x2;
matrix[2][1] = (yz2 - wx2) * transform.Scale3D.Z;
matrix[1][2] = (yz2 + wx2) * transform.Scale3D.Y;

float xy2 = transform.Rotation.x * y2;
float wz2 = transform.Rotation.w * z2;
matrix[1][0] = (xy2 - wz2) * transform.Scale3D.Y;
matrix[0][1] = (xy2 + wz2) * transform.Scale3D.X;

float xz2 = transform.Rotation.x * z2;
float wy2 = transform.Rotation.w * y2;
matrix[2][0] = (xz2 + wy2) * transform.Scale3D.Z;
matrix[0][2] = (xz2 - wy2) * transform.Scale3D.X;

matrix[0][3] = 0;
matrix[1][3] = 0;
matrix[2][3] = 0;
matrix[3][3] = 1;

return matrix;
}

FMatrix RotatorToMatrix(FRotator rotation) {
float radPitch = rotation.Pitch * ((float) M_PI / 180.0f);
float radYaw = rotation.Yaw * ((float) M_PI / 180.0f);
float radRoll = rotation.Roll * ((float) M_PI / 180.0f);

float SP = sinf(radPitch);
float CP = cosf(radPitch);
float SY = sinf(radYaw);
float CY = cosf(radYaw);
float SR = sinf(radRoll);
float CR = cosf(radRoll);

FMatrix matrix;

matrix[0][0] = (CP * CY);
matrix[0][1] = (CP * SY);
matrix[0][2] = (SP);
matrix[0][3] = 0;

matrix[1][0] = (SR * SP * CY - CR * SY);
matrix[1][1] = (SR * SP * SY + CR * CY);
matrix[1][2] = (-SR * CP);
matrix[1][3] = 0;

matrix[2][0] = (-(CR * SP * CY + SR * SY));
matrix[2][1] = (CY * SR - CR * SP * SY);
matrix[2][2] = (CR * CP);
matrix[2][3] = 0;

matrix[3][0] = 0;
matrix[3][1] = 0;
matrix[3][2] = 0;
matrix[3][3] = 1;

return matrix;
}

Vector3 Add_Vectors(Vector3 A, Vector3 B) {
return A + B;
}
Vector3 Multiply_VectorFloat(Vector3 A, float B){

return A * B;
}
Vector3 CalcAngle(Vector3 LocalHeadPosition, Vector3 AimPosition) {
Vector3 vecDelta = Vector3((LocalHeadPosition.X - AimPosition.X), (LocalHeadPosition.Y - AimPosition.Y), (LocalHeadPosition.Z - AimPosition.Z));
float hyp = (float)sqrt(vecDelta.X * vecDelta.X + vecDelta.Y * vecDelta.Y);
Vector3 ViewAngles;
ViewAngles.Y = -(float)atan(vecDelta.Z / hyp) * (float)(180 / M_PI);
ViewAngles.X = (float)atan(vecDelta.Y / vecDelta.X) * (float)(180 / M_PI);
if (vecDelta.X >= 0)
ViewAngles.X += 180.0f;
return ViewAngles;
}

Vector3 ClampAngles(Vector3 angles) {
while (angles.X < -180.0f)
angles.X += 360.0f;
while (angles.X > 180.0f)
angles.X -= 360.0f;
if (angles.Y < -74)
angles.Y = -74;
if (angles.Y > 74)
angles.Y = 74;
return angles;
}

Vector2 WorldToScreen(Vector3 worldLocation, MinimalViewInfo camViewInfo, int width, int height) {
FMatrix tempMatrix = RotatorToMatrix(camViewInfo.Rotation);
Vector3 vAxisX(tempMatrix[0][0], tempMatrix[0][1], tempMatrix[0][2]);
Vector3 vAxisY(tempMatrix[1][0], tempMatrix[1][1], tempMatrix[1][2]);
Vector3 vAxisZ(tempMatrix[2][0], tempMatrix[2][1], tempMatrix[2][2]);
Vector3 vDelta = worldLocation - camViewInfo.Location;
Vector3 vTransformed(Vector3::Dot(vDelta, vAxisY), Vector3::Dot(vDelta, vAxisZ), Vector3::Dot(vDelta, vAxisX));
if (vTransformed.Z < 1.0f) {
vTransformed.Z = 1.0f;
}

float fov = camViewInfo.FOV;
float screenCenterX = (width / 2.0f);
float screenCenterY = (height / 2.0f);
return Vector2(
(screenCenterX + vTransformed.X * (screenCenterX / tanf(fov * ((float) M_PI / 360.0f))) / vTransformed.Z),
(screenCenterY - vTransformed.Y * (screenCenterX / tanf(fov * ((float) M_PI / 360.0f))) / vTransformed.Z)
);
}

Box3D GetBox3D(Vector3 origin, Vector3 extends) {
origin.X -= extends.X / 2;
origin.Y -= extends.Y / 2;
origin.Z -= extends.Z / 2;
Vector3 one = origin;
Vector3 two = origin;
two.X += extends.X;
Vector3 tree = origin;
tree.X += extends.X;
tree.Y += extends.Y;
Vector3 four = origin;
four.Y += extends.Y;
Vector3 five = one;
five.Z += extends.Z;
Vector3 six = two;
six.Z += extends.Z;
Vector3 seven = tree;
seven.Z += extends.Z;
Vector3 eight = four;
eight.Z += extends.Z;
Vector2 s1, s2, s3, s4, s5, s6, s7, s8;

s1 = WorldToScreen(one, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
s2 = WorldToScreen(two, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
s3 = WorldToScreen(tree, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
s4 = WorldToScreen(four, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
s5 = WorldToScreen(five, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
s6 = WorldToScreen(six, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
s7 = WorldToScreen(seven, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
s8 = WorldToScreen(eight, POV, SCREEN_WIDTH, SCREEN_HEIGHT);

Box3D Box3D;
Box3D.s1 = s1;
Box3D.s2 = s2;
Box3D.s3 = s3;
Box3D.s4 = s4;
Box3D.s5 = s5;
Box3D.s6 = s6;
Box3D.s7 = s7;
Box3D.s8 = s8;
return Box3D;
}

@interface Fucking ()
@property (nonatomic, strong) NSTimer *DataTimer;
@end

@implementation Fucking
- (instancetype)init {
if (self = [super init]) {
self.playerList = [NSMutableArray array];
self.propsList = [NSMutableArray array];
self.playerPool = [[JFPlayerPool alloc] init];
self.propsPool = [[JFPropsPool alloc] init];
self.localPlayer = [self.playerPool getObjFromPool];
self.localPlayer.type = PlayerTypeMyself;
}
return self;
}

static Fucking *instance = nil;
+ (Fucking *)getInstance {
static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
instance = [[self alloc] init];
});
return instance;
}

+ (id)allocWithZone:(struct _NSZone*)zone {
static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
instance = [super allocWithZone:zone];
});
return instance;
}

+ (void)load {
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [[Fucking getInstance] entry]; //start esp and menu
});
}


- (NSString *)Paint:(NSString *)Paint Qaint:(NSString *)Qaint {
return [[self Qaint:[self Qaint:[self Qaint:[self Qaint:[self Qaint:Paint]]]]] stringByReplacingOccurrencesOfString:[self Qaint:[self Qaint:[self Qaint:[self Qaint:[self Qaint:Qaint]]]]] withString:@""];
}

- (NSString *)Qaint:(NSString *)Qaint {
NSData *Nsjdvw = [[NSData alloc] initWithBase64EncodedString:Qaint options:0];
return [[NSString alloc] initWithData:Nsjdvw encoding:NSUTF8StringEncoding];
}

- (BOOL)vmreadData:(void *)buf address:(long)address length:(long)length {
vm_size_t size = 0;
kern_return_t error = vm_read_overwrite(mach_task_self(), (vm_address_t)address, length, (vm_address_t)buf, &size);
if(error != KERN_SUCCESS || size != length){
return NO;
}
return YES;
}

- (void)entry {
module = (kaddr)_dyld_get_image_vmaddr_slide(0);
MainWindows = [UIApplication sharedApplication].keyWindow;

aHideHack = [[HideHack alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
aHideHack.userInteractionEnabled = NO;
[MainWindows addSubview:aHideHack];

[MainWindows addSubview:self.overlayView];

[self cancelTimer];
self.DataTimer = [NSTimer timerWithTimeInterval:1.0f/60 target:self selector:@selector(StatrtFucking) userInfo:nil repeats:YES];
[[NSRunLoop currentRunLoop] addTimer:self.DataTimer forMode:NSRunLoopCommonModes];
}

- (void)SetHideHack:(UISwitch *)Switch {
if (Switch.isOn) {
[aHideHack addSubview:self.overlayView];
} else {
[MainWindows addSubview:self.overlayView];
}
}

- (void)StatrtFucking {
[self readData];
[self localPlayerAction];

}

void VectorAnglesRadar(Vector3& forward, Vector3& angles) {
if (forward.X == 0.f && forward.Y == 0.f) {
angles.X = forward.Z > 0.f ? -90.f : 90.f;
angles.Y = 0.f;
} else {
angles.X = RAD2DEG(atan2(-forward.Z, forward.X));
angles.Y = RAD2DEG(atan2(forward.Y, forward.X));
}
angles.Z = 0.f;
}

void RotateTriangle(std::array<Vector3, 3>& points, float rotation) {
float NewX = (points.at(0).X + points.at(1).X + points.at(2).X) / 3;
float NewY = (points.at(0).Y + points.at(1).Y + points.at(2).Y) / 3;
const auto points_center = Vector3(NewX, NewY, 0);
for (auto& point : points) {
point = point - points_center;
const auto temp_x = point.X;
const auto temp_y = point.Y;
const auto theta = DEG2RAD(rotation);
const auto c = cosf(theta);
const auto s = sinf(theta);
point.X = temp_x * c - temp_y * s;
point.Y = temp_x * s + temp_y * c;
point = point + points_center;
}
}

Vector2 FindScreenEdge (Vector3 WLocation ,float PosX, float PosY, Vector2 Size ,float ZOME) {
Vector2 Coord;
Vector2 Return;
double num = (double)CameraCache.POV.Rotation.Yaw;
double num2 = num * 0.017453292519943295;

float cY = cos(num2);
float sY = sin(num2);
float dX = WLocation.X - CameraCache.POV.Location.X;
float dY = WLocation.Y - CameraCache.POV.Location.Y;
Coord.X = ( dY * cY - dX * sY ) /  ZOME;
Coord.Y = ( dX * cY + dY * sY ) /  ZOME;
Return.X =  Coord.X + PosX + (Size.X / 2.0f);
Return.Y = -Coord.Y + PosY + (Size.Y / 2.0f);
if(Return.X > (PosX + Size.X)) Return.X = (PosX + Size.X); else if(Return.X < (PosX)) Return.X = PosX;

if(Return.Y > (PosY + Size.Y)) Return.Y = (PosY + Size.Y); else if(Return.Y < (PosY)) Return.Y = PosY;

return Return;
}

Vector3 WorldToRadar(Vector3 Origin, Vector3 LocalOrigin, float PosX, float PosY, Vector3 Size, bool& outbuff) {
bool flag = false;
double num = (double)CameraCache.POV.Rotation.Yaw;
double num2 = num * 0.017453292519943295;
float num3 = (float)cosl(num2);
float num4 = (float)sinf(num2);
float num5 = Origin.X - LocalOrigin.X;
float num6 = Origin.Y - LocalOrigin.Y;
Vector3 vector;
vector.X = (num6 * num3 - num5 * num4) / 150.f;
vector.Y = (num5 * num3 + num6 * num4) / 150.f;
Vector3 vector2;
vector2.X = vector.X + PosX + Size.X / 2.f;
vector2.Y = -vector.Y + PosY + Size.Y / 2.f;
bool flag2 = vector2.X > PosX + Size.X;
if (flag2) {
vector2.X = PosX + Size.X;
} else {
bool flag3 = vector2.X < PosX;
if (flag3) {
vector2.X = PosX;
}
}
bool flag4 = vector2.Y > PosY + Size.Y;
if (flag4) {
vector2.Y = PosY + Size.Y;
} else {
bool flag5 = vector2.Y < PosY;
if (flag5) {
vector2.Y = PosY;
}
}
bool flag6 = vector2.Y == PosY || vector2.X == PosX;
if (flag6) {
flag = true;
}
outbuff = flag;
return vector2;
}

FRotator ToRotator(Vector3 local, Vector3 target) {
local.Z = local.Z - 15;
Vector3 rotation = local - target;
FRotator newViewAngle = {0};
float hyp = sqrt(rotation.X * rotation.X + rotation.Y * rotation.Y);
newViewAngle.Pitch = -atan(rotation.Z / hyp) * (180.f / (float) 3.14159265358979323846);
newViewAngle.Yaw = atan(rotation.Y / rotation.X) * (180.f / (float) 3.14159265358979323846);
newViewAngle.Roll = (float) 0.f;
if (rotation.X >= 0.f)
newViewAngle.Yaw += 180.0f;
return newViewAngle;
}

FRotator Conv_VectorToRotator(Vector3 a) {
FRotator R;
R.Yaw = atan2(a.Y,a.X) * (180 /3.141592654f);
R.Pitch = atan2(a.Z,sqrt(a.X*a.X+a.Y*a.Y)) * (180 /3.141592654f);
R.Roll = 0;
return R;
}

- (void)cancelTimer {
if (self.DataTimer) {
[self.DataTimer invalidate];
self.DataTimer = nil;
}
[self recyclePlayer];
}

- (void)recyclePlayer {
for (JFPlayer *player in self.playerList) {
[self.playerPool putObj2Pool:player];
}
[self.playerList removeAllObjects];

for (JFProps *props in self.propsList) {
[self.propsPool putObj2Pool:props];
}
[self.propsList removeAllObjects];
}

- (void)readData {
[self recyclePlayer];
if (![self readLocalPlayerInfo]) return;

auto GWorld = GetFuckingWorld();
auto ULevel = GetPtr(GWorld + 0x30);
auto ActorArray = GetPtr(ULevel + 0xA0);
auto ActorCount = Read<int>(ULevel + 0xA8);
@autoreleasepool
{
for (int i = 0; i < ActorCount; i++) {
kaddr base = GetPtr(ActorArray + i * 8);

if (base == 0 ) { continue; }
if (base == -1) { continue; }
if (!base) { continue; }

if (!IsValidAddress(base) || base == self.localPlayer.base) continue;

string FName = GetFName(base);
if (FName.empty()) continue;

if (IsPlayer(FName)) {
JFPlayer *player = [self.playerPool getObjFromPool];
player.base = base;

if ([self readPlayerInfo:player]) {
if (self.localPlayer.teamNo == player.teamNo) {
player.type = PlayerTypeTeam;
} else {
player.type = PlayerTypeEnemy;
}
[self.playerList addObject:player];
} else {
[self.playerPool putObj2Pool:player];
}
} else {
if (!self.overlayView.isShowProps) continue;
if (!isProps(FName)) continue;

string name;
PropsType type = PropsTypeNone;

JFProps *props = [self.propsPool getObjFromPool];
props.base = base;
auto rootComponent = GetPtr(props.base + 0x1a8); // Class: Actor.Object SceneComponent* RootComponent;
props.worldPos = Read<Vector3>(rootComponent + 0x160); // Class: BaseFPPComponent.ActorComponent.Object STExtraPlayerCharacter* Pawn;
props.distance = Vector3::Distance(props.worldPos, POV.Location) / 100.0f;

if (self.overlayView.isShowPropsEarlyWarning && !((name = getEarlyWarningWithFName(FName)).empty()) && props.distance <= 15) {
type = PropsTypeEarlyWarning;
} else if (self.overlayView.isShowPropsVehicle && !((name = getVehicleWithFName(FName)).empty()) && props.distance <= 400) {
type = PropsTypeVehicle;
props.Box3D = GetBox3D(Vector3(props.worldPos.X, props.worldPos.Y, props.worldPos.Z), Vector3(200.f, 400.f, 200.f));
props.isVisible = [self lineOfSightToViewPoint:Vector3(props.worldPos.X, props.worldPos.Y, props.worldPos.Z + 100)];
} else if (self.overlayView.isShowPropsWeapon && !((name = getWeaponWithFName(FName)).empty()) && props.distance <= 30) {
type = PropsTypeWeapon;
} else if (self.overlayView.isShowPropsArmor && !((name = getArmorWithFName(FName)).empty()) && props.distance <= 30) {
type = PropsTypeArmor;
} else if (self.overlayView.isShowPropsSight && !((name = getSightWithFName(FName)).empty()) && props.distance <= 30) {
type = PropsTypeSight;
} else if (self.overlayView.isShowPropsBullet && !((name = getBulletWithFName(FName)).empty()) && props.distance <= 30) {
type = PropsTypeBullet;
} else if (self.overlayView.isShowPropsDrug && !((name = getDrugWithFName(FName)).empty()) && props.distance <= 50) {
type = PropsTypeDrug;
} else if (self.overlayView.BoxWith && !((name = getBoxWithFName(FName)).empty()) && props.distance <= 100) {
type = PickUpListWrapperActor;
} else if (self.overlayView.BPc && !((name = getBPcWithFName(FName)).empty()) && props.distance <= 500) {
type = AirDropBox;
} else if (self.overlayView.Pistol && !((name = getWrapperWithFName(FName)).empty()) && props.distance <= 500) {
type = Flaregun;
}

props.name = name;
props.type = type;

    if (/* DISABLES CODE */ (true)) {
if (props.distance > self.overlayView.propsDistance) {
[self.propsPool putObj2Pool:props];
continue;
}

props.screenPos = WorldToScreen(props.worldPos, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
[self.propsList addObject:props];
} else {
[self.propsPool putObj2Pool:props];
}
}
}
}
}
- (bool)readLocalPlayerInfo {
auto GWorld = GetFuckingWorld();
auto NetDriver = GetPtr(GWorld + 0x38);
auto ServerConnection = GetPtr(NetDriver + 0x78);
localPlayerController = GetPtr(ServerConnection + 0x30);
self.localPlayer.base = GetPtr(localPlayerController + 0x3c8); // Class: DefaultPawn.Pawn.Actor.Object StaticMeshComponent* MeshComponent;
auto rootComponent = GetPtr(self.localPlayer.base + 0x1a8); // Class: Actor.Object SceneComponent* RootComponent;
if (IsValidAddress(rootComponent)) {
self.localPlayer.worldPos = Read<Vector3>(rootComponent + 0x160); // Class: BaseFPPComponent.ActorComponent.Object STExtraPlayerCharacter* Pawn;
}

if (IsValidAddress(self.localPlayer.base)) {
string FName = GetFName(self.localPlayer.base);
if (FName.empty()) return false;

if (IsPlayer(FName)) {
if ([self readPlayerInfo:self.localPlayer]) {
self.isFire = Read<bool>(self.localPlayer.base + 0x1508); // Class: STExtraBaseCharacter.STExtraCharacter.UAECharacter.Character.Pawn.Actor.Object bool bIsWeaponFiring;
self.Gunads = Read<bool>(self.localPlayer.base + 0xf59); // Class: STExtraCharacter.UAECharacter.Character.Pawn.Actor.Object bool bIsGunADS;
///self.autofire = Read<bool>(localPlayerController + 0x3348); // Class:
auto weaponManagerComponent = GetPtr(self.localPlayer.base + 0x2018);
auto shootWeaponComponent = GetPtr(weaponManagerComponent + 0xe00);
ownerShootWeapon = GetPtr(shootWeaponComponent + 0x208);//done
BulletFlySpeed = Read<float>(shootWeaponComponent + 0x4e0);
}
} else {
ownerShootWeapon = 0;
}
} else {
self.localPlayer.base = 0;
}

auto playerCameraManager = GetPtr(localPlayerController + 0x458); // Class: PlayerController.Controller.Actor.Object PlayerCameraManager* PlayerCameraManager;
CameraCache = Read<CameraCacheEntry>(playerCameraManager + 0x430);// Class: PlayerCameraManager.Actor.Object CameraCacheEntry CameraCache;
POV = Read<MinimalViewInfo>(playerCameraManager + 0xf90 + 0x10);  // Class: CameraCacheEntry MinimalViewInfo POV;
controlRotation = localPlayerController + 0x3f0; // Class: Controller.Actor.Object Rotator ControlRotation;
return IsValidAddress(localPlayerController) && IsValidAddress(playerCameraManager);
}
string getStatus(uintptr_t statusAddr){
    if (statusAddr == 131070 || statusAddr == 131071 || statusAddr == 131072 || statusAddr == 131073 || statusAddr == 131074 || statusAddr == 131075) {
        return "Knocked";
    }
    return "";
}
- (bool)readPlayerInfo:(JFPlayer *)player {
auto rootComponent = GetPtr(player.base + 0x1a8); // Class: Actor.Object SceneComponent* RootComponent;
if ( IsValidAddress(rootComponent)) {
player.worldPos = Read<Vector3>(rootComponent + 0x160); // Class: BaseFPPComponent.ActorComponent.Object STExtraPlayerCharacter* Pawn;
player.distance = Vector3::Distance(player.worldPos, POV.Location) / 100.0f;
if (player.distance > self.overlayView.espDistance) return false;
} else {
return false;
}

player.hp = Read<float>(player.base +  0xcd0); // Class: STExtraCharacter.UAECharacter.Character.Pawn.Actor.Object float Health;
player.maxHp = Read<float>(player.base + 0xcd4); // Class: STExtraCharacter.UAECharacter.Character.Pawn.Actor.Object float HealthMax;
player.signalHP = Read<float>(player.base + 0xcd8); // Class: STExtraCharacter.UAECharacter.Character.Pawn.Actor.Object float SignalHP;
player.signalHPMax = Read<float>(player.base + 0xcdc); // Class: STExtraCharacter.UAECharacter.Character.Pawn.Actor.Object float PreSignalHP;
player.isFallDown = player.hp == 0;
player.teamNo = Read<int>(player.base + 0x8c8); // Class: UAECharacter.Character.Pawn.Actor.Object int TeamID;

player.isDead = Read<bool>(player.base + 0xcec); // Class: STExtraCharacter.UAECharacter.Character.Pawn.Actor.Object bool bDead;
player.state = Read<uint64_t>(player.base+0xea8);  // Class: STExtraCharacter.UAECharacter.Character.Pawn.Actor.Object uint64 CurrentStates;
//player.NearDeathBreath = Read<float>(player.base +  0x17d8);
uintptr_t statusAddr = GetPtr(player.base + 0xec0);
player.statusName = getStatus(statusAddr);
if (player.hp < 0 || player.maxHp <= 0|| player.teamNo > 1000 || player.isDead || (player.hp <= 0 && player.statusName != "Knocked")) {
    return false;
    }
// if (player.isDead) return false;
auto nameAddr = GetPtr(player.base + 0x880); // Class: UAECharacter.Character.Pawn.Actor.Object FString PlayerName;
if (IsValidAddress(nameAddr)) {
UTF8 name[32] = "";
UTF16 buf16[16] = {0};
_read(nameAddr, buf16, 28);
Utf16_To_Utf8(buf16, name, 28, strictConversion);
player.name = [NSString stringWithUTF8String:(const char *)name];
}

auto flagAdd = GetPtr(player.base + 0x890); // Class: UAECharacter.Character.Pawn.Actor.Object FString Nation;
if (IsValidAddress(flagAdd)) {
UTF8 flag[32] = "";
UTF16 buf116[16] = {0};
_read(flagAdd, buf116, 28);
Utf16_To_Utf8(buf116, flag, 28, strictConversion);
player.flag = [NSString stringWithUTF8String:(const char *)flag];
}
    auto idplayer = GetPtr(player.base + 0x8a8); // Class: UAECharacter.Character.Pawn.Actor.Object FString Nation;
    if (IsValidAddress(idplayer)) {
    UTF8 idpl[32] = "";
    UTF16 buf116[16] = {0};
    _read(idplayer, buf116, 28);
    Utf16_To_Utf8(buf116, idpl, 28, strictConversion);
    player.idpl = [NSString stringWithUTF8String:(const char *)idpl];
    }
player.playerKey = Read<UInt32>(player.base + 0x8a0); // Class: UAECharacter.Character.Pawn.Actor.Object uint32 PlayerKey;
player.isAI = Read<bool>(player.base + 0x958); // Class: UAECharacter.Character.Pawn.Actor.Object bool bIsAI;
Vector2 topScreenPos = WorldToScreen(Vector3(player.worldPos.X, player.worldPos.Y, player.worldPos.Z + 100), POV, SCREEN_WIDTH, SCREEN_HEIGHT);
Vector2 bottomScreenPos = WorldToScreen(Vector3(player.worldPos.X, player.worldPos.Y, player.worldPos.Z - 100), POV, SCREEN_WIDTH, SCREEN_HEIGHT);

float height = max<float>(bottomScreenPos.Y - topScreenPos.Y, 5.0f);
float width = height * 0.5f;
float x = topScreenPos.X - width * 0.5f;
float y = topScreenPos.Y;
player.box = CGRectMake(x , y, width, height);

auto mesh = GetPtr(player.base + 0x420); // Class: Character.Pawn.Actor.Object SkeletalMeshComponent* Mesh;
//auto mymesh = GetPtr(self.localPlayer.base + 0x438); // Class: Character.Pawn.Actor.Object SkeletalMeshComponent* Mesh;

if (IsValidAddress(mesh)) {
FTransform meshTrans = Read<FTransform>(mesh + 0x1a0); // Class: CharacterMovementComponent.PawnMovementComponent.NavMovementComponent.MovementComponent.ActorComponent.Object Character* CharacterOwner; - NotNot
FMatrix c2wMatrix = TransformToMatrix(meshTrans);
auto boneArray  = GetPtr(mesh + 0x798); // Class: StaticMeshComponent.MeshComponent.PrimitiveComponent.SceneComponent.ActorComponent.Object StaticMesh* StaticMesh;
if (IsValidAddress(boneArray)) {
BoneData boneData;
BoneVisibleData boneVisibleData;

player.isVisibleAim = [self lineOfSightToViewPoint:[self getBoneWorldPos:boneArray + self.overlayView.aimbotPart * 48 c2wMatrix:c2wMatrix]];
player.AimPos = WorldToScreen([self getBoneWorldPos:boneArray + self.overlayView.aimbotPart * 48 c2wMatrix:c2wMatrix], POV, SCREEN_WIDTH, SCREEN_HEIGHT);

Vector3 head = [self getBoneWorldPos:boneArray + 6 * 48 c2wMatrix:c2wMatrix];
boneData.head = WorldToScreen(head, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.head = [self lineOfSightToViewPoint:head];

Vector3 chest = [self getBoneWorldPos:boneArray + 4 * 48 c2wMatrix:c2wMatrix];
boneData.chest = WorldToScreen(chest, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.chest = [self lineOfSightToViewPoint:chest];

Vector3 pelvis = [self getBoneWorldPos:boneArray + 1 * 48 c2wMatrix:c2wMatrix];
boneData.pelvis = WorldToScreen(pelvis, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.pelvis = [self lineOfSightToViewPoint:pelvis];

Vector3 leftShoulder = [self getBoneWorldPos:boneArray + 12 * 48 c2wMatrix:c2wMatrix];
boneData.leftShoulder = WorldToScreen(leftShoulder, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.leftShoulder = [self lineOfSightToViewPoint:leftShoulder];

Vector3 rightShoulder = [self getBoneWorldPos:boneArray + 33 * 48 c2wMatrix:c2wMatrix];
boneData.rightShoulder = WorldToScreen(rightShoulder, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.rightShoulder = [self lineOfSightToViewPoint:rightShoulder];

Vector3 leftElbow = [self getBoneWorldPos:boneArray + 13 * 48 c2wMatrix:c2wMatrix];
boneData.leftElbow = WorldToScreen(leftElbow, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.leftElbow = [self lineOfSightToViewPoint:leftElbow];

Vector3 rightElbow = [self getBoneWorldPos:boneArray + 34 * 48 c2wMatrix:c2wMatrix];
boneData.rightElbow = WorldToScreen(rightElbow, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.rightElbow = [self lineOfSightToViewPoint:rightElbow];

Vector3 leftHand = [self getBoneWorldPos:boneArray + 14 * 48 c2wMatrix:c2wMatrix];
boneData.leftHand = WorldToScreen(leftHand, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.leftHand = [self lineOfSightToViewPoint:leftHand];

Vector3 rightHand = [self getBoneWorldPos:boneArray + 35 * 48 c2wMatrix:c2wMatrix];
boneData.rightHand = WorldToScreen(rightHand, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.rightHand = [self lineOfSightToViewPoint:rightHand];

Vector3 leftThigh = [self getBoneWorldPos:boneArray + 53 * 48 c2wMatrix:c2wMatrix];
boneData.leftThigh = WorldToScreen(leftThigh, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.leftThigh = [self lineOfSightToViewPoint:leftThigh];

Vector3 rightThigh = [self getBoneWorldPos:boneArray + 57 * 48 c2wMatrix:c2wMatrix];
boneData.rightThigh = WorldToScreen(rightThigh, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.rightThigh = [self lineOfSightToViewPoint:rightThigh];

Vector3 leftKnee = [self getBoneWorldPos:boneArray + 54 * 48 c2wMatrix:c2wMatrix];
boneData.leftKnee = WorldToScreen(leftKnee, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.leftKnee = [self lineOfSightToViewPoint:leftKnee];

Vector3 rightKnee = [self getBoneWorldPos:boneArray + 58 * 48 c2wMatrix:c2wMatrix];
boneData.rightKnee = WorldToScreen(rightKnee, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.rightKnee = [self lineOfSightToViewPoint:rightKnee];

Vector3 leftFoot = [self getBoneWorldPos:boneArray + 55 * 48 c2wMatrix:c2wMatrix];
boneData.leftFoot = WorldToScreen(leftFoot, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.leftFoot = [self lineOfSightToViewPoint:leftFoot];

Vector3 rightFoot = [self getBoneWorldPos:boneArray + 59 * 48 c2wMatrix:c2wMatrix];
boneData.rightFoot = WorldToScreen(rightFoot, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
boneVisibleData.rightFoot = [self lineOfSightToViewPoint:rightFoot];

player.boneData = boneData;
player.boneVisibleData = boneVisibleData;
}
}

player.Box3D = GetBox3D(Vector3(player.worldPos.X, player.worldPos.Y, player.worldPos.Z), Vector3(80.f, 80.f, 180.f));

//bool Shit = false;
// Vector3 EntityPos = WorldToRadar(Vector3(player.worldPos.X, player.worldPos.Y, player.worldPos.Z + 100), Vector3(self.localPlayer.worldPos.X, self.localPlayer.worldPos.Y, self.localPlayer.worldPos.Z + 100), x, y, Vector3(SCREEN_WIDTH, SCREEN_HEIGHT, 0), Shit);

Vector2 EntityPos = FindScreenEdge(Vector3(player.worldPos.X, player.worldPos.Y, player.worldPos.Z + 100), x, y, {(float)SCREEN_WIDTH ,(float)SCREEN_HEIGHT}, 0);

int radar_range = 30;
Vector3 Angle;
Vector3 SetAngle = Vector3((float)(SCREEN_WIDTH / 2) - EntityPos.X, (float)(SCREEN_HEIGHT / 2) - EntityPos.Y, 0.f);
VectorAnglesRadar(SetAngle, Angle);

const auto angle_yaw_rad = DEG2RAD(Angle.Y + 180.f);
const auto new_point_x = (SCREEN_WIDTH / 2) + (radar_range) / 2 * 8 * cosf(angle_yaw_rad);
const auto new_point_y = (SCREEN_HEIGHT / 2) + (radar_range) / 2 * 8 * sinf(angle_yaw_rad);

std::array<Vector3, 3> points {
Vector3(new_point_x - ((90) / 4 + 3.5f) / 2, new_point_y - ((radar_range) / 4 + 3.5f) / 2, 0),
Vector3(new_point_x + ((90) / 4 + 3.5f) / 4, new_point_y, 0),
Vector3(new_point_x - ((90) / 4 + 3.5f) / 2, new_point_y + ((radar_range) / 4 + 3.5f) / 2, 0)
};

RotateTriangle(points, Angle.Y + 180.f);
Arrow Arrow;
Arrow.s1 = CGPointMake(points.at(0).X, points.at(0).Y);
Arrow.s2 = CGPointMake(points.at(1).X, points.at(1).Y);
Arrow.s3 = CGPointMake(points.at(2).X, points.at(2).Y);
player.Arrow = Arrow;

player.isVisible = [self lineOfSightToViewPoint:Vector3(player.worldPos.X, player.worldPos.Y, player.worldPos.Z + 100)];
return true;
}

- (bool)lineOfSightToViewPoint:(Vector3)viewPoint {
if (!IsValidAddress(self.localPlayer.base) || !IsValidAddress(localPlayerController)) {
return false;
}
return reinterpret_cast<bool(__fastcall *)(kaddr, kaddr, Vector3*, bool)>(GetRealOffset(Offsets::LineOfSightTo_Func))(localPlayerController, self.localPlayer.base, &viewPoint, false);
}

- (Vector3)getBoneWorldPos:(kaddr)base index:(int)index {
auto mesh = GetPtr(base + 0x420); // Class: Character.Pawn.Actor.Object SkeletalMeshComponent* Mesh;
if (IsValidAddress(mesh)) {
FTransform meshTrans = Read<FTransform>(mesh + 0x1a0); // Class: CharacterMovementComponent.PawnMovementComponent.NavMovementComponent.MovementComponent.ActorComponent.Object Character* CharacterOwner; - NotNot
FMatrix c2wMatrix = TransformToMatrix(meshTrans);
auto boneArray = GetPtr(mesh + 0x798); // Class: StaticMeshComponent.MeshComponent.PrimitiveComponent.SceneComponent.ActorComponent.Object StaticMesh* StaticMesh;
if (IsValidAddress(boneArray)) {
FTransform boneTrans = Read<FTransform>(boneArray + index * 48);
FMatrix boneMatrix = TransformToMatrix(boneTrans);
return MatrixToVector(MatrixMulti(boneMatrix, c2wMatrix));
}
}
return Vector3();
}

- (Vector2)getBoneScreenPos:(kaddr)boneTransAddr c2wMatrix:(FMatrix)c2wMatrix {
FTransform boneTrans = Read<FTransform>(boneTransAddr);
FMatrix boneMatrix = TransformToMatrix(boneTrans);
Vector3 relLocation = MatrixToVector(MatrixMulti(boneMatrix, c2wMatrix));
return WorldToScreen(relLocation, POV, SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (Vector3)getBoneWorldPos:(kaddr)boneTransAddr c2wMatrix:(FMatrix)c2wMatrix {
FTransform boneTrans = Read<FTransform>(boneTransAddr);
FMatrix boneMatrix = TransformToMatrix(boneTrans);
return MatrixToVector(MatrixMulti(boneMatrix, c2wMatrix));
}

- (void)localPlayerAction {
[self WeaponData];
[self Aimbot];
}

- (void)WeaponData {
auto weaponManagerComponent = GetPtr(self.localPlayer.base + 0x2008);
auto curwepaon = GetPtr(weaponManagerComponent + 0x4f0);
auto shootWeaponComponent = GetPtr(curwepaon + 0xf68);
if ((self.overlayView.isNorecoil)) {
float AccessoriesVRecoilFactor = Read<float>(shootWeaponComponent + 0xaa8);
float AccessoriesHRecoilFactor = Read<float>(shootWeaponComponent + 0xaac);
float AccessoriesRecoveryFactor = Read<float>(shootWeaponComponent + 0xab0);
float srecoil =Read<float>(shootWeaponComponent + 0xa38);
if (AccessoriesRecoveryFactor != 0.001 && srecoil != 0.001 && AccessoriesVRecoilFactor != 0.001 && AccessoriesHRecoilFactor != 0.001) {
Write<float>(shootWeaponComponent + 0xaa8, 0.001);
Write<float>(shootWeaponComponent + 0xaac, 0.001);
Write<float>(shootWeaponComponent + 0xab0, 0.001);
Write<float>(shootWeaponComponent + 0xbb8, 0.001);
Write<float>(shootWeaponComponent + 0xa38, 0.001);//SRecoilInfo RecoilInfo;
Write<float>(shootWeaponComponent + 0xab4, 0.001);//SDeviation DeviationInfo;
Write<float>(shootWeaponComponent + 0xbd8, 0.001);//float AnimationKick;
//Write<float>(shootWeaponComponent + 0x250, 0.001);
//Write<float>(shootWeaponComponent + 0x254, 0.001);
//Write<float>(shootWeaponComponent + 0x258, 0.001);
}
}
if (self.overlayView.NoSpread) {
if (IsValidAddress(shootWeaponComponent)) {
float GameDeviationFactor = Read<float>(shootWeaponComponent + 0xb04);
float ShotGunHorizontalSpread = Read<float>(shootWeaponComponent + 0xb00);
float ShotGunVerticalSpread = Read<float>(shootWeaponComponent + 0xafc);
if (GameDeviationFactor != 0.001 && ShotGunHorizontalSpread != 0.001 && ShotGunVerticalSpread != 0.001) {
Write<float>(shootWeaponComponent + 0xb04, 0.001);
Write<float>(shootWeaponComponent + 0xb00, 0.001);
Write<float>(shootWeaponComponent + 0xafc, 0.001);
}
}
}
if (self.overlayView.isBigx) {
if (IsValidAddress(shootWeaponComponent)) {
float ExtraHitPerformScale =Read<float>(shootWeaponComponent + 0xbbc);
if (ExtraHitPerformScale != 50.0f)
{
Write<float>(shootWeaponComponent + 0xbbc, 50.0f);
}

}
}
if (self.overlayView.isInstanthit) {
if (IsValidAddress(shootWeaponComponent)) {
float BulletFireSpeed =Read<float>(shootWeaponComponent + 0x4e0);
if (BulletFireSpeed != 800000)
{
Write<float>(shootWeaponComponent + 0x4e0, 800000);

}

}

}
if (self.overlayView.FastSwitchWeapon) {
if (IsValidAddress(shootWeaponComponent)) {
float SwitchWeaponSpeedScale =Read<float>(self.localPlayer.base + 0x25d8);

if (SwitchWeaponSpeedScale != 100)
{
Write<float>(self.localPlayer.base + 0x25d8, 100);

}

}
}

if (self.overlayView.speedp) {

Write<float>(self.localPlayer.base + 0x2500, 999);//float HighWalkSpeed;
Write<float>(self.localPlayer.base + 0x2504, 999);//float WalkSpeedChangeRate;
Write<float>(self.localPlayer.base + 0x2508, 999);//float WalkSpeedThreshold;
Write<float>(self.localPlayer.base + 0x250c, 999);//float MaxCrouchSpeed;
Write<float>(self.localPlayer.base + 0x2510, 999);//float MaxProneSpeed;
Write<float>(self.localPlayer.base + 0x2514, 999);//float MaxSprintSpeed;
Write<float>(self.localPlayer.base + 0x2518, 999);//float MaxSprintSpeed;



}
if (self.overlayView.SpeedFire) {
if (IsValidAddress(shootWeaponComponent)) {
float ShootInterval = Read<float>(shootWeaponComponent + 0x510);
float BaseImpactDamage = Read<float>(shootWeaponComponent + 0x604);
float VehicleDamageScale = Read<float>(shootWeaponComponent + 0x608);
if (ShootInterval != 0.030303f && BaseImpactDamage != 100 && VehicleDamageScale != 100){
Write<float>(shootWeaponComponent + 0x510, 0.030303f);
Write<float>(shootWeaponComponent + 0x62c, 100);
Write<float>(shootWeaponComponent + 0x630, 100);
}
}
}

}

void (*orig_shoot_event)(void *thiz , Vector3 start, FRotator rotation, void *unk1, int unk2) = 0;
void shoot_event(void *thiz, Vector3 start, FRotator rotation, void *weapon, int unk1) {
rotation = Rotation;
return orig_shoot_event(thiz, start, rotation, weapon, unk1);
}

- (void)Aimbot {
if (!(self.overlayView.isAimbot || self.overlayView.isBulletTrack)) return;
[self AimPlayer];
auto mesh = GetPtr(self.lockActor + 0x420); // Class: Character.Pawn.Actor.Object SkeletalMeshComponent* Mesh;
//JFPlayer *player;
bool isVisibleAim;
if (IsValidAddress(mesh)) {
FTransform meshTrans = Read<FTransform>(mesh + 0x1a0); // Class: CharacterMovementComponent.PawnMovementComponent.NavMovementComponent.MovementComponent.ActorComponent.Object Character* CharacterOwner; - NotNot
FMatrix c2wMatrix = TransformToMatrix(meshTrans);
auto boneArray  = GetPtr(mesh + 0x798); // Class: StaticMeshComponent.MeshComponent.PrimitiveComponent.SceneComponent.ActorComponent.Object StaticMesh* StaticMesh;
if (IsValidAddress(boneArray)) {
isVisibleAim = [self lineOfSightToViewPoint:[self getBoneWorldPos:boneArray + self.overlayView.aimbotPart * 48 c2wMatrix:c2wMatrix]];
}
}

//}
if (self.isFire || self.Gunads) {

if (IsValidAddress(self.lockActor)) {
float targetHp = Read<float>(self.lockActor + 0xcd0);
float localPlayerHp = Read<float>(self.localPlayer.base + 0xcd4);
if (targetHp >= 0 && localPlayerHp > 0) {

if (self.overlayView.isAimbot) {
Vector3 lockBoneV3 = [self getBoneWorldPos:self.lockActor index:self.overlayView.aimbotPart];
    Vector3 diffV3 = lockBoneV3 - POV.Location,Angle;
    Angle.Y = atan2f(diffV3.Z, sqrt(diffV3.X * diffV3.X + diffV3.Y * diffV3.Y)) * 180 /3.141592654f;
    Angle.X = atan2f(diffV3.Y, diffV3.X) * 180 /3.141592654f;

Write<float>(controlRotation, Angle.Y);
Write<float>(controlRotation + 0x4, Angle.X);


}
self.lockActor = 0;
self.isFire=false;
}else
{
//self.Gunads = false;
self.lockActor = 0;
self.isFire=false;

}
}
}else
{
self.isFire=false;
//ßself.Gunads = false;
self.lockActor = 0;
}
}

- (void)AimPlayer {
if (IsValidAddress(self.lockActor)) {
for (JFPlayer *player in self.playerList) {
if (self.lockActor == player.base) {
player.isBestAimTarget = true;
}
}
return;
}

JFPlayer *bestAimPlayer = nil;
float minCrossCenter = 100000;
for (JFPlayer *player in self.playerList) {
player.isBestAimTarget = false;
float crossCenter = Vector2::Distance(Vector2(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5), Vector2(CGRectGetMidX(player.box), CGRectGetMidY(player.box)));
if (player.isVisible &&
player.type == PlayerTypeEnemy &&
player.hp >= 0 && 
( ([getcheck boolForKey:@"aimbotfor"] && player.distance <= self.overlayView.aimbotRadius) || 
(![getcheck boolForKey:@"aimbotfor"] && crossCenter <= self.overlayView.aimbotRadius) ) &&
!(self.overlayView.isNearDeathNotAim && player.hp == 0)){
if (crossCenter < minCrossCenter) {
minCrossCenter = crossCenter;
bestAimPlayer = player;
}
}
}

if (bestAimPlayer) {
bestAimPlayer.isBestAimTarget = true;
self.lockActor = bestAimPlayer.base;
bestAimPlayer = nil;
}
}

- (JFOverlayView *)overlayView {
if (!_overlayView) {
_overlayView = [[JFOverlayView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}
return _overlayView;
}
@end


