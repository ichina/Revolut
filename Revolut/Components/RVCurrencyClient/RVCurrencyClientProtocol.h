//
//  RVCurrenciesProtocol.h
//  Revolut
//
//  Created by Chingis Gomboev on 30/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

@protocol RVCurrencyClientProtocol <NSObject>

- (RACSignal *)rac_currenciesUpdated;

@end
