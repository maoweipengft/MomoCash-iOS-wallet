//
//  NSData+Moc.m
//  MomoCash
//
//  Created by weipeng.mao on 2018/7/2.
//  Copyright © 2018年 Aaron Voisine. All rights reserved.
//

#import "NSData+Moc.h"
#import "Blake.c"
#import "Bmw.c"
#import "CubeHash.c"
#import "Groestl.c"
#import "Echo.c"
#import "Jh.c"
#import "Keccak.c"
#import "Luffa.c"
#import "Shavite.c"
#import "Simd.c"
#import "Skein.c"
#import "Neoscrypt.h"

@implementation NSData (Moc)
-(UInt512)blake512{
    UInt512 blakeData;
    
    sph_blake_big_context ctx_blake;
    sph_blake512_init(&ctx_blake);
    sph_blake512(&ctx_blake, self.bytes, self.length);
    sph_blake512_close(&ctx_blake, &blakeData);
    return blakeData;
}

-(UInt512)bmw512 {
    UInt512 bmwData;
    sph_bmw_big_context ctx_bmw;
    sph_bmw512_init(&ctx_bmw);
    sph_bmw512(&ctx_bmw, self.bytes, self.length);
    sph_bmw512_close(&ctx_bmw, &bmwData);
    return bmwData;
}

-(UInt512)groestl512{
    UInt512 groestlData;
    
    sph_groestl_big_context ctx_groestl;
    sph_groestl512_init(&ctx_groestl);
    sph_groestl512(&ctx_groestl, self.bytes, self.length);
    sph_groestl512_close(&ctx_groestl, &groestlData);
    return groestlData;
}

-(UInt512)skein512 {
    UInt512 skeinData;
    sph_skein_big_context ctx_skein;
    sph_skein512_init(&ctx_skein);
    sph_skein512(&ctx_skein, self.bytes, self.length);
    sph_skein512_close(&ctx_skein, &skeinData);
    return skeinData;
}

-(UInt512)jh512 {
    UInt512 jhData;
    sph_jh_context ctx_jh;
    sph_jh512_init(&ctx_jh);
    sph_jh512(&ctx_jh, self.bytes, self.length);
    sph_jh512_close(&ctx_jh, &jhData);
    return jhData;
}
//-(void)setNVersion:(int32_t)nVersion
//{
//    self.nVersion = nVersion;
//}


-(UInt512)keccak512{
    UInt512 keccakData;
    
    sph_keccak_context ctx_keccak;
    sph_keccak512_init(&ctx_keccak);
    sph_keccak512(&ctx_keccak, self.bytes, self.length);
    sph_keccak512_close(&ctx_keccak, &keccakData);
    return keccakData;
}

-(UInt512)luffa512{
    UInt512 luffaData;
    sph_luffa512_context ctx_luffa;
    sph_luffa512_init(&ctx_luffa);
    sph_luffa512(&ctx_luffa, self.bytes, self.length);
    sph_luffa512_close(&ctx_luffa, &luffaData);
    return luffaData;
}

-(UInt512)cubehash512 {
    UInt512 cubehashData;
    
    sph_cubehash_context ctx_cubehash;
    sph_cubehash512_init(&ctx_cubehash);
    sph_cubehash512(&ctx_cubehash, self.bytes, self.length);
    sph_cubehash512_close(&ctx_cubehash, &cubehashData);
    return cubehashData;
}

-(UInt512)shavite512 {
    UInt512 shaviteData;
    
    sph_shavite_big_context ctx_shavite;
    sph_shavite512_init(&ctx_shavite);
    sph_shavite512(&ctx_shavite, self.bytes, self.length);
    sph_shavite512_close(&ctx_shavite, &shaviteData);
    return shaviteData;
}

-(UInt512)simd512 {
    UInt512 simdData;
    
    sph_simd_big_context ctx_simd;
    sph_simd512_init(&ctx_simd);
    sph_simd512(&ctx_simd, self.bytes, self.length);
    sph_simd512_close(&ctx_simd, &simdData);
    return simdData;
}

-(UInt512)echo512 {
    UInt512 echoData;
    sph_echo_big_context ctx_echo;
    sph_echo512_init(&ctx_echo);
    sph_echo512(&ctx_echo, self.bytes, self.length);
    sph_echo512_close(&ctx_echo, &echoData);
    return echoData;
}

