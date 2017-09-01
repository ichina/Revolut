//
//  RVAccountsManagerProtocol.h
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//
#import "RVAccount.h"
#import "RVTransaction.h"

@protocol RVAccountsManagerProtocol <NSObject>

- (NSArray *) accounts;
- (RVAccount *) accountWithCode:(NSString *)code;

-(void)makeTransactionFromCode:(NSString *)fromCode toCode:(NSString *)toCode value:(NSNumber *) value;

-(NSInteger)transactionsCount;
-(RVTransaction *)transactionWithIndex:(NSInteger)idx;


@end
