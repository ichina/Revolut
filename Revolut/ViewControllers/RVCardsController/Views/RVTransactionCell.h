//
//  RVTransactionCell.h
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RVTransactionCellViewModelProtocol.h"

@interface RVTransactionCell : UITableViewCell

-(void)configure:(id <RVTransactionCellViewModelProtocol> )viewModel;

@end
