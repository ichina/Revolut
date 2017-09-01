//
//  RVExchangeDataSource.m
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVExchangeDataSource.h"
#import "RVExchangeCollectionCell.h"

@interface RVExchangeDataSource ()
{
    __weak id <RVExchangeViewModelProtocol> _viewModel;
    __weak UICollectionView* _firstCollectionView;
    __weak UICollectionView* _secondCollectionView;
    __weak UITextField* _firstTextField;
    __weak UICollectionView* _secondTextField;
}
@end

@implementation RVExchangeDataSource

- (instancetype)initWithViewModel:(id <RVExchangeViewModelProtocol>) viewModel
{
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)configure:(UICollectionView *) collectionView {    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    if (collectionView.tag != 0 ) {
        _firstCollectionView = collectionView;
    }
    else {
        _secondCollectionView = collectionView;
    }
}

-(BOOL) isFirstCollectionView:(UICollectionView *)collectionView {
    return _firstCollectionView == collectionView;
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RVExchangeCollectionCell* cell = (RVExchangeCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"exchangeCell" forIndexPath:indexPath];
    
    BOOL isTopCollection = [self isFirstCollectionView:collectionView];
    [cell configure:[_viewModel viewModelForCellAt: indexPath forTopCurrency:isTopCollection]];
    cell.textField.userInteractionEnabled = isTopCollection;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [(RVExchangeCollectionCell *)cell clean];
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    UICollectionView* collectionView = (UICollectionView *)scrollView;
    BOOL isTop = [self isFirstCollectionView:collectionView];
    RVExchangeCollectionCell* cell = [collectionView visibleCells].firstObject;
    NSString* currencyCode = [cell currencyLabel].text;
    [_viewModel didChangeCurrency:currencyCode isTop:isTop];
    [_secondCollectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
    if (isTop) {
        [cell.textField becomeFirstResponder];
    }
    if (self.needUpdatePageControlIndexBlock) {
        self.needUpdatePageControlIndexBlock(isTop, [collectionView.indexPathsForVisibleItems.firstObject row]%3);
    }
}

#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return collectionView.frame.size;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

@end
