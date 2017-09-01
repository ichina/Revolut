//
//  RVTransaction.m
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVTransaction.h"

@implementation RVTransaction
-(instancetype)initWithFromAccountCode:(NSString *) fromCode toAccountCode: toCode value:(NSNumber *) value
{
    self = [super init];
    if (self) {
        _fromAccountCode = fromCode;
        _toAccountCode = toCode;
        _value = value;
    }
    return self;
}
@end
