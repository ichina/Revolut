//
//  RVAccountsDataSource.h
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVAccountsViewModelProtocol.h"

@interface RVAccountsDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>
- (instancetype)initWithViewModel:(id <RVAccountsViewModelProtocol>) viewModel;
- (void)configure:(UITableView *) collectionView;
@end
