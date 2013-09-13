//
//  ShareResultViewController.m
//  Miratha
//
//  Created by Fayyazuddin Syed on 12-01-08.
//  Copyright (c) 2012 Cybermedia Consulting. All rights reserved.
//

#import "ShareResultViewController.h"
#import "Fraction.h"

@implementation ShareResultViewController
@synthesize results;
@synthesize numbers;
@synthesize totalEstate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    
    //iterate through the NSDictionary and remove any Fraction objects that have a numerator that is a zero.
    
    for(NSString *name in results) {
        
        Fraction *value = [results objectForKey:name];
        
        if (value.numerator == 0) {
            
            [results removeObjectForKey:name];
            
        }
        
    }
    
    NSArray *sortedFractions;
    NSArray *keys = [results allKeys];
    NSMutableDictionary *sortedList = [[NSMutableDictionary alloc] init];
    UIView *resultsView = [[UIView alloc] init];
    resultsView.backgroundColor = [UIColor whiteColor];
    
    int i = 0;
    
    for (NSString *key in keys) {
        
        Fraction *resultShare = [results objectForKey:key];
        Fraction *frac = [[Fraction alloc] init];
        
        if (([key isEqualToString:@"Wife"] || [key isEqualToString:@"Daughter"] || [key isEqualToString:@"Son"] || [key isEqualToString:@"Full Sister"] || [key isEqualToString:@"Full Brother"] || [key isEqualToString:@"Maternal Sister"] || [key isEqualToString:@"Maternal Brother"] || [key isEqualToString:@"Paternal Sister"] || [key isEqualToString:@"Paternal Brother"] || [key isEqualToString:@"Full Brother's Son"] || [key isEqualToString:@"Paternal Brother's Son"] || [key isEqualToString:@"Full Paternal Uncle"] || [key isEqualToString:@"Full Paternal Uncle's Son"] || [key isEqualToString:@"Paternal Paternal Uncle"] || [key isEqualToString:@"Paternal Paternal Uncle's Son"] || [key isEqualToString:@"Granddaughter"] || [key isEqualToString:@"Grandson"] || [key isEqualToString:@"Grandmother"]) && [[numbers objectForKey:key] intValue] > 1) {
            
            [frac setNumerator:[[numbers objectForKey:key] intValue] andDenominator:1];
            resultShare = [resultShare divide:frac];
            
            NSString *keyText1 = [NSString stringWithFormat:@"Each %@ inherits:", key];
            [sortedList setObject:resultShare forKey:keyText1];
            
            
        }
        
        else {
            
            NSString *keyText2 = [NSString stringWithFormat:@"%@ inherits:", key];
            [sortedList setObject:resultShare forKey:keyText2];
            
        }
        
        NSArray *fractions = [sortedList allValues];
        
        sortedFractions = [fractions sortedArrayUsingComparator:^(id obj1, id obj2) {
            
            Fraction *f1 = obj1;
            Fraction *f2 = obj2;
            double diff = (double)(f1.numerator) / f1.denominator - (double)(f2.numerator) / f2.denominator;
            return diff < 0 ? NSOrderedDescending : diff > 0 ? NSOrderedAscending : NSOrderedSame;
            
        }];
        
       
        i++;
        
    }
    
    for (Fraction *data in sortedFractions) {
        
        [data print];
    }
    
    
    
    NSLog(@"BismILLAH");
    
    for (int i = 0; i < [sortedFractions count]; i++) {
        
        int y = 10 + i * 30;
        UILabel *keyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, y, 270, 30)];
        UILabel *shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(270, y, 45, 30)];
        [shareLabel setTextAlignment: UITextAlignmentRight];

        Fraction *alphaTest = [sortedFractions objectAtIndex:i];
        NSArray *temp = [sortedList allKeysForObject:alphaTest];
        
        if ([temp count] > 1) {
            
            for (NSString *key in temp) {
                
                [keyLabel setText:key];
                [keyLabel setNumberOfLines:1];
                [keyLabel setMinimumFontSize:8];
                [keyLabel setAdjustsFontSizeToFitWidth:YES];
               
                NSString *share = [NSString stringWithFormat:@"%d/%d", alphaTest.numerator, alphaTest.denominator];
                
                [shareLabel setText:share];
                [shareLabel setNumberOfLines:1];
                [shareLabel setMinimumFontSize:8];
                [shareLabel setAdjustsFontSizeToFitWidth:YES];
                
                NSLog(@"%@ - %d/%d", key, alphaTest.numerator, alphaTest.denominator);
                
            }
            
            i+=[temp count];
        }
        
        else {
            
            [keyLabel setText:[temp objectAtIndex:0]];
            [keyLabel setNumberOfLines:1];
            [keyLabel setMinimumFontSize:8];
            [keyLabel setAdjustsFontSizeToFitWidth:YES];
            
            NSString *share = [NSString stringWithFormat:@"%d/%d", alphaTest.numerator, alphaTest.denominator];
            
            [shareLabel setText:share];
            [shareLabel setNumberOfLines:1];
            [shareLabel setMinimumFontSize:8];
            [shareLabel setAdjustsFontSizeToFitWidth:YES];
            
            NSLog(@"%@ - %d/%d", [temp objectAtIndex:0], alphaTest.numerator, alphaTest.denominator);
            
        }
        
        
        
        [resultsView addSubview:keyLabel];
        [resultsView addSubview:shareLabel];
        
        
    }
    
    if (![totalEstate isEqualToString:@"0.00"] || [totalEstate length] > 4) {
        
        NSLog(@"Is it working?");
        
        for (int j = 0; j < [sortedFractions count]; j++) {
            
            int y = 50 + i * 30;
            UILabel *keyLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(10, y, 215, 30)];
            UILabel *shareLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(215, y, 100, 30)];
            [shareLabel1 setTextAlignment:UITextAlignmentRight];
            
            Fraction *alphaTest = [sortedFractions objectAtIndex:j];
            NSArray *temp = [sortedList allKeysForObject:alphaTest];
            
            if ([temp count] > 1) {
                
                for (NSString *key in temp) {
                    
                    [keyLabel1 setText:key];
                    [keyLabel1 setNumberOfLines:1];
                    [keyLabel1 setMinimumFontSize:8];
                    [keyLabel1 setAdjustsFontSizeToFitWidth:YES];
                    
                    float estateValue = [totalEstate floatValue] * alphaTest.numerator / alphaTest.denominator;
                    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
                    NSDecimalNumber *decimal = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",estateValue]];
                    NSString *modifiedValue = [formatter stringFromNumber:decimal];
                    
                    [shareLabel1 setText:modifiedValue];
                    [shareLabel1 setNumberOfLines:1];
                    [shareLabel1 setMinimumFontSize:8];
                    [shareLabel1 setAdjustsFontSizeToFitWidth:YES];
                    NSLog(@"%@ - %d/%d", key, alphaTest.numerator, alphaTest.denominator);
                    
                }
                
                j+=[temp count];
                
            }
            
            else {
                
                [keyLabel1 setText:[temp objectAtIndex:0]];
                [keyLabel1 setNumberOfLines:1];
                [keyLabel1 setMinimumFontSize:8];
                [keyLabel1 setAdjustsFontSizeToFitWidth:YES];
                
                float estateValue = [totalEstate floatValue] * alphaTest.numerator / alphaTest.denominator;
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
                NSDecimalNumber *decimal = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",estateValue]];
                NSString *modifiedValue = [formatter stringFromNumber:decimal];
                
                [shareLabel1 setText:modifiedValue];
                [shareLabel1 setNumberOfLines:1];
                [shareLabel1 setMinimumFontSize:8];
                [shareLabel1 setAdjustsFontSizeToFitWidth:YES];
                
                NSLog(@"%@ - %d/%d", [temp objectAtIndex:0], alphaTest.numerator, alphaTest.denominator);
                
            }
            
            
            
            [resultsView addSubview:keyLabel1];
            [resultsView addSubview:shareLabel1];
            i++;
            
        }
         
        
    }
    
    self.view = resultsView;
}



 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 
     [super viewDidLoad];
     self.navigationItem.title = @"Results";
 }


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
