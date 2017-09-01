//
//  RVApplicationAssembly.h
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"

@class AppDelegate;
@class RVAccountsController;

@interface RVApplicationAssembly : TyphoonAssembly

- (RVAccountsController *)accountsController;

@end
