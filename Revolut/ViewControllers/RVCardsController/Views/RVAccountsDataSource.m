//
//  RVAccountsDataSource.m
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVAccountsDataSource.h"
#import "RVTransactionCell.h"

@implementation RVAccountsDataSource
{
    __weak id <RVAccountsViewModelProtocol> _viewModel;
    __weak UITableView* _tableView;
}

- (instancetype)initWithViewModel:(id <RVAccountsViewModelProtocol>) viewModel
{
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)configure:(UITableView *) tableView {
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableFooterView = [UIView new];
    _tableView = tableView;
}

#pragma mark UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_viewModel transactionsCount];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RVTransactionCell* cell = (RVTransactionCell *)[tableView dequeueReusableCellWithIdentifier:@"transactionCell" forIndexPath:indexPath];
    
    [cell configure:[_viewModel viewModelForCellAt:indexPath]];

    return [UITableViewCell new];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Transaction history";
}
@end
