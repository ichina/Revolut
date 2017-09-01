//
//  RVAccount.h
//  Revolut
//
//  Created by Chingis Gomboev on 30/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RVCurrency;
@interface RVAccount : NSObject <NSCoding>

@property(nonatomic, strong, readonly) NSString* ID;
@property(nonatomic, strong, readonly) RVCurrency* currency;
@property(nonatomic, strong) NSNumber* balance;

- (instancetype)initWithID:(NSString *)ID currency:(RVCurrency *) currency balance:(NSNumber *) balance;
- (void)updateCurrency:(RVCurrency *)currency;

+ (NSString *) convertedBalance:(NSNumber *)balance currency:(NSString *) currencyCode;
- (NSString *) convertedBalance;
@end
