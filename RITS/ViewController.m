//
//  ViewController.m
//  RITS
//
//  Created by Madan Parameswaran on 2/18/16.
//  Copyright © 2016 Old is Gold. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    IBOutlet UIImageView *resultImage;
    IBOutlet UILabel *skuLabel;
    IBOutlet UILabel *artistLabel;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *priceLabel;
    IBOutlet UILabel *qualityLabel;
    IBOutlet UILabel *quantityLabel;
    UITextView *resultText;
   
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}
-(void)didFailFetchingInventoryItem:(NSError *)error{
    NSLog(@"%@",error.description);
}
-(void)didFetchInventorySuccessfully:(Inventory *)item
{
    [skuLabel setText:[NSString stringWithFormat:@"%i",(int)[item sku]]];
    [artistLabel setText:[item artist]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)scanButtonPressed:(id)sender
{
    // ADD: present a barcode reader that scans from the camera feed
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // present and release the controller
    [self presentModalViewController: reader
                            animated: YES];
}


- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    
    // EXAMPLE: do something useful with the barcode data
    NSString *barcode = symbol.data;
    BarCodeService *barcodeService = [[BarCodeService alloc]initWithDelegate:self];
    [barcodeService fetchInventory:barcode];
    
    resultImage.image =
    [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissModalViewControllerAnimated: YES];
      NSLog(@"Barcode = %@", symbol.data);
}

-(void)dealloc
{
    resultImage = nil;
    resultText = nil;
}
@end
