//
//  ViewController.m
//  BillSplitterApp
//
//  Created by Wiljay Flores on 2018-08-12.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *splitAmount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculateSplitAmount:(UIButton *)sender {
    
    NSDecimalNumber *people = [[NSDecimalNumber alloc] initWithFloat:self.slider.value];
    NSDecimalNumber *bill = [[NSDecimalNumber alloc] initWithString:self.billAmount.text];
    NSDecimalNumberHandler *behaviour = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:0 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumberHandler *twoDecimal = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
   
    
    people = [people decimalNumberByRoundingAccordingToBehavior:behaviour];
    
    self.splitAmount.text = [NSString stringWithFormat:@"Split Amount: $%@",[[bill decimalNumberByDividingBy:people] decimalNumberByRoundingAccordingToBehavior:twoDecimal]];
    
}


@end
