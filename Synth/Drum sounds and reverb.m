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

    // set this view controller as both delegate and datasource of picker views
    self.kickTrackSoundsPicker.delegate = self;
    self.kickTrackSoundsPicker.dataSource = self;
    self.hiHatTrackSoundsPicker.delegate = self;
    self.hiHatTrackSoundsPicker.dataSource = self;
    self.snareTrackSoundsPicker.delegate = self;
    self.snareTrackSoundsPicker.dataSource = self;
    self.tomTrackSoundsPicker.delegate = self;
    self.tomTrackSoundsPicker.dataSource = self;
    // enabling multi touch, could be useful for fast interaction
    [self.kickTrackSoundsPicker setMultipleTouchEnabled:true];
    [self.snareTrackSoundsPicker setMultipleTouchEnabled:true];
    [self.tomTrackSoundsPicker setMultipleTouchEnabled:true];
    [self.hiHatTrackSoundsPicker setMultipleTouchEnabled:true];

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
    // 3 rows for each component since I allow the user to choose from 3 different sounds per drum sequencer track sample
    // I had 6 possible sounds to choose from actually, but I ran out of available memory
    return 3;
}


# pragma mark PickerViewDelegate methods

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    UIView *band = [[UIView alloc] init];
    // gray color for kick picker
    if (pickerView == self.kickTrackSoundsPicker) {
        band.backgroundColor = [UIColor lightGrayColor];
        if (row == 0) {
            band.alpha = 0.3;
        }
        else if (row == 1) {
            band.alpha = 0.6;
        }
        else if (row == 2) {
            band.alpha = 0.9;
        }
       
    }
    
    // yellow color for yellow picker
    if (pickerView == self.hiHatTrackSoundsPicker) {
        band.backgroundColor = [UIColor orangeColor];
        if (row == 0) {
            band.alpha = 0.3;
        }
        else if (row == 1) {
            band.alpha = 0.6;
        }
        else if (row == 2) {
            band.alpha = 0.9;
        }
        
    }
    
    // cyan color for snare picker
    if (pickerView == self.snareTrackSoundsPicker) {
        band.backgroundColor = [UIColor blueColor];
        if (row == 0) {
            band.alpha = 0.3;
        }
        else if (row == 1) {
            band.alpha = 0.6;
        }
        else if (row == 2) {
            band.alpha = 0.9;
        }
        
    }
    
    // orange color for tom picker
    if (pickerView == self.tomTrackSoundsPicker) {
        band.backgroundColor = [UIColor redColor];
        if (row == 0) {
            band.alpha = 0.3;
        }
        else if (row == 1) {
            band.alpha = 0.6;
        }
        else if (row == 2) {
            band.alpha = 0.9;
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
        
    }
    
    // HIHAT SOUND PICKER
    if (pickerView == self.hiHatTrackSoundsPicker) {
        
        if ([self.hiHatTrackSoundsPicker selectedRowInComponent:component] == 0)  {
            [Data setHiHatSound:0 atSample:component];
        }
        else if ([self.hiHatTrackSoundsPicker selectedRowInComponent:component] == 1)  {
            [Data setHiHatSound:1 atSample:component];
        }
        else if ([self.hiHatTrackSoundsPicker selectedRowInComponent:component] == 2)  {
            [Data setHiHatSound:2 atSample:component];
        }
       
    }
  
    
    
    // SNARE SOUND PICKER
    if (pickerView == self.snareTrackSoundsPicker) {
        
        if ([self.snareTrackSoundsPicker selectedRowInComponent:component] == 0)  {
            [Data setSnareSound:0 atSample:component];
        }
        else if ([self.snareTrackSoundsPicker selectedRowInComponent:component] == 1)  {
            [Data setSnareSound:1 atSample:component];
        }
        else if ([self.snareTrackSoundsPicker selectedRowInComponent:component] == 2)  {
            [Data setSnareSound:2 atSample:component];
        }
        
    }
    
    // SNARE SOUND PICKER
    if (pickerView == self.tomTrackSoundsPicker) {
        
        if ([self.tomTrackSoundsPicker selectedRowInComponent:component] == 0)  {
            [Data setTomSound:0 atSample:component];
        }
        else if ([self.tomTrackSoundsPicker selectedRowInComponent:component] == 1)  {
            [Data setTomSound:1 atSample:component];
        }
        else if ([self.tomTrackSoundsPicker selectedRowInComponent:component] == 2)  {
            [Data setTomSound:2 atSample:component];
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


# pragma mark Kick randomise and reset

- (IBAction)didRandomiseKickSoundsPress:(UIButton *)sender {
    int a = arc4random_uniform(2);
    int b = arc4random_uniform(2);
    int c = arc4random_uniform(2);
    int d = arc4random_uniform(2);
    int e = arc4random_uniform(2);
    int f = arc4random_uniform(2);
    int g = arc4random_uniform(2);
    int h = arc4random_uniform(2);
    int i = arc4random_uniform(2);
    int j = arc4random_uniform(2);
    int k = arc4random_uniform(2);
    int l = arc4random_uniform(2);
    int m = arc4random_uniform(2);
    int n = arc4random_uniform(2);
    int o = arc4random_uniform(2);
    int p = arc4random_uniform(2);
    
    [self.kickTrackSoundsPicker selectRow:a inComponent:0 animated:false];
    [self.kickTrackSoundsPicker selectRow:b inComponent:1 animated:false];
    [self.kickTrackSoundsPicker selectRow:c inComponent:2 animated:false];
    [self.kickTrackSoundsPicker selectRow:d inComponent:3 animated:false];
    [self.kickTrackSoundsPicker selectRow:e inComponent:4 animated:false];
    [self.kickTrackSoundsPicker selectRow:f inComponent:5 animated:false];
    [self.kickTrackSoundsPicker selectRow:g inComponent:6 animated:false];
    [self.kickTrackSoundsPicker selectRow:h inComponent:7 animated:false];
    [self.kickTrackSoundsPicker selectRow:i inComponent:8 animated:false];
    [self.kickTrackSoundsPicker selectRow:j inComponent:9 animated:false];
    [self.kickTrackSoundsPicker selectRow:k inComponent:10 animated:false];
    [self.kickTrackSoundsPicker selectRow:l inComponent:11 animated:false];
    [self.kickTrackSoundsPicker selectRow:m inComponent:12 animated:false];
    [self.kickTrackSoundsPicker selectRow:n inComponent:13 animated:false];
    [self.kickTrackSoundsPicker selectRow:o inComponent:14 animated:false];
    [self.kickTrackSoundsPicker selectRow:p inComponent:15 animated:false];
    
    
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:p inComponent:15];
    
}

- (IBAction)didResetKickSoundsPress:(UIButton *)sender {
    [self.kickTrackSoundsPicker selectRow:0 inComponent:0 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:1 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:2 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:3 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:4 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:5 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:6 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:7 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:8 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:9 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:10 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:11 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:12 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:13 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:14 animated:false];
    [self.kickTrackSoundsPicker selectRow:0 inComponent:15 animated:false];
    
    
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:0];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:1];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:2];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:3];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:4];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:5];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:6];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:7];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:8];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:9];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:10];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:11];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:12];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:13];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:14];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:0 inComponent:15];
    
}

