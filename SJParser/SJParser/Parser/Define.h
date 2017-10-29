//
//  Define.h
//  SJParser
//
//  Created by hai on 2017/10/26.
//  Copyright © 2017年 hai. All rights reserved.
//

#ifndef Define_h
#define Define_h


typedef NS_ENUM(NSInteger, JSNodeType){
    JSTokenTypeInvalid     = 0,
    JSTokenTypeNumber      = 1,
    JSTokenTypeString      = 2,
    JSTokenTypeObjectBegin = 3,
    JSTokenTypeObjectEnd   = 4,
    JSTokenTypeArrayBegin  = 5,
    JSTokenTypeArrayEnd    = 6,
    JSTokenTypeSeparator   = 7,
    JSTokenTypeComma       = 8,
    JSTokenTypeTrue        = 9,
    JSTokenTypeFalse       = 10,
    JSTokenTypeNull        = 11,
    JSTokenTypeWhiteSpace  = 12,
};


#endif /* Define_h */
