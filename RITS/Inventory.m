//
//  Inventory.m
//  RITS
//
//  Created by Madan Parameswaran on 2/29/16.
//  Copyright © 2016 Old is Gold. All rights reserved.
//

#import "Inventory.h"

@implementation Inventory

+(RKMapping *)mapping
{
    RKObjectMapping *inventoryMapping = [RKObjectMapping mappingForClass:[Inventory class]];
    
  //  [inventoryMapping mappingForSourceKeyPath:@"inventory"];
    [inventoryMapping addAttributeMappingsFromDictionary:@{@"sku":@"sku",@"artist":@"artist",@"title":@"title",@"quality":@"quality",@"price":@"price",@"quantity":@"quantity"}];
    return inventoryMapping;
    
}

@end
