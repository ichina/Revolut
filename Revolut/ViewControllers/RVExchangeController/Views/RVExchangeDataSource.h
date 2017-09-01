//
//  RVExchangeDataSource.h
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVExchangeViewModelProtocol.h"
typedef void (^NeedUpdatePageControlIndexBlock)(BOOL isTop, NSInteger idx);

@interface RVExchangeDataSource : NSObject <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy) NeedUpdatePageControlIndexBlock needUpdatePageControlIndexBlock;

- (instancetype)initWithViewModel:(id <RVExchangeViewModelProtocol>) viewModel;
- (void)configure:(UICollectionView *) collectionView;

@end
