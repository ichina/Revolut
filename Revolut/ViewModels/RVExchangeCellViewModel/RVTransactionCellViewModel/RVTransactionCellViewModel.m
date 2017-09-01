//
//  RVTransactionCellViewModel.m
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVTransactionCellViewModel.h"
#import "RVTransaction.h"
#import "RVAccount.h"

@implementation RVTransactionCellViewModel

- (instancetype)initWithTransaction:(RVTransaction *)transaction
{
    self = [super init];
    if (self) {
        _title = [NSString stringWithFormat:@"Exchanged from %@ to %@", transaction.fromAccountCode, transaction.toAccountCode];
        _value = [@"-" stringByAppendingString:[RVAccount convertedBalance:transaction.value currency:transaction.fromAccountCode]];
    }
    return self;
}

@end
