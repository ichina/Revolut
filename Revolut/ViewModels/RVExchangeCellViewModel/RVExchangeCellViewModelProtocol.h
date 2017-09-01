//
//  RVExchangeCellViewModelProtocol.h
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

@protocol RVExchangeCellViewModelProtocol <NSObject>

@required
@property(nonatomic, strong, readonly) NSString* currencyName;
@property(nonatomic, strong, readonly) NSString* balance;
@property(nonatomic, strong, readonly) NSString* value;
@property(nonatomic, strong, readonly) NSString* rate;

@optional
@property(nonatomic, weak, readonly) RACSubject* valueSubject;
- (CGFloat) balanceNum;
- (BOOL) isTop;

@end
