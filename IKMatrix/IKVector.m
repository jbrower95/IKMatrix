//
//  IKVector.m
//  IKMatrix
//
//  Created by Justin Brower on 12/7/13.
//  Copyright (c) 2013 Justin Brower. All rights reserved.
//

#import "IKVector.h"

@implementation IKVector

@synthesize domain,f;

//typically an NSArray of NSNumbers
- (id)initWithList:(NSArray *)array
{
    self = [super init];
    
    NSMutableArray *indices = [NSMutableArray array];
    NSMutableDictionary *func = [[NSMutableDictionary alloc] init];
    
    int i = 0;
    
    for (NSNumber *n in array)
    {
        [indices addObject:[NSNumber numberWithInt:i]];
        
        if ( !(pow([n floatValue],2) < pow(10,-14)))
        {
             //add it to the dictionary
            [func setObject:n forKey:[NSNumber numberWithInt:i]];
        }
        i++;
    }
    
    
    self.domain = [[NSMutableSet alloc] initWithArray:indices];
    self.f = func;

    return self;
}

//initializes an empty vector
- (id)init
{
    self = [super init];
    
    self.domain = [[NSMutableSet alloc] init];
    self.f = [[NSMutableDictionary alloc] init];
    
    return self;
}


//returns an entry of a vector
- (id)getValueAtIndex:(id)key
{
    
    if (! [self.domain containsObject:key]){
        //throw an error
        @throw [NSException exceptionWithName:@"IKVecDomainError" reason:@"Tried to access element outside of vec domain" userInfo:nil];
    }
    
    if ([[self.f allKeys] containsObject:key]){
        return [self.f objectForKey:key];
    }
    else{
        //return 0
        return [NSNumber numberWithFloat:0.0];
    }

}



//calculates the norm of the vector
- (NSNumber *)norm
{
    NSEnumerator *enumerator = self.f.objectEnumerator;
    NSNumber *n;
    
    float sum = 0;
    
    while ( n = [enumerator nextObject]){
        float value = [n floatValue];
        sum += pow(value,2);
    }
    
    return [NSNumber numberWithFloat:sqrt(sum)];
    
}

- (void)setNumber:(NSNumber *)num forKey:(id)key
{
    if ([self.domain containsObject:key] ){
        if ( pow([num floatValue],2) < pow(10,-14)){
            [self.domain removeObject:key];
            [self.f removeObjectForKey:key];
        }
        [self.f setObject:num forKey:key];
    }
    else{
        if ( pow([num floatValue],2) < pow(10,-14)){
            return;
        }
        else{
        [self.domain addObject:key];
        [self.f setObject:num forKey:key];
        }
    }
    
}


//calculates equality between vectors
- (BOOL)isEqualToVector:(IKVector *)another
{
    if (![self.domain isEqualToSet:another.domain]){
        @throw [NSException exceptionWithName:@"IKVecDomainError" reason:@"Tried to compare two vecs with different domains" userInfo:nil];
    }
    
    NSEnumerator *e = [self.domain objectEnumerator];
    id key;
    while (key = [e nextObject]){
        
        NSNumber *object1 = [self getValueAtIndex:key];
        NSNumber *object2 = [another getValueAtIndex:key];
        if ( ![object1 isEqualToNumber:object2] ){
            return NO;
        }
        
    }
    return YES;
    
    
}

//calculates the dot product between two vectors
- (NSNumber *)dotProductWith:(IKVector *)anotherVector
{
    if (![self.domain isEqualToSet:anotherVector.domain]){
        @throw [NSException exceptionWithName:@"IKVecComparisonError" reason:@"Tried to dot product two vecs with different domains" userInfo:nil];
    }
    
    float sum = 0;
    for (id key in self.domain)
    {
        sum = sum + [[anotherVector getValueAtIndex:key] floatValue]*[[self getValueAtIndex:key] floatValue];
    }
    return [NSNumber numberWithFloat:sum];
}


+ (BOOL)numSet:(NSSet *)a isEqualToSet:(NSSet *)b
{
    if ([a count] != [b count]) return NO;
    
    for (NSNumber *n in a)
    {
        int flag = 0;
        for ( NSNumber *m in b)
        {
            if ([m isEqualToNumber:n])
            {
                flag = 1;
            }
        }
        if ( flag == 0) return NO;
    }
    for (NSNumber *n in b)
    {
        int flag = 0;
        for ( NSNumber *m in a)
        {
            if ([m isEqualToNumber:n])
            {
                flag = 1;
            }
        }
        if ( flag == 0) return NO;
    }
    return YES;
}





@end
