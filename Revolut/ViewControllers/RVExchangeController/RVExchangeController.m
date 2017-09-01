//
//  RVExchangeController.m
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVExchangeController.h"
#import "RVExchangeView.h"
#import "RVExchangeDataSource.h"
#import "RVExchangeCollectionCell.h"

@interface RVExchangeController ()
{
    RVExchangeView* _exchangeView;
    RVExchangeDataSource* _exchangeDataSource;
}
@end

@implementation RVExchangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;

    _exchangeView = (RVExchangeView *)self.view;
    _exchangeDataSource = [[RVExchangeDataSource alloc] initWithViewModel:_viewModel];
    
    [_exchangeDataSource configure:_exchangeView.firstCollectionView];
    [_exchangeDataSource configure:_exchangeView.secondCollectionView];
    
    [_exchangeView addCancelToItem:self.navigationItem withCommand:_viewModel.rac_cancel];
    [_exchangeView addExchangeToItem:self.navigationItem withCommand:_viewModel.rac_exchange enableSignal:_viewModel.rac_exchangeEnabled];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_exchangeView.firstCollectionView setContentOffset:CGPointMake(CGRectGetWidth(self.view.frame)*30, 0)];
    [_exchangeView.secondCollectionView setContentOffset:CGPointMake(CGRectGetWidth(self.view.frame)*31, 0)];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[(RVExchangeCollectionCell *)[[_exchangeView.firstCollectionView visibleCells] firstObject] textField]becomeFirstResponder];
    });
}

@end
