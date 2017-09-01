//
//  RVRouter.m
//  Revolut
//
//  Created by Chingis Gomboev on 29/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVRouter.h"
#import "RVApplicationAssembly.h"

@implementation RVRouter

-(UINavigationController *) rootNavController {
    return (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
}

-(void)showScene:(RVSceneType)type {
    switch (type) {
        case RVSceneTypeAccounts:
            //can be usefull potencialy
            break;
        case RVSceneTypeExchange: {
            UIViewController* vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"exchangeController"];
            [self.rootNavController pushViewController:vc animated:YES];
        }
            break;
    }
}

-(void)dismiss {
    [self.rootNavController popViewControllerAnimated:YES];
}

@end