# pragma mark Kick step

- (IBAction)didKickSoundSelectionStepUpPress:(UIButton *)sender {
    // store all kick sound picker selectors (number of row selected) in variables
    // step them up, replace their values back to the picker row and retrigger their code functions manually, so that I don't have to call specific Data public methods
    long a = [self.kickTrackSoundsPicker selectedRowInComponent:0];
    long b = [self.kickTrackSoundsPicker selectedRowInComponent:1];
    long c = [self.kickTrackSoundsPicker selectedRowInComponent:2];
    long d = [self.kickTrackSoundsPicker selectedRowInComponent:3];
    long e = [self.kickTrackSoundsPicker selectedRowInComponent:4];
    long f = [self.kickTrackSoundsPicker selectedRowInComponent:5];
    long g = [self.kickTrackSoundsPicker selectedRowInComponent:6];
    long h = [self.kickTrackSoundsPicker selectedRowInComponent:7];
    long i = [self.kickTrackSoundsPicker selectedRowInComponent:8];
    long j = [self.kickTrackSoundsPicker selectedRowInComponent:9];
    long k = [self.kickTrackSoundsPicker selectedRowInComponent:10];
    long l = [self.kickTrackSoundsPicker selectedRowInComponent:11];
    long m = [self.kickTrackSoundsPicker selectedRowInComponent:12];
    long n = [self.kickTrackSoundsPicker selectedRowInComponent:13];
    long o = [self.kickTrackSoundsPicker selectedRowInComponent:14];
    long p = [self.kickTrackSoundsPicker selectedRowInComponent:15];
    
    
    
    
    a++;
    b++;
    c++;
    d++;
    e++;
    f++;
    g++;
    h++;
    i++;
    j++;
    k++;
    l++;
    m++;
    n++;
    o++;
    p++;
    
    if (a > 2) {a = 2;}
    if (b > 2) {b = 2;}
    if (c > 2) {c = 2;}
    if (d > 2) {d = 2;}
    if (e > 2) {e = 2;}
    if (f > 2) {f = 2;}
    if (g > 2) {g = 2;}
    if (h > 2) {h = 2;}
    if (i > 2) {i = 2;}
    if (j > 2) {j = 2;}
    if (k > 2) {k = 2;}
    if (l > 2) {l = 2;}
    if (m > 2) {m = 2;}
    if (n > 2) {n = 2;}
    if (o > 2) {o = 2;}
    if (p > 2) {p = 2;}
    
    
    
    [self.kickTrackSoundsPicker selectRow:a inComponent:0 animated:0];
    [self.kickTrackSoundsPicker selectRow:b inComponent:1 animated:0];
    [self.kickTrackSoundsPicker selectRow:c inComponent:2 animated:0];
    [self.kickTrackSoundsPicker selectRow:d inComponent:3 animated:0];
    [self.kickTrackSoundsPicker selectRow:e inComponent:4 animated:0];
    [self.kickTrackSoundsPicker selectRow:f inComponent:5 animated:0];
    [self.kickTrackSoundsPicker selectRow:g inComponent:6 animated:0];
    [self.kickTrackSoundsPicker selectRow:h inComponent:7 animated:0];
    [self.kickTrackSoundsPicker selectRow:i inComponent:8 animated:0];
    [self.kickTrackSoundsPicker selectRow:j inComponent:9 animated:0];
    [self.kickTrackSoundsPicker selectRow:k inComponent:10 animated:0];
    [self.kickTrackSoundsPicker selectRow:l inComponent:11 animated:0];
    [self.kickTrackSoundsPicker selectRow:m inComponent:12 animated:0];
    [self.kickTrackSoundsPicker selectRow:n inComponent:13 animated:0];
    [self.kickTrackSoundsPicker selectRow:o inComponent:14 animated:0];
    [self.kickTrackSoundsPicker selectRow:p inComponent:15 animated:0];
    
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:p inComponent:15];
    
}




