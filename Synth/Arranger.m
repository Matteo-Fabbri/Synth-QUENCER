//
//  Arranger.m
//  Synth
//
//  Created by Matteo Fabbri on 26/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import "Arranger.h"

@interface Arranger ()

@end

@implementation Arranger

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.section1FirstSamplePicker.delegate = self;
    self.section1FirstSamplePicker.dataSource = self;
    self.section1LastSamplePicker.delegate = self;
    self.section1LastSamplePicker.dataSource = self;
    
    self.section2FirstSamplePicker.delegate = self;
    self.section2FirstSamplePicker.dataSource = self;
    self.section2LastSamplePicker.delegate = self;
    self.section2LastSamplePicker.dataSource = self;
    
    self.section3FirstSamplePicker.delegate = self;
    self.section3FirstSamplePicker.dataSource = self;
    self.section3LastSamplePicker.delegate = self;
    self.section3LastSamplePicker.dataSource = self;
    
    self.section4FirstSamplePicker.delegate = self;
    self.section4FirstSamplePicker.dataSource = self;
    self.section4LastSamplePicker.delegate = self;
    self.section4LastSamplePicker.dataSource = self;

    
    
    // Setting default selected rows in pickers
    // Here the "compositional" choices come into account
    // I set the first section to be all the 16 samples length
    // The second and the third section are respectively the first and the second half of the first section
    // The fourth is set to be the backwards, from sample 16 to sample 1. This could be an interesting compositional approach if accordinly exploited
    
    
    // First I manually select the rows, then I manually trigger the code associated with each row
    
    
    [self.section1FirstSamplePicker selectRow:0 inComponent:0 animated:false];
    [self.section1LastSamplePicker selectRow:15 inComponent:0 animated:false];
    
    [self.section2FirstSamplePicker selectRow:0 inComponent:0 animated:false];
    [self.section2LastSamplePicker selectRow:7 inComponent:0 animated:false];
    
    [self.section3FirstSamplePicker selectRow:8 inComponent:0 animated:false];
    [self.section3LastSamplePicker selectRow:15 inComponent:0 animated:false];
    
    [self.section4FirstSamplePicker selectRow:15 inComponent:0 animated:false];
    [self.section4LastSamplePicker selectRow:0 inComponent:0 animated:false];
    
    [self pickerView:self.section1FirstSamplePicker didSelectRow:0 inComponent:0];
    [self pickerView:self.section1LastSamplePicker didSelectRow:15 inComponent:0];
    
    [self pickerView:self.section2FirstSamplePicker didSelectRow:0 inComponent:0];
    [self pickerView:self.section2LastSamplePicker didSelectRow:7 inComponent:0];
    
    [self pickerView:self.section3FirstSamplePicker didSelectRow:8 inComponent:0];
    [self pickerView:self.section3LastSamplePicker didSelectRow:15 inComponent:0];

    [self pickerView:self.section4FirstSamplePicker didSelectRow:15 inComponent:0];
    [self pickerView:self.section4LastSamplePicker didSelectRow:0 inComponent:0];

    // Setting initial loops selection buttons opacity, as I did in Sequencer.m
    self.section1Button.alpha = 1;
    self.section2Button.alpha = 0.5;
    self.section3Button.alpha = 0.5;
    self.section4Button.alpha = 0.5;

    
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


#pragma mark Buttons methods - section selection

- (IBAction)didSection1ButtonSelect:(UIButton *)sender {
    self.section1Button.alpha = 1;
    self.section2Button.alpha = 0.5;
    self.section3Button.alpha = 0.5;
    self.section4Button.alpha = 0.5;
    [Data section1Selected];
}

- (IBAction)didSection2ButtonSelect:(UIButton *)sender {
    self.section1Button.alpha = 0.5;
    self.section2Button.alpha = 1;
    self.section3Button.alpha = 0.5;
    self.section4Button.alpha = 0.5;
    [Data section2Selected];

}

- (IBAction)didSection3ButtonSelect:(UIButton *)sender {
    self.section1Button.alpha = 0.5;
    self.section2Button.alpha = 0.5;
    self.section3Button.alpha = 1;
    self.section4Button.alpha = 0.5;
    [Data section3Selected];

}

- (IBAction)didSection4ButtonSelect:(UIButton *)sender {
    self.section1Button.alpha = 0.5;
    self.section2Button.alpha = 0.5;
    self.section3Button.alpha = 0.5;
    self.section4Button.alpha = 1;
    [Data section4Selected];

}





#pragma mark Pickers methods - implementation
// all pickers in this view must have just 1 component
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// all pickers in this view must have 16 rows = 16 number of possible samples in sequencer
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 16;
}






// In didSelectRow for each picker view I call the correspondent setters in the Data - each section has 2 pickers since there is a start but also a last sample to be set

// I just call the setters and give the selected row as argument

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    if (pickerView == self.section1FirstSamplePicker) {
        [Data setSection1FirstSample:row];
    }
    if (pickerView == self.section1LastSamplePicker) {
        [Data setSection1LastSample:row];
    }
    
    if (pickerView == self.section2FirstSamplePicker) {
        [Data setSection2FirstSample:row];
    }
    if (pickerView == self.section2LastSamplePicker) {
        [Data setSection2LastSample:row];
    }
    
    if (pickerView == self.section3FirstSamplePicker) {
        [Data setSection3FirstSample:row];
    }
    if (pickerView == self.section3LastSamplePicker) {
        [Data setSection3LastSample:row];
    }
    
    if (pickerView == self.section4FirstSamplePicker) {
        [Data setSection4FirstSample:row];
    }
    if (pickerView == self.section4LastSamplePicker) {
        [Data setSection4LastSample:row];
    }
}



// creating a string and filling it with the value of the row+1
// Doing this for all the rows in all the pickers in this view
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    
    NSString *stringForRow = [NSString stringWithFormat:@"%ld",(row+1)];
    
    return stringForRow;
}








@end
