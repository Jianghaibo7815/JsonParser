//
//  JSParser.h
//  SJParser
//
//  Created by hai on 2017/10/26.
//  Copyright © 2017年 hai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"

@interface JSParser : NSObject

+ (id)objectWithJson:(NSString *)json;

@end

@interface JSNode : NSObject

@property(nonatomic, strong)id value;
@property(nonatomic, strong)NSMutableArray *subNodes;

/**
 返回解析节点类型
 
 @param scanner 数据源
 @return 节点类型
 */
+ (JSNode *)parse:(NSScanner *)scanner;

/**
 试探下一个数据类型

 @param scanner 数据源
 @return 节点类型
 */
+ (JSNodeType)nextNodeType:(NSScanner *)scanner;

/**
 填充节点数据

 @param source 数据源
 @return yes 填充数据成功  no 填充数据失败
 */
- (BOOL)paddingData:(NSScanner *)source;

/**
 将节点树转换为字典或者数组

 @return json 对象
 */
- (id)jsonObject;

+ (BOOL)isInt:(NSString*)string;
+ (BOOL)isFloat:(NSString*)string;
@end
