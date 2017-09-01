//
//  RVAccount.m
//  Revolut
//
//  Created by Chingis Gomboev on 30/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVAccount.h"
#import "RVCurrency.h"
@implementation RVAccount

- (instancetype)initWithID:(NSString *)ID currency:(RVCurrency *) currency balance:(NSNumber *) balance {
    self = [super init];
    if (self) {
        _ID = ID;
        _currency = currency;
        _balance = balance;
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)coder
{
    self = [super init];
    if (self)
    {
        _ID = [coder decodeObjectForKey:@"_ID"];
        _currency = [coder decodeObjectForKey:@"_currency"];
        _balance = [coder decodeObjectForKey:@"_balance"];
    }
    return self;
}

- (void)updateCurrency:(RVCurrency *)currency {
    if (currency != nil) {
        _currency = currency;
    }
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"Account: ID=%@, currency=%@, balance=%@", _ID, _currency.code, _balance];
}

- (void)encodeWithCoder:(NSCoder*)coder
{
    [coder encodeObject:_ID forKey:@"_ID"];
    [coder encodeObject:_currency forKey:@"_currency"];
    [coder encodeObject:_balance forKey:@"_balance"];
}

- (NSString *) convertedBalance {
    return [RVAccount convertedBalance:_balance currency:_currency.code];
}

+ (NSString *) convertedBalance:(NSNumber *)balance currency:(NSString *) currencyCode {
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setCurrencyCode:currencyCode];
    [formatter setPositiveFormat: @"¤#,##0.00"];
    [formatter setDecimalSeparator:@"."];
    return [formatter stringFromNumber:balance];
}


@end
