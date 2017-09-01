//
//  RVCurrency.m
//  Revolut
//
//  Created by Chingis Gomboev on 30/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVCurrency.h"

@implementation RVCurrency

+ (RVCurrency *) currencyWithCode:(NSString *)code rate: (NSNumber *) rate {
    return [[RVCurrency alloc] initWithCode:code rate:rate];
}

- (instancetype) initWithCode:(NSString*)code rate:(NSNumber*)rate {
    self = [super init];
    if (self)
    {
        _code = code;
        _rate = rate;
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder*)coder
{
    self = [super init];
    if (self)
    {
        _code = [coder decodeObjectForKey:@"_code"];
        _rate = [coder decodeObjectForKey:@"_rate"];
    }
    return self;
}


- (NSString*)description
{
    return [NSString stringWithFormat:@"Currency: code=%@, rate=%@", _code, _rate];
}

- (void)encodeWithCoder:(NSCoder*)coder
{
    [coder encodeObject:_code forKey:@"_code"];
    [coder encodeObject:_rate forKey:@"_rate"];
}

@end
