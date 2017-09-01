//
//  RVTransactionCellViewModelProtocol.h
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

@protocol RVTransactionCellViewModelProtocol <NSObject>

@required
@property(nonatomic, strong) NSString* title;
@property(nonatomic, strong) NSString* value;


@end
