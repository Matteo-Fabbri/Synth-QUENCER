//
//  Velocities.m
//  Synth
//
//  Created by Matteo Fabbri on 17/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import "Velocities.h"
#import "Drum sounds and reverb.h"

@interface Velocities ()

@end

@implementation Velocities




- (void)viewDidLoad {
    [super viewDidLoad];
    // enabling multiple touch for pickers
    [self.kickTrackVelocitiesPicker setMultipleTouchEnabled:YES];
    [self.hiHatTrackVelocitiesPicker setMultipleTouchEnabled:YES];
    [self.snareTrackVelocities setMultipleTouchEnabled:YES];
    [self.tomTrackVelocities setMultipleTouchEnabled:YES];

    // model
//    Data *data = [Data sharedInstance];
    // setting picker view data source and model as this viewcontroller class
    self.kickTrackVelocitiesPicker.delegate = self;
    self.kickTrackVelocitiesPicker.dataSource = self;
    
    self.hiHatTrackVelocitiesPicker.delegate = self;
    self.hiHatTrackVelocitiesPicker.dataSource = self;
    
    self.snareTrackVelocities.delegate = self;
    self.snareTrackVelocities.dataSource = self;
    
    self.tomTrackVelocities.delegate = self;
    self.tomTrackVelocities.dataSource = self;

    
    // selecting default amplitudes (half way = every pickerview, row n. 4 = 0.5 amplitude out of 1). This is just a visual setting, I have set the actual amplitude in Sequencer viewDidLoad, which is the first view to be loaded and to be actually seen by the user
    // I use a for loop to do this quicker, with less code
    for (int i = 0; i <= 15; i++) {
        [self.kickTrackVelocitiesPicker selectRow:4 inComponent:i animated:false];
    }
    for (int i = 0; i <= 15; i++) {
        [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:i animated:false];
    }
    for (int i = 0; i <= 15; i++) {
        [self.snareTrackVelocities selectRow:4 inComponent:i animated:false];
    }
    for (int i = 0; i <= 15; i++) {
        [self.tomTrackVelocities selectRow:4 inComponent:i animated:false];
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
    
    // gray for kick
    if (pickerView == self.kickTrackVelocitiesPicker) {
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
    
    // yellow for hihat
    else if (pickerView == self.hiHatTrackVelocitiesPicker) {
        band.backgroundColor = [UIColor orangeColor];
        
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
    
    // cyan for snare
    else if (pickerView == self.snareTrackVelocities) {
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
    
    
    // orange for tom
    else if (pickerView == self.tomTrackVelocities) {
        band.backgroundColor = [UIColor redColor];
        
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
        
        
        // I do in this way to specify a code "universal" for all the components in each picker: I need to specify the setters triggered by each row, but this code IS THE SAME FOR ALL THE COMPONENTS
        
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
    
    
    // hihat track
    
    if (pickerView == self.hiHatTrackVelocitiesPicker) {
    if ([self.hiHatTrackVelocitiesPicker selectedRowInComponent:component] == 0)  {
        
        // Here I set set data in the model, which i will get from the sequencer itself
        [Data setHiHatAmplitude:0.1 atSample:component];
    }
    else if ([self.hiHatTrackVelocitiesPicker selectedRowInComponent:component] == 1) {
        [Data setHiHatAmplitude:0.2 atSample:component];
    }
    else if ([self.hiHatTrackVelocitiesPicker selectedRowInComponent:component] == 2) {
        [Data setHiHatAmplitude:0.3 atSample:component];
    }
    else if ([self.hiHatTrackVelocitiesPicker selectedRowInComponent:component] == 3) {
        [Data setHiHatAmplitude:0.4 atSample:component];
    }
    else if ([self.hiHatTrackVelocitiesPicker selectedRowInComponent:component] == 4) {
        [Data setHiHatAmplitude:0.5 atSample:component];
    }
    else if ([self.hiHatTrackVelocitiesPicker selectedRowInComponent:component] == 5) {
        [Data setHiHatAmplitude:0.6 atSample:component];
    }
    else if ([self.hiHatTrackVelocitiesPicker selectedRowInComponent:component] == 6) {
        [Data setHiHatAmplitude:0.7 atSample:component];
    }
    else if ([self.hiHatTrackVelocitiesPicker selectedRowInComponent:component] == 7) {
        [Data setHiHatAmplitude:0.8 atSample:component];
    }
    else if ([self.hiHatTrackVelocitiesPicker selectedRowInComponent:component] == 8) {
        [Data setHiHatAmplitude:0.9 atSample:component];
    }
    else if ([self.hiHatTrackVelocitiesPicker selectedRowInComponent:component] == 9) {
        [Data setHiHatAmplitude:1.0 atSample:component];
    }
        
    }
    
    
    
    
    
    // snare track
    
    if (pickerView == self.snareTrackVelocities) {
        if ([self.snareTrackVelocities selectedRowInComponent:component] == 0)  {
            
            // Here I set set data in the model, which i will get from the sequencer itself
            [Data setSnareAmplitude:0.1 atSample:component];
        }
        else if ([self.snareTrackVelocities selectedRowInComponent:component] == 1) {
            [Data setSnareAmplitude:0.2 atSample:component];
        }
        else if ([self.snareTrackVelocities selectedRowInComponent:component] == 2) {
            [Data setSnareAmplitude:0.3 atSample:component];
        }
        else if ([self.snareTrackVelocities selectedRowInComponent:component] == 3) {
            [Data setSnareAmplitude:0.4 atSample:component];
        }
        else if ([self.snareTrackVelocities selectedRowInComponent:component] == 4) {
            [Data setSnareAmplitude:0.5 atSample:component];
        }
        else if ([self.snareTrackVelocities selectedRowInComponent:component] == 5) {
            [Data setSnareAmplitude:0.6 atSample:component];
        }
        else if ([self.snareTrackVelocities selectedRowInComponent:component] == 6) {
            [Data setSnareAmplitude:0.7 atSample:component];
        }
        else if ([self.snareTrackVelocities selectedRowInComponent:component] == 7) {
            [Data setSnareAmplitude:0.8 atSample:component];
        }
        else if ([self.snareTrackVelocities selectedRowInComponent:component] == 8) {
            [Data setSnareAmplitude:0.9 atSample:component];
        }
        else if ([self.snareTrackVelocities selectedRowInComponent:component] == 9) {
            [Data setSnareAmplitude:1.0 atSample:component];
        }
        
    }
    
    
    
    // tom track
    
    if (pickerView == self.tomTrackVelocities) {
        if ([self.tomTrackVelocities selectedRowInComponent:component] == 0)  {
            
            // Here I set set data in the model, which i will get from the sequencer itself
            [Data setTomAmplitude:0.1 atSample:component];
        }
        else if ([self.tomTrackVelocities selectedRowInComponent:component] == 1) {
            [Data setTomAmplitude:0.2 atSample:component];
        }
        else if ([self.tomTrackVelocities selectedRowInComponent:component] == 2) {
            [Data setTomAmplitude:0.3 atSample:component];
        }
        else if ([self.tomTrackVelocities selectedRowInComponent:component] == 3) {
            [Data setTomAmplitude:0.4 atSample:component];
        }
        else if ([self.tomTrackVelocities selectedRowInComponent:component] == 4) {
            [Data setTomAmplitude:0.5 atSample:component];
        }
        else if ([self.tomTrackVelocities selectedRowInComponent:component] == 5) {
            [Data setTomAmplitude:0.6 atSample:component];
        }
        else if ([self.tomTrackVelocities selectedRowInComponent:component] == 6) {
            [Data setTomAmplitude:0.7 atSample:component];
        }
        else if ([self.tomTrackVelocities selectedRowInComponent:component] == 7) {
            [Data setTomAmplitude:0.8 atSample:component];
        }
        else if ([self.tomTrackVelocities selectedRowInComponent:component] == 8) {
            [Data setTomAmplitude:0.9 atSample:component];
        }
        else if ([self.tomTrackVelocities selectedRowInComponent:component] == 9) {
            [Data setTomAmplitude:1.0 atSample:component];
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






# pragma mark Randomise Kick Velocities Button
- (IBAction)didKickRandomisePress:(UIButton *)sender {
    // random uniform number generator for kicktrack velocities
    // creating variables for storing the random numbers, then manual call of 2 methods: one visually sets the wanted row, the other actually triggers the correspondent code
    // https://stackoverflow.com/questions/160890/generating-random-numbers-in-objective-c
    int a = arc4random_uniform(9);
    int b = arc4random_uniform(9);
    int c = arc4random_uniform(9);
    int d = arc4random_uniform(9);
    int e = arc4random_uniform(9);
    int f = arc4random_uniform(9);
    int g = arc4random_uniform(9);
    int h = arc4random_uniform(9);
    int i = arc4random_uniform(9);
    int j = arc4random_uniform(9);
    int k = arc4random_uniform(9);
    int l = arc4random_uniform(9);
    int m = arc4random_uniform(9);
    int n = arc4random_uniform(9);
    int o = arc4random_uniform(9);
    int p = arc4random_uniform(9);
    
    [self.kickTrackVelocitiesPicker selectRow:a inComponent:0 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:b inComponent:1 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:c inComponent:2 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:d inComponent:3 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:e inComponent:4 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:f inComponent:5 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:g inComponent:6 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:h inComponent:7 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:i inComponent:8 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:j inComponent:9 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:k inComponent:10 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:l inComponent:11 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:m inComponent:12 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:n inComponent:13 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:o inComponent:14 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:p inComponent:15 animated:false];
    
    
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:a inComponent:0];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:b inComponent:1];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:c inComponent:2];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:d inComponent:3];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:e inComponent:4];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:f inComponent:5];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:g inComponent:6];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:h inComponent:7];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:i inComponent:8];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:j inComponent:9];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:k inComponent:10];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:l inComponent:11];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:m inComponent:12];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:n inComponent:13];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:o inComponent:14];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:p inComponent:15];
    

}
# pragma mark Reset kick velocities (all to half way)
- (IBAction)didKickVelocitiesResetPress:(UIButton *)sender {
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:0 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:1 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:2 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:3 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:4 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:5 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:6 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:7 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:8 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:9 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:10 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:11 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:12 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:13 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:14 animated:false];
    [self.kickTrackVelocitiesPicker selectRow:4 inComponent:15 animated:false];
    
    
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:0];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:1];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:2];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:3];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:4];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:5];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:6];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:7];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:8];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:9];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:10];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:11];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:12];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:13];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:14];
    [self pickerView:self.kickTrackVelocitiesPicker didSelectRow:4 inComponent:15];
    }

