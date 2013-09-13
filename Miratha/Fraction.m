//
//  Fraction.m
//  Miratha
//
//  Created by Fayyazuddin Syed on 12-04-20.
//  Copyright (c) 2012 Cybermedia Consulting. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction 

@synthesize numerator;
@synthesize denominator;

- (void) print {
    
    if (denominator == 1) 
        
        NSLog(@"%i", numerator);
    
    
    
    else
        
        NSLog(@"%i/%i", numerator, denominator);
}

- (double) convertToNum {
    
    if (denominator != 0)
        
        return (double)numerator/denominator;
    
    else
        
        return 1.0;
    
    
}

- (void) setNumerator:(int)n andDenominator:(int)d {
    
    numerator = n;
    denominator = d;
    
}

- (Fraction *) add:(Fraction *)f {
    
    Fraction *result = [[Fraction alloc] init];
    int resultNum;
    int resultDenom;
    
    resultNum = numerator * f.denominator + denominator * f.numerator;
    resultDenom = denominator * f.denominator;
    
    [result setNumerator:resultNum andDenominator:resultDenom];
    [result reduce];
    
    return result;
}

- (Fraction *) subtract:(Fraction *)f {
    
    Fraction *result = [[Fraction alloc] init];
    int resultNum;
    int resultDenom;
    
    resultNum = numerator * f.denominator - denominator * f.numerator;
    resultDenom = denominator * f.denominator;
    
    [result setNumerator:resultNum andDenominator:resultDenom];
    [result reduce];
    
    return result;
}

- (Fraction *) divide:(Fraction *)f {
    
    Fraction *result = [[Fraction alloc] init];
    int resultNum;
    int resultDenom;
    
    resultNum = numerator * f.denominator;
    resultDenom = denominator * f.numerator;
    
    [result setNumerator:resultNum andDenominator:resultDenom];
    [result reduce];
    
    return result;
}

- (Fraction *) multiply:(Fraction *)f {
 
    Fraction *result = [[Fraction alloc] init];
    int resultNum;
    int resultDenom;
    
    resultNum = numerator * f.numerator;
    resultDenom = denominator * f.denominator;
    
    [result setNumerator:resultNum andDenominator:resultDenom];
    [result reduce];
    
    return result;
    
}


- (void) reduce {
    
    int u = numerator;
    int v = denominator;
    int temp;
    
    while (v != 0) {
        
        temp = u % v;
        u = v;
        v = temp;
        
    }
    
    numerator /=u;
    denominator /=u;
}

@end
