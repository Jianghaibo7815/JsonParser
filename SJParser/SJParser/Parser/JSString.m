//
//  JSString.m
//  SJParser
//
//  Created by hai on 2017/10/26.
//  Copyright © 2017年 hai. All rights reserved.
//

#import "JSString.h"

@implementation JSString

- (BOOL)paddingData:(NSScanner *)source {
    NSString *s ;
    NSCharacterSet *sepSet = [NSCharacterSet characterSetWithCharactersInString:@"{[}],:"];
    
    BOOL b = [source scanUpToCharactersFromSet:sepSet intoString:&s];
    if (b) {
        self.value = s;
    }
    
    return b;
}
@end
