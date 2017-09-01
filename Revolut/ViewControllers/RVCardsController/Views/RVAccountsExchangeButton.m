//
//  RVAccountsExchangeButton.m
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVAccountsExchangeButton.h"

@implementation RVAccountsExchangeButton

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    self.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.4].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = CGRectGetHeight(self.frame)/2;
}

@end
