// www.rohitab.com/discuss/topic/39611-malware-related-compile-time-hacks-with-c11/
// github.com/Rednick16/cpp11-compile-time-string-obfuscation

#include <stdio.h>
#include <stdint.h>

// ------------------------------------------------ ------------- //
// "Hack thời gian biên dịch có liên quan đến phần mềm độc hại với C 11" của LeFF //
// Bạn có thể sử dụng mã này theo cách bạn muốn, tôi thực sự không thực sự //
// chê bai, nhưng nếu bạn cảm thấy tôn trọng tôi, làm ơn //
// không cắt chú thích này khi sao chép-dán ... ;-) //
// ------------------------------------------------ ------------- //

#if defined(_MSC_VER)
#define ALWAYS_INLINE __forceinline
#else 
#define ALWAYS_INLINE __attribute__((always_inline))
#endif
 
// Ví dụ sử dụng:
void setup()    __attribute__((noinline));
void startAuthentication()  __attribute__((noinline));

#ifndef seed
// Tôi sử dụng hiện tại (thời gian biên dịch) làm hạt giống
    // Chuyển chuỗi thời gian (hh: mm: ss) thành một số
    constexpr int seedToInt(char c) { return c - '0'; }
    const int seed = seedToInt(__TIME__[7]) +
                     seedToInt(__TIME__[6]) * 10 +
                     seedToInt(__TIME__[4]) * 60 +
                     seedToInt(__TIME__[3]) * 600 +
                     seedToInt(__TIME__[1]) * 3600 +
                     seedToInt(__TIME__[0]) * 36000;
#endif

// Mẫu hằng số được sử dụng để đảm bảo rằng kết quả của constexpr
// hàm sẽ được tính tại thời gian biên dịch thay vì thời gian chạy

template <uintptr_t Const> struct 
vxCplConstantify { enum { Value = Const }; };

// Chế độ thời gian biên dịch của trình tạo số giả ngẫu nhiên đồng dư tuyến tính,
// thuật toán thực tế được lấy từ "Numerical Recipes" sách
constexpr uintptr_t vxCplRandom(uintptr_t Id)
{ return (1013904223 + 1664525 * ((Id > 0) ? (vxCplRandom(Id - 1)) : (/*vxCPLSEED*/seed))) & 0xFFFFFFFF; }

// Các macro ngẫu nhiên thời gian biên dịch, có thể được sử dụng để thực thi ngẫu nhiên
// đường dẫn cho các bản dựng riêng biệt hoặc tạo mã thùng rác theo thời gian biên dịch

#define vxRANDOM(Min, Max) (Min + (vxRAND() % (Max - Min + 1)))
#define vxRAND()           (vxCplConstantify<vxCplRandom(__COUNTER__ + 1)>::Value)

// Mod đệ quy thời gian biên dịch của thuật toán băm chuỗi,
// thuật toán thực tế được lấy từ thư viện Qt (cái này
// hàm không phân biệt chữ hoa chữ thường do vxCplTolower)
constexpr char   vxCplTolower(char Ch)                { return (Ch >= 'A' && Ch <= 'Z') ? (Ch - 'A' + 'a') : (Ch); }
constexpr uintptr_t vxCplHashPart3(char Ch, uintptr_t Hash) { return ((Hash << 4) + vxCplTolower(Ch)); }
constexpr uintptr_t vxCplHashPart2(char Ch, uintptr_t Hash) { return (vxCplHashPart3(Ch, Hash) ^ ((vxCplHashPart3(Ch, Hash) & 0xF0000000) >> 23)); }
constexpr uintptr_t vxCplHashPart1(char Ch, uintptr_t Hash) { return (vxCplHashPart2(Ch, Hash) & 0x0FFFFFFF); }
constexpr uintptr_t vxCplHash(const char* Str)           { return (*Str) ? (vxCplHashPart1(*Str, vxCplHash(Str + 1))) : (0); }

// Macro băm thời gian biên dịch, các giá trị băm thay đổi bằng cách sử dụng số giả ngẫu nhiên đầu tiên trong chuỗi
#define HASH(Str) (uintptr_t)(vxCplConstantify<vxCplHash(Str)>::Value ^ vxCplConstantify<vxCplRandom(1)>::Value)

// Trình tạo thời gian biên dịch cho danh sách các chỉ mục (0, 1, 2, ...)
template <uintptr_t...> struct vxCplIndexList {};
template <typename  IndexList, uintptr_t Right> struct vxCplAppend;
template <uintptr_t... Left,      uintptr_t Right> struct vxCplAppend<vxCplIndexList<Left...>, Right> { typedef vxCplIndexList<Left..., Right> Result; };
template <uintptr_t N> struct vxCplIndexes { typedef typename vxCplAppend<typename vxCplIndexes<N - 1>::Result, N - 1>::Result Result; };
template <> struct vxCplIndexes<0> { typedef vxCplIndexList<> Result; };

// Mã hóa chuỗi thời gian biên dịch của một ký tự
const char vxCplEncryptCharKey = (const char)vxRANDOM(0, 0xFF);
constexpr char ALWAYS_INLINE vxCplEncryptChar(const char Ch, uintptr_t Idx) { return Ch ^ (vxCplEncryptCharKey + Idx); }

// Lớp mã hóa chuỗi thời gian biên dịch
template <typename IndexList> struct vxCplEncryptedString;
template <uintptr_t... Idx> struct vxCplEncryptedString<vxCplIndexList<Idx...> >
{
    char Value[sizeof...(Idx) + 1]; // Buffer for a string

    // Hàm tạo thời gian biên dịch
    constexpr ALWAYS_INLINE vxCplEncryptedString(const char* const Str)  
    : Value{ vxCplEncryptChar(Str[Idx], Idx)... } {}

    // Giải mã thời gian chạy
    inline const char* decrypt()
    {
        for(uintptr_t t = 0; t < sizeof...(Idx); t++)
        { this->Value[t] = this->Value[t] ^ (vxCplEncryptCharKey + t); }
        this->Value[sizeof...(Idx)] = '\0'; return this->Value;
    }
};

// Macro mã hóa chuỗi thời gian biên dịch

#define ENCRYPT(Str) (vxCplEncryptedString<vxCplIndexes<sizeof(Str) - 1>::Result>(Str).decrypt())

#ifdef __APPLE__
// Thời gian biên dịch macro mã hóa chuỗi Objective-c

#define NSSENCRYPT(Str) @(ENCRYPT(Str))
#endif

// Macro mã hóa chuỗi bù đắp theo thời gian biên dịch, chuyển đổi trở lại uint64_t.

#define ENCRYPTOFFSET(Str) strtoull(ENCRYPT(Str), NULL, 0)

// Macro mã hóa chuỗi hex theo thời gian biên dịch, tương tự như ENCRYPT, nhưng cách đặt tên rõ ràng hơn.

#define ENCRYPTHEX(Str) ENCRYPT(Str)
