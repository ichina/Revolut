//
//  RVExchangeCollectionCell.m
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVExchangeCollectionCell.h"

@implementation RVExchangeCollectionCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
}

-(void)configure:(id <RVExchangeCellViewModelProtocol> )viewModel {
    self.textField.text = viewModel.value;
    [self setValueLabelText:viewModel.value];
    self.currencyLabel.text = viewModel.currencyName;
    self.balanceLabel.text = viewModel.balance;
    self.rateLabel.text = viewModel.rate;
    
    //RAC binding
    RACSubject* subject = viewModel.valueSubject;
    __weak typeof(self) wSelf = self;
    if (viewModel.isTop) {
        CGFloat balance = viewModel.balanceNum;
        [[self.textField.rac_textSignal
          takeUntil:self.rac_prepareForReuseSignal]
         subscribeNext:^(NSString * _Nullable x) {
             NSString* text = [x stringByReplacingOccurrencesOfString:@"," withString:@"."];
             [subject sendNext:text];
             [wSelf setValueLabelText:text];
             wSelf.balanceLabel.textColor = text.floatValue > balance ? [UIColor redColor] : [UIColor colorWithWhite:1 alpha:0.8];
         }];
    }
    else {
        [[subject takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(NSString*  _Nullable x) {
            wSelf.valueLabel.text = x;
        }];
    }
}

-(void) setValueLabelText:(NSString *)text {
    if (!text.length) {
        self.valueLabel.text = @"";
    }
    else {
        BOOL hasFloatPart = [text containsString:@"."];
        self.valueLabel.text = hasFloatPart ? [NSString stringWithFormat: @"-%0.2f", text.floatValue] : [NSString stringWithFormat: @"-%ld", text.integerValue];
    }
}

-(void)clean {
    self.textField.text = @"";
}
@end
