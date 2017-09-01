//
//  RVCurrencyClient.m
//  Revolut
//
//  Created by Chingis Gomboev on 30/08/2017.
//  Copyright © 2017 fesolution. All rights reserved.
//

#import "RVCurrencyClient.h"
#import "RXMLElement.h"
#import "RXMLElement+RVCurrency.h"
#import "RVCurrency.h"

typedef void(^RVCurrenciesReceivedBlock)(NSArray* currencies);
typedef void(^RVCurrenciesErrorBlock)(NSError* error);

NSString *const RV_BASE_URL = @"https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml";

@interface RVCurrencyClient()
{
    NSTimer* _timer;
}
@property (nonatomic, strong) RACSubject* subject;
@end

@implementation RVCurrencyClient

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(void) setup {
    _subject = [RACSubject subject];
    _timer = [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
    
    [self tick:nil];
}

-(void)tick:(id)sender {
    @weakify(self);
    [self loadCurrenciesOnSuccess:^(NSArray *currencies) {
        @strongify(self);
        [self.subject sendNext:currencies];
    } onError:^(NSError *error) {
        @strongify(self);
        [self.subject sendError:error];
    }];

}

- (RACSignal *)rac_currenciesUpdated {
    return _subject;
}

- (void)loadCurrenciesOnSuccess:(RVCurrenciesReceivedBlock)successBlock
                     onError:(RVCurrenciesErrorBlock)errorBlock;
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^
                   {
                       NSData* data = [NSData dataWithContentsOfURL:[self queryURL]];
                       
                       RXMLElement* rootElement = [RXMLElement elementFromXMLData:data];
                       RXMLElement* error = [rootElement child:@"error"];
                       if (error && errorBlock)
                       {
                           NSString* failureReason = [[[error child:@"msg"] text] copy];
                           NSError* error = [NSError errorWithDomain:@"API.Error"
                                                                code:400
                                                            userInfo:@{
                                                                       NSLocalizedDescriptionKey: @"error",
                                                                       NSLocalizedFailureReasonErrorKey : failureReason.length == 0 ? @"Unexpected error." : failureReason
                                                                       }];
                           dispatch_async(dispatch_get_main_queue(), ^
                                          {
                                              errorBlock(error);
                                          });
                           
                       }
                       else if (successBlock)
                       {
                           NSArray* currencies = [rootElement asCurrencies];
                           
                           dispatch_async(dispatch_get_main_queue(), ^
                                          {
                                              successBlock(currencies);
                                          });
                       }
                   });

    
}

- (NSURL*)queryURL
{
    return [[NSURL alloc] initWithString:RV_BASE_URL];
}



@end
