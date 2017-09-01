//
//  RVCurrency.h
//  Revolut
//
//  Created by Chingis Gomboev on 30/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RVCurrency : NSObject <NSCoding>

@property(nonatomic, strong, readonly) NSString* code;
@property(nonatomic, strong, readonly) NSNumber* rate;

+ (RVCurrency *) currencyWithCode:(NSString *)code rate: (NSNumber *) rate;

- (instancetype) initWithCode:(NSString*)code rate:(NSNumber*)rate;

@end
