//
//  ViewController.h
//  RITS
//
//  Created by Madan Parameswaran on 2/18/16.
//  Copyright © 2016 Old is Gold. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarCodeService.h"
#import "Inventory.h"

@interface ViewController : UIViewController<ZBarReaderViewDelegate, BarCodeServiceDelegate>


@end

