//
//  JSMap.m
//  SJParser
//
//  Created by hai on 2017/10/26.
//  Copyright © 2017年 hai. All rights reserved.
//

#import "JSMap.h"
#import "JSPairNode.h"

@implementation JSMap

- (BOOL)paddingData:(NSScanner *)source {
    while ([JSNode nextNodeType:source] != JSTokenTypeObjectEnd) {
        if ([JSNode nextNodeType:source]==JSTokenTypeSeparator) {
            source.scanLocation += 1;
        }
        JSPairNode *sub = [[JSPairNode alloc] init];
        [sub paddingData:source];
        if (sub) {
            [self.subNodes addObject:sub];
        }
    }
    
    BOOL b = [JSNode nextNodeType:source] == JSTokenTypeObjectEnd;
    source.scanLocation++;
    
    return b;
}
- (id)jsonObject {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:self.subNodes.count];
    for (JSPairNode *pair in self.subNodes) {
        [dict setObject:[pair jsonValue] forKey:[pair jsonKey]];
    }
    
    return dict;
}


@end
