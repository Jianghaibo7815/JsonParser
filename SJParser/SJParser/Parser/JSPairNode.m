//
//  JSPairNode.m
//  SJParser
//
//  Created by hai on 2017/10/26.
//  Copyright © 2017年 hai. All rights reserved.
//

#import "JSPairNode.h"

@interface JSPairNode ()

@property(nonatomic, strong)NSString *key;

@end

@implementation JSPairNode

- (BOOL)paddingData:(NSScanner *)source {
    NSString *s;
    if ([source scanUpToString:@":" intoString:&s]) {
        self.key = s;
        source.scanLocation++;
        self.value = [JSNode parse:source];
        
        return self.value!=nil;
    }
    
    return NO;
}

- (NSString *)jsonKey {
    return self.key;
}
- (id)jsonValue {
    return [self.value jsonObject];
}

@end
