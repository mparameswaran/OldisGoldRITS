//
//  BarCodeService.m
//  RITS
//
//  Created by Madan Parameswaran on 2/29/16.
//  Copyright © 2016 Old is Gold. All rights reserved.
//

#import "BarCodeService.h"

@implementation BarCodeService

-(id)initWithDelegate:(id<BarCodeServiceDelegate>) delegate
{
    self = [super init];
    if (self) {
        [self setDelegate:delegate];
    }
    return self;
}


-(void)fetchInventory:(NSString *)barcode
{

    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[Inventory mapping] pathPattern:nil keyPath:nil statusCodes:nil];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://172.29.81.7:5678/oldisgold/%@",barcode]]];
    RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        Inventory *item = [result firstObject];
        NSLog(@"%@ %@ %d",item.artist, item.title, (int)item.quantity);
        [[self delegate]didFetchInventorySuccessfully:item];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [[self delegate]didFailFetchingInventoryItem:error];
    }];
    [operation start];
    
}

@end
