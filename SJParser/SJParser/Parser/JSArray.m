//
//  JSArray.m
//  SJParser
//
//  Created by hai on 2017/10/26.
//  Copyright © 2017年 hai. All rights reserved.
//

#import "JSArray.h"

@implementation JSArray

- (BOOL)paddingData:(NSScanner *)source {
    while ([JSNode nextNodeType:source] != JSTokenTypeArrayEnd) {
        if ([JSNode nextNodeType:source]==JSTokenTypeSeparator) {
            source.scanLocation += 1;
        }
        JSNode *sub = [JSNode parse:source];
        if (sub) {
            [self.subNodes addObject:sub];
        }
    }
    
    BOOL b = [JSNode nextNodeType:source] == JSTokenTypeArrayEnd;
    source.scanLocation++;
    
    return b;
}

- (id)jsonObject {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.subNodes.count];
    for (JSNode *node in self.subNodes) {
        [array addObject:[node jsonObject]];
    }
    
    return array;
}

@end
