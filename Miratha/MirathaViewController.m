//
//  MirathaViewController.m
//  Miratha
//
//  Created by Fayyazuddin Syed on 11-12-26.
//  Copyright (c) 2011 Cybermedia Consulting. All rights reserved.
//

#import "Fraction.h"
#import "MirathaViewController.h"
#import "ShareResultViewController.h"

@implementation MirathaViewController


@synthesize motherShare;
@synthesize fatherShare;
@synthesize wifeShare;
@synthesize husbandShare;
@synthesize daughterShare;
@synthesize sonShare;
@synthesize gDaughterShare;
@synthesize gSonShare;
@synthesize gMotherShare;
@synthesize gFatherShare;
@synthesize fSisterShare;
@synthesize fBrotherShare;
@synthesize pSisterShare;
@synthesize pBrotherShare;
@synthesize mSisterShare;
@synthesize mBrotherShare;
@synthesize estate;
@synthesize remainingShare;
//@synthesize dict;
//@synthesize numDict;
/*- (void)awakeFromNib {
    
    
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Al-Khwarizmi";
    
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                      style:UIBarButtonItemStyleBordered
                                     target:nil
                                     action:nil];
    
    [numWife becomeFirstResponder];
    [shareScroll setScrollEnabled:YES];
    [shareScroll setContentSize:CGSizeMake(320, 490)];
    [numEstate setDelegate:self];
    [numEstate setTag:1];
    
    [numSon setDelegate:self];
    [numSon setTag:2];
    
    [numDaughter setDelegate:self];
    [numDaughter setTag:2];
    
    [numHusband setDelegate:self];
    [numHusband setTag:3];
    
    [numWife setDelegate:self];
    [numWife setTag:3];
    
    [numMother setDelegate:self];
    [numMother setTag:3];
    
    [numFather setDelegate:self];
    [numFather setTag:3];
    
    [numFBrother setDelegate:self];
    [numFBrother setTag:2];
    
    [numFSister setDelegate:self];
    [numFSister setTag:2];
    
    [numPBrother setDelegate:self];
    [numPBrother setTag:2];
    
    [numPSister setDelegate:self];
    [numPSister setTag:2];
    
    [numHBrother setDelegate:self];
    [numHBrother setTag:2];
    
    [numHSister setDelegate:self];
    [numHSister setTag:2];
    
    [numGDaughter setDelegate:self];
    [numGDaughter setTag:2];
    
    [numGSon setDelegate:self];
    [numGSon setTag:2];
    
    [numGMother setDelegate:self];
    [numGMother setTag:3];
    
    [numGFather setDelegate:self];
    [numGFather setTag:3];
    
    [numSonFBrother setDelegate:self];
    [numSonFBrother setTag:2];
    
    [numSonPBrother setDelegate:self];
    [numSonPBrother setTag:2];
    
    [numFBrotherFather setDelegate:self];
    [numFBrotherFather setTag:2];
    
    [numSonFBrotherFather setDelegate:self];
    [numSonFBrotherFather setTag:2];
    
    [numSonPBrotherFather setDelegate:self];
    [numSonPBrotherFather setTag:2];
    
    [numPBrotherFather setDelegate:self];
    [numPBrotherFather setTag:2];
    
}

- (void)viewDidUnload
{
    numSon = nil;
    numDaughter = nil;
    numHusband = nil;
    numWife = nil;
    numMother = nil;
    numFather = nil;
    numFBrother = nil;
    numFSister = nil;
    numPBrother = nil;
    numPSister = nil;
    numHBrother = nil;
    numHSister = nil;
    shareScroll = nil;
    numGDaughter = nil;
    numGSon = nil;
    numGMother = nil;
    numGFather = nil;
    numSonFBrother = nil;
    numSonPBrother = nil;
    numFBrotherFather = nil;
    numSonFBrotherFather = nil;
    numSonPBrotherFather = nil;
    
    numPBrotherFather = nil;
    numEstate = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)reset:(id)sender {
    
    numSon.text = @"";
    numDaughter.text = @"";
    numHusband.text = @"";
    numWife.text = @"";
    numMother.text = @"";
    numFather.text = @"";
    numFBrother.text = @"";
    numFSister.text = @"";
    numPBrother.text = @"";
    numPSister.text = @"";
    numHBrother.text = @"";
    numHSister.text = @"";
    numGDaughter.text = @"";
    numGSon.text = @"";
    numGMother.text = @"";
    numGFather.text = @"";
    numSonFBrother.text = @"";
    numSonPBrother.text = @"";
    numFBrotherFather.text = @"";
    numPBrotherFather.text = @"";
    numSonFBrotherFather.text = @"";
    numSonPBrotherFather.text = @"";
    numEstate.text = @"$0.00";
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (textField.tag == 1) {
        
        if([[string stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]]
            isEqualToString:@""])
            return YES;
        
        NSString *previousValue = [[[textField.text stringByTrimmingCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] stringByReplacingOccurrencesOfString:@"." withString:@""] stringByReplacingOccurrencesOfString:@"," withString:@""];
        
        if(previousValue.length >= 15)
            return NO;
        
        string = [string stringByTrimmingCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]];
        NSString *modifiedValue = [NSString stringWithFormat:@"%@%@", previousValue, string];
        
        if ([modifiedValue length] == 1) {
            
            modifiedValue = [NSString stringWithFormat:@"0.0%@", string];
            
        }
        
        else if ([modifiedValue length] == 2) {
            
            modifiedValue = [NSString stringWithFormat:@"0.%@%@", previousValue, string];
            
        }
        
        else if ([modifiedValue length] > 2) {
            
            modifiedValue = [NSString stringWithFormat:@"%@.%@",[modifiedValue substringToIndex: modifiedValue.length-2],[modifiedValue substringFromIndex:modifiedValue.length-2]];
            
        }
        
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        NSDecimalNumber *decimal = [NSDecimalNumber decimalNumberWithString:modifiedValue];
        modifiedValue = [formatter stringFromNumber:decimal];
        [textField setText:modifiedValue];
        
        return NO;
        
    }
    
    else if (textField.tag == 2){
        
        return newText.length <= 2;
        
    }
    
    else if (textField.tag == 3) {
        
        return newText.length <= 1;
        
    }
    
    else {
        
        return YES;
        
    }
    
}

//I added a segue in the storyboard so that there is a push every time the button is pressed
- (IBAction)calculateShares:(id)sender {
    
    NSLog(@"button was pressed");
    
    if ([numWife.text intValue] > 4) {
        
        [self showAlertWithMessage:@"Cannot have more than four wives"];
        
    }
    
    else if ([numHusband.text intValue] > 1) {
        
        [self showAlertWithMessage:@"Cannot have more than one husband"];
        
    }
    
    else if ([numWife.text intValue] > 0 && [numHusband.text intValue] > 0) {
        
        [self showAlertWithMessage:@"Husband and Wife cannot be alive at the same time"];
        
    }
    
    else if ([numMother.text intValue] > 1) {
        
        [self showAlertWithMessage:@"Cannot have more than one mother"];
        
    }
    
    else if ([numFather.text intValue] > 1) {
        
        [self showAlertWithMessage:@"Cannot have more than one father"];
        
    }
    
    else if ([numGFather.text intValue] > 1) {
        
        [self showAlertWithMessage:@"Cannot have more than one Grandfather"];
        
    }
    
    else if ([numGMother.text intValue] > 2) {
        
        [self showAlertWithMessage:@"Cannot have more than two Grandmothers"];
        
    }
    
    else if ([numSon.text intValue] == 0 && [numDaughter.text intValue] == 0 && [numHusband.text intValue] == 0 && [numWife.text intValue] == 0 && [numMother.text intValue] == 0 && [numFather.text intValue] == 0 && [numFBrother.text intValue] == 0 && [numFSister.text intValue] == 0 && [numPBrother.text intValue] == 0 && [numPSister.text intValue] == 0 && [numHBrother.text intValue] == 0 && [numHSister.text intValue] == 0 && [numGDaughter.text intValue] == 0 && [numGSon.text intValue] == 0 && [numGMother.text intValue] == 0 && [numGFather.text intValue] == 0 && [numSonFBrother.text intValue] == 0 && [numSonPBrother.text intValue] == 0 && [numFBrotherFather.text intValue] == 0 && [numPBrotherFather.text intValue] == 0 && [numSonFBrotherFather.text intValue] == 0 && [numSonPBrotherFather.text intValue] == 0) {
        
        
        [self showAlertWithMessage:@"Must enter at least one relative to inherit"];
            
               
    }
    
    
    else {
        
        [self performSegueWithIdentifier:@"resultsSegue" sender:self];
        
    }
    
}
//This is called just before the push
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
            
    NSArray *shares = [self assignShares];
        
    NSMutableDictionary *currentShare = [shares objectAtIndex:0];
    NSMutableDictionary *numDict = [shares objectAtIndex:1];
        
    NSString *estateTotal = [numEstate text];
    estateTotal = [estateTotal stringByReplacingOccurrencesOfString:@"," withString:@""];
    estateTotal = [estateTotal stringByReplacingOccurrencesOfString:@"$" withString:@""];
    
    //I added a property of type NSMutableDictionary in SharedResultViewController so that we can send data between the 2 view controllers.
    ShareResultViewController *detailVC = segue.destinationViewController; //destinationViewController is an instance of SharedResultViewController as shown in the storyboard
    detailVC.results = currentShare;
    detailVC.numbers = numDict;
    detailVC.totalEstate = estateTotal;
    
        
}


- (NSArray *) assignShares {
    
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *numDict = [[NSMutableDictionary alloc] init];
    NSArray *shares;
    
    
    estate = [[Fraction alloc] init];
    [estate setNumerator:1 andDenominator:1];
    remainingShare = [[Fraction alloc] init];
    
    //check status of children/grandchildren (i.e. are there any surviving children?)
    
    if (!([self checkChildren] || [self checkGrandChildren])) {
        
        //check to see if there is a living spouse
        
        if ([self checkSpouse]) {
            
            //check to see if wife is alive
            
            if ([numWife.text intValue] > 0) {
                
                wifeShare = [[Fraction alloc] init];
                
                [wifeShare setNumerator:1 andDenominator:4];
                
                estate = [estate subtract:wifeShare];
                remainingShare = estate;
                
                [dict setObject:wifeShare forKey:@"Wife"];
                [numDict setObject:numWife.text forKey:@"Wife"];
                
            }
            
            //check to see if husband is alive
            
            else if ([numHusband.text intValue] > 0) {
                
                husbandShare = [[Fraction alloc] init];
                [husbandShare setNumerator:1 andDenominator:2];
                
                estate = [estate subtract:husbandShare];
                remainingShare = estate;
                
                [dict setObject:husbandShare forKey:@"Husband"];
                [numDict setObject:numHusband.text forKey:@"Husband"];
                
            }
            
            //check to see if there any living siblings
            //if no living siblings
            if (![self checkSiblings]){
                
                //check to see if there any living parents -->Umaryatain
                
                if ([self checkParents]) {
                    NSLog(@"Hellooooooooo Fayyaz!");
                    //where both parents are alive
                    motherShare = [[Fraction alloc] init];
                    fatherShare = [[Fraction alloc] init];
                    //both parents are alive
                    if ([numFather.text intValue] > 0 && [numMother.text intValue] > 0){
                        
                        Fraction *fraction = [[Fraction alloc] init];
                        [fraction setNumerator:1 andDenominator:3];
                        
                        motherShare = [fraction multiply:remainingShare];
                        estate = [estate subtract:motherShare];
                        remainingShare = estate;
                        
                        fatherShare = remainingShare;
                        
                        [estate print];
                        [remainingShare print];
                        
                        [dict setObject:motherShare forKey:@"Mother"];
                        [dict setObject:fatherShare forKey:@"Father"];
                        
                        [numDict setObject:numMother.text forKey:@"Mother"];
                        [numDict setObject:numFather.text forKey:@"Father"];
                        
                    }
                    
                    //where father is alive and mother is not
                    
                    else if ([numFather.text intValue] > 0 && [numMother.text intValue] == 0) {
                        
                        if ([numGMother.text intValue] > 0) {
                            
                            gMotherShare = [[Fraction alloc] init];
                            
                            Fraction *fraction = [[Fraction alloc] init];
                            [fraction setNumerator:1 andDenominator:3];
                            
                            gMotherShare = [fraction multiply:remainingShare];
                            estate = [estate subtract:gMotherShare];
                            remainingShare = estate;
                            
                            fatherShare = remainingShare;
                           
                            [dict setObject:gMotherShare forKey:@"GrandMother"];
                            [dict setObject:fatherShare forKey:@"Father"];
                            
                            [numDict setObject:numGMother.text forKey:@"Grandmother"];
                            [numDict setObject:numFather.text forKey:@"Father"];
                        }
                        
                        else {
                            
                            fatherShare = estate;
                            
                            [dict setObject:fatherShare forKey:@"Father"];
                            [numDict setObject:numFather.text forKey:@"Father"];
                            
                        }
                        
                    }
                    
                    
                    //where mother is alive and father is not -->grandparents are not included in 'Umaryatain.
                    
                    else if ([numMother.text intValue] > 0 && [numFather.text intValue] == 0) {
                        
                        if ([numGFather.text intValue] > 0) {
                            
                            gFatherShare = [[Fraction alloc] init];
                            
                            [motherShare setNumerator:1 andDenominator:3];
                            
                            estate = [estate subtract:motherShare];
                            remainingShare = estate;
                            
                            gFatherShare = remainingShare;
                            
                            [estate print];
                            [remainingShare print];
                            
                            [dict setObject:motherShare forKey:@"Mother"];
                            [dict setObject:gFatherShare forKey:@"Grandfather"];
                            
                            [numDict setObject:numMother.text forKey:@"Mother"];
                            [numDict setObject:numGFather.text forKey:@"Grandfather"];
                            
                        }
                        
                        else {
                            
                            [motherShare setNumerator:1 andDenominator:3];
                            
                            estate = [estate subtract:motherShare];
                            remainingShare = estate;
                            
                            [dict setObject:motherShare forKey:@"Mother"];
                            [numDict setObject:numMother.text forKey:@"Mother"];
                            //below is code that needs to be put into a method because it is used in several places.xyz
                            
                            
                            shares = [self calculateSingleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            
                            if ([self checkShares:dict] == -1) {
                                
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                            } //residual calculations
                            
                        }
                        
                                                
                    }//where mother is alive and father is not
                    
                    
                }//close checkParents
                
                else if ([self checkGrandParents]) {//*******
                    
                    gMotherShare = [[Fraction alloc] init];
                    gFatherShare = [[Fraction alloc] init];
                    //both grandparents are alive
                    if ([numGFather.text intValue] > 0 && [numGMother.text intValue] > 0){
                        
                        Fraction *fraction = [[Fraction alloc] init];
                        [fraction setNumerator:1 andDenominator:3];
                        
                        gMotherShare = [fraction multiply:remainingShare];
                        estate = [estate subtract:gMotherShare];
                        remainingShare = estate;
                        
                        gFatherShare = remainingShare;
                        
                        [estate print];
                        [remainingShare print];
                        
                        [dict setObject:gMotherShare forKey:@"Grandmother"];
                        [dict setObject:gFatherShare forKey:@"Grandfather"];
                        
                        [numDict setObject:numGMother.text forKey:@"Grandmother"];
                        [numDict setObject:numGFather.text forKey:@"Grandfather"];
                        
                    }
                    
                    //where grandfather is alive and grandmother is not
                    
                    else if ([numGFather.text intValue] > 0 && [numGMother.text intValue] == 0) {
                                                    
                        gFatherShare = estate;
                            
                        [dict setObject:gFatherShare forKey:@"Grandfather"];
                        [numDict setObject:numGFather.text forKey:@"Grandfather"];
                            
                    }
                     
                    //where grandmother is alive and grandfather is not                     
                    else if ([numGMother.text intValue] > 0 && [numGFather.text intValue] == 0) {
                                                    
                        [gMotherShare setNumerator:1 andDenominator:6];
                            
                        estate = [estate subtract:gMotherShare];
                        remainingShare = estate;
                            
                        [dict setObject:gMotherShare forKey:@"Grandmother"];
                        [numDict setObject:numGMother.text forKey:@"Grandmother"];
                        //below is code that needs to be put into a method because it is used in several places.
                        
                        shares = [self calculateSingleSiblingShare:dict names:numDict];
                        
                        dict = [shares objectAtIndex:0];
                        numDict = [shares objectAtIndex:1];
                        
                        
                        if ([self checkShares:dict] == -1) {
                                
                            //add residual male relatives in order here, starting with grandfather
                            shares = [self calculateResidualShares:dict names:numDict];
                                
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                                
                        } //residual calculations
                        
                    }
                    
                }
                
                else { //i.e. no living parents or grandparents
                    
                    //below is code that needs to be put into a method because it is used in several places.
                    
                    shares = [self calculateSingleSiblingShare:dict names:numDict];
                    
                    dict = [shares objectAtIndex:0];
                    numDict = [shares objectAtIndex:1];
                    
                    
                    if ([self checkShares:dict] == -1) {
                        
                        //add residual male relatives in order here, starting with grandfather
                        shares = [self calculateResidualShares:dict names:numDict];
                        
                        dict = [shares objectAtIndex:0];
                        numDict = [shares objectAtIndex:1];
                        
                    }
                    
                    
                }//close no living parents or no grandparents
              
                
            }//close checkSiblings
            
            else if ([self checkSiblings]) { //i.e. there are at least 2 siblings of any kind alive
                
                if ([self checkParents]) {
                    //where mother is alive
                    motherShare = [[Fraction alloc] init];
                    fatherShare = [[Fraction alloc] init];
                    
                    //Both parents are alive
                    if ([numMother.text intValue] == 1) {
                        
                        [motherShare setNumerator:1 andDenominator:6];
                        
                        estate = [estate subtract:motherShare];
                        remainingShare = estate;
                        
                        [dict setObject:motherShare forKey:@"Mother"];
                        [numDict setObject:numMother.text forKey:@"Mother"];
                        
                        if ([numFather.text intValue] == 1) {
                            
                            fatherShare = estate;
                            
                            [dict setObject:fatherShare forKey:@"Father"];
                            [numDict setObject:numFather.text forKey:@"Father"];
                            
                        }
                        
                        //if grandfather is alive
                        else if ([numGFather.text intValue] > 0) {
                        
                            gFatherShare = [[Fraction alloc] init];
                            gFatherShare = estate;
                        
                            [dict setObject:gFatherShare forKey:@"Grandfather"];
                            [numDict setObject:numGFather.text forKey:@"Grandfather"];
                        
                        
                        }
                    
                        else {
                            
                            shares = [self calculateMultipleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            if ([self checkShares:dict] == -1) {
                                
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                                
                            }
                            
                        }
                                                
                    }
                    
                    else if ([numMother.text intValue] == 0 && [numFather.text intValue] == 1) {
                        
                        if ([numGMother.text intValue] > 0) {
                            
                            gMotherShare = [[Fraction alloc] init];
                            fatherShare = [[Fraction alloc] init];
                            
                            [gMotherShare setNumerator:1 andDenominator:6];
                                
                            estate = [estate subtract:gMotherShare];
                            remainingShare = estate;
                            
                            fatherShare = remainingShare;
                                
                            [dict setObject:gMotherShare forKey:@"Grandmother"];
                            [numDict setObject:numGMother.text forKey:@"Grandmother"];
                                
                            [dict setObject:fatherShare forKey:@"Father"];
                            [numDict setObject:numFather.text forKey:@"Father"];
                                                            
                        }
                        
                        else {
                            
                            fatherShare = [[Fraction alloc] init];
                            fatherShare = estate;
                            
                            [dict setObject:fatherShare forKey:@"Father"];
                            [numDict setObject:numFather.text forKey:@"Father"];
                            
                        }
                        
                    }
                    
                }//close checkParents
                
                //if grandparents are alive and parents are not
                else if ([self checkGrandParents]) {
                    
                    gMotherShare = [[Fraction alloc] init];
                    gFatherShare = [[Fraction alloc] init];
                    
                    //Both grandparents are alive
                    if ([numGMother.text intValue] > 0 && [numGFather.text intValue] == 1) {
                        
                        [gMotherShare setNumerator:1 andDenominator:6];
                        
                        estate = [estate subtract:gMotherShare];
                        remainingShare = estate;
                        
                        gFatherShare = estate;
                        
                        [dict setObject:gMotherShare forKey:@"Grandmother"];
                        [numDict setObject:numGMother.text forKey:@"Grandmother"];
                        
                        [dict setObject:gFatherShare forKey:@"Grandfather"];
                        [numDict setObject:numGFather.text forKey:@"Grandfather"];
                        
                    }
                    //if only grandmother is alive
                    else if ([numGMother.text intValue] > 0 && [numGFather.text intValue] == 0) {
                        
                        [gMotherShare setNumerator:1 andDenominator:6];
                        
                        estate = [estate subtract:gMotherShare];
                        remainingShare = estate;
                        
                        [dict setObject:gMotherShare forKey:@"Grandmother"];
                        [numDict setObject:numGMother.text forKey:@"Grandmother"];
                        
                        shares = [self calculateMultipleSiblingShare:dict names:numDict];
                        
                        dict = [shares objectAtIndex:0];
                        numDict = [shares objectAtIndex:1];
                        
                        
                        if ([self checkShares:dict] == -1) {
                            
                            //add residual male relatives in order here, starting with grandfather
                            shares = [self calculateResidualShares:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                        }
                        
                    }
                    
                    else if ([numGMother.text intValue] == 0 && [numGFather.text intValue] == 1) {
                        
                        gFatherShare = estate;
                            
                        [dict setObject:gFatherShare forKey:@"Grandfather"];
                        [numDict setObject:numGFather.text forKey:@"Grandfather"];
                            
                        
                    }
                    
                }//close checkgrandparents
                
                else { //i.e. no living parents or grandparents
                    
                    shares = [self calculateMultipleSiblingShare:dict names:numDict];
                    
                    dict = [shares objectAtIndex:0];
                    numDict = [shares objectAtIndex:1];
                    
                    
                    if ([self checkShares:dict] == -1) {
                        
                        //add residual male relatives in order here, starting with grandfather
                        shares = [self calculateResidualShares:dict names:numDict];
                        
                        dict = [shares objectAtIndex:0];
                        numDict = [shares objectAtIndex:1];
                        
                    }
                    
                }//close no living parents or grandparents
                
                
            }//close checkSiblings
            
        }//close checkSpouse
        
        else if (![self checkSpouse]) { //i.e. no living spouse
            
            if (![self checkSiblings]) { //1 or no siblings alive
                
                if ([self checkParents]) {
                    //where both parents are alive
                    motherShare = [[Fraction alloc] init];
                    fatherShare = [[Fraction alloc] init];
                    
                    if ([numFather.text intValue] > 0 && [numMother.text intValue] > 0) {
                        
                        [motherShare setNumerator:1 andDenominator:3];
                        
                        estate = [estate subtract:motherShare];
                        remainingShare = estate;
                        fatherShare = remainingShare;
                        
                        [dict setObject:motherShare forKey:@"Mother"];
                        [dict setObject:fatherShare forKey:@"Father"];
                        
                        [numDict setObject:numMother.text forKey:@"Mother"];
                        [numDict setObject:numFather.text forKey:@"Father"];
                        
                    }
                    
                    //where father is alive and mother is not
                    else if ([numFather.text intValue] > 0 && [numMother.text intValue] == 0) {
                        
                        if ([numGMother.text intValue] > 0) {
                            
                            gMotherShare = [[Fraction alloc] init];
                            fatherShare = [[Fraction alloc] init];
                            
                            [gMotherShare setNumerator:1 andDenominator:6];
                            
                            estate = [estate subtract:gMotherShare];
                            remainingShare = estate;
                            
                            fatherShare = remainingShare;
                            
                            [dict setObject:gMotherShare forKey:@"Grandmother"];
                            [numDict setObject:numGMother.text forKey:@"Grandmother"];
                            
                            [dict setObject:fatherShare forKey:@"Father"];
                            [numDict setObject:numFather.text forKey:@"Father"];
                            
                        }
                        
                        else {
                            
                            fatherShare = [[Fraction alloc] init];
                            fatherShare = estate;
                            
                            [dict setObject:fatherShare forKey:@"Father"];
                            [numDict setObject:numFather.text forKey:@"Father"];
                            
                        }
                        
                        
                    }
                    
                    //where mother is alive and father is not
                    else if ([numFather.text intValue] == 0 && [numMother.text intValue] > 0) {
                        
                        [motherShare setNumerator:1 andDenominator:3];
                        
                        estate = [estate subtract:motherShare];
                        remainingShare = estate;
                        
                        [dict setObject:motherShare forKey:@"Mother"];
                        [numDict setObject:numMother.text forKey:@"Mother"];
                        
                        //where grandfather is alive
                        if ([numGFather.text intValue] > 0) {
                            
                            gFatherShare = [[Fraction alloc] init];
                            gFatherShare = remainingShare;
                            
                            [dict setObject:gFatherShare forKey:@"Grandfather"];
                            [numDict setObject:numGFather.text forKey:@"Grandfather"];

                        }
                        
                        else {//very important---v
                            
                            shares = [self calculateSingleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            
                            if ([self checkShares:dict] == -1) {
                                
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                            }
                            
                        }
                    
                    }
            
                }//close checkParents
                
                else if ([self checkGrandParents]) {
                    
                    //where both parents are dead and both grandparents are alive
                    gMotherShare = [[Fraction alloc] init];
                    gFatherShare = [[Fraction alloc] init];
                    
                    if ([numGFather.text intValue] > 0 && [numGMother.text intValue] > 0) {
                        
                        [gMotherShare setNumerator:1 andDenominator:6];
                        
                        estate = [estate subtract:gMotherShare];
                        remainingShare = estate;
                        gFatherShare = remainingShare;
                        
                        [dict setObject:gMotherShare forKey:@"Grandmother"];
                        [dict setObject:gFatherShare forKey:@"Grandfather"];
                        
                        [numDict setObject:numGMother.text forKey:@"Grandmother"];
                        [numDict setObject:numGFather.text forKey:@"Grandfather"];
                        
                    }
                    
                    //where grandmother is alive and grandfather is not
                    else if ([numGFather.text intValue] == 0 && [numGMother.text intValue] > 0) {
                        
                        [gMotherShare setNumerator:1 andDenominator:6];
                            
                        estate = [estate subtract:gMotherShare];
                        remainingShare = estate;
                            
                        [dict setObject:gMotherShare forKey:@"Grandmother"];
                        [numDict setObject:numGMother.text forKey:@"Grandmother"];
                        
                        shares = [self calculateSingleSiblingShare:dict names:numDict];
                        
                        dict = [shares objectAtIndex:0];
                        numDict = [shares objectAtIndex:1];
                        
                        
                        if ([self checkShares:dict] == -1) {
                            
                            //add residual male relatives in order here, starting with grandfather
                            shares = [self calculateResidualShares:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                        }
                        
                    }
                    
                    //where grandfather is alive and grandmother is not
                    else if ([numGFather.text intValue] > 0 && [numGMother.text intValue] == 0) {
                        
                        gFatherShare = [[Fraction alloc] init];
                        gFatherShare = estate;
                        
                        [dict setObject:gFatherShare forKey:@"Grandfather"];
                        [numDict setObject:numGFather.text forKey:@"Grandfather"];
                        
                    }
                    
                    
                }//close checkgrandparents
                
                else {//***********************important!  check
                    
                    shares = [self calculateSingleSiblingShare:dict names:numDict];
                    
                    dict = [shares objectAtIndex:0];
                    numDict = [shares objectAtIndex:1];
                    
                    
                    if ([self checkShares:dict] == -1) {
                        
                        //add residual male relatives in order here, starting with grandfather
                        shares = [self calculateResidualShares:dict names:numDict];
                        
                        dict = [shares objectAtIndex:0];
                        numDict = [shares objectAtIndex:1];
                        
                    }
 
                }//close no parents nor grandparents
        
            }//close no Siblings
    
            else if ([self checkSiblings]){ //i.e. at least two siblings of any kind alive
                
                NSLog(@"No children or spouse");
                if ([self checkParents]) {
                    //where both parents are alive
                    motherShare = [[Fraction alloc] init];
                    fatherShare = [[Fraction alloc] init];
                    
                    if ([numMother.text intValue] == 1 && [numFather.text intValue] == 1) {
                        
                        [motherShare setNumerator:1 andDenominator:6];
                        
                        estate = [estate subtract:motherShare];
                        remainingShare = estate;
                        
                        fatherShare = estate;
                        
                        [dict setObject:motherShare forKey:@"Mother"];
                        [numDict setObject:numMother.text forKey:@"Mother"];
                        
                        [dict setObject:fatherShare forKey:@"Father"];
                        [numDict setObject:numFather.text forKey:@"Father"];
                        
                        
                    }
                    //where mother is alive and father is not
                    else if ([numMother.text intValue] == 1 && [numFather.text intValue] == 0) {
                        
                        [motherShare setNumerator:1 andDenominator:6];
                        
                        estate = [estate subtract:motherShare];
                        remainingShare = estate;
                        
                        [dict setObject:motherShare forKey:@"Mother"];
                        [numDict setObject:numMother.text forKey:@"Mother"];
                        
                        if ([numGFather.text intValue] == 1) {
                            
                            gFatherShare = [[Fraction alloc] init];
                            gFatherShare = estate;
                            
                            [dict setObject:gFatherShare forKey:@"Grandfather"];
                            [numDict setObject:numGFather.text forKey:@"Grandfather"];
                            
                        }
                        
                        else {
                        
                            shares = [self calculateMultipleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            
                            if ([self checkShares:dict] == -1) {
                            
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                            
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                            
                            }
                        
                        }
                    
                    }
                    //where father is alive and mother is not
                    else if ([numMother.text intValue] == 0 && [numFather.text intValue] == 1) {
                    
                        if ([numGMother.text intValue] > 0) {
                        
                            [gMotherShare setNumerator:1 andDenominator:6];
                        
                            estate = [estate subtract:gMotherShare];
                            remainingShare = estate;
                        
                            [dict setObject:gMotherShare forKey:@"Grandmother"];
                            [numDict setObject:numGMother.text forKey:@"Grandmother"];
                        
                            fatherShare = estate;
                        
                            [dict setObject:fatherShare forKey:@"Father"];
                            [numDict setObject:numFather.text forKey:@"Father"];
                        
                        }
                    
                        else {
                        
                            fatherShare = estate;
                        
                            [dict setObject:fatherShare forKey:@"Father"];
                            [numDict setObject:numFather.text forKey:@"Father"];
                        
                        }
                    
                    
                    }
                
                
                }//close checkParents
                
                else if ([self checkGrandParents]) {
                    
                    //where both grqndparents are alive
                    gMotherShare = [[Fraction alloc] init];
                    gFatherShare = [[Fraction alloc] init];
                    
                    if ([numGMother.text intValue] > 0 && [numGFather.text intValue] == 1) {
                        
                        [gMotherShare setNumerator:1 andDenominator:6];
                        
                        estate = [estate subtract:gMotherShare];
                        remainingShare = estate;
                        
                        gFatherShare = estate;
                        
                        [dict setObject:gMotherShare forKey:@"Grandmother"];
                        [numDict setObject:numGMother.text forKey:@"Grandmother"];
                        
                        [dict setObject:gFatherShare forKey:@"Grandfather"];
                        [numDict setObject:numGFather.text forKey:@"Grandfather"];
                        
                    }
                    //where grandmother is alive and grandfather is not
                    else if ([numGMother.text intValue] > 0 && [numGFather.text intValue] == 0) {
                        
                        [gMotherShare setNumerator:1 andDenominator:6];
                        
                        estate = [estate subtract:gMotherShare];
                        remainingShare = estate;
                        
                        [dict setObject:gMotherShare forKey:@"Grandmother"];
                        [numDict setObject:numGMother.text forKey:@"Grandmother"];
                        
                        shares = [self calculateMultipleSiblingShare:dict names:numDict];
                        
                        dict = [shares objectAtIndex:0];
                        numDict = [shares objectAtIndex:1];
                        
                        
                        if ([self checkShares:dict] == -1) {
                            
                            //add residual male relatives in order here, starting with grandfather
                            shares = [self calculateResidualShares:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                        }
                        
                    }
                    //where grandfather is alive and grandmother is not
                    else if ([numGMother.text intValue] == 0 && [numGFather.text intValue] == 1) {
                        
                        fatherShare = estate;
                        
                        [dict setObject:fatherShare forKey:@"Grandfather"];
                        [numDict setObject:numFather.text forKey:@"Grandfather"];
                      
                    }
                    
                }//close grandparents
                
                else {//i.e. no living parents or grandparents
                    
                    shares = [self calculateMultipleSiblingShare:dict names:numDict];
                    
                    dict = [shares objectAtIndex:0];
                    numDict = [shares objectAtIndex:1];
                    
                    
                    if ([self checkShares:dict] == -1) {
                        //add residual male relatives in order here, starting with grandfather
                        shares = [self calculateResidualShares:dict names:numDict];
                        
                        dict = [shares objectAtIndex:0];
                        numDict = [shares objectAtIndex:1];
                        
                    }
                    
                    
                }//close no living parents or grandparents
                
                
            }//close siblings
            
        }//close checkSpouse
        
        
    }//close if no children
    
    //else if (([self checkChildren] && ![self checkGrandChildren]) || ([self checkGrandChildren] && ![self checkChildren])) {
    
    else if (([self checkChildren]) || ([self checkGrandChildren])) { //children or grandchildren are alive
        //either one of the above clauses needs to be true, but not both
        NSLog(@"Am I here?");
        //check to see if there is a living spouse
        if ([self checkSpouse]) {
            
            //check to see if wife is alive
            wifeShare = [[Fraction alloc] init];
            husbandShare = [[Fraction alloc] init];
            
            if ([numWife.text intValue] > 0) {
                
                [wifeShare setNumerator:1 andDenominator:8];
                
                estate = [estate subtract:wifeShare];
                remainingShare = estate;
                
                [dict setObject:wifeShare forKey:@"Wife"];
                [numDict setObject:numWife.text forKey:@"Wife"];
                NSLog(@"This is stupid");
            }
            
            //check to see if husband is alive
            else if ([numHusband.text intValue] > 0) {
                
                [husbandShare setNumerator:1 andDenominator:4];
                
                estate = [estate subtract:husbandShare];
                remainingShare = estate;
                
                [dict setObject:husbandShare forKey:@"Husband"];
                [numDict setObject:numHusband.text forKey:@"Husband"];
                
            }
            
        }//close checkSpouse
        
        //check to see if there any living parents
        if ([self checkParents]) {
            
            motherShare = [[Fraction alloc] init];
            fatherShare = [[Fraction alloc] init];
            //where both parents are alive
            if ([numFather.text intValue] > 0) {
                
                [fatherShare setNumerator:1 andDenominator:6];
                
                estate = [estate subtract:fatherShare];
                remainingShare = estate;
                
                [dict setObject:fatherShare forKey:@"Father"];
                [numDict setObject:numFather.text forKey:@"Father"];
                
            }
            
            else if ([numGFather.text intValue] > 0) {
                
                gFatherShare = [[Fraction alloc] init];
                
                [gFatherShare setNumerator:1 andDenominator:6];
                
                estate = [estate subtract:gFatherShare];
                remainingShare = estate;
                
                [dict setObject:gFatherShare forKey:@"Grandfather"];
                [numDict setObject:numGFather.text forKey:@"Grandfather"];
                
            }
            
            
            //where mother is alive and father is not
            if ([numMother.text intValue] > 0) {
                
                [motherShare setNumerator:1 andDenominator:6];
                
                estate = [estate subtract:motherShare];
                remainingShare = estate;
                
                [dict setObject:motherShare forKey:@"Mother"];
                [numDict setObject:numMother.text forKey:@"Mother"];
                
            }
            
            else if ([numGMother.text intValue] > 0) {
                
                gMotherShare = [[Fraction alloc] init];
                
                [gMotherShare setNumerator:1 andDenominator:6];
                
                estate = [estate subtract:gMotherShare];
                remainingShare = estate;
                
                [dict setObject:gMotherShare forKey:@"Grandmother"];
                [numDict setObject:numGMother.text forKey:@"Grandmother"];
                
            }
            
            
        }//close check parents
        
        else if ([self checkGrandParents]) {
            
            gMotherShare = [[Fraction alloc] init];
            gFatherShare = [[Fraction alloc] init];
            //where both grandparents are alive
            if ([numGMother.text intValue] > 0) {
                
                gMotherShare = [[Fraction alloc] init];
                
                [gMotherShare setNumerator:1 andDenominator:6];
                
                estate = [estate subtract:gMotherShare];
                remainingShare = estate;
                
                [dict setObject:gMotherShare forKey:@"Grandmother"];
                [numDict setObject:numGMother.text forKey:@"Grandmother"];
                
            }

            if ([numGFather.text intValue] > 0) {
                
                gFatherShare = [[Fraction alloc] init];
                
                [gFatherShare setNumerator:1 andDenominator:6];
                
                estate = [estate subtract:gFatherShare];
                remainingShare = estate;
                
                [dict setObject:gFatherShare forKey:@"Grandfather"];
                [numDict setObject:numGFather.text forKey:@"Grandfather"];
                
            }

        }
        //do I add an else statement for no parents?
        //no son
        
        if (![self checkSiblings]) {
            //at least one daughter and no sons
            if ([numSon.text intValue] == 0 && [numDaughter.text intValue] > 0) {
                
                daughterShare = [[Fraction alloc] init];
                //one daughter and no grandchildren --> improve this code please!
                if ([numDaughter.text intValue] == 1) {
                    
                    [daughterShare setNumerator:1 andDenominator:2];
                    
                    estate = [estate subtract:daughterShare];
                    remainingShare = estate;
                    
                    [dict setObject:daughterShare forKey:@"Daughter"];
                    [numDict setObject:numDaughter.text forKey:@"Daughter"];
                    
                    if (![self checkGrandChildren]) {
                        
                        //also important ... please check!
                        if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                            
                            shares = [self calculateSingleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            
                            if ([self checkShares:dict] == -1) {
                                
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                            }
                            
                        }
                        
                    }//close one daughter and no grandchildren
                    
                    else if ([self checkGrandChildren]) {
                        //one daughter, and at least one grandson and at least one granddaughter
                        if ([numGSon.text intValue] > 0 && [numGDaughter.text intValue] > 0) {
                            
                            Fraction *gSonFrac = [[Fraction alloc] init];
                            [gSonFrac setNumerator:2 andDenominator:1];
                            
                            Fraction *gSonNumber = [[Fraction alloc] init];
                            [gSonNumber setNumerator:[numGSon.text intValue] andDenominator:1];
                            
                            Fraction *gDaughterFrac = [[Fraction alloc] init];
                            [gDaughterFrac setNumerator:[numGDaughter.text intValue] andDenominator:1];
                            gDaughterShare = [self calculateFemaleShare:[numGSon.text intValue] :[numGDaughter.text intValue] :estate];
                            Fraction *tempFrac = [gDaughterShare multiply:gSonFrac];
                            gSonShare = [tempFrac multiply:gSonNumber];
                            gDaughterShare = [gDaughterShare multiply:gDaughterFrac];
                            
                            [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                            [dict setObject:gSonShare forKey:@"Grandson"];
                            
                            [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                            [numDict setObject:numGSon.text forKey:@"Grandson"];
                            
                        }
                        
                        //no grandson and at least one granddaughter
                        else if ([numGSon.text intValue] == 0 && [numGDaughter.text intValue] > 0) {
                            
                            gDaughterShare = [[Fraction alloc] init];
                            [gDaughterShare setNumerator:1 andDenominator:6];
                            
                            estate = [estate subtract:gDaughterShare];
                            remainingShare = estate;
                            
                            [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                            [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                            
                            //also important ... please check!
                            
                            if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                                
                                shares = [self calculateSingleSiblingShare:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                                
                                if ([self checkShares:dict] == -1) {
                                    
                                    //add residual male relatives in order here, starting with grandfather
                                    shares = [self calculateResidualShares:dict names:numDict];
                                    
                                    dict = [shares objectAtIndex:0];
                                    numDict = [shares objectAtIndex:1];
                                    
                                    
                                }
                                
                            }
                            
                        }
                        
                        //one daughter and at least one grandson
                        else if ([numGDaughter.text intValue] == 0 && [numGSon.text intValue] > 0) {
                            
                            gSonShare = [[Fraction alloc] init];
                            
                            remainingShare = estate;
                            gSonShare = remainingShare;
                            
                            [dict setObject:gSonShare forKey:@"Grandson"];
                            [numDict setObject:numGSon.text forKey:@"Grandson"];
                            
                        }
                        
                    }//close one daughter with grandchildren
                                      
                }//close one daughter
                
                //at least two daughters
                else if ([numDaughter.text intValue] > 1) {
                    
                    [daughterShare setNumerator:2 andDenominator:3];
                    estate = [estate subtract:daughterShare];
                    remainingShare = estate;
                    
                    [dict setObject:daughterShare forKey:@"Daughter"];
                    [numDict setObject:numDaughter.text forKey:@"Daughter"];
                    
                    if ([self checkGrandChildren]) {
                        
                        //at least one granddaughter at least one grandson
                        if ([numGSon.text intValue] > 0 && [numGDaughter.text intValue] > 0) {
                            
                            Fraction *gSonFrac = [[Fraction alloc] init];
                            [gSonFrac setNumerator:2 andDenominator:1];
                            
                            Fraction *gSonNumber = [[Fraction alloc] init];
                            [gSonNumber setNumerator:[numGSon.text intValue] andDenominator:1];
                            
                            Fraction *gDaughterFrac = [[Fraction alloc] init];
                            [gDaughterFrac setNumerator:[numGDaughter.text intValue] andDenominator:1];
                            gDaughterShare = [self calculateFemaleShare:[numGSon.text intValue] :[numGDaughter.text intValue] :estate];
                            Fraction *tempFrac = [gDaughterShare multiply:gSonFrac];
                            gSonShare = [tempFrac multiply:gSonNumber];
                            gDaughterShare = [gDaughterShare multiply:gDaughterFrac];
                            
                            [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                            [dict setObject:gSonShare forKey:@"Grandson"];
                            
                            [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                            [numDict setObject:numGSon.text forKey:@"Grandson"];
                            
                        }
                        
                        //no granddaughters and at least one grandson
                        else if ([numGDaughter.text intValue] == 0 && [numGSon.text intValue] > 0) {
                            
                            gSonShare = [[Fraction alloc] init];
                            gSonShare = remainingShare;
                            
                            [dict setObject:gSonShare forKey:@"Grandson"];
                            [numDict setObject:numGSon.text forKey:@"Grandson"];
                            
                        }
                        //at least one granddaughter and no grandsons
                        else if ([numGDaughter.text intValue] > 0 && [numGSon.text intValue] == 0) {
                            
                            //also important ... please check!
                            
                            if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                                
                                shares = [self calculateSingleSiblingShare:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                                
                                if ([self checkShares:dict] == -1) {
                                    
                                    //add residual male relatives in order here, starting with grandfather
                                    shares = [self calculateResidualShares:dict names:numDict];
                                    
                                    dict = [shares objectAtIndex:0];
                                    numDict = [shares objectAtIndex:1];
                                    
                                }
                                
                            }
                          
                        }
                        
                    }//close two daughters with grandchildren
                    
                    else if (![self checkGrandChildren]) {
                        
                        //also important ... please check!
                        if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                         
                            shares = [self calculateSingleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            
                            if ([self checkShares:dict] == -1) {
                                
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                            }
                            
                        }
                        
                    }//close two daughters with no grandchildren
                    
                }//close two daughters and no sons
                
            }//close at least one daughter and no sons
            //at least one daughter and at least one son
            else if ([numDaughter.text intValue] > 0 && [numSon.text intValue] > 0) {
                
                Fraction *sonFrac = [[Fraction alloc] init];
                [sonFrac setNumerator:2 andDenominator:1];
                
                Fraction *sonNumber = [[Fraction alloc] init];
                [sonNumber setNumerator:[numSon.text intValue] andDenominator:1];
                
                Fraction *daughterFrac = [[Fraction alloc] init];
                [daughterFrac setNumerator:[numDaughter.text intValue] andDenominator:1];
                daughterShare = [self calculateFemaleShare:[numSon.text intValue] :[numDaughter.text intValue] :estate];
                Fraction *tempFrac = [daughterShare multiply:sonFrac];
                sonShare = [tempFrac multiply:sonNumber];
                daughterShare = [daughterShare multiply:daughterFrac];
                
                
                [dict setObject:daughterShare forKey:@"Daughter"];
                [dict setObject:sonShare forKey:@"Son"];
                
                [numDict setObject:numDaughter.text forKey:@"Daughter"];
                [numDict setObject:numSon.text forKey:@"Son"];
                
            }
            //no daughters and at least one son
            else if ([numDaughter.text intValue] == 0 && [numSon.text intValue] > 0) {
                
                sonShare = estate;
                
                [dict setObject:sonShare forKey:@"Son"];
                [numDict setObject:numSon.text forKey:@"Son"];
                
            }
            //no daughter and no son
            else if ([numDaughter.text intValue] == 0 && [numSon.text intValue] == 0) {
                
                //grandchildren scenarios here
                if ([self checkGrandChildren]) {
                    
                    gDaughterShare = [[Fraction alloc] init];
                    gSonShare = [[Fraction alloc] init];
                    //one granddaughter and no grandson
                    if ([numGDaughter.text intValue] == 1 && [numGSon.text intValue] == 0) {
                        
                        [gDaughterShare setNumerator:1 andDenominator:2];
                        
                        estate = [estate subtract:gDaughterShare];
                        remainingShare = estate;
                        
                        [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                        [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                        
                        //also important ... please check!
                        if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                            
                            shares = [self calculateSingleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            
                            if ([self checkShares:dict] == -1) {
                                
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                                
                            }
                            
                        }
                                                
                    }
                    //at least two granddaughters and no grandsons
                    else if ([numGDaughter.text intValue] > 1 && [numGSon.text intValue] == 0) {
                        
                        [gDaughterShare setNumerator:2 andDenominator:3];
                        
                        estate = [estate subtract:gDaughterShare];
                        remainingShare = estate;
                        
                        [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                        [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                        
                        //also important ... please check!
                        if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                            
                            shares = [self calculateSingleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            
                            if ([self checkShares:dict] == -1) {
                                
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                            }
                                                        
                        }
                                               
                    }
                    //at least one granddaughter and at least one grandson
                    else if ([numGDaughter.text intValue] > 0 && [numGSon.text intValue] > 0) {
                        
                        Fraction *gSonFrac = [[Fraction alloc] init];
                        [gSonFrac setNumerator:2 andDenominator:1];
                        
                        Fraction *gSonNumber = [[Fraction alloc] init];
                        [gSonNumber setNumerator:[numGSon.text intValue] andDenominator:1];
                        
                        Fraction *gDaughterFrac = [[Fraction alloc] init];
                        [gDaughterFrac setNumerator:[numGDaughter.text intValue] andDenominator:1];
                        gDaughterShare = [self calculateFemaleShare:[numGSon.text intValue] :[numGDaughter.text intValue] :estate];
                        Fraction *tempFrac = [gDaughterShare multiply:gSonFrac];
                        gSonShare = [tempFrac multiply:gSonNumber];
                        gDaughterShare = [gDaughterShare multiply:gDaughterFrac];
                        
                        [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                        [dict setObject:gSonShare forKey:@"Grandson"];
                        
                        [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                        [numDict setObject:numGSon.text forKey:@"Grandson"];
                        
                    }
                    //no granddaughter and at least one grandson
                    else if ([numGDaughter.text intValue] == 0 && [numGSon.text intValue] > 0) {
                        
                        gSonShare = estate;
                        
                        [dict setObject:gSonShare forKey:@"Grandson"];
                        [numDict setObject:numGSon.text forKey:@"Grandson"];
                        
                    }
                                        
                }
                
            }
            
        }
        
        else if ([self checkSiblings]){
            //no sons and at least one daughter
            if ([numSon.text intValue] == 0 && [numDaughter.text intValue] > 0) {
                
                daughterShare = [[Fraction alloc] init];
                //one daughter and no grandchildren
                if ([numDaughter.text intValue] == 1) {
                    
                    [daughterShare setNumerator:1 andDenominator:2];
                    
                    estate = [estate subtract:daughterShare];
                    remainingShare = estate;
                    
                    [dict setObject:daughterShare forKey:@"Daughter"];
                    [numDict setObject:numDaughter.text forKey:@"Daughter"];
                    
                    if (![self checkGrandChildren]) {
                        
                        if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                            
                            shares = [self calculateMultipleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            //do I need this here?
                            if ([self checkShares:dict] == -1) {
                                
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                            }
                            
                        }
                        
                    }//close one daughter and no grandchildren
                    
                    else if ([self checkGrandChildren]) {
                        
                        //at least one granddaughter and at least one grandson
                        if ([numGDaughter.text intValue] > 0 && [numGSon.text intValue] > 0) {
                            
                            Fraction *gSonFrac = [[Fraction alloc] init];
                            [gSonFrac setNumerator:2 andDenominator:1];
                            
                            Fraction *gSonNumber = [[Fraction alloc] init];
                            [gSonNumber setNumerator:[numGSon.text intValue] andDenominator:1];
                            
                            Fraction *gDaughterFrac = [[Fraction alloc] init];
                            [gDaughterFrac setNumerator:[numGDaughter.text intValue] andDenominator:1];
                            gDaughterShare = [self calculateFemaleShare:[numGSon.text intValue] :[numGDaughter.text intValue] :estate];
                            Fraction *tempFrac = [gDaughterShare multiply:gSonFrac];
                            gSonShare = [tempFrac multiply:gSonNumber];
                            gDaughterShare = [gDaughterShare multiply:gDaughterFrac];
                            
                            
                            [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                            [dict setObject:gSonShare forKey:@"Grandson"];
                            
                            [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                            [numDict setObject:numGSon.text forKey:@"Grandson"];
                            
                        }
                        //at least one granddaughter and no grandson abc
                        else if ([numGDaughter.text intValue] > 0 && [numGSon.text intValue] == 0) {
                            
                            gDaughterShare = [[Fraction alloc] init];
                            [gDaughterShare setNumerator:1 andDenominator:6];
                            
                            estate = [estate subtract:gDaughterShare];
                            remainingShare = estate;
                            
                            [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                            [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                            
                            if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                                
                                shares = [self calculateMultipleSiblingShare:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                                
                                //do I need this here?
                                if ([self checkShares:dict] == -1) {
                                    
                                    //add residual male relatives in order here, starting with grandfather
                                    shares = [self calculateResidualShares:dict names:numDict];
                                    
                                    dict = [shares objectAtIndex:0];
                                    numDict = [shares objectAtIndex:1];
                                    
                                }
                                
                            }
                            
                        }
                        
                        //no granddaughter and at least one grandson
                        else if ([numGDaughter.text intValue] == 0 && [numGSon.text intValue] > 0) {
                            
                            gSonShare = [[Fraction alloc] init];
                            gSonShare = remainingShare;
                            
                            [dict setObject:gSonShare forKey:@"Grandson"];
                            [numDict setObject:numGSon.text forKey:@"Grandson"];
                            
                        }
                        
                    }//close one daughter with grandchildren
                    
                                      
                }//close one daughter only
                
                //at least two daughters
                else if ([numDaughter.text intValue] > 1) {
                    
                    [daughterShare setNumerator:2 andDenominator:3];
                    
                    estate = [estate subtract:daughterShare];
                    remainingShare = estate;
                    
                    [dict setObject:daughterShare forKey:@"Daughter"];
                    [numDict setObject:numDaughter.text forKey:@"Daughter"];
                    
                    if (![self checkGrandChildren]) {
                        
                        if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                            
                            shares = [self calculateMultipleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            //do I need this here?
                            if ([self checkShares:dict] == -1) {
                                
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                            }
                            
                        }
                        
                    }
                    
                    else if ([self checkGrandChildren]) {
                        
                        //at least one grandson and no granddaughters
                        if ([numGSon.text intValue] > 0 && [numGDaughter.text intValue] == 0) {
                            
                            gSonShare = [[Fraction alloc] init];
                            gSonShare = remainingShare;
                            
                            [dict setObject:gSonShare forKey:@"Grandson"];
                            [numDict setObject:numGSon forKey:@"Grandson"];
                            
                        }
                        //at least one grandson and at least one granddaughter
                        else if ([numGSon.text intValue] > 0 && [numGDaughter.text intValue] > 0) {
                            
                            Fraction *gSonFrac = [[Fraction alloc] init];
                            [gSonFrac setNumerator:2 andDenominator:1];
                            
                            Fraction *gSonNumber = [[Fraction alloc] init];
                            [gSonNumber setNumerator:[numGSon.text intValue] andDenominator:1];
                            
                            Fraction *gDaughterFrac = [[Fraction alloc] init];
                            [gDaughterFrac setNumerator:[numGDaughter.text intValue] andDenominator:1];
                            gDaughterShare = [self calculateFemaleShare:[numGSon.text intValue] :[numGDaughter.text intValue] :estate];
                            Fraction *tempFrac = [gDaughterShare multiply:gSonFrac];
                            gSonShare = [tempFrac multiply:gSonNumber];
                            gDaughterShare = [gDaughterShare multiply:gDaughterFrac];
                            
                            [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                            [dict setObject:gSonShare forKey:@"Grandson"];
                            
                            [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                            [numDict setObject:numGSon.text forKey:@"Grandson"];
                            
                        }
                        
                        //at least one granddaughter and no grandsons abc
                        else if ([numGSon.text intValue] == 0 && [numGDaughter.text intValue] > 0) {
                            
                            if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                                
                                shares = [self calculateMultipleSiblingShare:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                                if ([self checkShares:dict] == -1) {
                                    
                                    //add residual male relatives in order here, starting with grandfather
                                    shares = [self calculateResidualShares:dict names:numDict];
                                    
                                    dict = [shares objectAtIndex:0];
                                    numDict = [shares objectAtIndex:1];
                                    
                                }
                                
                            }
                            
                        }
                        
                    }//close two daughters with grandchildren
                    
                }//close at least two daughters and no sons
                
            }//close at least one daughter and no sons
            //at least one daughter and at least one son
            else if ([numDaughter.text intValue] > 0 && [numSon.text intValue] > 0) {
                
                Fraction *sonFrac = [[Fraction alloc] init];
                [sonFrac setNumerator:2 andDenominator:1];
                
                Fraction *sonNumber = [[Fraction alloc] init];
                [sonNumber setNumerator:[numSon.text intValue] andDenominator:1];
                
                Fraction *daughterFrac = [[Fraction alloc] init];
                [daughterFrac setNumerator:[numDaughter.text intValue] andDenominator:1];
                daughterShare = [self calculateFemaleShare:[numSon.text intValue] :[numDaughter.text intValue] :estate];
                Fraction *tempFrac = [daughterShare multiply:sonFrac];
                sonShare = [tempFrac multiply:sonNumber];
                daughterShare = [daughterShare multiply:daughterFrac];
                
                
                [dict setObject:daughterShare forKey:@"Daughter"];
                [dict setObject:sonShare forKey:@"Son"];
                
                [numDict setObject:numDaughter.text forKey:@"Daughter"];
                [numDict setObject:numSon.text forKey:@"Son"];
                
            }
            //no daughters and at least one son
            else if ([numDaughter.text intValue] == 0 && [numSon.text intValue] > 0) {
                
                sonShare = estate;
                
                [dict setObject:sonShare forKey:@"Son"];
                [numDict setObject:numSon.text forKey:@"Son"];
                
            }
            //no daughters and no sons
            else if ([numDaughter.text intValue] == 0 && [numSon.text intValue] == 0) {
                
                //grandchildren scenarios here
                if ([self checkGrandChildren]) {
                    
                    gDaughterShare = [[Fraction alloc] init];
                    gSonShare = [[Fraction alloc] init];
                    //one granddaughter and no grandsons
                    if ([numGDaughter.text intValue] == 1 && [numGSon.text intValue] == 0) {
                        
                        [gDaughterShare setNumerator:1 andDenominator:2];
                        
                        estate = [estate subtract:gDaughterShare];
                        remainingShare = estate;
                        
                        [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                        [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                        
                        if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                            
                            shares = [self calculateMultipleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            //do I need this here?
                            if ([self checkShares:dict] == -1) {
                                
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                            }
                            
                        }
                                                
                    }
                    //at least two granddaughters and no grandsons abc
                    else if ([numGDaughter.text intValue] > 1 && [numGSon.text intValue] == 0) {
                        
                        [gDaughterShare setNumerator:2 andDenominator:3];
                        
                        estate = [estate subtract:gDaughterShare];
                        remainingShare = estate;
                        
                        [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                        [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                        
                        if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                            
                            shares = [self calculateMultipleSiblingShare:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                            //do I need this here?
                            if ([self checkShares:dict] == -1) {
                                
                                //add residual male relatives in order here, starting with grandfather
                                shares = [self calculateResidualShares:dict names:numDict];
                                
                                dict = [shares objectAtIndex:0];
                                numDict = [shares objectAtIndex:1];
                                
                            }
                            
                        }
                                                
                    }
                    //at least one granddaughter and at least one grandson
                    else if ([numGDaughter.text intValue] > 0 && [numGSon.text intValue] > 0) {
                        
                        Fraction *gSonFrac = [[Fraction alloc] init];
                        [gSonFrac setNumerator:2 andDenominator:1];
                        
                        Fraction *gSonNumber = [[Fraction alloc] init];
                        [gSonNumber setNumerator:[numGSon.text intValue] andDenominator:1];
                        
                        Fraction *gDaughterFrac = [[Fraction alloc] init];
                        [gDaughterFrac setNumerator:[numGDaughter.text intValue] andDenominator:1];
                        gDaughterShare = [self calculateFemaleShare:[numGSon.text intValue] :[numGDaughter.text intValue] :estate];
                        Fraction *tempFrac = [gDaughterShare multiply:gSonFrac];
                        gSonShare = [tempFrac multiply:gSonNumber];
                        gDaughterShare = [gDaughterShare multiply:gDaughterFrac];
                        
                        
                        [dict setObject:gDaughterShare forKey:@"Granddaughter"];
                        [dict setObject:gSonShare forKey:@"Grandson"];
                        
                        [numDict setObject:numGDaughter.text forKey:@"Granddaughter"];
                        [numDict setObject:numGSon.text forKey:@"Grandson"];
                        
                    }
                    //no granddaughter and at least one grandson
                    else if ([numGDaughter.text intValue] == 0 && [numGSon.text intValue] > 0) {
                        
                        gSonShare = estate;
                        
                        [dict setObject:gSonShare forKey:@"Grandson"];
                        [numDict setObject:numGSon.text forKey:@"Grandson"];
                        
                    }
                    
                }//close grandchildren
                
                else if (![self checkGrandChildren]) {
                    
                    if ([numFather.text intValue] == 0 && [numGFather.text intValue] == 0) {
                        
                        shares = [self calculateMultipleSiblingShare:dict names:numDict];
                        
                        dict = [shares objectAtIndex:0];
                        numDict = [shares objectAtIndex:1];
                        
                        if ([self checkShares:dict] == -1) {
                            
                            //add residual male relatives in order here, starting with grandfather
                            shares = [self calculateResidualShares:dict names:numDict];
                            
                            dict = [shares objectAtIndex:0];
                            numDict = [shares objectAtIndex:1];
                            
                        }
                        
                    }
                    
                }//close no grandchildren
                
                
            }//close no daughters and no sons
            
            
        }//close checkSiblings
        
            
        if ([self checkShares:dict] == -1) {
        
            //add residual male relatives in order here, starting with grandfather
            shares = [self calculateResidualShares:dict names:numDict];
        
            dict = [shares objectAtIndex:0];
            numDict = [shares objectAtIndex:1];
        
        }
    
    }//close if children exist


    if ([self checkShares:dict] == 1) {
        
        dict = [self increaseBase:dict];
        
    }
    
    else if ([self checkShares:dict] == -1) {
        
        dict = [self reduceBase:dict];
        
    }
    
    
    
    NSLog(@"%@", dict);
    
    NSArray *keys = [dict allKeys];
    
    // values in foreach loop
    for (NSString *key in keys) {
        NSLog(@"%@ gets %@",key, [dict objectForKey:key]);
    }
    
    NSArray *array = [NSArray arrayWithObjects:dict, numDict, nil];
    
    return array;
    
}

- (NSArray *) calculateMultipleSiblingShare: (NSMutableDictionary *)dict names: (NSMutableDictionary *) numDict {
    
    //if maternal siblings are alive
    mSisterShare = [[Fraction alloc] init];
    mBrotherShare = [[Fraction alloc] init];
    
    if ([numHSister.text intValue] > 0 || [numHBrother.text intValue] > 0) {
        
        Fraction *halfSibling = [[Fraction alloc] init];
        [halfSibling setNumerator:1 andDenominator:3];
        
        if ([numHBrother.text intValue] == 0) {
            
            if ([numHSister.text intValue] == 1) {
                
                [mSisterShare setNumerator:1 andDenominator:6];
                
                estate = [estate subtract:mSisterShare];
                remainingShare = estate;
                
                [dict setObject:mSisterShare forKey:@"Maternal Sister"];
                [numDict setObject:numHSister.text forKey:@"Maternal Sister"];
                
                
            }
            
            else if ([numHSister.text intValue] > 1) {
                
                if ([numFSister.text intValue] == 0 && [numFBrother.text intValue] > 0 && [numHusband.text intValue] == 1) {
                    
                    Fraction *halfFrac = [[Fraction alloc] init];
                    [halfFrac setNumerator:[numHSister.text intValue] andDenominator:1];
                    
                    Fraction *fullFrac = [[Fraction alloc] init];
                    [fullFrac setNumerator:[numFBrother.text intValue] andDenominator:1];
                    
                    Fraction *frac = [halfFrac add:fullFrac];
                    
                    Fraction *singleFrac = [halfSibling divide:frac];
                    
                    mSisterShare = [singleFrac multiply:halfFrac];
                    fBrotherShare = [singleFrac multiply:fullFrac];
                    
                    estate = [estate subtract:mSisterShare];
                    estate = [estate subtract:fBrotherShare];
                    remainingShare = estate;
                    
                    [dict setObject:mSisterShare forKey:@"Maternal Sister"];
                    [numDict setObject:numHSister.text forKey:@"Maternal Sister"];
                    
                    [dict setObject:fBrotherShare forKey:@"Full Brother"];
                    [numDict setObject:numFBrother.text forKey:@"Full Brother"];
                    
                }
                
                else {
                    
                    mSisterShare = halfSibling;
                    
                    estate = [estate subtract:mSisterShare];
                    remainingShare = estate;
                    
                    [dict setObject:mSisterShare forKey:@"Maternal Sister"];
                    [numDict setObject:numHSister.text forKey:@"Maternal Sister"];
                    
                    
                }
                
            }
            
        }
        
        else if ([numHSister.text intValue] == 0) {
            
            if ([numHBrother.text intValue] == 1) {
                
                [mBrotherShare setNumerator:1 andDenominator:6];
                
                estate = [estate subtract:mBrotherShare];
                remainingShare = estate;
                
                [dict setObject:mBrotherShare forKey:@"Maternal Brother"];
                [numDict setObject:numHBrother.text forKey:@"Maternal Brother"];
                
            }
            
            else if ([numHBrother.text intValue] > 1) {
                //Second 'Umaryatain scenario
                if ([numFSister.text intValue] == 0 && [numFBrother.text intValue] > 0 && [numHusband.text intValue] == 1) {
                    
                    Fraction *halfFrac = [[Fraction alloc] init];
                    [halfFrac setNumerator:[numHBrother.text intValue] andDenominator:1];
                    
                    Fraction *fullFrac = [[Fraction alloc] init];
                    [fullFrac setNumerator:[numFBrother.text intValue] andDenominator:1];
                    
                    Fraction *frac = [halfFrac add:fullFrac];
                    
                    Fraction *singleFrac = [halfSibling divide:frac];
                    
                    mBrotherShare = [singleFrac multiply:halfFrac];
                    fBrotherShare = [singleFrac multiply:fullFrac];
                    
                    estate = [estate subtract:mBrotherShare];
                    estate = [estate subtract:fBrotherShare];
                    remainingShare = estate;
                    
                    [dict setObject:mBrotherShare forKey:@"Maternal Brother"];
                    [numDict setObject:numHBrother.text forKey:@"Maternal Brother"];
                    
                    [dict setObject:fBrotherShare forKey:@"Full Brother"];
                    [numDict setObject:numFBrother.text forKey:@"Full Brother"];
                    
                }
                
                
                else {
                    
                    mBrotherShare = halfSibling;
                    
                    estate = [estate subtract:mBrotherShare];
                    remainingShare = estate;
                    
                    [dict setObject:mBrotherShare forKey:@"Maternal Brother"];
                    [numDict setObject:numHBrother.text forKey:@"Maternal Brother"];
                    
                }
                
                
            }
            
        }
        
        else {
            //Second 'Umaryatain scenario
            if ([numFSister.text intValue] == 0 && [numFBrother.text intValue] > 0 && [numHusband.text intValue] == 1) {
                
                NSArray *siblings = [self calculateHalfSiblingShare:[numHBrother.text intValue] :[numHSister.text intValue] :[numFBrother.text intValue] :halfSibling];
                
                mSisterShare = [siblings objectAtIndex:0];
                mBrotherShare = [siblings objectAtIndex:1];
                fBrotherShare = [siblings objectAtIndex:2];
             
                estate = [estate subtract:mSisterShare];
                estate = [estate subtract:mBrotherShare];
                estate = [estate subtract:fBrotherShare];
                
                remainingShare = estate;
                
                [dict setObject:mSisterShare forKey:@"Maternal Sister"];
                [dict setObject:mBrotherShare forKey:@"Maternal Brother"];
                
                [numDict setObject:numHSister.text forKey:@"Maternal Sister"];
                [numDict setObject:numHBrother.text forKey:@"Maternal Brother"];
                
                [dict setObject:fBrotherShare forKey:@"Full Brother"];
                [numDict setObject:numFBrother.text forKey:@"Full Brother"];
                
            }
            
            else {
                
                NSArray *siblings = [self calculateHalfSiblingShare:[numHBrother.text intValue] :[numHSister.text intValue] :0 :halfSibling];
                
                mSisterShare = [siblings objectAtIndex:0];
                mBrotherShare = [siblings objectAtIndex:1];
                
                estate = [estate subtract:mSisterShare];
                estate = [estate subtract:mBrotherShare];
                
                remainingShare = estate;
                
                [dict setObject:mSisterShare forKey:@"Maternal Sister"];
                [dict setObject:mBrotherShare forKey:@"Maternal Brother"];
                
                [numDict setObject:numHSister.text forKey:@"Maternal Sister"];
                [numDict setObject:numHBrother.text forKey:@"Maternal Brother"];
                
            }
            
            
        }
        
    }
    //here is where you should do a shares check
  //  if ([dict count] == 0 || [self checkShares:dict] == -1) {
        
        //if full siblings are alive
        if ([numFSister.text intValue] > 0 || [numFBrother.text intValue] > 0) {
            
            fSisterShare = [[Fraction alloc] init];
            fBrotherShare = [[Fraction alloc] init];
            
            if ([numDaughter.text intValue] > 0 || [numGDaughter.text intValue] > 0) {
                
                if ([numFSister.text intValue] > 0 && [numFBrother.text intValue] == 0) {
                    
                    fSisterShare = estate;
                    
                    [dict setObject:fSisterShare forKey:@"Full Sister"];
                    [numDict setObject:numFSister.text forKey:@"Full Sister"];
                    
                }
                
                else if ([numFSister.text intValue] == 0 && [numFBrother.text intValue] > 0) {
                    
                    fBrotherShare = estate;
                    
                    [dict setObject:fBrotherShare forKey:@"Full Brother"];
                    [numDict setObject:numFBrother.text forKey:@"Full Brother"];
                    
                }
                
                else if ([numFSister.text intValue] > 0 && [numFBrother.text intValue] > 0) {
                    
                    Fraction *temp = [[Fraction alloc] init];
                    [temp setNumerator:2 andDenominator:1];
                    
                    Fraction *sisFrac = [[Fraction alloc] init];
                    [sisFrac setNumerator:[numFSister.text intValue] andDenominator:1];
                    
                    Fraction *broFrac = [[Fraction alloc] init];
                    [broFrac setNumerator:[numFBrother.text intValue] andDenominator:1];
                    
                    Fraction *tempSis = [self calculateFemaleShare:[numFBrother.text intValue] :[numFSister.text intValue] :estate];
                    
                    Fraction *tempBro = [tempSis multiply:temp];
                    
                    fSisterShare = [tempSis multiply:sisFrac];
                    fBrotherShare = [tempBro multiply:broFrac];
                    
                    [dict setObject:fSisterShare forKey:@"Full Sister"];
                    [numDict setObject:numFSister.text forKey:@"Full Sister"];
                    
                    [dict setObject:fBrotherShare forKey:@"Full Brother"];
                    [numDict setObject:numFBrother.text forKey:@"Full Brother"];
                    
                }
                
            }
            
            else {
                
                if ([numFSister.text intValue] == 1 && [numFBrother.text intValue] == 0) {
                    
                    [fSisterShare setNumerator:1 andDenominator:2];
                    
                    estate = [estate subtract:fSisterShare];
                    remainingShare = estate;
                    
                    [dict setObject:fSisterShare forKey:@"Full Sister"];
                    [numDict setObject:numFSister.text forKey:@"Full Sister"];
                    
                    if ([numPSister.text intValue] > 0 && [numPBrother.text intValue] == 0) {
                        
                        pSisterShare = [[Fraction alloc] init];
                        [pSisterShare setNumerator:1 andDenominator:6];
                        
                        estate = [estate subtract:pSisterShare];
                        remainingShare = estate;
                        
                        [dict setObject:pSisterShare forKey:@"Paternal Sister"];
                        [numDict setObject:numPSister.text forKey:@"Paternal Sister"];
                        
                    }
                    
                }
                
                else if ([numFSister.text intValue] > 1 && [numFBrother.text intValue] == 0) {
                    
                    [fSisterShare setNumerator:2 andDenominator:3];
                    
                    estate = [estate subtract:fSisterShare];
                    remainingShare = estate;
                    
                    [dict setObject:fSisterShare forKey:@"Full Sister"];
                    [numDict setObject:numFSister.text forKey:@"Full Sister"];
                    
                }
                
                else if ([numFSister.text intValue] > 0 && [numFBrother.text intValue] > 0) {
                    
                    Fraction *temp = [[Fraction alloc] init];
                    [temp setNumerator:2 andDenominator:1];
                    
                    Fraction *sisFrac = [[Fraction alloc] init];
                    [sisFrac setNumerator:[numFSister.text intValue] andDenominator:1];
                    
                    Fraction *broFrac = [[Fraction alloc] init];
                    [broFrac setNumerator:[numFBrother.text intValue] andDenominator:1];
                    
                    Fraction *tempSis = [self calculateFemaleShare:[numFBrother.text intValue] :[numFSister.text intValue] :estate];
                    
                    Fraction *tempBro = [tempSis multiply:temp];
                    
                    fSisterShare = [tempSis multiply:sisFrac];
                    fBrotherShare = [tempBro multiply:broFrac];
                    
                    [dict setObject:fSisterShare forKey:@"Full Sister"];
                    [numDict setObject:numFSister.text forKey:@"Full Sister"];
                    
                    [dict setObject:fBrotherShare forKey:@"Full Brother"];
                    [numDict setObject:numFBrother.text forKey:@"Full Brother"];
                    
                }
                
                else if ([numFSister.text intValue] == 0 && [numFBrother.text intValue] > 0 && estate.numerator > 0) {
                    
                    fBrotherShare = estate;
                    
                    [dict setObject:fBrotherShare forKey:@"Full Brother"];
                    [numDict setObject:numFBrother.text forKey:@"Full Brother"];
                    
                }
                
            }
            
        }
        
        //if no full siblings, then do paternal siblings
        else if ([numPSister.text intValue] > 0 || [numPBrother.text intValue] > 0) {
            
            pSisterShare = [[Fraction alloc] init];
            pBrotherShare = [[Fraction alloc] init];
            
            if ([numDaughter.text intValue] > 0 || [numGDaughter.text intValue] > 0) {
                
                if ([numPSister.text intValue] > 0 && [numPBrother.text intValue] == 0) {
                    
                    pSisterShare = estate;
                    
                    [dict setObject:pSisterShare forKey:@"Paternal Sister"];
                    [numDict setObject:numPSister.text forKey:@"Paternal Sister"];
                    
                }
                
                else if ([numPSister.text intValue] == 0 && [numPBrother.text intValue] > 0) {
                    
                    pBrotherShare = estate;
                    
                    [dict setObject:pBrotherShare forKey:@"Paternal Brother"];
                    [numDict setObject:numPBrother.text forKey:@"Paternal Brother"];
                    
                }
                
                else if ([numPSister.text intValue] > 0 && [numPBrother.text intValue] > 0) {
                    
                    Fraction *temp = [[Fraction alloc] init];
                    [temp setNumerator:2 andDenominator:1];
                    
                    Fraction *sisFrac = [[Fraction alloc] init];
                    [sisFrac setNumerator:[numPSister.text intValue] andDenominator:1];
                    
                    Fraction *broFrac = [[Fraction alloc] init];
                    [broFrac setNumerator:[numPBrother.text intValue] andDenominator:1];
                    
                    Fraction *tempSis = [self calculateFemaleShare:[numPBrother.text intValue] :[numPSister.text intValue] :estate];
                    
                    Fraction *tempBro = [tempSis multiply:temp];
                    
                    pBrotherShare = [tempBro multiply:broFrac];
                    pSisterShare = [tempSis multiply:sisFrac];
                    
                    [dict setObject:pSisterShare forKey:@"Paternal Sister"];
                    [numDict setObject:numPSister.text forKey:@"Paternal Sister"];
                    
                    [dict setObject:pBrotherShare forKey:@"Paternal Brother"];
                    [numDict setObject:numPBrother.text forKey:@"Paternal Brother"];
                    
                }
                
                
            }
            
            else {
                
                if ([numPSister.text intValue] == 1 && [numPBrother.text intValue] == 0) {
                    
                    [pSisterShare setNumerator:1 andDenominator:2];
                    
                    estate = [estate subtract:pSisterShare];
                    remainingShare = estate;
                    
                    [dict setObject:pSisterShare forKey:@"Paternal Sister"];
                    [numDict setObject:numPSister.text forKey:@"Paternal Sister"];
                    
                }
                
                else if ([numPSister.text intValue] > 1 && [numPBrother.text intValue] == 0) {
                    
                    [pSisterShare setNumerator:2 andDenominator:3];
                    
                    estate = [estate subtract:pSisterShare];
                    remainingShare = estate;
                    
                    [dict setObject:pSisterShare forKey:@"Paternal Sister"];
                    [numDict setObject:numPSister.text forKey:@"Paternal Sister"];
                    
                }
                
                else if ([numPSister.text intValue] > 0 && [numPBrother.text intValue] > 0) {
                    
                    Fraction *temp = [[Fraction alloc] init];
                    [temp setNumerator:2 andDenominator:1];
                    
                    Fraction *sisFrac = [[Fraction alloc] init];
                    [sisFrac setNumerator:[numPSister.text intValue] andDenominator:1];
                    
                    Fraction *broFrac = [[Fraction alloc] init];
                    [broFrac setNumerator:[numPBrother.text intValue] andDenominator:1];
                    
                    Fraction *tempSis = [self calculateFemaleShare:[numPBrother.text intValue] :[numPSister.text intValue] :estate];
                    
                    Fraction *tempBro = [tempSis multiply:temp];
                    
                    pBrotherShare = [tempBro multiply:broFrac];
                    pSisterShare = [tempSis multiply:sisFrac];
                    
                    [dict setObject:pSisterShare forKey:@"Paternal Sister"];
                    [numDict setObject:numPSister.text forKey:@"Paternal Sister"];
                    
                    [dict setObject:pBrotherShare forKey:@"Paternal Brother"];
                    [numDict setObject:numPBrother.text forKey:@"Paternal Brother"];
                    
                }
                
                else if ([numPSister.text intValue] == 0 && [numPBrother.text intValue] > 0) {
                    
                    pBrotherShare = estate;
                    
                    [dict setObject:pBrotherShare forKey:@"Paternal Brother"];
                    [numDict setObject:numPBrother.text forKey:@"Paternal Brother"];
                    
                }
                
            }
            
        }
        
   // }
    
    NSArray *array = [NSArray arrayWithObjects:dict, numDict, nil];
    
    return array;
    
}


- (NSArray *) calculateSingleSiblingShare: (NSMutableDictionary *)dict names: (NSMutableDictionary *)numDict {
    
    if ([numHSister.text intValue] == 1 || [numHBrother.text intValue] == 1) {
        
        mSisterShare = [[Fraction alloc] init];
        mBrotherShare = [[Fraction alloc] init];
        
        if ([numHSister.text intValue] == 0) {
            
            [mBrotherShare setNumerator:1 andDenominator:6];
            
            estate = [estate subtract:mBrotherShare];
            remainingShare = estate;
            
            [dict setObject:mBrotherShare forKey:@"Maternal Brother"];
            [numDict setObject:numHBrother.text forKey:@"Maternal Brother"];
            
        }
        
        else {
            
            [mSisterShare setNumerator:1 andDenominator:6];
            
            estate = [estate subtract:mSisterShare];
            remainingShare = estate;
            
            [dict setObject:mSisterShare forKey:@"Maternal Sister"];
            [numDict setObject:numHSister.text forKey:@"Maternal Sister"];
            
        }
        
        
    }
    
//    if ([dict count] == 0 || [self checkShares:dict] == -1) {
        
        if ([numFSister.text intValue] == 1 || [numFBrother.text intValue] == 1) {
            
            fSisterShare = [[Fraction alloc] init];
            fBrotherShare = [[Fraction alloc] init];
            
            if ([numDaughter.text intValue] > 0 || [numGDaughter.text intValue] > 0) {
                
                if ([numFSister.text intValue] == 1) {
                    
                    fSisterShare = estate;
                    
                    [dict setObject:fSisterShare forKey:@"Full Sister"];
                    [numDict setObject:numFSister.text forKey:@"Full Sister"];
                    
                }
                
                else if ([numFBrother.text intValue] == 1) {
                    
                    fBrotherShare = estate;
                    
                    [dict setObject:fBrotherShare forKey:@"Full Brother"];
                    [numDict setObject:numFBrother.text forKey:@"Full Brother"];
                    
                }
                
            }
            
            else {
                
                if ([numFSister.text intValue] == 1) {
                    
                    [fSisterShare setNumerator:1 andDenominator:2];
                    
                    estate = [estate subtract:fSisterShare];
                    remainingShare = estate;
                    
                    [dict setObject:fSisterShare forKey:@"Full Sister"];
                    [numDict setObject:numFSister.text forKey:@"Full Sister"];
                    
                }
                
                else if ([numFBrother.text intValue] == 1) {
                    
                    fBrotherShare = estate;
                    
                    [dict setObject:fBrotherShare forKey:@"Full Brother"];
                    [numDict setObject:numFBrother.text forKey:@"Full Brother"];
                    
                }
                
            }
            
        }
        
        
        else if ([numPSister.text intValue] == 1 || [numPBrother.text intValue] == 1) {
            
            pSisterShare = [[Fraction alloc] init];
            pBrotherShare = [[Fraction alloc] init];
            
            if ([numDaughter.text intValue] > 0 || [numGDaughter.text intValue] > 0) {
                
                if ([numPSister.text intValue] == 1) {
                    
                    pSisterShare = estate;
                    
                    [dict setObject:pSisterShare forKey:@"Paternal Sister"];
                    [numDict setObject:numPSister.text forKey:@"Paternal Sister"];
                    
                }
                
                else if ([numPBrother.text intValue] == 1) {
                    
                    pBrotherShare = estate;
                    
                    [dict setObject:pBrotherShare forKey:@"Paternal Brother"];
                    [numDict setObject:numPBrother.text forKey:@"Paternal Brother"];
                    
                }
                
            }
            
            else {
                
                if ([numPSister.text intValue] == 1) {
                    
                    [pSisterShare setNumerator:1 andDenominator:2];
                    
                    estate = [estate subtract:pSisterShare];
                    remainingShare = estate;
                    
                    [dict setObject:pSisterShare forKey:@"Paternal Sister"];
                    [numDict setObject:numPSister.text forKey:@"Paternal Sister"];
                    
                }
                
                else if ([numPBrother.text intValue] == 1) {
                    
                    pBrotherShare = estate;
                    
                    [dict setObject:pBrotherShare forKey:@"Paternal Brother"];
                    [numDict setObject:numPBrother.text forKey:@"Paternal Brother"];
                    
                }
                
            }
            
        }
        
   // }
    
        
    NSArray *array = [NSArray arrayWithObjects:dict, numDict, nil];
    
    return array;
    
}

- (NSArray *) calculateResidualShares:(NSMutableDictionary *)dict names:(NSMutableDictionary *)numDict {
    
    //add residual male relatives in order here, starting with grandfather
    if ([numPBrother.text intValue] > 0) {
        
        pBrotherShare = [[Fraction alloc] init];
        pBrotherShare = estate;
        
        [dict setObject:pBrotherShare forKey:@"Paternal Brother"];
        [numDict setObject:numPBrother.text forKey:@"Paternal Brother"];
        
    }
    
    else if ([numSonFBrother.text intValue] > 0) {
        
        fBrotherSonShare = [[Fraction alloc] init];
        fBrotherSonShare = estate;
        
        [dict setObject:fBrotherSonShare forKey:@"Full Brother's Son"];
        [numDict setObject:numSonFBrother.text forKey:@"Full Brother's Son"];
        
    }
    
    else if ([numSonPBrother.text intValue] > 0) {
        
        pBrotherSonShare = [[Fraction alloc] init];
        pBrotherSonShare = estate;
        
        [dict setObject:pBrotherSonShare forKey:@"Paternal Brother's Son"];
        [numDict setObject:numSonPBrother.text forKey:@"Paternal Brother's Son"];
        
    }
    
    else if ([numFBrotherFather.text intValue] > 0) {
        
        fPaternalUncleShare = [[Fraction alloc] init];
        fPaternalUncleShare = estate;
        
        [dict setObject:fPaternalUncleShare forKey:@"Full Paternal Uncle"];
        [numDict setObject:numFBrotherFather.text forKey:@"Full Paternal Uncle"];
        
    }
    
    else if ([numPBrotherFather.text intValue] > 0) {
        
        pPaternalUncleShare = [[Fraction alloc] init];
        pPaternalUncleShare = estate;
        
        [dict setObject:pPaternalUncleShare forKey:@"Paternal Paternal Uncle"];
        [numDict setObject:numPBrotherFather.text forKey:@"Paternal Paternal Uncle"];
        
    }
    
    else if ([numSonFBrotherFather.text intValue] > 0) {
        
        fPaternalUncleSonShare = [[Fraction alloc] init];
        fPaternalUncleSonShare = estate;
        
        [dict setObject:fPaternalUncleSonShare forKey:@"Full Paternal Uncle's Son"];
        [numDict setObject:numSonFBrotherFather.text forKey:@"Full Paternal Uncle's Son"];
        
    }
    
    else if ([numSonPBrotherFather.text intValue] > 0) {
        
        pPaternalUncleSonShare = [[Fraction alloc] init];
        pPaternalUncleSonShare = estate;
        
        [dict setObject:pPaternalUncleSonShare forKey:@"Paternal Paternal Uncle's Son"];
        [numDict setObject:numSonPBrotherFather.text forKey:@"Paternal Paternal Uncle's Son"];
        
    }

    NSArray *array = [NSArray arrayWithObjects:dict, numDict, nil];
    
    return array;

    
}


- (NSMutableDictionary *)calcResidualShares:(NSMutableDictionary *)currentList {
    
    
    return currentList;
}

- (Fraction *) calculateFemaleShare: (int)numMales :(int)numFemales :(Fraction *)share {
    
    int numUnits = 2 * numMales + numFemales;
    int base = 1;
    
    Fraction *numShare = [[Fraction alloc] init];
    [numShare setNumerator:numUnits andDenominator:base];
    Fraction *shareFemale = [share divide:numShare];
    
    return shareFemale;
    
}

- (NSArray *) calculateHalfSiblingShare: (int)numMales :(int)numFemales :(int)numFullBrothers :(Fraction *)share {
    
    NSArray *siblingArray;
    
    if (numFullBrothers == 0) {
        
        int numUnits = numMales + numFemales;
        int base = 1;
        
        Fraction *numShare = [[Fraction alloc] init];
        [numShare setNumerator:numUnits andDenominator:base];
        
        Fraction *siblingShare = [share divide:numShare];
        
        Fraction *sisFraction = [[Fraction alloc] init];
        [sisFraction setNumerator:numFemales andDenominator:base];
        
        Fraction *broFraction = [[Fraction alloc] init];
        [broFraction setNumerator:numMales andDenominator:base];
        
        Fraction *shareSis = [siblingShare multiply:sisFraction];
        Fraction *shareBro = [siblingShare multiply:broFraction];
        
        siblingArray = [NSArray arrayWithObjects:shareSis, shareBro, nil];
        
    }
    
    else {
        
        int numUnits = numMales + numFemales + numFullBrothers;
        int base = 1;
        
        Fraction *numShare = [[Fraction alloc] init];
        [numShare setNumerator:numUnits andDenominator:base];
        
        Fraction *siblingShare = [share divide:numShare];
        
        Fraction *sisFraction = [[Fraction alloc] init];
        [sisFraction setNumerator:numFemales andDenominator:base];
        
        Fraction *broFraction = [[Fraction alloc] init];
        [broFraction setNumerator:numMales andDenominator:base];
        
        Fraction *fullBroFraction = [[Fraction alloc] init];
        [fullBroFraction setNumerator:numFullBrothers andDenominator:base];
        
        Fraction *shareSis = [siblingShare multiply:sisFraction];
        Fraction *shareBro = [siblingShare multiply:broFraction];
        Fraction *shareFullBro = [siblingShare multiply:fullBroFraction];
        
        siblingArray = [NSArray arrayWithObjects:shareSis, shareBro, shareFullBro, nil];
        
    }
    
    return siblingArray;
    
}


- (int) checkShares: (NSMutableDictionary *)currentShares {
    
    NSArray *values = [currentShares allValues];
    //NSUInteger i;
    
    if ([values count] == 0) {
        
        return -1;
        
    }
    
    else {
        
        Fraction *totalSum = (Fraction *)[values objectAtIndex:0];
        
        for (int i = 1; i < [values count]; i++) {
            
            totalSum = [totalSum add:[values objectAtIndex:i]];
            [totalSum print];
            NSLog(@"%d",totalSum.numerator);
            NSLog(@"%d",totalSum.denominator);
            
        }
        
        NSLog(@"Testing, testing");
        NSLog(@"%d", totalSum.numerator);
        NSLog(@"%d", totalSum.denominator);
        
        if (totalSum.numerator > totalSum.denominator)
            return 1;
        
        else if (totalSum.numerator == totalSum.denominator)
            return 0;
        
        else
            return -1;
        
    }
    
    
}


- (int) gcd:(int)a num:(int)b {
    
    while (b > 0) {
        
        int temp = b;
        b = a % b;
        a = temp;
        
    }
    
    return a;
    
}

- (int) lcm:(int) a num:(int) b {
    
    return  a * (b / [self gcd:a num:b]);
    
}


- (NSMutableDictionary *) increaseBase: (NSMutableDictionary *)currentShares {
    //Here we are increasing the base due to over prescription
    NSArray *fracKeys = [currentShares allKeys];
    NSArray *fracObjects = [currentShares allValues];
    
    NSLog(@"Here are the keys");
    
    for (NSString *key in fracKeys) {
        
        NSLog(@"%@", key);
        
    }
    
    NSUInteger fracCount = [fracObjects count];
    
    Fraction *tf = [fracObjects objectAtIndex:0];
    int result = tf.denominator;
    
    
    NSLog(@"Here we have: %i", result);
    
    //First we iterate over the array to find the lowest common denominator (LCD)
    for (int i = 0; i < fracCount; i++) {
        
        Fraction *testFrac = [fracObjects objectAtIndex:i];
        result = [self lcm:result num:testFrac.denominator];
        
        NSLog(@"The results are: %i", result);
        
    }
    
    NSLog(@"Here is the lowest common denominator: %i", result);
    
    //Now we iterate through the array and calculate the new numerator that corresponds to each fractions LCD
    //and then assign that numerator, and lcd to a new Fraction object, and then insert each new Fraction object
    //to a new NSMutableArray
    
    NSMutableArray *newList = [NSMutableArray array];
    
    for (int j = 0; j < fracCount; j++) {
        
        Fraction *tFrac = [fracObjects objectAtIndex:j];
        int numFactor = result / tFrac.denominator;
        int numer = numFactor * tFrac.numerator;
        [tFrac setNumerator:numer andDenominator:result];
        [newList addObject:tFrac];
        //[tFrac reduce];
        NSLog(@"InshaALLAH this works");
        [tFrac print];
        
    }
    
    //We then calculate the new denominator by summing the numerators of each new Fraction object in the new
    //NSMutableArray collection, and then assign this value as the final new denominator of each Fraction object
    //inside the NSMutableArray collection.  We are now finished updating the fraction objects, and now need to put
    //these objects back into an NSDictionary object with their corresponding keys.
    
    Fraction *testF = [newList objectAtIndex:0];
    int newResult = testF.numerator;
    
    for (int k = 1; k < fracCount; k++) {
        
        Fraction *testFr = [newList objectAtIndex:k];
        newResult = newResult + testFr.numerator;
        
    }
    
    NSLog(@"And here it is: %i", newResult);
    
    NSMutableArray *finalList = [NSMutableArray array];
    
    for (int l = 0; l < fracCount; l++) {
        
        Fraction *testFra = [newList objectAtIndex:l];
        [testFra setDenominator:newResult];
        [testFra reduce];
        [finalList addObject:testFra];
        NSLog(@"Can this work?");
        [testFra print];
    }
    
    NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
    
    for (int m = 0; m < fracCount; m++) {
        
        Fraction * updateFrac = [newList objectAtIndex:m];
        NSString *key = [fracKeys objectAtIndex:m];
        [newDict setObject:updateFrac forKey:key];
        
        NSLog(@"%@ fraction is", key);
        Fraction *finalFrac = [newDict objectForKey:key];
        [finalFrac print];
        
    }
    
    
    return newDict;
}


- (NSMutableDictionary *) reduceBase: (NSMutableDictionary *)currentShares {
    
    NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc]initWithDictionary:currentShares];
    
    if ([tempDictionary count] > 1 && [tempDictionary objectForKey:@"Wife"]) {
        
        [tempDictionary removeObjectForKey:@"Wife"];
        
    }
    
    else if ([tempDictionary count] > 1 && [tempDictionary objectForKey:@"Husband"]) {
        
        [tempDictionary removeObjectForKey:@"Husband"];
        
    }
    
    if ([tempDictionary objectForKey:@"Father"]) {
        
       // NSArray *fracKeys = [currentShares allKeys];
        NSArray *fracObjects = [currentShares allValues];
        
        Fraction *total = [[Fraction alloc] init];
        
        [total setNumerator:1 andDenominator:1];
        
        
        //first we need to iterate over the NSMutableDictionary we received, and sum all the shares together
        Fraction *presentShare = [[Fraction alloc] init];
        for (int i = 0; i < [fracObjects count]; i++) {
            
            if (i == 0)
                presentShare = [fracObjects objectAtIndex:i];
            else
                presentShare = [presentShare add:[fracObjects objectAtIndex:i]];
            
        }
        
        NSLog(@"I really hope this works");
        [presentShare reduce];
        
        
        //second, we need to calculate the outstanding share that we need to re-distribute
        Fraction *remainder = [total subtract:presentShare];
        [remainder reduce];
        NSLog(@"This is how much that has been distributed");
        [presentShare print];
        NSLog(@"This is how much that remains");
        [remainder print];
        
        //third, we need to add this outstanding share to the fathers share
        
        Fraction *value = [tempDictionary objectForKey:@"Father"];
        Fraction *newFather = [value add:remainder];
        [newFather reduce];
        [currentShares setObject:newFather forKey:@"Father"];
        
        return currentShares;
        
    }
    
    else if ([tempDictionary objectForKey:@"Grandfather"]) {
        
        // NSArray *fracKeys = [currentShares allKeys];
        NSArray *fracObjects = [currentShares allValues];
        
        Fraction *total = [[Fraction alloc] init];
        
        [total setNumerator:1 andDenominator:1];
        
        
        //first we need to iterate over the NSMutableDictionary we received, and sum all the shares together
        Fraction *presentShare = [[Fraction alloc] init];
        for (int i = 0; i < [fracObjects count]; i++) {
            
            if (i == 0)
                presentShare = [fracObjects objectAtIndex:i];
            else
                presentShare = [presentShare add:[fracObjects objectAtIndex:i]];
            
        }
        
        NSLog(@"I really hope this works");
        [presentShare reduce];
        
        
        //second, we need to calculate the outstanding share that we need to re-distribute
        Fraction *remainder = [total subtract:presentShare];
        [remainder reduce];
        NSLog(@"This is how much that has been distributed");
        [presentShare print];
        NSLog(@"This is how much that remains");
        [remainder print];
        
        //third, we need to add this outstanding share to the fathers share
        
        Fraction *value = [tempDictionary objectForKey:@"Grandfather"];
        Fraction *newGFather = [value add:remainder];
        [newGFather reduce];
        [currentShares setObject:newGFather forKey:@"Grandfather"];
        
        return currentShares;
        
    }
    
    else {
        
        NSArray *fracKeys = [currentShares allKeys];
        NSArray *fracObjects = [currentShares allValues];
        
        NSArray *modKeys = [tempDictionary allKeys];
        NSArray *modObjects = [tempDictionary allValues];
        
        Fraction *total = [[Fraction alloc] init];
        
        [total setNumerator:1 andDenominator:1];
        
        
        //first we need to iterate over the NSMutableDictionary we received, and sum all the shares together
        Fraction *presentShare = [[Fraction alloc] init];
        for (int i = 0; i < [fracObjects count]; i++) {
            
            if (i == 0)
                presentShare = [fracObjects objectAtIndex:i];
            else
                presentShare = [presentShare add:[fracObjects objectAtIndex:i]];
            
        }
        
        NSLog(@"I really hope this works");
        [presentShare reduce];
        
        //second, we need to calculate the outstanding share that we need to re-distribute
        Fraction *remainder = [total subtract:presentShare];
        [remainder reduce];
        NSLog(@"This is how much that has been distributed");
        [presentShare print];
        NSLog(@"This is how much that remains");
        [remainder print];
        
        
        NSLog(@"Here are the keys");
        for (NSString *key in fracKeys) {
            
            NSLog(@"%@", key);
        }
        
        
        //third, we iterate over the array to find the lowest common denominator (LCD)
        int result = 0;
        
        for (int i = 0; i < [modObjects count]; i++) {
            
            Fraction *testFrac = [modObjects objectAtIndex:i];
            
            if (i == 0)
                result = testFrac.denominator;
            
            else
                result = [self lcm:result num:testFrac.denominator];
            
            NSLog(@"The results are: %i", result);
        }
        
        //NSLog(@"Here is the lowest common denominator: %i", result);
        
        //fourth, we iterate through the array and calculate the new numerator that corresponds to each fractions LCD and then assign that numerator, and lcd to a new Fraction object, and then insert each new Fraction object to a new NSMutableArray
        
        NSMutableArray *newList = [NSMutableArray array];
        
        for (int i = 0; i < [modObjects count]; i++) {
            
            Fraction *tFrac = [modObjects objectAtIndex:i];
            int numFactor = result / tFrac.denominator;
            int numer = numFactor * tFrac.numerator;
            [tFrac setNumerator:numer andDenominator:result];
            [newList addObject:tFrac];
            NSLog(@"InshaALLAH this works");
            [tFrac print];
            
        }
        
        //fifth, we then calculate the new denominator by summing the numerators of each new Fraction object in the new NSMutableArray collection
        
        int newResult = 0;
        
        for (int i = 0; i < [modObjects count]; i++) {
            
            Fraction *testFr = [newList objectAtIndex:i];
            if (i == 0)
                newResult = testFr.numerator;
            
            else
                newResult += testFr.numerator;
            
        }
        
        //NSLog(@"And here it is: %i", newResult);
        
        
        //sixth, we then assign this new denominator of each Fraction object
        //inside the NSMutableArray collection.  We are now finished updating the fraction objects, and now need to multiply this fraction with the remainingShare value we derived earlier to find out what portion of the remainder is to be assigned to the original shareholders.
        
        NSMutableArray *extraShareList = [NSMutableArray array];
        
        for (int i = 0; i < [modObjects count]; i++) {
            
            Fraction *testFract = [[Fraction alloc] init];
            [testFract setNumerator:[[newList objectAtIndex:i] numerator] andDenominator:newResult];
            NSLog(@"What are the results?");
            [testFract print];
            
            NSLog(@"This is the leftover share that needs to be redistributed");
            [remainder print];
            
            Fraction *additionalPortion = [testFract multiply:remainder];
            NSLog(@"This is the extra portion each person gets");
            [additionalPortion print];
            
            [extraShareList addObject:additionalPortion];
            
        }
        
        
        //seventh, we then add the additional share to the original share that each person had to get the final amount that each person receives
        
        
        NSMutableArray *finalShareList = [NSMutableArray array];
        for (int i = 0; i < [modObjects count]; i++) {
            
            Fraction *originalShare = [modObjects objectAtIndex:i];
            NSLog(@"Here is the original share that each person received");
            [originalShare print];
            
            Fraction *extraShare = [extraShareList objectAtIndex:i];
            NSLog(@"This is the extra share that each person now receives in addition");
            [extraShare print];
            
            Fraction *finalShare = [originalShare add:extraShare];
            NSLog(@"This is what each person now gets");
            [finalShare reduce];
            [finalShare print];
            
            [finalShareList addObject:finalShare];
            
        }
        
        NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < [modObjects count]; i++) {
            
            Fraction *updateFrac = [finalShareList objectAtIndex:i];
            NSString *key = [modKeys objectAtIndex:i];
            [newDict setObject:updateFrac forKey:key];
            
            NSLog(@"%@ fraction is", key);
            Fraction *finalFrac = [newDict objectForKey:key];
            NSLog(@"BismILLAH");
            [finalFrac print];
            
        }
        
        //take the new values that have been generated, and update the original collection that was received by the method.
        
        for(NSString *name in newDict) {
            
            Fraction *value = [newDict objectForKey:name];
            [currentShares setObject:value forKey:name];
            
        }
        
        return currentShares;
    }
    
    
}


- (Fraction *) calculateGrandfatherShare:(Fraction *) remainderShare numBrothers:(int) num {
        
    return remainderShare;
    
}

- (Boolean) checkSiblings {
    
    if (([numPBrother.text intValue] + [numPSister.text intValue] + [numHBrother.text intValue] + [numHSister.text intValue] + [numFBrother.text intValue] + [numFSister.text intValue]) < 2) {
        
        return false;
        
    }
    
    else {
        
        return true;
        
    }
    
}

- (Boolean) checkSpouse {
    
    if (([numHusband.text intValue] + [numWife.text intValue]) < 1) {
        
        return false;
        
    }
    
    else {
        
        return true;
        
    }
}

- (Boolean) checkParents {
    
    if (([numMother.text intValue] + [numFather.text intValue]) < 1) {
        
        return false;
        
    }
    
    else {
        
        return true;
        
    }
    
}

- (Boolean) checkGrandParents {
    
    if (([numGMother.text intValue] + [numGFather.text intValue]) < 1) {
        
        return false;
        
    }
    
    else {
        
        return true;
        
    }
    
}

- (Boolean) checkChildren {
    
    if (([numSon.text intValue] + [numDaughter.text intValue]) < 1) {
        
        return false;
        
    }
    
    else {
        
        return true;
        
    }
    
}

- (Boolean) checkGrandChildren {
    
    if (([numGSon.text intValue] + [numGDaughter.text intValue]) < 1) {
        
        return false;
        
    }
    
    else {
        
        return true;
        
    }
    
}


- (void) showAlertWithMessage: (NSString*) message {
    
    UIAlertView* alert= [[UIAlertView alloc] initWithTitle: @"Error" message: message
                                                   delegate: NULL cancelButtonTitle: @"OK" otherButtonTitles: NULL];
    [alert show];
    
}


@end
