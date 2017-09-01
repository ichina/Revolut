//
//  RVTransactionCell.m
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVTransactionCell.h"

@implementation RVTransactionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];

    // Initialization code
}

-(void)configure:(id <RVTransactionCellViewModelProtocol> )viewModel {
    self.textLabel.text = viewModel.title;
    self.detailTextLabel.text = viewModel.value;
    self.backgroundColor = [UIColor clearColor];
}
@end
