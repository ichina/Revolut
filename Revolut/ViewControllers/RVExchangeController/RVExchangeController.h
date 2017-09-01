//
//  RVExchangeController.h
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RVExchangeViewModelProtocol.h"
@class RVExchangeViewModel;

@interface RVExchangeController : UIViewController

@property(nonatomic, strong) id <RVExchangeViewModelProtocol> viewModel;

@end