- (IBAction)didKickSoundSelectionStepDownPress:(UIButton *)sender {
    
    long a = [self.kickTrackSoundsPicker selectedRowInComponent:0];
    long b = [self.kickTrackSoundsPicker selectedRowInComponent:1];
    long c = [self.kickTrackSoundsPicker selectedRowInComponent:2];
    long d = [self.kickTrackSoundsPicker selectedRowInComponent:3];
    long e = [self.kickTrackSoundsPicker selectedRowInComponent:4];
    long f = [self.kickTrackSoundsPicker selectedRowInComponent:5];
    long g = [self.kickTrackSoundsPicker selectedRowInComponent:6];
    long h = [self.kickTrackSoundsPicker selectedRowInComponent:7];
    long i = [self.kickTrackSoundsPicker selectedRowInComponent:8];
    long j = [self.kickTrackSoundsPicker selectedRowInComponent:9];
    long k = [self.kickTrackSoundsPicker selectedRowInComponent:10];
    long l = [self.kickTrackSoundsPicker selectedRowInComponent:11];
    long m = [self.kickTrackSoundsPicker selectedRowInComponent:12];
    long n = [self.kickTrackSoundsPicker selectedRowInComponent:13];
    long o = [self.kickTrackSoundsPicker selectedRowInComponent:14];
    long p = [self.kickTrackSoundsPicker selectedRowInComponent:15];
    
    a--;
    b--;
    c--;
    d--;
    e--;
    f--;
    g--;
    h--;
    i--;
    j--;
    k--;
    l--;
    m--;
    n--;
    o--;
    p--;
    
    if (a < 0) {a = 0;}
    if (b < 0) {b = 0;}
    if (c < 0) {c = 0;}
    if (d < 0) {d = 0;}
    if (e < 0) {e = 0;}
    if (f < 0) {f = 0;}
    if (g < 0) {g = 0;}
    if (h < 0) {h = 0;}
    if (i < 0) {i = 0;}
    if (j < 0) {j = 0;}
    if (k < 0) {k = 0;}
    if (l < 0) {l = 0;}
    if (m < 0) {m = 0;}
    if (n < 0) {n = 0;}
    if (o < 0) {o = 0;}
    if (p < 0) {p = 0;}
    
    
    
    [self.kickTrackSoundsPicker selectRow:a inComponent:0 animated:0];
    [self.kickTrackSoundsPicker selectRow:b inComponent:1 animated:0];
    [self.kickTrackSoundsPicker selectRow:c inComponent:2 animated:0];
    [self.kickTrackSoundsPicker selectRow:d inComponent:3 animated:0];
    [self.kickTrackSoundsPicker selectRow:e inComponent:4 animated:0];
    [self.kickTrackSoundsPicker selectRow:f inComponent:5 animated:0];
    [self.kickTrackSoundsPicker selectRow:g inComponent:6 animated:0];
    [self.kickTrackSoundsPicker selectRow:h inComponent:7 animated:0];
    [self.kickTrackSoundsPicker selectRow:i inComponent:8 animated:0];
    [self.kickTrackSoundsPicker selectRow:j inComponent:9 animated:0];
    [self.kickTrackSoundsPicker selectRow:k inComponent:10 animated:0];
    [self.kickTrackSoundsPicker selectRow:l inComponent:11 animated:0];
    [self.kickTrackSoundsPicker selectRow:m inComponent:12 animated:0];
    [self.kickTrackSoundsPicker selectRow:n inComponent:13 animated:0];
    [self.kickTrackSoundsPicker selectRow:o inComponent:14 animated:0];
    [self.kickTrackSoundsPicker selectRow:p inComponent:15 animated:0];
    
    
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.kickTrackSoundsPicker didSelectRow:p inComponent:15];
}

# pragma mark Hihat Randomise
- (IBAction)didRandomiseHiHatSoundsPress:(UIButton *)sender {
    
    int a = arc4random_uniform(2);
    int b = arc4random_uniform(2);
    int c = arc4random_uniform(2);
    int d = arc4random_uniform(2);
    int e = arc4random_uniform(2);
    int f = arc4random_uniform(2);
    int g = arc4random_uniform(2);
    int h = arc4random_uniform(2);
    int i = arc4random_uniform(2);
    int j = arc4random_uniform(2);
    int k = arc4random_uniform(2);
    int l = arc4random_uniform(2);
    int m = arc4random_uniform(2);
    int n = arc4random_uniform(2);
    int o = arc4random_uniform(2);
    int p = arc4random_uniform(2);
    
    [self.hiHatTrackSoundsPicker selectRow:a inComponent:0 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:b inComponent:1 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:c inComponent:2 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:d inComponent:3 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:e inComponent:4 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:f inComponent:5 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:g inComponent:6 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:h inComponent:7 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:i inComponent:8 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:j inComponent:9 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:k inComponent:10 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:l inComponent:11 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:m inComponent:12 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:n inComponent:13 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:o inComponent:14 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:p inComponent:15 animated:false];
    
    
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:p inComponent:15];
    
    
}

