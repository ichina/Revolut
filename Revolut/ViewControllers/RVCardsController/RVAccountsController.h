//
//  RVAccountsController.h
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RVAccountsViewModelProtocol.h"
@class RVAccountsViewModel;

@interface RVAccountsController : UIViewController

@property(nonatomic, strong) id <RVAccountsViewModelProtocol> viewModel;
@end
