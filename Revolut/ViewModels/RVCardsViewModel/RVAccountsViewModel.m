//
//  RVAccountsViewModel.m
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVAccountsViewModel.h"
#import "RVTransaction.h"
#import "RVTransactionCellViewModel.h"
@implementation RVAccountsViewModel

- (instancetype)initWithRouter:(id <RVRoutingProtocol>) router accountsManager:(id <RVAccountsManagerProtocol>) accountsManager
{
    self = [super init];
    if (self) {
        _router = router;
        _accountsManager = accountsManager;
    }
    return self;
}

-(RACCommand *) rac_exchangeCommand {
    @weakify(self);
    return [[RACCommand alloc] initWithSignalBlock:^(id _) {
        @strongify(self);
        [self.router showScene:RVSceneTypeExchange];
        return [RACSignal empty];
    }];
}

-(NSArray *) accountsInfo {
    return [_accountsManager.accounts mapUsingBlock:^NSString*(RVAccount* obj) {
        return [NSString stringWithFormat:@"%@\n%@", [obj convertedBalance], obj.ID];
    }];
}

-(NSInteger)transactionsCount {
    return [_accountsManager transactionsCount];
}

-(id <RVTransactionCellViewModelProtocol>) viewModelForCellAt:(NSIndexPath *) indexPath{
    
    return (id <RVTransactionCellViewModelProtocol>) [[RVTransactionCellViewModel alloc] initWithTransaction:[_accountsManager transactionWithIndex:indexPath.row]];
}


@end
