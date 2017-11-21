//
//  Drum sounds and reverb.m
//  Synth
//
//  Created by Matteo Fabbri on 17/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import "Drum sounds and reverb.h"

@interface Drum_sounds_and_reverb ()

@end

@implementation Drum_sounds_and_reverb

- (void)viewDidLoad {
    [super viewDidLoad];
    // set THIS class as pickerviews delegates and datasources
    self.kickTrackSoundsPicker.delegate = self;
    self.kickTrackSoundsPicker.dataSource = self;
    // enable multiple touch for pickerviews
    [self.kickTrackSoundsPicker setMultipleTouchEnabled:true];
    // creating model class method
    Data *data = [Data sharedInstance];
    // set this view controller as both delegate and datasource of picker views
    self.kickTrackSoundsPicker.delegate = self;
    self.kickTrackSoundsPicker.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Importing functions for picker

# pragma mark PickerViewDataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    // number of components = number of samples (16)
    return 16;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    // 6 rows for each component since I allow the user to choose from 6 different sounds per drum sequencer track
    return 6;
}


# pragma mark PickerViewDelegate methods

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    UIView *band = [[UIView alloc] init];
    
    if (pickerView == self.kickTrackSoundsPicker) {
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
    }
    return band;
}





# pragma mark DIDSELECTROW
// Setting drum kick sounds in model, by calling appropriate custom method I created for
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    // KICK SOUND PICKER
    if (pickerView == self.kickTrackSoundsPicker) {
        // FIRST ROW
        if ([self.kickTrackSoundsPicker selectedRowInComponent:component] == 0)  {
            [Data setKickSound:0 atSample:component];
        }
        else if ([self.kickTrackSoundsPicker selectedRowInComponent:component] == 1)  {
            [Data setKickSound:1 atSample:component];
        }
        else if ([self.kickTrackSoundsPicker selectedRowInComponent:component] == 2)  {
            [Data setKickSound:2 atSample:component];
        }
        else if ([self.kickTrackSoundsPicker selectedRowInComponent:component] == 3)  {
            [Data setKickSound:3 atSample:component];
        }
        else if ([self.kickTrackSoundsPicker selectedRowInComponent:component] == 4)  {
            [Data setKickSound:4 atSample:component];
        }
        else if ([self.kickTrackSoundsPicker selectedRowInComponent:component] == 5)  {
            [Data setKickSound:5 atSample:component];
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

# pragma mark KICK pan slider - setter call
- (IBAction)didKickPanSliderChange:(UISlider *)sender {
    [Data setKickPan:sender.value];
}
@end
