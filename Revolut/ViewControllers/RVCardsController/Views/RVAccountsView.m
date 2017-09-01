//
//  RVAccountsView.m
//  Revolut
//
//  Created by Chingis Gomboev on 01/09/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVAccountsView.h"

@implementation RVAccountsView

-(void)awakeFromNib {
    [super awakeFromNib];
}

-(void) makeNavbarTransparent:(UINavigationBar *) navbar {
    [navbar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    navbar.shadowImage = [UIImage new];
    navbar.translucent = YES;
    navbar.backgroundColor = [UIColor clearColor];

}
@end
