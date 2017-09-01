//
//  RVApplicationAssembly.m
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//


#import "RVApplicationAssembly.h"
#import "AppDelegate.h"
#import "RVAccountsController.h"
#import "RVAccountsViewModel.h"
#import "RVAccountsViewModelProtocol.h"
#import "RVExchangeController.h"
#import "RVExchangeViewModel.h"
#import "RVExchangeViewModelProtocol.h"
#import "RVRoutingProtocol.h"
#import "RVRouter.h"
#import "RVCurrencyClient.h"
#import "RVAccountsManager.h"

@implementation RVApplicationAssembly

#pragma mark - View Layer

- (RVAccountsController *) accountsController {
    return [TyphoonDefinition withClass:[RVAccountsController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(viewModel) with:[self accountsViewModel]];
    }];
}

- (RVExchangeController *)exchangeController {
    return [TyphoonDefinition withClass:[RVExchangeController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(viewModel) with:[self exchangeViewModel]];
    }];
}



#pragma mark - View Models

- (id <RVAccountsViewModelProtocol>) accountsViewModel {
    return [TyphoonDefinition withClass:[RVAccountsViewModel class] configuration:^(TyphoonDefinition *definition) {
        
        [definition useInitializer:@selector(initWithRouter:accountsManager:)
                        parameters:^(TyphoonMethod *initializer) {
                            
                            [initializer injectParameterWith:[self router]];
                            [initializer injectParameterWith:[self accountsManager]];
                        }];
    }];
}


- (id <RVExchangeViewModelProtocol>) exchangeViewModel {
    return [TyphoonDefinition withClass:[RVExchangeViewModel class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithRouter:accountsManager:)
                        parameters:^(TyphoonMethod *initializer) {
                            
                            [initializer injectParameterWith:[self router]];
                            [initializer injectParameterWith:[self accountsManager]];
                        }];
    }];
}

#pragma mark - Services

- (id <RVRoutingProtocol>) router {
    return [TyphoonDefinition withClass:[RVRouter class]];
}

- (id <RVCurrencyClientProtocol>) currencyClient {
    return [TyphoonDefinition withClass:[RVCurrencyClient class]];
}

- (id <RVAccountsManagerProtocol>) accountsManager {
    return [TyphoonDefinition withClass:[RVAccountsManager class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithCurrencyClient:)
                        parameters:^(TyphoonMethod *initializer) {
                            [initializer injectParameterWith:[self currencyClient]];
                        }];
        definition.scope = TyphoonScopeLazySingleton;
    }];
}

@end
