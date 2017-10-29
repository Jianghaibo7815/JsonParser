//
//  JSParser.m
//  SJParser
//
//  Created by hai on 2017/10/26.
//  Copyright © 2017年 hai. All rights reserved.
//

#import "JSParser.h"
#import "JSNull.h"
#import "JSNumber.h"
#import "JSString.h"
#import "JSPairNode.h"
#import "JSMap.h"
#import "JSArray.h"


@implementation JSParser

+ (id)objectWithJson:(NSString *)json {
    JSNode *node = nil;
    //TODO key字符串里去掉两边空格
    json = [json stringByReplacingOccurrencesOfString:@" " withString:@""];
    json = [json stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    @try {
       node = [JSNode parse:[NSScanner scannerWithString:json]];
    } @catch (NSException *exception) {
        NSLog(@"invalid json string");
        return nil;
    } @finally {
        
    }
    return [node jsonObject];
}

@end

@implementation JSNode
+ (JSNode *)parse:(NSScanner *)scanner {
    JSNode *node = nil;
    switch ([self nextNodeType:scanner]) {
        case JSTokenTypeNumber:{
            node = [[JSNumber alloc] init];
        }break;
        case JSTokenTypeString:{
            node = [[JSString alloc] init];
        }break;
        case JSTokenTypeObjectBegin:{
            node = [[JSMap alloc] init];
            scanner.scanLocation++;
        }break;
        case JSTokenTypeArrayBegin:{
            node = [[JSArray alloc] init];
            scanner.scanLocation++;
        }break;
        case JSTokenTypeNull:{
            node = [[JSNull alloc] init];
        }break;
        case JSTokenTypeComma:{
            node = [[JSPairNode alloc] init];
        }break;
        case JSTokenTypeSeparator: {
            scanner.scanLocation++;
        }break;
        case JSTokenTypeObjectEnd:{
            
        }break;
        case JSTokenTypeArrayEnd:{
            
        }break;
            
        default:
            break;
    }
    
    [node paddingData:scanner];
    
    return node;
}

+ (JSNodeType)nextNodeType:(NSScanner *)scanner {
    NSInteger type = JSTokenTypeInvalid;
    NSString *source = [scanner.string substringFromIndex:scanner.scanLocation];
    if (source.length==0) {return type;}

    if ([self isObjectBegin:source]) {
        return JSTokenTypeObjectBegin;
    }else if ([self isObjectEnd:source]) {
        return JSTokenTypeObjectEnd;
    } else if ([self isArrayBegin:source]) {
        return JSTokenTypeArrayBegin;
    }else if ([self isArrayEnd:source]) {
        return JSTokenTypeArrayEnd;
    } else if ([self isTypeSeparator:source]) {
        return JSTokenTypeSeparator;
    } else if ([self isNull:source]) {
        return JSTokenTypeNull;
    } else if ([self isString:source]) {
        return JSTokenTypeString;
    } else {
        return JSTokenTypeNumber;
    }
    
    
    return type;
}

+ (BOOL)isInt:(NSString*)string{
    NSScanner* scanner = [NSScanner scannerWithString:string];
    int intVal;
    return [scanner scanInt:&intVal] && [scanner scanLocation]!=0;
}
+ (BOOL)isFloat:(NSString*)string{
    NSScanner* scanner = [NSScanner scannerWithString:string];
    float floatVal;
    return  [scanner scanFloat:&floatVal] && [scanner scanLocation]!=0;
}
+ (BOOL)isNull:(NSString *)string {
    NSScanner* scanner = [NSScanner scannerWithString:string];
    scanner.caseSensitive = NO;
    [scanner scanUpToString:@"null" intoString:nil];
    return [scanner scanLocation]==0;
}
+ (BOOL)isString:(NSString *)string {
    NSScanner* scanner = [NSScanner scannerWithString:string];
    [scanner scanUpToString:@"\"" intoString:nil];
    return [scanner scanLocation]==0;
}
+ (BOOL)isObjectBegin:(NSString *)string {
    NSScanner* scanner = [NSScanner scannerWithString:string];
    [scanner scanUpToString:@"{" intoString:nil];
    return [scanner scanLocation]==0;
}
+ (BOOL)isObjectEnd:(NSString *)string {
    NSScanner* scanner = [NSScanner scannerWithString:string];
    [scanner scanUpToString:@"}" intoString:nil];
    return [scanner scanLocation]==0;
}
+ (BOOL)isArrayBegin:(NSString *)string {
    NSScanner* scanner = [NSScanner scannerWithString:string];
    [scanner scanUpToString:@"[" intoString:nil];
    return [scanner scanLocation]==0;
}
+ (BOOL)isArrayEnd:(NSString *)string {
    NSScanner* scanner = [NSScanner scannerWithString:string];
    [scanner scanUpToString:@"]" intoString:nil];
    return [scanner scanLocation]==0;
}
+ (BOOL)isTypeSeparator:(NSString *)string {
    NSScanner* scanner = [NSScanner scannerWithString:string];
    [scanner scanUpToString:@"," intoString:nil];
    return [scanner scanLocation]==0;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.subNodes = @[].mutableCopy;
    }
    return self;
}

- (BOOL)paddingData:(NSScanner *)source {
    
    return YES;
}

- (id)jsonObject {
    return self.value;
}

@end
