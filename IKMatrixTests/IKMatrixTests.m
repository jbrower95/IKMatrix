//
//  IKMatrixTests.m
//  IKMatrixTests
//
//  Created by Justin Brower on 12/7/13.
//  Copyright (c) 2013 Justin Brower. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IKVector.h"
@interface IKMatrixTests : XCTestCase

@end

@implementation IKMatrixTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testVecDomain
{
    IKVector *a = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:2.0],[NSNumber numberWithFloat:3.0],nil]];
    
    IKVector *b = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],nil]];
    IKVector *c = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],nil]];

    
    XCTAssert([a.domain isEqualToSet:b.domain]  ,@"Testing domain");
    XCTAssertFalse([a.domain isEqual:c.domain],@"Testing false domain");
}
- (void)testVecAccessor
{
    IKVector *a = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:2.0],[NSNumber numberWithFloat:3.0],nil]];
    
    IKVector *b = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],nil]];
    
    XCTAssert(([[a getValueAtIndex:[NSNumber numberWithInt:0]] floatValue] == 1.0),@"Accessor test");
    
    XCTAssert(([[a getValueAtIndex:[NSNumber numberWithInt:1]] floatValue] == 2.0),@"Accessor test");
    
    XCTAssert(([[a getValueAtIndex:[NSNumber numberWithInt:2]] floatValue] == 3.0),@"Accessor test");
    
    XCTAssert(([[b getValueAtIndex:[NSNumber numberWithInt:2]] floatValue] == 1.0),@"Accessor test");
    
    XCTAssert(([[b getValueAtIndex:[NSNumber numberWithInt:0]] floatValue] == 1.0),@"Accessor test");
}
- (void)testVecDotProduct
{
    IKVector *a = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:2.0],[NSNumber numberWithFloat:3.0],nil]];
    
    IKVector *b = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],nil]];
    
    
    XCTAssertEqualObjects([a dotProductWith:b],[NSNumber numberWithFloat:6.0],@"Dot product error");
    
}

- (void)testAddition
{
    
    IKVector *a = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:2.0],[NSNumber numberWithFloat:3.0],nil]];
    
    IKVector *b = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],nil]];
    
    IKVector *c = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:2.0],[NSNumber numberWithFloat:3.0],[NSNumber numberWithFloat:4.0],nil]];

    IKVector *d = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:3.0],[NSNumber numberWithFloat:4.0],[NSNumber numberWithFloat:5.0],nil]];
    
    //simple addition tests
    XCTAssert([[a add:b] isEqualToVector:c],@"Addition error");
    XCTAssert([[b add:c] isEqualToVector:d],@"Addition error");
    
    //commutivity tests
    XCTAssert([[a add:b] isEqualToVector:[b add:a]],@"Addition error");
    XCTAssert([[b add:c] isEqualToVector:[c add:b]],@"Addition error");
    XCTAssert([[a add:c] isEqualToVector:[c add:a]],@"Addition error");
    XCTAssert([[b add:d] isEqualToVector:[d add:b]],@"Addition error");
    
}

- (void)testVecNorm
{
    
    IKVector *a = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:2.0],[NSNumber numberWithFloat:3.0],nil]];
    
    IKVector *b = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],nil]];
    
    XCTAssert([[a norm] isEqualToNumber:[NSNumber numberWithFloat:sqrt(14)]],@"Testing norm");
    XCTAssert([[b norm] isEqualToNumber:[NSNumber numberWithFloat:sqrt(3)]],@"Testing norm 2");
    
}

@end
