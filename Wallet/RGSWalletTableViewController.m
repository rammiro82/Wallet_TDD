//
//  RGSWalletTableViewController.m
//  Wallet
//
//  Created by Ramiro García Salazar on 21/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSWalletTableViewController.h"
#import "RGSWallet.h"

static NSString *cellID = @"cellIdentifier";

@interface RGSWalletTableViewController ()

@property (nonatomic, strong) RGSWallet *wallet;
@property (nonatomic, strong) RGSBroker *broker;

@end

@implementation RGSWalletTableViewController


-(id) initWithModel: (RGSWallet *) wallet broker:(RGSBroker *)broker{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _wallet = wallet;
        _broker = broker;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.wallet countCurrencyTypes] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.wallet countCurrencyTypes] == section) {
        // si estamos en la última sección, la del TOTAL sólo tiene una celda
        return 1;
    }
    return [self.wallet countMoneysForCurrencyType:section] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // creamos la celda
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellID];
    }
    
    RGSMoney *auxMoney;
    NSString *auxLbl = @"Total:";
    
    if (indexPath.section == [self.wallet countCurrencyTypes]) {
        // tenemos que contabilizar TODA la billetera
        auxMoney = [self.wallet reduceToCurrency:@"EUR"
                                      withBroker:self.broker];
        auxLbl = [NSString stringWithFormat:@"%@ EUR", [auxMoney amount]];
    }else{
        // mostrar el total de la currency
        if (indexPath.row == [self.wallet countMoneysForCurrencyType:indexPath.section]) {
            auxLbl = [[self.wallet currencyTypesArray] objectAtIndex:indexPath.section];
            auxLbl = [NSString stringWithFormat:@"Total %@: %@",
                      auxLbl,
                      [self.wallet sumAmountForCurrencyType:indexPath.section]];
        }else{
            // mostrar el importe de la moneda
            auxMoney = [self.wallet moneyForCurrency:indexPath.section withIndex:indexPath.row];
            auxLbl = [NSString stringWithFormat:@"%@ - %@", [auxMoney.amount stringValue], auxMoney.currency];
        }
    }
    
    // tenemos que pintar por cada sección, todas sus cantidades y su total
    // y al final, un total de todo lo demás.
    cell.textLabel.text = auxLbl;
    
    
    return cell;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section < [self.wallet countCurrencyTypes]) {
        return [[self.wallet currencyTypesArray] objectAtIndex:section];
    }else{
        return @"TOTAL";
    }
}

@end