# pragma mark Hihat reset
- (IBAction)didResetHiHatSoundsPress:(UIButton *)sender {
    
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:0 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:1 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:2 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:3 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:4 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:5 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:6 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:7 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:8 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:9 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:10 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:11 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:12 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:13 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:14 animated:false];
    [self.hiHatTrackSoundsPicker selectRow:0 inComponent:15 animated:false];
    
    
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:0];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:1];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:2];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:3];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:4];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:5];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:6];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:7];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:8];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:9];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:10];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:11];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:12];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:13];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:14];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:0 inComponent:15];
    
    
}
- (IBAction)didHiHatSoundSelectionStepUpPress:(UIButton *)sender {
    
    long a = [self.hiHatTrackSoundsPicker selectedRowInComponent:0];
    long b = [self.hiHatTrackSoundsPicker selectedRowInComponent:1];
    long c = [self.hiHatTrackSoundsPicker selectedRowInComponent:2];
    long d = [self.hiHatTrackSoundsPicker selectedRowInComponent:3];
    long e = [self.hiHatTrackSoundsPicker selectedRowInComponent:4];
    long f = [self.hiHatTrackSoundsPicker selectedRowInComponent:5];
    long g = [self.hiHatTrackSoundsPicker selectedRowInComponent:6];
    long h = [self.hiHatTrackSoundsPicker selectedRowInComponent:7];
    long i = [self.hiHatTrackSoundsPicker selectedRowInComponent:8];
    long j = [self.hiHatTrackSoundsPicker selectedRowInComponent:9];
    long k = [self.hiHatTrackSoundsPicker selectedRowInComponent:10];
    long l = [self.hiHatTrackSoundsPicker selectedRowInComponent:11];
    long m = [self.hiHatTrackSoundsPicker selectedRowInComponent:12];
    long n = [self.hiHatTrackSoundsPicker selectedRowInComponent:13];
    long o = [self.hiHatTrackSoundsPicker selectedRowInComponent:14];
    long p = [self.hiHatTrackSoundsPicker selectedRowInComponent:15];
    
    
    
    
    a++;
    b++;
    c++;
    d++;
    e++;
    f++;
    g++;
    h++;
    i++;
    j++;
    k++;
    l++;
    m++;
    n++;
    o++;
    p++;
    
    if (a > 2) {a = 2;}
    if (b > 2) {b = 2;}
    if (c > 2) {c = 2;}
    if (d > 2) {d = 2;}
    if (e > 2) {e = 2;}
    if (f > 2) {f = 2;}
    if (g > 2) {g = 2;}
    if (h > 2) {h = 2;}
    if (i > 2) {i = 2;}
    if (j > 2) {j = 2;}
    if (k > 2) {k = 2;}
    if (l > 2) {l = 2;}
    if (m > 2) {m = 2;}
    if (n > 2) {n = 2;}
    if (o > 2) {o = 2;}
    if (p > 2) {p = 2;}
    
    
    
    [self.hiHatTrackSoundsPicker selectRow:a inComponent:0 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:b inComponent:1 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:c inComponent:2 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:d inComponent:3 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:e inComponent:4 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:f inComponent:5 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:g inComponent:6 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:h inComponent:7 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:i inComponent:8 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:j inComponent:9 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:k inComponent:10 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:l inComponent:11 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:m inComponent:12 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:n inComponent:13 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:o inComponent:14 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:p inComponent:15 animated:0];
    
    
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:p inComponent:15];
    
}

- (IBAction)didHiHatSoundSelectionStepDownPress:(UIButton *)sender {
    
    long a = [self.hiHatTrackSoundsPicker selectedRowInComponent:0];
    long b = [self.hiHatTrackSoundsPicker selectedRowInComponent:1];
    long c = [self.hiHatTrackSoundsPicker selectedRowInComponent:2];
    long d = [self.hiHatTrackSoundsPicker selectedRowInComponent:3];
    long e = [self.hiHatTrackSoundsPicker selectedRowInComponent:4];
    long f = [self.hiHatTrackSoundsPicker selectedRowInComponent:5];
    long g = [self.hiHatTrackSoundsPicker selectedRowInComponent:6];
    long h = [self.hiHatTrackSoundsPicker selectedRowInComponent:7];
    long i = [self.hiHatTrackSoundsPicker selectedRowInComponent:8];
    long j = [self.hiHatTrackSoundsPicker selectedRowInComponent:9];
    long k = [self.hiHatTrackSoundsPicker selectedRowInComponent:10];
    long l = [self.hiHatTrackSoundsPicker selectedRowInComponent:11];
    long m = [self.hiHatTrackSoundsPicker selectedRowInComponent:12];
    long n = [self.hiHatTrackSoundsPicker selectedRowInComponent:13];
    long o = [self.hiHatTrackSoundsPicker selectedRowInComponent:14];
    long p = [self.hiHatTrackSoundsPicker selectedRowInComponent:15];
    
    a--;
    b--;
    c--;
    d--;
    e--;
    f--;
    g--;
    h--;
    i--;
    j--;
    k--;
    l--;
    m--;
    n--;
    o--;
    p--;
    
    if (a < 0) {a = 0;}
    if (b < 0) {b = 0;}
    if (c < 0) {c = 0;}
    if (d < 0) {d = 0;}
    if (e < 0) {e = 0;}
    if (f < 0) {f = 0;}
    if (g < 0) {g = 0;}
    if (h < 0) {h = 0;}
    if (i < 0) {i = 0;}
    if (j < 0) {j = 0;}
    if (k < 0) {k = 0;}
    if (l < 0) {l = 0;}
    if (m < 0) {m = 0;}
    if (n < 0) {n = 0;}
    if (o < 0) {o = 0;}
    if (p < 0) {p = 0;}
    
    
    
    [self.hiHatTrackSoundsPicker selectRow:a inComponent:0 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:b inComponent:1 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:c inComponent:2 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:d inComponent:3 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:e inComponent:4 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:f inComponent:5 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:g inComponent:6 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:h inComponent:7 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:i inComponent:8 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:j inComponent:9 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:k inComponent:10 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:l inComponent:11 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:m inComponent:12 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:n inComponent:13 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:o inComponent:14 animated:0];
    [self.hiHatTrackSoundsPicker selectRow:p inComponent:15 animated:0];
    
    
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.hiHatTrackSoundsPicker didSelectRow:p inComponent:15];
    
    
}


