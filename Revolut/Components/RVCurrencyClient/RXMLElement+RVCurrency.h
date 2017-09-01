//
//  RXMLElement+RVCurrency.h
//  Revolut
//
//  Created by Chingis Gomboev on 30/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXMLElement.h"
@class RVCurrency;
@interface RXMLElement (RVCurrency)

- (RVCurrency*)asCurrency;
- (NSArray*) asCurrencies;
@end