# pragma mark HiHat randomise and reset methods

- (IBAction)didHiHatRandomisePress:(UIButton *)sender {
    int a = arc4random_uniform(9);
    int b = arc4random_uniform(9);
    int c = arc4random_uniform(9);
    int d = arc4random_uniform(9);
    int e = arc4random_uniform(9);
    int f = arc4random_uniform(9);
    int g = arc4random_uniform(9);
    int h = arc4random_uniform(9);
    int i = arc4random_uniform(9);
    int j = arc4random_uniform(9);
    int k = arc4random_uniform(9);
    int l = arc4random_uniform(9);
    int m = arc4random_uniform(9);
    int n = arc4random_uniform(9);
    int o = arc4random_uniform(9);
    int p = arc4random_uniform(9);
    
    [self.hiHatTrackVelocitiesPicker selectRow:a inComponent:0 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:b inComponent:1 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:c inComponent:2 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:d inComponent:3 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:e inComponent:4 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:f inComponent:5 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:g inComponent:6 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:h inComponent:7 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:i inComponent:8 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:j inComponent:9 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:k inComponent:10 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:l inComponent:11 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:m inComponent:12 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:n inComponent:13 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:o inComponent:14 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:p inComponent:15 animated:false];
    
    
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:a inComponent:0];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:b inComponent:1];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:c inComponent:2];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:d inComponent:3];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:e inComponent:4];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:f inComponent:5];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:g inComponent:6];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:h inComponent:7];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:i inComponent:8];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:j inComponent:9];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:k inComponent:10];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:l inComponent:11];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:m inComponent:12];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:n inComponent:13];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:o inComponent:14];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:p inComponent:15];
}