# pragma mark Snare randomise and reset

- (IBAction)didRandomiseSnareSoundsPress:(UIButton *)sender {
    
    
    int a = arc4random_uniform(2);
    int b = arc4random_uniform(2);
    int c = arc4random_uniform(2);
    int d = arc4random_uniform(2);
    int e = arc4random_uniform(2);
    int f = arc4random_uniform(2);
    int g = arc4random_uniform(2);
    int h = arc4random_uniform(2);
    int i = arc4random_uniform(2);
    int j = arc4random_uniform(2);
    int k = arc4random_uniform(2);
    int l = arc4random_uniform(2);
    int m = arc4random_uniform(2);
    int n = arc4random_uniform(2);
    int o = arc4random_uniform(2);
    int p = arc4random_uniform(2);
    
    [self.snareTrackSoundsPicker selectRow:a inComponent:0 animated:false];
    [self.snareTrackSoundsPicker selectRow:b inComponent:1 animated:false];
    [self.snareTrackSoundsPicker selectRow:c inComponent:2 animated:false];
    [self.snareTrackSoundsPicker selectRow:d inComponent:3 animated:false];
    [self.snareTrackSoundsPicker selectRow:e inComponent:4 animated:false];
    [self.snareTrackSoundsPicker selectRow:f inComponent:5 animated:false];
    [self.snareTrackSoundsPicker selectRow:g inComponent:6 animated:false];
    [self.snareTrackSoundsPicker selectRow:h inComponent:7 animated:false];
    [self.snareTrackSoundsPicker selectRow:i inComponent:8 animated:false];
    [self.snareTrackSoundsPicker selectRow:j inComponent:9 animated:false];
    [self.snareTrackSoundsPicker selectRow:k inComponent:10 animated:false];
    [self.snareTrackSoundsPicker selectRow:l inComponent:11 animated:false];
    [self.snareTrackSoundsPicker selectRow:m inComponent:12 animated:false];
    [self.snareTrackSoundsPicker selectRow:n inComponent:13 animated:false];
    [self.snareTrackSoundsPicker selectRow:o inComponent:14 animated:false];
    [self.snareTrackSoundsPicker selectRow:p inComponent:15 animated:false];
    
    
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:p inComponent:15];
    
    
}

- (IBAction)didResetSnareSoundsPress:(UIButton *)sender {
    
    
    [self.snareTrackSoundsPicker selectRow:0 inComponent:0 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:1 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:2 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:3 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:4 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:5 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:6 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:7 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:8 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:9 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:10 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:11 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:12 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:13 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:14 animated:false];
    [self.snareTrackSoundsPicker selectRow:0 inComponent:15 animated:false];
    
    
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:0];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:1];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:2];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:3];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:4];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:5];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:6];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:7];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:8];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:9];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:10];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:11];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:12];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:13];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:14];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:0 inComponent:15];
    
    
}







# pragma mark Tom randomise and reset

- (IBAction)didRandomiseTomSoundsPress:(UIButton *)sender {
    
    int a = arc4random_uniform(2);
    int b = arc4random_uniform(2);
    int c = arc4random_uniform(2);
    int d = arc4random_uniform(2);
    int e = arc4random_uniform(2);
    int f = arc4random_uniform(2);
    int g = arc4random_uniform(2);
    int h = arc4random_uniform(2);
    int i = arc4random_uniform(2);
    int j = arc4random_uniform(2);
    int k = arc4random_uniform(2);
    int l = arc4random_uniform(2);
    int m = arc4random_uniform(2);
    int n = arc4random_uniform(2);
    int o = arc4random_uniform(2);
    int p = arc4random_uniform(2);
    
    [self.tomTrackSoundsPicker selectRow:a inComponent:0 animated:false];
    [self.tomTrackSoundsPicker selectRow:b inComponent:1 animated:false];
    [self.tomTrackSoundsPicker selectRow:c inComponent:2 animated:false];
    [self.tomTrackSoundsPicker selectRow:d inComponent:3 animated:false];
    [self.tomTrackSoundsPicker selectRow:e inComponent:4 animated:false];
    [self.tomTrackSoundsPicker selectRow:f inComponent:5 animated:false];
    [self.tomTrackSoundsPicker selectRow:g inComponent:6 animated:false];
    [self.tomTrackSoundsPicker selectRow:h inComponent:7 animated:false];
    [self.tomTrackSoundsPicker selectRow:i inComponent:8 animated:false];
    [self.tomTrackSoundsPicker selectRow:j inComponent:9 animated:false];
    [self.tomTrackSoundsPicker selectRow:k inComponent:10 animated:false];
    [self.tomTrackSoundsPicker selectRow:l inComponent:11 animated:false];
    [self.tomTrackSoundsPicker selectRow:m inComponent:12 animated:false];
    [self.tomTrackSoundsPicker selectRow:n inComponent:13 animated:false];
    [self.tomTrackSoundsPicker selectRow:o inComponent:14 animated:false];
    [self.tomTrackSoundsPicker selectRow:p inComponent:15 animated:false];
    
    
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:p inComponent:15];
    
}

