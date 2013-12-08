IKMatrix
========

An Objective-C implementation of Vectors and Matrices

IKVector
=======
Provides methods for creating vectors and manipulating them.

Initialize a vector with a list of NSNumbers:
	IKVector *v = [[IKVector alloc] initWithList:[NSArray arrayWithObjects:[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:2.0],[NSNumber numberWithFloat:3.0],nil]];

Take the norm of the vector:
	NSNumber *norm = [v norm];

Calculate the dot product of two vectors:
	IKVector *v2 = ...
	NSNumber *dot = [v dotProductWith:v2]





IKMatrix
========
To be implemented
