//
//  RVExchangeView.m
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVExchangeView.h"

@implementation RVExchangeView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self configure:_firstCollectionView];
    [self configure:_secondCollectionView];
    
    [_fakeTextField becomeFirstResponder];
}

-(void)configure:(UICollectionView *)collectionView {
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.contentInset = UIEdgeInsetsZero;
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.headerReferenceSize = CGSizeZero;
    layout.itemSize = collectionView.frame.size;
    [collectionView setCollectionViewLayout:layout];
    
    [collectionView registerNib:[UINib nibWithNibName:@"RVExchangeCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"exchangeCell"];
    collectionView.pagingEnabled = true;
}

-(void)addCancelToItem:(UINavigationItem *) item withCommand:(RACCommand *)command {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Cancel" forState:UIControlStateNormal];
    [button sizeToFit];
    button.rac_command = command;
    UIBarButtonItem* btnItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [item setLeftBarButtonItem:btnItem];
}

-(void) addExchangeToItem:(UINavigationItem *) item withCommand:(RACCommand *)command enableSignal:(RACSignal *)enableSignal {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Exchange" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateDisabled];
    [button sizeToFit];
    button.rac_command = command;
    [[enableSignal takeUntil:self.rac_willDeallocSignal]
        subscribeNext:^(NSNumber* isEnabled) {
            [button setEnabled:isEnabled.boolValue];
        }];
    UIBarButtonItem* btnItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [item setRightBarButtonItem:btnItem];
    
}

@end
