//
//  Mix.h
//  Synth
//
//  Created by Matteo Fabbri on 23/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import <UIKit/UIKit.h>
// import model
#import "Data.h"


@interface Mix : UIViewController

# pragma mark Tom mix properties and methods

- (IBAction)didTomMixSliderChange:(UISlider *)sender;
- (IBAction)didTomPanSliderChange:(UISlider *)sender;
- (IBAction)didMuteTomPress:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UISlider *tomMixSlider;
@property (strong, nonatomic) IBOutlet UISlider *tomPan;
@property (strong, nonatomic) IBOutlet UIButton *tomMuteButton;



# pragma mark Snare mix properties and methods

- (IBAction)didSnareMixSliderChange:(UISlider *)sender;
- (IBAction)didSnarePanSliderChange:(UISlider *)sender;
- (IBAction)didMuteSnarePress:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UISlider *snareMixSlider;
@property (strong, nonatomic) IBOutlet UISlider *snarePan;
@property (strong, nonatomic) IBOutlet UIButton *snareMuteButton;


# pragma mark HiHat mix properties and methods

- (IBAction)didHIHatMixSliderChange:(UISlider *)sender;
@property (strong, nonatomic) IBOutlet UISlider *hiHatMixSlider;
- (IBAction)didHiHatPanSliderChange:(UISlider *)sender;
@property (strong, nonatomic) IBOutlet UISlider *hiHatPan;
- (IBAction)didMuteHiHatPress:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *hiHatMuteButton;



# pragma mark Kick mix property and methods
- (IBAction)didKickMixSliderChange:(UISlider *)sender;
@property (strong, nonatomic) IBOutlet UISlider *KickMixSlider;
- (IBAction)didKickPanSliderChange:(UISlider *)sender;
@property (strong, nonatomic) IBOutlet UISlider *kickPan;
// apply image to button
- (IBAction)didMuteKickPress:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *kickMuteButton;

# pragma mark Buttons images
// declaring images property for buttons
@property (strong,nonatomic) UIImage *mutedImage;
@property (strong,nonatomic) UIImage *unMutedImage;


# pragma mark Master volume slider and mute button

@property (strong, nonatomic) IBOutlet UISlider *masterVolumeSlider;
- (IBAction)didMasterVolumeSliderChange:(UISlider *)sender;
@property (strong, nonatomic) IBOutlet UIButton *masterMuteButton;
- (IBAction)didMasterMuteButtonPress:(UIButton *)sender;


@end
