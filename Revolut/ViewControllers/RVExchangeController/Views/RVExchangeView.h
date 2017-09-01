//
//  RVExchangeView.h
//  Revolut
//
//  Created by Chingis Gomboev on 31/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RVExchangeView : UIView

@property (weak, nonatomic) IBOutlet UICollectionView *firstCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *firstPageControl;

@property (weak, nonatomic) IBOutlet UICollectionView *secondCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *seconPageControl;
@property (weak, nonatomic) IBOutlet UITextField *fakeTextField;

-(void)addCancelToItem:(UINavigationItem *) item withCommand:(RACCommand *)command;
-(void) addExchangeToItem:(UINavigationItem *) item withCommand:(RACCommand *)command enableSignal:(RACSignal *)enableSignal;

@end
