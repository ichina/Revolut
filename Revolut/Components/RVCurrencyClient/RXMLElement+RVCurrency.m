//
//  RXMLElement+RVCurrency.m
//  Revolut
//
//  Created by Chingis Gomboev on 30/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RXMLElement+RVCurrency.h"
#import "RVCurrency.h"

@implementation RXMLElement (RVCurrency)

- (NSArray*) asCurrencies {
    NSArray* cubeElements = [[[self child:@"Cube"] child:@"Cube"] children:@"Cube"];
    NSMutableArray* arr = @[].mutableCopy;
    [cubeElements enumerateObjectsUsingBlock:^(RXMLElement * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [arr addObject:obj.asCurrency];
    }];
    return arr.copy;
}


- (RVCurrency*)asCurrency
{
    if (![self.tag isEqualToString:@"Cube"])
    {
        [NSException raise:NSInvalidArgumentException format:@"Element is not 'Cube'."];
    }
    NSString* code = [self attribute:@"currency"];
    NSNumber* rate = @([self attribute:@"rate"].floatValue);
    return [RVCurrency currencyWithCode:code rate:rate];
}

@end
