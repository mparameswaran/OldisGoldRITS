//
//  BarCodeService.h
//  RITS
//
//  Created by Madan Parameswaran on 2/29/16.
//  Copyright © 2016 Old is Gold. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "Inventory.h"

@protocol BarCodeServiceDelegate <NSObject>

-(void)didFetchInventorySuccessfully:(Inventory*) item;
-(void)didFailFetchingInventoryItem:(NSError *) error;

@end

@interface BarCodeService : NSObject
@property(nonatomic, weak) id<BarCodeServiceDelegate> delegate;
-(void)fetchInventory: (NSString *) barcode;
-(id)initWithDelegate: (id<BarCodeServiceDelegate>) delegate;
@end