- (IBAction)didResetTomSoundsPress:(UIButton *)sender {
    
    [self.tomTrackSoundsPicker selectRow:0 inComponent:0 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:1 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:2 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:3 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:4 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:5 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:6 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:7 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:8 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:9 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:10 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:11 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:12 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:13 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:14 animated:false];
    [self.tomTrackSoundsPicker selectRow:0 inComponent:15 animated:false];
    
    
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:0];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:1];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:2];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:3];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:4];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:5];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:6];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:7];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:8];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:9];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:10];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:11];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:12];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:13];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:14];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:0 inComponent:15];
    
    
}




# pragma mark Snare step

- (IBAction)didSnareSoundsSelectionStepUpPress:(UIButton *)sender {
    
    long a = [self.snareTrackSoundsPicker selectedRowInComponent:0];
    long b = [self.snareTrackSoundsPicker selectedRowInComponent:1];
    long c = [self.snareTrackSoundsPicker selectedRowInComponent:2];
    long d = [self.snareTrackSoundsPicker selectedRowInComponent:3];
    long e = [self.snareTrackSoundsPicker selectedRowInComponent:4];
    long f = [self.snareTrackSoundsPicker selectedRowInComponent:5];
    long g = [self.snareTrackSoundsPicker selectedRowInComponent:6];
    long h = [self.snareTrackSoundsPicker selectedRowInComponent:7];
    long i = [self.snareTrackSoundsPicker selectedRowInComponent:8];
    long j = [self.snareTrackSoundsPicker selectedRowInComponent:9];
    long k = [self.snareTrackSoundsPicker selectedRowInComponent:10];
    long l = [self.snareTrackSoundsPicker selectedRowInComponent:11];
    long m = [self.snareTrackSoundsPicker selectedRowInComponent:12];
    long n = [self.snareTrackSoundsPicker selectedRowInComponent:13];
    long o = [self.snareTrackSoundsPicker selectedRowInComponent:14];
    long p = [self.snareTrackSoundsPicker selectedRowInComponent:15];
    
    
    
    
    a++;
    b++;
    c++;
    d++;
    e++;
    f++;
    g++;
    h++;
    i++;
    j++;
    k++;
    l++;
    m++;
    n++;
    o++;
    p++;
    
    if (a > 2) {a = 2;}
    if (b > 2) {b = 2;}
    if (c > 2) {c = 2;}
    if (d > 2) {d = 2;}
    if (e > 2) {e = 2;}
    if (f > 2) {f = 2;}
    if (g > 2) {g = 2;}
    if (h > 2) {h = 2;}
    if (i > 2) {i = 2;}
    if (j > 2) {j = 2;}
    if (k > 2) {k = 2;}
    if (l > 2) {l = 2;}
    if (m > 2) {m = 2;}
    if (n > 2) {n = 2;}
    if (o > 2) {o = 2;}
    if (p > 2) {p = 2;}
    
    
    
    [self.snareTrackSoundsPicker selectRow:a inComponent:0 animated:0];
    [self.snareTrackSoundsPicker selectRow:b inComponent:1 animated:0];
    [self.snareTrackSoundsPicker selectRow:c inComponent:2 animated:0];
    [self.snareTrackSoundsPicker selectRow:d inComponent:3 animated:0];
    [self.snareTrackSoundsPicker selectRow:e inComponent:4 animated:0];
    [self.snareTrackSoundsPicker selectRow:f inComponent:5 animated:0];
    [self.snareTrackSoundsPicker selectRow:g inComponent:6 animated:0];
    [self.snareTrackSoundsPicker selectRow:h inComponent:7 animated:0];
    [self.snareTrackSoundsPicker selectRow:i inComponent:8 animated:0];
    [self.snareTrackSoundsPicker selectRow:j inComponent:9 animated:0];
    [self.snareTrackSoundsPicker selectRow:k inComponent:10 animated:0];
    [self.snareTrackSoundsPicker selectRow:l inComponent:11 animated:0];
    [self.snareTrackSoundsPicker selectRow:m inComponent:12 animated:0];
    [self.snareTrackSoundsPicker selectRow:n inComponent:13 animated:0];
    [self.snareTrackSoundsPicker selectRow:o inComponent:14 animated:0];
    [self.snareTrackSoundsPicker selectRow:p inComponent:15 animated:0];
    
    
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:p inComponent:15];
    
}

