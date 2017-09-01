//
//  RVTransaction.h
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RVTransaction : NSObject

@property(nonatomic, strong) NSString* fromAccountCode;
@property(nonatomic, strong) NSString* toAccountCode;
@property(nonatomic, strong) NSNumber* value;

-(instancetype)initWithFromAccountCode:(NSString *) fromCode toAccountCode: toCode value:(NSNumber *) value;
@end
