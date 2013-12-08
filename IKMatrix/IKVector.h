//
//  IKVector.h
//  IKMatrix
//
//  Created by Justin Brower on 12/7/13.
//  Copyright (c) 2013 Justin Brower. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IKVector : NSObject
{
    NSMutableDictionary *f;
    
    NSMutableSet *domain;
}

//typically an NSArray of NSNumbers
- (id)initWithList:(NSArray *)array;

//initializes a vector
- (id)init;

//returns an entry of a vector
- (id)getValueAtIndex:(id)key;

//calculates the norm of the vector
- (NSNumber *)norm;

//calculates equality between vectors
- (BOOL)isEqualToVector:(IKVector *)another;

//calculates the dot product between two vectors
- (NSNumber *)dotProductWith:(IKVector *)anotherVector;

//used to compare vec domains
+ (BOOL)numSet:(NSSet *)a isEqualToSet:(NSSet *)b;

@property (strong) NSMutableSet *domain;
@property (strong) NSMutableDictionary *f;


@end