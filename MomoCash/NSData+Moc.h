//
//  NSData+Moc.h
//  MomoCash
//
//  Created by weipeng.mao on 2018/7/2.
//  Copyright © 2018年 Aaron Voisine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IntTypes.h"
typedef signed int            int32_t;


@interface NSData (Moc)
-(UInt256)x11;
-(UInt512)blake512;
-(UInt512)bmw512;
-(UInt512)groestl512;
-(UInt512)skein512;
-(UInt512)jh512;
-(UInt512)keccak512;
-(UInt512)luffa512;
-(UInt512)cubehash512;
-(UInt512)shavite512;
-(UInt512)simd512;
-(UInt512)echo512;
-(UInt256)Neoscrypt;

+ (NSData *)dataFromHexString:(NSString *)string;

@end
