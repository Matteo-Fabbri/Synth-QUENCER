//
//  Sequencer.m
//  Synth
//
//  Created by Matteo Fabbri on 16/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import "Sequencer.h"

@interface Sequencer ()

@end

@implementation Sequencer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didPressButton:(UIButton *)sender {
    NSLog(@"Button pressed");
}
@end
