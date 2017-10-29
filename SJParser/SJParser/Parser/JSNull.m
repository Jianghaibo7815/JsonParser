//
//  JSNull.m
//  SJParser
//
//  Created by hai on 2017/10/26.
//  Copyright © 2017年 hai. All rights reserved.
//

#import "JSNull.h"

@implementation JSNull

- (BOOL)paddingData:(NSScanner *)source {
    self.value = [NSNull null];
    source.scanLocation += 4;
    return YES;
}


@end
