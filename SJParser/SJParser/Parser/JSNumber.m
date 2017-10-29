//
//  JSNumber.m
//  SJParser
//
//  Created by hai on 2017/10/26.
//  Copyright © 2017年 hai. All rights reserved.
//

#import "JSNumber.h"

@interface JSNumber ()


@end

@implementation JSNumber

- (BOOL)paddingData:(NSScanner *)source {
    if ([JSNode isInt:[source.string substringFromIndex:source.scanLocation]]) {
        int num;
        [source scanInt:&num];
        self.value = [NSNumber numberWithInteger:num];
        return YES;
    }else if ([JSNode isFloat:[source.string substringFromIndex:source.scanLocation]]) {
        float f;
        [source scanFloat:&f];
        self.value = [NSNumber numberWithFloat:f];
        return YES;
    }
    
    return NO;
}

@end
