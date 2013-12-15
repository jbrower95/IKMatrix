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

/*     Making Vectors / Utilities   */
/***********************************/

//typically an NSArray of NSNumbers
- (id)initWithList:(NSArray *)array;

//initializes a vector with some mutable set of NSIntegers as the domain
- (id)initWithDomain:(NSMutableSet *)domain;

//initializes a vector, copying the domain and function of another vector
- (id)initWithVector:(IKVector *)vec;

//initializes a vector with no domain
- (id)init;

//returns a newly allocated vector with the same domain and function
- (id)copy;

//returns an entry of a vector
- (id)getValueAtIndex:(id)key;

//calculates equality between vectors
- (BOOL)isEqualToVector:(IKVector *)another;

//used to compare vec domains
+ (BOOL)numSet:(NSSet *)a isEqualToSet:(NSSet *)b;





/* Computational Functions */
/***************************/


//calculates the norm of the vector
- (NSNumber *)norm;

//multiplies the vector by a scalar
- (void)multiplyByScalar:(float)scalar;

//calculates the dot product between two vectors
- (NSNumber *)dotProductWith:(IKVector *)anotherVector;

//given an input vector v, returns a vector equal to self + v
- (IKVector *)add:(IKVector *)anotherVector;

//given an input vector v, returns a vector equal to self - v
- (IKVector *)subtract:(IKVector *)anotherVector;





/*      Vector Convenience Functions        */
/********************************************/


// returns the projection of the vector object parallel to an input vector
- (IKVector *)projectParallelTo:(IKVector *)input;

// returns the perpindicular projection of the vector to an input vector
- (IKVector *)projectOrthogonalTo:(IKVector *)input;

// returns the perpindicular projection of the vector to several MUTUALLY ORTHOGONAL vectors
- (IKVector *)projectOrthogonalToList:(NSArray *)otherVecs;

// returns the parallel projection of the vector to several vectors
- (IKVector *)projectPerpindicularToList:(NSArray *)otherVecs;






@property (strong) NSMutableSet *domain;
@property (strong) NSMutableDictionary *f;


@end
