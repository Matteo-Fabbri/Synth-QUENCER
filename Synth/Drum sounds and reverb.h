//
//  Drum sounds and reverb.h
//  Synth
//
//  Created by Matteo Fabbri on 17/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import <UIKit/UIKit.h>
// import model
#import "Data.h"






@interface Drum_sounds_and_reverb : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>



@property (strong, nonatomic) IBOutlet UIPickerView *kickTrackSoundsPicker;
- (IBAction)didKickPanSliderChange:(UISlider *)sender;


// Importing functions (from Apple doc) to specify picker setting

# pragma mark KICK PickerViewDelegate methods

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view;

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component;




# pragma mark KICK PickerViewDataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component;





@end
