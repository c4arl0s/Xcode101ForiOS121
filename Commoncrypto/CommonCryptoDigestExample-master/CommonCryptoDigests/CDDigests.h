//
//  CDDigests.h
//  CommonCryptoDigests
//
//  Created by Luis Ezcurdia on 10/6/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

#ifndef CDDigests_h
#define CDDigests_h
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>

@interface CDDigests : NSObject
+(NSString *) sha1String: (NSString *)input;
+(NSString *) sha1NSData: (NSData *)input;
+(NSString *) sha256String: (NSString *)input;
@end
#endif /* CDDigests_h */
