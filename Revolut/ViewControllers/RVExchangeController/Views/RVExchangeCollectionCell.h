//
//  RVExchangeCollectionCell.h
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RVExchangeCellViewModelProtocol.h"

@interface RVExchangeCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *rateLabel;

-(void)configure:(id <RVExchangeCellViewModelProtocol> )viewModel;
-(void)clean;
@end
