//
//  RvRoutingProtocol.h
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

typedef NS_ENUM(NSInteger, RVSceneType) {
    RVSceneTypeAccounts,
    RVSceneTypeExchange
};

@protocol RVRoutingProtocol <NSObject>

-(void)showScene:(RVSceneType)type;
-(void)dismiss;

@end
