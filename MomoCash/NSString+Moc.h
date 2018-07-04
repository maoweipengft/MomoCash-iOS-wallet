//
//  NSString+Moc.h
//  MomoCash
//
//  Created by weipeng.mao on 2018/7/2.
//  Copyright © 2018年 Aaron Voisine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define MoMo_PUBKEY_ADDRESS      50
#define MoMo_SCRIPT_ADDRESS      16
#define MoMo_PUBKEY_ADDRESS_TEST 140
#define MoMo_SCRIPT_ADDRESS_TEST 19
#define MoMo_PRIVKEY             204
#define MoMo_PRIVKEY_TEST        239

#define BIP38_NOEC_PREFIX      0x0142
#define BIP38_EC_PREFIX        0x0143
#define BIP38_NOEC_FLAG        (0x80 | 0x40)
#define BIP38_COMPRESSED_FLAG  0x20
#define BIP38_LOTSEQUENCE_FLAG 0x04
#define BIP38_INVALID_FLAG     (0x10 | 0x08 | 0x02 | 0x01)
@interface NSString (Moc)


+ (NSString *)addressWithScriptPubKey:(NSData *)script;
+ (NSString *)addressWithScriptSig:(NSData *)script;

- (NSAttributedString*)attributedStringForDashSymbol;
- (NSAttributedString*)attributedStringForDashSymbolWithTintColor:(UIColor*)color;
- (NSAttributedString*)attributedStringForDashSymbolWithTintColor:(UIColor*)color dashSymbolSize:(CGSize)dashSymbolSize;
+ (NSAttributedString*)dashSymbolAttributedStringWithTintColor:(UIColor*)color forDashSymbolSize:(CGSize)dashSymbolSize;

- (BOOL)isValidDashAddress;
- (BOOL)isValidDashPrivateKey;
- (BOOL)isValidDashBIP38Key; // BIP38 encrypted keys: https://github.com/bitcoin/bips/blob/master/bip-0038.mediawiki

-(NSInteger)indexOfCharacter:(unichar)character;

+(NSString*)waitTimeFromNow:(NSTimeInterval)wait;

@end
