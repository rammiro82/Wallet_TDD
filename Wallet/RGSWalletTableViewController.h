//
//  RGSWalletTableViewController.h
//  Wallet
//
//  Created by Ramiro García Salazar on 21/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RGSWallet.h"
@interface RGSWalletTableViewController : UITableViewController

-(id) initWithModel: (RGSWallet *) model;

@end
