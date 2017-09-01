//
//  RVTransactionCellViewModel.h
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVTransactionCellViewModelProtocol.h"

@class RVTransaction;

@interface RVTransactionCellViewModel : NSObject <RVTransactionCellViewModelProtocol>

@property(nonatomic, strong) NSString* title;
@property(nonatomic, strong) NSString* value;

- (instancetype)initWithTransaction:(RVTransaction *)transaction;

@end
