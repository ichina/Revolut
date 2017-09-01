//
//  RVAccountsManager.m
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVAccountsManager.h"
#import "RVAccount.h"
#import "RVCurrency.h"
#import "RVTransaction.h"

@interface RVAccountsManager()
{
    NSMutableArray* _accounts;
    NSMutableArray* _transactions;
}
@end

@implementation RVAccountsManager

- (instancetype)initWithCurrencyClient:(id <RVCurrencyClientProtocol>) currencyClient
{
    self = [super init];
    if (self) {
        _currencyClient = currencyClient;
        [self setup];
    }
    return self;
}

-(void)setup {
    NSArray *arr = @[@"EUR", @"USD", @"GBP"];
    NSArray *accounts = [arr mapUsingBlock:^RVAccount *(NSString* code) {
        RVCurrency* currency = [[RVCurrency alloc] initWithCode:code rate:@1];
        return [[RVAccount alloc] initWithID:code currency:currency balance:@100];
    }];
    _accounts = accounts.copy;
    _transactions = @[].mutableCopy;
    
    __weak typeof(self) weakself = self;
    [[self.currencyClient rac_currenciesUpdated]
     subscribeNext:^(NSArray*  currencies) {
         [weakself updateCurrencies:currencies];
     }];

}

-(void)updateCurrencies:(NSArray *) currencies {
    [_accounts mapUsingBlock:^id(RVAccount* acc) {
        RVCurrency* curr = [currencies filterUsingBlock:^BOOL(RVCurrency* obj) {
            return [obj.code isEqualToString:acc.currency.code];
        }].firstObject;
        [acc updateCurrency:curr];
        return acc;
    }];
}

- (NSArray *) accounts {
    return _accounts.copy;
}

- (RVAccount *) accountWithCode:(NSString *)code {
    return [_accounts filterUsingBlock:^BOOL(RVAccount* account) {
        return [account.currency.code isEqualToString:code];
    }].firstObject;
}

-(void)makeTransactionFromCode:(NSString *)fromCode toCode:(NSString *)toCode value:(NSNumber *) value {
    RVAccount *acc = [self accountWithCode:fromCode];
    acc.balance = @(acc.balance.floatValue - value.floatValue);
    
    acc = [self accountWithCode:toCode];
    acc.balance = @(acc.balance.floatValue + value.floatValue);
    
    RVTransaction* transaction = [[RVTransaction alloc] initWithFromAccountCode:fromCode toAccountCode:toCode value:value];
    [_transactions addObject:transaction];
}

#pragma mark - transactions history

-(NSInteger)transactionsCount {
    return _transactions.count;
}

-(RVTransaction *)transactionWithIndex:(NSInteger)idx {
    return (idx < _transactions.count) ? _transactions[idx] : nil;
}

@end
