//
//  CDDigests.m
//  CommonCryptoDigests
//
//  Created by Luis Ezcurdia on 10/6/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

#import "CDDigests.h"

@implementation CDDigests
+(NSString *) sha1String: (NSString *)input {
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    return [CDDigests sha1NSData:data];
}
+(NSString *) sha1NSData: (NSData *)input {
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(input.bytes, (CC_LONG)input.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}
+(NSString *) sha256String: (NSString *)input{
    const char *data = [input cStringUsingEncoding:NSASCIIStringEncoding];
    NSData *keyData = [NSData dataWithBytes:data length:strlen(data)];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH] = {0};
    CC_SHA256(keyData.bytes, (CC_LONG)(keyData.length), digest);
    NSData *out = [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    NSString *hash = [out description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}
@end
