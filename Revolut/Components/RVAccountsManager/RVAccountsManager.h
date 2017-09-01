//
//  RVAccountsManager.h
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVAccountsManagerProtocol.h"
#import "RVCurrencyClientProtocol.h"

@class RVAccount;

@interface RVAccountsManager : NSObject <RVAccountsManagerProtocol>

@property (nonatomic, strong) id <RVCurrencyClientProtocol> currencyClient;

- (instancetype)initWithCurrencyClient:(id <RVCurrencyClientProtocol>) currencyClient;

@end
