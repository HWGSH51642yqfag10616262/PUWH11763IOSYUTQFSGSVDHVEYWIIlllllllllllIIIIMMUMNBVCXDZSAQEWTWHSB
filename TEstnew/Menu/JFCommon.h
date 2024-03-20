#ifndef JFCommon_h
#define JFCommon_h

//
//  Created BY 2U on 2021/6/31
//  B.Y QQ  654153159
//  仅供学习交流


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

typedef long kaddr;

struct Vector2 {
    float X;
    float Y;

    Vector2() {
        this->X = 0;
        this->Y = 0;
    }

    Vector2(float x, float y) {
        this->X = x;
        this->Y = y;
    }

    static Vector2 Zero() {
        return Vector2(0.0f, 0.0f);
    }

    static float Distance(Vector2 a, Vector2 b) {
        Vector2 vector = Vector2(a.X - b.X, a.Y - b.Y);
        return sqrt((vector.X * vector.X) + (vector.Y * vector.Y));
    }

    bool operator!=(const Vector2 &src) const {
        return (src.X != X) || (src.Y != Y);
    }

    Vector2 &operator+=(const Vector2 &v) {
        X += v.X;
        Y += v.Y;
        return *this;
    }

    Vector2 &operator-=(const Vector2 &v) {
        X -= v.X;
        Y -= v.Y;
        return *this;
    }
};

struct Vector3 {
    float X;
    float Y;
    float Z;

    Vector3() {
        this->X = 0;
        this->Y = 0;
        this->Z = 0;
    }

    Vector3(float x, float y, float z) {
        this->X = x;
        this->Y = y;
        this->Z = z;
    }
    
    Vector3 operator*(const Vector3 &v) const {
        return Vector3(X * v.X, Y * v.Y, Z * v.Z);
    }

    Vector3 operator+(const Vector3 &v) const {
        return Vector3(X + v.X, Y + v.Y, Z + v.Z);
    }

    Vector3 operator-(const Vector3 &v) const {
        return Vector3(X - v.X, Y - v.Y, Z - v.Z);
    }

    bool operator==(const Vector3 &v) {
        return X == v.X && Y == v.Y && Z == v.Z;
    }

    bool operator!=(const Vector3 &v) {
        return !(X == v.X && Y == v.Y && Z == v.Z);
    }
    
    Vector3 operator*(float scalar) const {
        return Vector3(X * scalar, Y * scalar, Z * scalar);
    }

    static Vector3 Zero() {
        return Vector3(0.0f, 0.0f, 0.0f);
    }

    static float Dot(Vector3 lhs, Vector3 rhs) {
        return (((lhs.X * rhs.X) + (lhs.Y * rhs.Y)) + (lhs.Z * rhs.Z));
    }

    static float Distance(Vector3 a, Vector3 b) {
        Vector3 vector = Vector3(a.X - b.X, a.Y - b.Y, a.Z - b.Z);
        return sqrt(((vector.X * vector.X) + (vector.Y * vector.Y)) + (vector.Z * vector.Z));
    }
};

struct MyRect {
    float X;
    float Y;
    float Width;
    float Height;

    MyRect() {
        this->X = 0;
        this->Y = 0;
        this->Width = 0;
        this->Height = 0;
    }

    MyRect(float x, float y, float width, float height) {
        this->X = x;
        this->Y = y;
        this->Width = width;
        this->Height = height;
    }

    float GetCenterX() {
        return this->X + this->Width * 0.5f;
    }

    float GetCenterY() {
        return this->Y + this->Height * 0.5f;
    }

    float GetMaxX() {
        return this->X + this->Width;
    }

    float GetMaxY() {
        return this->Y + this->Height;
    }

    bool operator==(const MyRect &src) const {
        return (src.X == this->X && src.Y == this->Y && src.Height == this->Height &&
                src.Width == this->Width);
    }

    bool operator!=(const MyRect &src) const {
        return (src.X != this->X && src.Y != this->Y && src.Height != this->Height &&
                src.Width != this->Width);
    }
};

struct FMatrix {
    float Matrix[4][4];

    float *operator[](int index) {
        return Matrix[index];
    }
};

struct Quat {
    float x;
    float y;
    float z;
    float w;
};

struct FTransform {
    Quat Rotation;
    Vector3 Translation;
    float w;
    Vector3 Scale3D;
};

struct FRotator {
    float Pitch;
    float Yaw;
    float Roll;
    
    
};

struct MinimalViewInfo {
    Vector3 Location;
    Vector3 LocationLocalSpace;
    FRotator Rotation;
    float FOV;
};

struct CameraCacheEntry {
    float TimeStamp;
    char chunks[0xC];
    MinimalViewInfo POV;
};

struct BoneData
{
    Vector2 head;
    Vector2 chest;
    Vector2 leftShoulder;
    Vector2 rightShoulder;
    Vector2 leftElbow;
    Vector2 rightElbow;
    Vector2 leftHand;
    Vector2 rightHand;
    Vector2 pelvis;
    Vector2 leftThigh;
    Vector2 rightThigh;
    Vector2 leftKnee;
    Vector2 rightKnee;
    Vector2 leftFoot;
    Vector2 rightFoot;
};


struct BoneVisibleData
{
    bool head;
    bool chest;
    bool leftShoulder;
    bool rightShoulder;
    bool leftElbow;
    bool rightElbow;
    bool leftHand;
    bool rightHand;
    bool pelvis;
    bool leftThigh;
    bool rightThigh;
    bool leftKnee;
    bool rightKnee;
    bool leftFoot;
    bool rightFoot;
};

struct Box3D
{
    Vector2 s1;
    Vector2 s2;
    Vector2 s3;
    Vector2 s4;
    Vector2 s5;
    Vector2 s6;
    Vector2 s7;
    Vector2 s8;
};

struct Arrow
{
    CGPoint s1;
    CGPoint s2;
    CGPoint s3;
};


typedef enum : NSUInteger {
    PlayerTypeMyself,
    PlayerTypeTeam,
    PlayerTypeEnemy
} PlayerType;

typedef enum : NSUInteger {
    PropsTypeVehicle,
    PropsTypeWeapon,
    PropsTypeArmor,
    PropsTypeSight,
    PropsTypeAccessory,
    PropsTypeBullet,
    PropsTypeDrug,
    PickUpListWrapperActor,
    AirDropBox,
    Flaregun,
    PropsTypeBox,
    PropsTypeEarlyWarning,
    PropsTypeOther,
    PropsTypeNone
} PropsType;

#endif //QQ97184668
