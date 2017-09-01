//
//  RVAccountsController.m
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVAccountsController.h"
#import "RVAccountsViewModel.h"
#import "RVAccountsView.h"
#import "RVAccountsDataSource.h"

@interface RVAccountsController ()
{
    RVAccountsView* _accountsView;
    RVAccountsDataSource* _accountsDataSource;
}
@end

@implementation RVAccountsController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _accountsView = (RVAccountsView *)self.view;
    [_accountsView makeNavbarTransparent:self.navigationController.navigationBar];
    
    _accountsDataSource = [[RVAccountsDataSource alloc] initWithViewModel:_viewModel];
    [_accountsDataSource configure:_accountsView.tableView];
    
    _accountsView.exchangeButton.rac_command = _viewModel.rac_exchangeCommand;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_accountsView.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    [self updateAccountsInfo];
    _accountsView.emptyLabel.hidden = _viewModel.transactionsCount > 0;
}
-(void)updateAccountsInfo {
    [[_viewModel accountsInfo] enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [(UILabel *)_accountsView.accountsLabels[idx] setText:obj];
    }];
}
@end
