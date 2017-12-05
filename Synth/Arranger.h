//
//  Arranger.h
//  Synth
//
//  Created by Matteo Fabbri on 26/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import <UIKit/UIKit.h>
// import model
#import "Data.h"


@interface Arranger : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

#pragma mark Sections' pickers
@property (strong, nonatomic) IBOutlet UIPickerView *section1FirstSamplePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *section1LastSamplePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *section2FirstSamplePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *section2LastSamplePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *section3FirstSamplePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *section3LastSamplePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *section4FirstSamplePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *section4LastSamplePicker;

#pragma mark Sections' buttons

- (IBAction)didSection1ButtonSelect:(UIButton *)sender;
- (IBAction)didSection2ButtonSelect:(UIButton *)sender;
- (IBAction)didSection3ButtonSelect:(UIButton *)sender;
- (IBAction)didSection4ButtonSelect:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *section1Button;
@property (strong, nonatomic) IBOutlet UIButton *section2Button;
@property (strong, nonatomic) IBOutlet UIButton *section3Button;
@property (strong, nonatomic) IBOutlet UIButton *section4Button;




#pragma mark Pickers methods declaration

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component;












@end
