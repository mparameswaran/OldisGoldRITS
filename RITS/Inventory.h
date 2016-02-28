//
//  Inventory.h
//  RITS
//
//  Created by Madan Parameswaran on 2/29/16.
//  Copyright © 2016 Old is Gold. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface Inventory : NSObject

@property(nonatomic) NSInteger sku;
@property(nonatomic,strong) NSString *artist;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *quality;
@property(nonatomic) NSInteger quantity;
@property(nonatomic) CGFloat price;

+(RKMapping *) mapping;
@end