-(UInt256)Neoscrypt
{
    unsigned int profile = 0x0;
    UInt256 hash;
    neoscrypt((uchar *) self.bytes, (uchar *) &hash, profile);
    return hash;
    
}

//-(NSString *)verificationWithNumber:(NSString *)Number{
//
//    unsigned char css[10];
//
//    memcpy(css, [Number cStringUsingEncoding:NSASCIIStringEncoding], [Number length]);
//
//    unsigned int OUTPUT[4];
//
//    verification(css,OUTPUT);
//
//    NSMutableArray *ary = [NSMutableArray array];
//
//    for(int i = 0; i< 4; ++i) {
//
//        [ary addObject:[NSString stringWithFormat:@"%04X", OUTPUT[i]]];
//    }
//
//    NSString *str = [ary componentsJoinedByString:@"-"];
//
//    NSLog(@"str = %@", str);
//
//    return str;
//}

- (UInt256)x11
{
    NSData * copy = [self copy];
    UInt512 x11Data = UINT512_ZERO;
    
    sph_blake_big_context ctx_blake;
    sph_blake512_init(&ctx_blake);
    sph_blake512(&ctx_blake, copy.bytes, copy.length);
    sph_blake512_close(&ctx_blake, &x11Data);
    
    sph_bmw_big_context ctx_bmw;
    sph_bmw512_init(&ctx_bmw);
    sph_bmw512(&ctx_bmw, &x11Data, 64);
    sph_bmw512_close(&ctx_bmw, &x11Data);
    
    sph_groestl_big_context ctx_groestl;
    sph_groestl512_init(&ctx_groestl);
    sph_groestl512(&ctx_groestl, &x11Data, 64);
    sph_groestl512_close(&ctx_groestl, &x11Data);
    
    sph_skein_big_context ctx_skein;
    sph_skein512_init(&ctx_skein);
    sph_skein512(&ctx_skein, &x11Data, 64);
    sph_skein512_close(&ctx_skein, &x11Data);
    
    sph_jh_context ctx_jh;
    sph_jh512_init(&ctx_jh);
    sph_jh512(&ctx_jh, &x11Data, 64);
    sph_jh512_close(&ctx_jh, &x11Data);
    
    sph_keccak_context ctx_keccak;
    sph_keccak512_init(&ctx_keccak);
    sph_keccak512(&ctx_keccak, &x11Data, 64);
    sph_keccak512_close(&ctx_keccak, &x11Data);
    
    sph_luffa512_context ctx_luffa;
    sph_luffa512_init(&ctx_luffa);
    sph_luffa512(&ctx_luffa, &x11Data, 64);
    sph_luffa512_close(&ctx_luffa, &x11Data);
    
    sph_cubehash_context ctx_cubehash;
    sph_cubehash512_init(&ctx_cubehash);
    sph_cubehash512(&ctx_cubehash, &x11Data, 64);
    sph_cubehash512_close(&ctx_cubehash, &x11Data);
    
    sph_shavite_big_context ctx_shavite;
    sph_shavite512_init(&ctx_shavite);
    sph_shavite512(&ctx_shavite, &x11Data, 64);
    sph_shavite512_close(&ctx_shavite, &x11Data);
    
    sph_simd_big_context ctx_simd;
    sph_simd512_init(&ctx_simd);
    sph_simd512(&ctx_simd, &x11Data, 64);
    sph_simd512_close(&ctx_simd, &x11Data);
    
    UInt256 rData = UINT256_ZERO;
    
    sph_echo_big_context ctx_echo;
    sph_echo512_init(&ctx_echo);
    sph_echo512(&ctx_echo, &x11Data, 64);
    echo_big_close(&ctx_echo, 0,0,&rData,16);
    
    
    return rData;
    
}

+ (NSData *)dataFromHexString:(NSString *)string
{
    string = [string lowercaseString];
    NSMutableData *data= [NSMutableData new];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i = 0;
    NSUInteger length = string.length;
    while (i < length-1) {
        char c = [string characterAtIndex:i++];
        if (c < '0' || (c > '9' && c < 'a') || c > 'f')
            continue;
        byte_chars[0] = c;
        byte_chars[1] = [string characterAtIndex:i++];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    return data;
}
@end
