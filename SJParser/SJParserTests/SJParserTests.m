//
//  SJParserTests.m
//  SJParserTests
//
//  Created by hai on 2017/10/26.
//  Copyright © 2017年 hai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSParser.h"

@interface SJParserTests : XCTestCase

@end

@implementation SJParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSString *str = @"test";
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"test" ofType:@"txt"];
    str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", str);
    id obj = [JSParser objectWithJson:str];
    NSLog(@"%@", obj);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