- (IBAction)didSnareSoundsSelectionStepDownPress:(UIButton *)sender {
    long a = [self.snareTrackSoundsPicker selectedRowInComponent:0];
    long b = [self.snareTrackSoundsPicker selectedRowInComponent:1];
    long c = [self.snareTrackSoundsPicker selectedRowInComponent:2];
    long d = [self.snareTrackSoundsPicker selectedRowInComponent:3];
    long e = [self.snareTrackSoundsPicker selectedRowInComponent:4];
    long f = [self.snareTrackSoundsPicker selectedRowInComponent:5];
    long g = [self.snareTrackSoundsPicker selectedRowInComponent:6];
    long h = [self.snareTrackSoundsPicker selectedRowInComponent:7];
    long i = [self.snareTrackSoundsPicker selectedRowInComponent:8];
    long j = [self.snareTrackSoundsPicker selectedRowInComponent:9];
    long k = [self.snareTrackSoundsPicker selectedRowInComponent:10];
    long l = [self.snareTrackSoundsPicker selectedRowInComponent:11];
    long m = [self.snareTrackSoundsPicker selectedRowInComponent:12];
    long n = [self.snareTrackSoundsPicker selectedRowInComponent:13];
    long o = [self.snareTrackSoundsPicker selectedRowInComponent:14];
    long p = [self.snareTrackSoundsPicker selectedRowInComponent:15];
    
    a--;
    b--;
    c--;
    d--;
    e--;
    f--;
    g--;
    h--;
    i--;
    j--;
    k--;
    l--;
    m--;
    n--;
    o--;
    p--;
    
    if (a < 0) {a = 0;}
    if (b < 0) {b = 0;}
    if (c < 0) {c = 0;}
    if (d < 0) {d = 0;}
    if (e < 0) {e = 0;}
    if (f < 0) {f = 0;}
    if (g < 0) {g = 0;}
    if (h < 0) {h = 0;}
    if (i < 0) {i = 0;}
    if (j < 0) {j = 0;}
    if (k < 0) {k = 0;}
    if (l < 0) {l = 0;}
    if (m < 0) {m = 0;}
    if (n < 0) {n = 0;}
    if (o < 0) {o = 0;}
    if (p < 0) {p = 0;}
    
    
    
    [self.snareTrackSoundsPicker selectRow:a inComponent:0 animated:0];
    [self.snareTrackSoundsPicker selectRow:b inComponent:1 animated:0];
    [self.snareTrackSoundsPicker selectRow:c inComponent:2 animated:0];
    [self.snareTrackSoundsPicker selectRow:d inComponent:3 animated:0];
    [self.snareTrackSoundsPicker selectRow:e inComponent:4 animated:0];
    [self.snareTrackSoundsPicker selectRow:f inComponent:5 animated:0];
    [self.snareTrackSoundsPicker selectRow:g inComponent:6 animated:0];
    [self.snareTrackSoundsPicker selectRow:h inComponent:7 animated:0];
    [self.snareTrackSoundsPicker selectRow:i inComponent:8 animated:0];
    [self.snareTrackSoundsPicker selectRow:j inComponent:9 animated:0];
    [self.snareTrackSoundsPicker selectRow:k inComponent:10 animated:0];
    [self.snareTrackSoundsPicker selectRow:l inComponent:11 animated:0];
    [self.snareTrackSoundsPicker selectRow:m inComponent:12 animated:0];
    [self.snareTrackSoundsPicker selectRow:n inComponent:13 animated:0];
    [self.snareTrackSoundsPicker selectRow:o inComponent:14 animated:0];
    [self.snareTrackSoundsPicker selectRow:p inComponent:15 animated:0];
    
    
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.snareTrackSoundsPicker didSelectRow:p inComponent:15];
    
    
}

# pragma mark Tom sounds step

- (IBAction)didTomSoundsSelectionStepUpPress:(UIButton *)sender {
    long a = [self.tomTrackSoundsPicker selectedRowInComponent:0];
    long b = [self.tomTrackSoundsPicker selectedRowInComponent:1];
    long c = [self.tomTrackSoundsPicker selectedRowInComponent:2];
    long d = [self.tomTrackSoundsPicker selectedRowInComponent:3];
    long e = [self.tomTrackSoundsPicker selectedRowInComponent:4];
    long f = [self.tomTrackSoundsPicker selectedRowInComponent:5];
    long g = [self.tomTrackSoundsPicker selectedRowInComponent:6];
    long h = [self.tomTrackSoundsPicker selectedRowInComponent:7];
    long i = [self.tomTrackSoundsPicker selectedRowInComponent:8];
    long j = [self.tomTrackSoundsPicker selectedRowInComponent:9];
    long k = [self.tomTrackSoundsPicker selectedRowInComponent:10];
    long l = [self.tomTrackSoundsPicker selectedRowInComponent:11];
    long m = [self.tomTrackSoundsPicker selectedRowInComponent:12];
    long n = [self.tomTrackSoundsPicker selectedRowInComponent:13];
    long o = [self.tomTrackSoundsPicker selectedRowInComponent:14];
    long p = [self.tomTrackSoundsPicker selectedRowInComponent:15];
    
    
    
    
    a++;
    b++;
    c++;
    d++;
    e++;
    f++;
    g++;
    h++;
    i++;
    j++;
    k++;
    l++;
    m++;
    n++;
    o++;
    p++;
    
    if (a > 2) {a = 2;}
    if (b > 2) {b = 2;}
    if (c > 2) {c = 2;}
    if (d > 2) {d = 2;}
    if (e > 2) {e = 2;}
    if (f > 2) {f = 2;}
    if (g > 2) {g = 2;}
    if (h > 2) {h = 2;}
    if (i > 2) {i = 2;}
    if (j > 2) {j = 2;}
    if (k > 2) {k = 2;}
    if (l > 2) {l = 2;}
    if (m > 2) {m = 2;}
    if (n > 2) {n = 2;}
    if (o > 2) {o = 2;}
    if (p > 2) {p = 2;}
    
    
    
    [self.tomTrackSoundsPicker selectRow:a inComponent:0 animated:0];
    [self.tomTrackSoundsPicker selectRow:b inComponent:1 animated:0];
    [self.tomTrackSoundsPicker selectRow:c inComponent:2 animated:0];
    [self.tomTrackSoundsPicker selectRow:d inComponent:3 animated:0];
    [self.tomTrackSoundsPicker selectRow:e inComponent:4 animated:0];
    [self.tomTrackSoundsPicker selectRow:f inComponent:5 animated:0];
    [self.tomTrackSoundsPicker selectRow:g inComponent:6 animated:0];
    [self.tomTrackSoundsPicker selectRow:h inComponent:7 animated:0];
    [self.tomTrackSoundsPicker selectRow:i inComponent:8 animated:0];
    [self.tomTrackSoundsPicker selectRow:j inComponent:9 animated:0];
    [self.tomTrackSoundsPicker selectRow:k inComponent:10 animated:0];
    [self.tomTrackSoundsPicker selectRow:l inComponent:11 animated:0];
    [self.tomTrackSoundsPicker selectRow:m inComponent:12 animated:0];
    [self.tomTrackSoundsPicker selectRow:n inComponent:13 animated:0];
    [self.tomTrackSoundsPicker selectRow:o inComponent:14 animated:0];
    [self.tomTrackSoundsPicker selectRow:p inComponent:15 animated:0];
    
    
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:p inComponent:15];
}

