//
//  Fraction.h
//  Miratha
//
//  Created by Fayyazuddin Syed on 12-04-20.
//  Copyright (c) 2012 Cybermedia Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject {
    
    int numerator;
    int denominator;
}

@property int numerator;
@property int denominator;

- (void) print;
- (void) setNumerator: (int) n andDenominator: (int) d;
- (double) convertToNum;
- (Fraction *) add: (Fraction *) f;
- (Fraction *) subtract: (Fraction *) f;
- (Fraction *) divide: (Fraction *) f;
- (Fraction *) multiply: (Fraction *) f;
- (void) reduce;

@end
