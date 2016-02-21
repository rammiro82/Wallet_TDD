//
//  RGSSimpleViewController.h
//  Wallet
//
//  Created by Ramiro García Salazar on 21/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGSSimpleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)displayText:(id)sender;

@end
