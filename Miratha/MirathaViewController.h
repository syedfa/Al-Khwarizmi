//
//  MirathaViewController.h
//  Miratha
//
//  Created by Fayyazuddin Syed on 11-12-26.
//  Copyright (c) 2011 Cybermedia Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MirathaViewController : UIViewController <UITextFieldDelegate>{
    
    IBOutlet UITextField *numHusband;
    
    IBOutlet UITextField *numWife;
    
    IBOutlet UITextField *numMother;
    
    IBOutlet UITextField *numFather;
    
    IBOutlet UITextField *numSon;
    
    IBOutlet UITextField *numDaughter;
    
    IBOutlet UITextField *numFBrother;
    
    IBOutlet UITextField *numFSister;
    
    IBOutlet UITextField *numPBrother;
    
    IBOutlet UITextField *numPSister;
    
    IBOutlet UITextField *numHBrother;
    
    IBOutlet UITextField *numHSister;
    
    IBOutlet UITextField *numGDaughter;
    
    IBOutlet UITextField *numGSon;
    
    IBOutlet UITextField *numGMother;
    
    IBOutlet UITextField *numGFather;
    
    IBOutlet UITextField *numSonFBrother;
    
    IBOutlet UITextField *numSonPBrother;
    
    IBOutlet UITextField *numFBrotherFather;
    
    IBOutlet UITextField *numPBrotherFather;
    
    IBOutlet UITextField *numSonFBrotherFather;    
    
    IBOutlet UITextField *numSonPBrotherFather;
    
    IBOutlet UIScrollView *shareScroll;
    
    IBOutlet UITextField *numEstate;
    
    
    Fraction *motherShare;
    Fraction *fatherShare;
    Fraction *husbandShare;
    Fraction *wifeShare;
    Fraction *daughterShare;
    Fraction *sonShare;
    Fraction *gDaughterShare;
    Fraction *gSonShare;
    Fraction *gMotherShare;
    Fraction *gFatherShare;
    Fraction *fSisterShare;
    Fraction *fBrotherShare;
    Fraction *pSisterShare;
    Fraction *pBrotherShare;
    Fraction *mSisterShare;
    Fraction *mBrotherShare;
    Fraction *fBrotherSonShare;
    Fraction *pBrotherSonShare;
    Fraction *fPaternalUncleShare;
    Fraction *pPaternalUncleShare;
    Fraction *fPaternalUncleSonShare;
    Fraction *pPaternalUncleSonShare;
    
    Fraction *estate;
    Fraction *remainingShare;
    
    //NSMutableDictionary *dict;
    //NSMutableDictionary *numDict;
    
    
}

@property (nonatomic, retain) Fraction *motherShare;
@property (nonatomic, retain) Fraction *fatherShare;
@property (nonatomic, retain) Fraction *husbandShare;
@property (nonatomic, retain) Fraction *wifeShare;
@property (nonatomic, retain) Fraction *daughterShare;
@property (nonatomic, retain) Fraction *sonShare;
@property (nonatomic, retain) Fraction *gDaughterShare;
@property (nonatomic, retain) Fraction *gSonShare;
@property (nonatomic, retain) Fraction *gMotherShare;
@property (nonatomic, retain) Fraction *gFatherShare;
@property (nonatomic, retain) Fraction *fSisterShare;
@property (nonatomic, retain) Fraction *fBrotherShare;
@property (nonatomic, retain) Fraction *pSisterShare;
@property (nonatomic, retain) Fraction *pBrotherShare;
@property (nonatomic, retain) Fraction *mSisterShare;
@property (nonatomic, retain) Fraction *mBrotherShare;

@property (nonatomic, retain) Fraction *estate;
@property (nonatomic, retain) Fraction *remainingShare;

//@property (nonatomic, retain) NSMutableDictionary *dict;
//@property (nonatomic, retain) NSMutableDictionary *numDict;

- (IBAction)calculateShares:(id)sender;
- (IBAction)reset:(id)sender;
- (Boolean) checkSiblings;
- (Boolean) checkSpouse;
- (Boolean) checkParents;
- (Boolean) checkChildren;
- (Boolean) checkGrandChildren;
- (Fraction *) calculateFemaleShare: (int)numMales :(int)numFemales :(Fraction *)share;
- (int) checkShares: (NSMutableDictionary *)currentShares;
- (NSMutableDictionary *) increaseBase: (NSMutableDictionary *)currentShares;
- (NSMutableDictionary *) reduceBase: (NSMutableDictionary *)currentShares;

@end
