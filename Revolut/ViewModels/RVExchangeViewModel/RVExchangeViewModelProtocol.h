//
//  RVExchangeViewModelProtocol.h
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//
#import "RVExchangeCellViewModelProtocol.h"

@protocol RVExchangeViewModelProtocol <NSObject>

-(id <RVExchangeCellViewModelProtocol>) viewModelForCellAt:(NSIndexPath *) indexPath forTopCurrency:(BOOL) isTopCurrency;
-(void) didChangeCurrency:(NSString *)code isTop:(BOOL)isFirst;

-(RACCommand *) rac_cancel;
-(RACCommand *) rac_exchange;
-(RACSignal *) rac_exchangeEnabled;
@end
