//
//  IKMatrix.h
//  IKMatrix
//
//  Created by Justin Brower on 12/7/13.
//  Copyright (c) 2013 Justin Brower. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IKVector.h"

typedef struct {
    int row;
    int col;
} MatKey;

@interface IKMatrix : NSObject
{
    NSMutableSet *rowDomain;
    NSMutableSet *colDomain;
    
    
    
    
}
//constructors

//makes a new matrix from a list of list of NSNumber. Each list is a row.
- (id)initWithListList:(NSArray *)rowlistlist;

//forms a new matrix from a list of IKVector, whose columns are given by the entries
- (id)initWithColumnDict:(NSMutableDictionary *)columns;

//forms a new matrix from a list of IKVector, whose rows are given by the entries
- (id)initWithRowDict:(NSMutableDictionary *)rows;



//matrix functions

//Given a matrix A, Returns (Self * A)
- (IKMatrix *)rightMultiply:(IKMatrix *)anotherMatrix;

//Given a matrix B, Returns (B * Self)
- (IKMatrix *)leftMultiply:(IKMatrix *)anotherMatrix;

//Returns the transpose
- (IKMatrix *)transpose;

//Returns the rank of the matrix
- (int)rank;

//Returns the QR factorization of the matrix in an NSDictionary
- (NSDictionary *)qrFactorization;

//Returns the determinant (if square). Otherwise raises an error
- (float)determinant;

//Solves Ax = b using gaussian elimination
+ (IKVector *)gaussianSolveWithA:(IKMatrix *)A b:(IKVector *)b;

//Solves Ax = b using orthogonalization
+ (IKVector *)orthogonalSolveWithA:(IKMatrix *)A b:(IKVector *)b;







@end
