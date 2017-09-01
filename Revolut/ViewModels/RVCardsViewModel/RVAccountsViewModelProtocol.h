//
//  RVAccountsViewModelProtocol.h
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//
#import "RVTransactionCellViewModelProtocol.h"

@protocol RVAccountsViewModelProtocol <NSObject>

-(RACCommand *) rac_exchangeCommand;
-(NSArray *) accountsInfo;

-(NSInteger)transactionsCount;
-(id <RVTransactionCellViewModelProtocol>) viewModelForCellAt:(NSIndexPath *) indexPath;
@end
