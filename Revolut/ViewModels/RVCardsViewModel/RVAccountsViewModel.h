//
//  RVAccountsViewModel.h
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVRoutingProtocol.h"
#import "RVAccountsViewModelProtocol.h"
#import "RVAccountsManagerProtocol.h"
#import "RVTransactionCellViewModelProtocol.h"

@interface RVAccountsViewModel : NSObject <RVAccountsViewModelProtocol>

@property (nonatomic, strong) id <RVRoutingProtocol> router;
@property (nonatomic, strong) id <RVAccountsManagerProtocol> accountsManager;

- (instancetype)initWithRouter:(id <RVRoutingProtocol>) router accountsManager:(id <RVAccountsManagerProtocol>) accountsManager;

- (RACCommand *) rac_exchangeCommand;

@end