- (IBAction)didHiHatVelocitiesResetPress:(UIButton *)sender {
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:0 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:1 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:2 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:3 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:4 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:5 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:6 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:7 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:8 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:9 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:10 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:11 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:12 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:13 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:14 animated:false];
    [self.hiHatTrackVelocitiesPicker selectRow:4 inComponent:15 animated:false];
    
    
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:0];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:1];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:2];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:3];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:4];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:5];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:6];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:7];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:8];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:9];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:10];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:11];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:12];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:13];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:14];
    [self pickerView:self.hiHatTrackVelocitiesPicker didSelectRow:4 inComponent:15];
}
- (IBAction)didSnareRandomisePress:(UIButton *)sender {
    int a = arc4random_uniform(9);
    int b = arc4random_uniform(9);
    int c = arc4random_uniform(9);
    int d = arc4random_uniform(9);
    int e = arc4random_uniform(9);
    int f = arc4random_uniform(9);
    int g = arc4random_uniform(9);
    int h = arc4random_uniform(9);
    int i = arc4random_uniform(9);
    int j = arc4random_uniform(9);
    int k = arc4random_uniform(9);
    int l = arc4random_uniform(9);
    int m = arc4random_uniform(9);
    int n = arc4random_uniform(9);
    int o = arc4random_uniform(9);
    int p = arc4random_uniform(9);
    
    [self.snareTrackVelocities selectRow:a inComponent:0 animated:false];
    [self.snareTrackVelocities selectRow:b inComponent:1 animated:false];
    [self.snareTrackVelocities selectRow:c inComponent:2 animated:false];
    [self.snareTrackVelocities selectRow:d inComponent:3 animated:false];
    [self.snareTrackVelocities selectRow:e inComponent:4 animated:false];
    [self.snareTrackVelocities selectRow:f inComponent:5 animated:false];
    [self.snareTrackVelocities selectRow:g inComponent:6 animated:false];
    [self.snareTrackVelocities selectRow:h inComponent:7 animated:false];
    [self.snareTrackVelocities selectRow:i inComponent:8 animated:false];
    [self.snareTrackVelocities selectRow:j inComponent:9 animated:false];
    [self.snareTrackVelocities selectRow:k inComponent:10 animated:false];
    [self.snareTrackVelocities selectRow:l inComponent:11 animated:false];
    [self.snareTrackVelocities selectRow:m inComponent:12 animated:false];
    [self.snareTrackVelocities selectRow:n inComponent:13 animated:false];
    [self.snareTrackVelocities selectRow:o inComponent:14 animated:false];
    [self.snareTrackVelocities selectRow:p inComponent:15 animated:false];
    
    
    [self pickerView:self.snareTrackVelocities didSelectRow:a inComponent:0];
    [self pickerView:self.snareTrackVelocities didSelectRow:b inComponent:1];
    [self pickerView:self.snareTrackVelocities didSelectRow:c inComponent:2];
    [self pickerView:self.snareTrackVelocities didSelectRow:d inComponent:3];
    [self pickerView:self.snareTrackVelocities didSelectRow:e inComponent:4];
    [self pickerView:self.snareTrackVelocities didSelectRow:f inComponent:5];
    [self pickerView:self.snareTrackVelocities didSelectRow:g inComponent:6];
    [self pickerView:self.snareTrackVelocities didSelectRow:h inComponent:7];
    [self pickerView:self.snareTrackVelocities didSelectRow:i inComponent:8];
    [self pickerView:self.snareTrackVelocities didSelectRow:j inComponent:9];
    [self pickerView:self.snareTrackVelocities didSelectRow:k inComponent:10];
    [self pickerView:self.snareTrackVelocities didSelectRow:l inComponent:11];
    [self pickerView:self.snareTrackVelocities didSelectRow:m inComponent:12];
    [self pickerView:self.snareTrackVelocities didSelectRow:n inComponent:13];
    [self pickerView:self.snareTrackVelocities didSelectRow:o inComponent:14];
    [self pickerView:self.snareTrackVelocities didSelectRow:p inComponent:15];
}

