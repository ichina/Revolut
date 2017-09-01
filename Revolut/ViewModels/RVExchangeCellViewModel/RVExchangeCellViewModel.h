//
//  RVExchangeCellViewModel.h
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVExchangeCellViewModelProtocol.h"
@class RVAccount;

@interface RVExchangeCellViewModel : NSObject <RVExchangeCellViewModelProtocol>

@property(nonatomic, strong) NSString* currencyName;
@property(nonatomic, strong) NSString* balance;
@property(nonatomic, strong) NSString* value;
@property(nonatomic, strong) NSString* rate;

@property(nonatomic, assign) BOOL isTop;
@property(nonatomic, assign) CGFloat rateValue;
@property(nonatomic, assign) CGFloat balanceNum;

- (instancetype)initWithAccount:(RVAccount *) account originalAccount:(RVAccount *)origAccount valueSubject:(RACSubject *)subject;

@end
