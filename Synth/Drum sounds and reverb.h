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

# pragma mark Pickers properties
@property (strong, nonatomic) IBOutlet UIPickerView *hiHatTrackSoundsPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *kickTrackSoundsPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *snareTrackSoundsPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *tomTrackSoundsPicker;



# pragma mark Randomise and reset Kick sounds

- (IBAction)didRandomiseKickSoundsPress:(UIButton *)sender;
- (IBAction)didResetKickSoundsPress:(UIButton *)sender;

# pragma mark Randomise and reset hihat sounds

- (IBAction)didRandomiseHiHatSoundsPress:(UIButton *)sender;
- (IBAction)didResetHiHatSoundsPress:(UIButton *)sender;

# pragma mark Randomise and reset snare sounds

- (IBAction)didRandomiseSnareSoundsPress:(UIButton *)sender;
- (IBAction)didResetSnareSoundsPress:(UIButton *)sender;

# pragma mark Randomise and reset tom sounds

- (IBAction)didRandomiseTomSoundsPress:(UIButton *)sender;
- (IBAction)didResetTomSoundsPress:(UIButton *)sender;



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

# pragma mark step kick sounds selection

- (IBAction)didKickSoundSelectionStepUpPress:(UIButton *)sender;
- (IBAction)didKickSoundSelectionStepDownPress:(UIButton *)sender;

# pragma mark step hihat sounds selection

- (IBAction)didHiHatSoundSelectionStepUpPress:(UIButton *)sender;
- (IBAction)didHiHatSoundSelectionStepDownPress:(UIButton *)sender;

# pragma mark step snare sounds selection

- (IBAction)didSnareSoundsSelectionStepUpPress:(UIButton *)sender;
- (IBAction)didSnareSoundsSelectionStepDownPress:(UIButton *)sender;

# pragma mark step tom sounds selection

- (IBAction)didTomSoundsSelectionStepUpPress:(UIButton *)sender;
- (IBAction)didTomSoundsSelectionStepDownPress:(UIButton *)sender;






@end
