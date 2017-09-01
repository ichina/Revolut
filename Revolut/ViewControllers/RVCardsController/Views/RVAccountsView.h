//
//  RVAccountsView.h
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RVAccountsView : UIView

@property (weak, nonatomic) IBOutlet UIButton *exchangeButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *accountsLabels;
@property (weak, nonatomic) IBOutlet UILabel *emptyLabel;


-(void) makeNavbarTransparent:(UINavigationBar *) navbar;
@end