- (IBAction)didTomSoundsSelectionStepDownPress:(UIButton *)sender {
    long a = [self.tomTrackSoundsPicker selectedRowInComponent:0];
    long b = [self.tomTrackSoundsPicker selectedRowInComponent:1];
    long c = [self.tomTrackSoundsPicker selectedRowInComponent:2];
    long d = [self.tomTrackSoundsPicker selectedRowInComponent:3];
    long e = [self.tomTrackSoundsPicker selectedRowInComponent:4];
    long f = [self.tomTrackSoundsPicker selectedRowInComponent:5];
    long g = [self.tomTrackSoundsPicker selectedRowInComponent:6];
    long h = [self.tomTrackSoundsPicker selectedRowInComponent:7];
    long i = [self.tomTrackSoundsPicker selectedRowInComponent:8];
    long j = [self.tomTrackSoundsPicker selectedRowInComponent:9];
    long k = [self.tomTrackSoundsPicker selectedRowInComponent:10];
    long l = [self.tomTrackSoundsPicker selectedRowInComponent:11];
    long m = [self.tomTrackSoundsPicker selectedRowInComponent:12];
    long n = [self.tomTrackSoundsPicker selectedRowInComponent:13];
    long o = [self.tomTrackSoundsPicker selectedRowInComponent:14];
    long p = [self.tomTrackSoundsPicker selectedRowInComponent:15];
    
    a--;
    b--;
    c--;
    d--;
    e--;
    f--;
    g--;
    h--;
    i--;
    j--;
    k--;
    l--;
    m--;
    n--;
    o--;
    p--;
    
    if (a < 0) {a = 0;}
    if (b < 0) {b = 0;}
    if (c < 0) {c = 0;}
    if (d < 0) {d = 0;}
    if (e < 0) {e = 0;}
    if (f < 0) {f = 0;}
    if (g < 0) {g = 0;}
    if (h < 0) {h = 0;}
    if (i < 0) {i = 0;}
    if (j < 0) {j = 0;}
    if (k < 0) {k = 0;}
    if (l < 0) {l = 0;}
    if (m < 0) {m = 0;}
    if (n < 0) {n = 0;}
    if (o < 0) {o = 0;}
    if (p < 0) {p = 0;}
    
    
    
    [self.tomTrackSoundsPicker selectRow:a inComponent:0 animated:0];
    [self.tomTrackSoundsPicker selectRow:b inComponent:1 animated:0];
    [self.tomTrackSoundsPicker selectRow:c inComponent:2 animated:0];
    [self.tomTrackSoundsPicker selectRow:d inComponent:3 animated:0];
    [self.tomTrackSoundsPicker selectRow:e inComponent:4 animated:0];
    [self.tomTrackSoundsPicker selectRow:f inComponent:5 animated:0];
    [self.tomTrackSoundsPicker selectRow:g inComponent:6 animated:0];
    [self.tomTrackSoundsPicker selectRow:h inComponent:7 animated:0];
    [self.tomTrackSoundsPicker selectRow:i inComponent:8 animated:0];
    [self.tomTrackSoundsPicker selectRow:j inComponent:9 animated:0];
    [self.tomTrackSoundsPicker selectRow:k inComponent:10 animated:0];
    [self.tomTrackSoundsPicker selectRow:l inComponent:11 animated:0];
    [self.tomTrackSoundsPicker selectRow:m inComponent:12 animated:0];
    [self.tomTrackSoundsPicker selectRow:n inComponent:13 animated:0];
    [self.tomTrackSoundsPicker selectRow:o inComponent:14 animated:0];
    [self.tomTrackSoundsPicker selectRow:p inComponent:15 animated:0];
    
    
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:a inComponent:0];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:b inComponent:1];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:c inComponent:2];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:d inComponent:3];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:e inComponent:4];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:f inComponent:5];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:g inComponent:6];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:h inComponent:7];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:i inComponent:8];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:j inComponent:9];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:k inComponent:10];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:l inComponent:11];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:m inComponent:12];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:n inComponent:13];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:o inComponent:14];
    [self pickerView:self.tomTrackSoundsPicker didSelectRow:p inComponent:15];
}





@end
