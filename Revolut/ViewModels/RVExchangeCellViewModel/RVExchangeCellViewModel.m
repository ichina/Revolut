//
//  RVExchangeCellViewModel.m
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVExchangeCellViewModel.h"
#import "RVAccount.h"
#import "RVCurrency.h"
@interface RVExchangeCellViewModel()
{
    RACSubject* _valueSubject;
}
@end

@implementation RVExchangeCellViewModel

- (instancetype)initWithAccount:(RVAccount *) account originalAccount:(RVAccount *)origAccount valueSubject:(RACSubject *)valueSubject
{
    self = [super init];
    if (self) {
        _valueSubject = valueSubject;

        self.currencyName = [account.currency.code uppercaseString];
        self.balance = [NSString stringWithFormat:@"You have %@", [account convertedBalance]];
        self.balanceNum = account.balance.floatValue;
        self.isTop = origAccount == nil;

        if (!self.isTop) {
            NSNumber *rateNum = @(origAccount.currency.rate.floatValue/account.currency.rate.floatValue);
            self.rate = [NSString stringWithFormat:@"%@ = %@",
                         [RVAccount convertedBalance:@1 currency:account.currency.code],
                         [RVAccount convertedBalance:rateNum currency:origAccount.currency.code]];
            self.rateValue = rateNum.floatValue;
        }
        else {
            self.rate = @"";
        }
    }
    return self;
}

-(RACSubject *)valueSubject {
    if (self.isTop) {
        return _valueSubject;
    }
    else {
        return (RACSubject *)[_valueSubject map:^NSString* (NSString* value) {
            if (!value.integerValue) {
                return @"";
            }
            return [NSString stringWithFormat:@"+%0.2f",value.floatValue / self.rateValue];
        }];

    }
}

@end
