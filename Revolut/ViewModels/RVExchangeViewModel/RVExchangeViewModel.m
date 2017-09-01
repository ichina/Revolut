//
//  RVExchangeViewModel.m
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVExchangeViewModel.h"
#import "RVExchangeCellViewModelProtocol.h"
#import "RVCurrencyClientProtocol.h"
#import "RVAccountsManagerProtocol.h"
#import "RVExchangeCellViewModel.h"
#import "RVAccount.h"

@interface RVExchangeViewModel ()
{
    NSArray* _accountsCodes;
    NSString* _firstCurrCode;
    NSString* _secondCurrCode;
    
    RACSubject* _valueSubject;
}
@property (nonatomic, strong) NSNumber* lastValue;
@end

@implementation RVExchangeViewModel

- (instancetype)initWithRouter:(id <RVRoutingProtocol>) router
               accountsManager:(id <RVAccountsManagerProtocol>) accountsManager
{
    self = [super init];
    if (self) {
        _router = router;
        _accountsManager = accountsManager;
        
        _accountsCodes = @[@"EUR", @"USD", @"GBP"];
        _firstCurrCode = _accountsCodes.firstObject;
        _secondCurrCode = _accountsCodes.lastObject;
        
        _valueSubject = [RACSubject subject];
        __weak typeof(self) wSelf = self;
        [[_valueSubject takeUntil:self.rac_willDeallocSignal]
            subscribeNext:^(NSString* x) {
                wSelf.lastValue = @(x.floatValue);
            }];
    }
    return self;
}

-(NSArray *)codesExclude:(NSString *)code {
    return [_accountsCodes filterUsingBlock:^BOOL(NSString* obj) {
        return ![obj isEqualToString:code];
    }];
}

-(NSArray *) accountsCodesForTopCurrency:(BOOL) isTopCurrency {
    NSArray* arr;
    if (isTopCurrency) {
        arr = _accountsCodes;
    }
    else {
        arr = [self codesExclude:_firstCurrCode];
    }
    return arr;
}

-(RACCommand *) rac_cancel {
    __weak typeof(self) wSelf = self;
    return [[RACCommand alloc] initWithSignalBlock:^(id _) {
        [wSelf.router dismiss];
        return [RACSignal empty];
    }];
}
-(RACCommand *) rac_exchange {
    __weak typeof(self) wSelf = self;
    return [[RACCommand alloc] initWithSignalBlock:^(id _) {
        [wSelf.accountsManager makeTransactionFromCode:_firstCurrCode toCode:_secondCurrCode value:wSelf.lastValue];
        [wSelf.router dismiss];
        return [RACSignal empty];
    }];

}
-(RACSignal *) rac_exchangeEnabled {
    __weak typeof(self) wSelf = self;
    NSString* firstCurrCode = _firstCurrCode;
    return [_valueSubject map:^NSNumber*(NSString* value) {
        if (!value.length || (value.floatValue > [wSelf.accountsManager accountWithCode:firstCurrCode].balance.floatValue)) {
            return @NO;
        }
        return @YES;
    }];
}

-(id <RVExchangeCellViewModelProtocol>) viewModelForCellAt:(NSIndexPath *) indexPath forTopCurrency:(BOOL) isTopCurrency {
    NSArray* accountsCodes = [self accountsCodesForTopCurrency:isTopCurrency];
    NSString* code = accountsCodes[indexPath.row % accountsCodes.count];
    RVAccount* account = [_accountsManager accountWithCode:code];
    RVAccount* origAccount = isTopCurrency ? nil : [_accountsManager accountWithCode:_firstCurrCode];
    return (id <RVExchangeCellViewModelProtocol>) [[RVExchangeCellViewModel alloc] initWithAccount: account originalAccount:origAccount valueSubject:_valueSubject];
}

-(void) didChangeCurrency:(NSString *)code isTop:(BOOL)isFirst {
    if (isFirst) {
        _firstCurrCode = code;
        _secondCurrCode = [self codesExclude:_firstCurrCode].firstObject;
    }
    else {
        _secondCurrCode = code;
    }
    
}
@end
