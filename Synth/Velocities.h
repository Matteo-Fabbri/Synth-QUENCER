//
//  Velocities.h
//  Synth
//
//  Created by Matteo Fabbri on 17/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import <UIKit/UIKit.h>
// model
#import "Data.h"
#import "Drum sounds and reverb.h"



@interface Velocities : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

# pragma mark Randomise and Reset hihat
- (IBAction)didHiHatRandomisePress:(UIButton *)sender;

- (IBAction)didHiHatVelocitiesResetPress:(UIButton *)sender;


# pragma mark Randomise and Reset Kick
- (IBAction)didKickRandomisePress:(UIButton *)sender;
- (IBAction)didKickVelocitiesResetPress:(UIButton *)sender;

# pragma mark Randomise and Reset Snare

- (IBAction)didSnareRandomisePress:(UIButton *)sender;
- (IBAction)didSnareVelocitiesResetPress:(UIButton *)sender;

# pragma mark Randomise and Reset Tom
- (IBAction)didTomRandomisePress:(UIButton *)sender;
- (IBAction)didTomVelocitiesResetPress:(UIButton *)sender;





# pragma mark pickerviews outlets
@property (strong, nonatomic) IBOutlet UIPickerView *kickTrackVelocitiesPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *hiHatTrackVelocitiesPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *snareTrackVelocities;
@property (strong, nonatomic) IBOutlet UIPickerView *tomTrackVelocities;





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