- (IBAction)didSnareVelocitiesResetPress:(UIButton *)sender {
    [self.snareTrackVelocities selectRow:4 inComponent:0 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:1 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:2 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:3 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:4 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:5 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:6 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:7 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:8 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:9 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:10 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:11 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:12 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:13 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:14 animated:false];
    [self.snareTrackVelocities selectRow:4 inComponent:15 animated:false];
    
    
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:0];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:1];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:2];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:3];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:4];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:5];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:6];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:7];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:8];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:9];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:10];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:11];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:12];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:13];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:14];
    [self pickerView:self.snareTrackVelocities didSelectRow:4 inComponent:15];
}

- (IBAction)didTomRandomisePress:(UIButton *)sender {
    int a = arc4random_uniform(9);
    int b = arc4random_uniform(9);
    int c = arc4random_uniform(9);
    int d = arc4random_uniform(9);
    int e = arc4random_uniform(9);
    int f = arc4random_uniform(9);
    int g = arc4random_uniform(9);
    int h = arc4random_uniform(9);
    int i = arc4random_uniform(9);
    int j = arc4random_uniform(9);
    int k = arc4random_uniform(9);
    int l = arc4random_uniform(9);
    int m = arc4random_uniform(9);
    int n = arc4random_uniform(9);
    int o = arc4random_uniform(9);
    int p = arc4random_uniform(9);
    
    [self.tomTrackVelocities selectRow:a inComponent:0 animated:false];
    [self.tomTrackVelocities selectRow:b inComponent:1 animated:false];
    [self.tomTrackVelocities selectRow:c inComponent:2 animated:false];
    [self.tomTrackVelocities selectRow:d inComponent:3 animated:false];
    [self.tomTrackVelocities selectRow:e inComponent:4 animated:false];
    [self.tomTrackVelocities selectRow:f inComponent:5 animated:false];
    [self.tomTrackVelocities selectRow:g inComponent:6 animated:false];
    [self.tomTrackVelocities selectRow:h inComponent:7 animated:false];
    [self.tomTrackVelocities selectRow:i inComponent:8 animated:false];
    [self.tomTrackVelocities selectRow:j inComponent:9 animated:false];
    [self.tomTrackVelocities selectRow:k inComponent:10 animated:false];
    [self.tomTrackVelocities selectRow:l inComponent:11 animated:false];
    [self.tomTrackVelocities selectRow:m inComponent:12 animated:false];
    [self.tomTrackVelocities selectRow:n inComponent:13 animated:false];
    [self.tomTrackVelocities selectRow:o inComponent:14 animated:false];
    [self.tomTrackVelocities selectRow:p inComponent:15 animated:false];
    
    
    [self pickerView:self.tomTrackVelocities didSelectRow:a inComponent:0];
    [self pickerView:self.tomTrackVelocities didSelectRow:b inComponent:1];
    [self pickerView:self.tomTrackVelocities didSelectRow:c inComponent:2];
    [self pickerView:self.tomTrackVelocities didSelectRow:d inComponent:3];
    [self pickerView:self.tomTrackVelocities didSelectRow:e inComponent:4];
    [self pickerView:self.tomTrackVelocities didSelectRow:f inComponent:5];
    [self pickerView:self.tomTrackVelocities didSelectRow:g inComponent:6];
    [self pickerView:self.tomTrackVelocities didSelectRow:h inComponent:7];
    [self pickerView:self.tomTrackVelocities didSelectRow:i inComponent:8];
    [self pickerView:self.tomTrackVelocities didSelectRow:j inComponent:9];
    [self pickerView:self.tomTrackVelocities didSelectRow:k inComponent:10];
    [self pickerView:self.tomTrackVelocities didSelectRow:l inComponent:11];
    [self pickerView:self.tomTrackVelocities didSelectRow:m inComponent:12];
    [self pickerView:self.tomTrackVelocities didSelectRow:n inComponent:13];
    [self pickerView:self.tomTrackVelocities didSelectRow:o inComponent:14];
    [self pickerView:self.tomTrackVelocities didSelectRow:p inComponent:15];
}

- (IBAction)didTomVelocitiesResetPress:(UIButton *)sender {
    [self.tomTrackVelocities selectRow:4 inComponent:0 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:1 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:2 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:3 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:4 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:5 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:6 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:7 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:8 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:9 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:10 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:11 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:12 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:13 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:14 animated:false];
    [self.tomTrackVelocities selectRow:4 inComponent:15 animated:false];
    
    
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:0];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:1];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:2];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:3];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:4];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:5];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:6];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:7];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:8];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:9];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:10];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:11];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:12];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:13];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:14];
    [self pickerView:self.tomTrackVelocities didSelectRow:4 inComponent:15];
}

@end
