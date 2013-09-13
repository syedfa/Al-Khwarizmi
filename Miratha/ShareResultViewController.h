//
//  ShareResultViewController.h
//  Miratha
//
//  Created by Fayyazuddin Syed on 12-01-08.
//  Copyright (c) 2012 Cybermedia Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareResultViewController : UIViewController
{
    NSMutableDictionary *results;
    NSMutableDictionary *numbers;
    NSString *totalEstate;
}
@property (nonatomic, strong) NSMutableDictionary *results;
@property (nonatomic, strong) NSMutableDictionary *numbers;
@property (nonatomic, strong) NSString *totalEstate;

@end
