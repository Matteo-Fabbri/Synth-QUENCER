//
//  Velocities.m
//  Synth
//
//  Created by Matteo Fabbri on 17/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import "Velocities.h"

@interface Velocities ()

@end

@implementation Velocities

// convenience init, so that we initialise this class from Sequencer.m in viewDidLoad

- (id)init {
    
    self = [super init]; {
        if (self) {
            self.kickTrackVelocitiesPicker = [[UIPickerView alloc]init];
        }
        return self;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // enabling multiple touch for pickers
    [self.kickTrackVelocitiesPicker setMultipleTouchEnabled:YES];
    // model
    Data *data = [Data sharedInstance];
    // setting picker view data source and model as this viewcontroller class
    self.kickTrackVelocitiesPicker.delegate = self;
    self.kickTrackVelocitiesPicker.dataSource = self;
    
    self.snareTrackVelocitiesPicker.delegate = self;
    self.snareTrackVelocitiesPicker.dataSource = self;
    // selecting default amplitudes (half way = every pickerview, row n. 4)
    // I use a for loop to do this quicker, with less code
    for (int i = 0; i <= 15; i++) {
        [self.kickTrackVelocitiesPicker selectRow:4 inComponent:i animated:false];
    }
    for (int i = 0; i <= 15; i++) {
        [self.snareTrackVelocitiesPicker selectRow:4 inComponent:i animated:false];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



# pragma mark PickerViewDataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    // number of components = number of samples (16), for all pickerviews
    return 16;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    // 10 rows for each component since I want 10 velocity possibilities
    return 10;
}


# pragma mark PickerViewDelegate methods
// I create views to fill the rows of the pickerviews
// starting form row 0 to 10, the alpha values increases linerly, and so it will a higher amplitude (velocity) for the sound to be played is selected

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    UIView *band = [[UIView alloc] init];
    
    // Each picker view has a different tag
    if (pickerView.tag == 0) {
    band.backgroundColor = [UIColor lightGrayColor];
    
    if (row == 0) {
        band.alpha = 0;
    }
    else if (row == 1) {
        band.alpha = 0.2;
    }
    else if (row == 2) {
        band.alpha = 0.3;
    }
    else if (row == 3) {
        band.alpha = 0.4;
    }
    else if (row == 4) {
        band.alpha = 0.5;
    }
    else if (row == 5) {
        band.alpha = 0.6;
    }
    else if (row == 6) {
        band.alpha = 0.7;
    }
    else if (row == 7) {
        band.alpha = 0.8;
    }
    else if (row == 8) {
        band.alpha = 0.9;
    }
    else if (row == 9) {
        band.alpha = 1;
    }
    }
    
    else if (pickerView.tag == 1) {
        band.backgroundColor = [UIColor blueColor];
        
        if (row == 0) {
            band.alpha = 0;
        }
        if (row == 1) {
            band.alpha = 0.2;
        }
        if (row == 2) {
            band.alpha = 0.3;
        }
        if (row == 3) {
            band.alpha = 0.4;
        }
        if (row == 4) {
            band.alpha = 0.5;
        }
        if (row == 5) {
            band.alpha = 0.6;
        }
        if (row == 6) {
            band.alpha = 0.7;
        }
        if (row == 7) {
            band.alpha = 0.8;
        }
        if (row == 8) {
            band.alpha = 0.9;
        }
        if (row == 9) {
            band.alpha = 1;
        }
    }
    return band;
}



# pragma mark DIDSELECTROW


- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    
    // KICK TRACK
    if (pickerView == self.kickTrackVelocitiesPicker) {
        
    // pickerview component = sequencer sample (16 possible values)
    // pickerview row = sample ampltidue (10 possible values)
    // for each component (N = n of sample), I set kickSampleNSelectedRow
        
        
     // FOR EACH ROW THAT IS SELECTED, SET CORRESPONDENT VALUE
        
        
    if ([self.kickTrackVelocitiesPicker selectedRowInComponent:component] == 0)  {
        
        // Here I set set data in the model, which i will get from the sequencer itself
        [Data setKickAmplitude:0.1 atSample:component];
    }
    else if ([self.kickTrackVelocitiesPicker selectedRowInComponent:component] == 1) {
        [Data setKickAmplitude:0.2 atSample:component];
    }
    else if ([self.kickTrackVelocitiesPicker selectedRowInComponent:component] == 2) {
        [Data setKickAmplitude:0.3 atSample:component];
    }
    else if ([self.kickTrackVelocitiesPicker selectedRowInComponent:component] == 3) {
        [Data setKickAmplitude:0.4 atSample:component];
    }
    else if ([self.kickTrackVelocitiesPicker selectedRowInComponent:component] == 4) {
       [Data setKickAmplitude:0.5 atSample:component];
    }
    else if ([self.kickTrackVelocitiesPicker selectedRowInComponent:component] == 5) {
        [Data setKickAmplitude:0.6 atSample:component];
    }
    else if ([self.kickTrackVelocitiesPicker selectedRowInComponent:component] == 6) {
        [Data setKickAmplitude:0.7 atSample:component];
    }
    else if ([self.kickTrackVelocitiesPicker selectedRowInComponent:component] == 7) {
        [Data setKickAmplitude:0.8 atSample:component];
    }
    else if ([self.kickTrackVelocitiesPicker selectedRowInComponent:component] == 8) {
        [Data setKickAmplitude:0.9 atSample:component];
    }
    else if ([self.kickTrackVelocitiesPicker selectedRowInComponent:component] == 9) {
        [Data setKickAmplitude:1.0 atSample:component];
    }
    }
}
    







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
