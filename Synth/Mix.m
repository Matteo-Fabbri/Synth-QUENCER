//
//  Mix.m
//  Synth
//
//  Created by Matteo Fabbri on 23/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import "Mix.h"

@interface Mix ()

@end

@implementation Mix

- (void)viewDidLoad {
    [super viewDidLoad];
    // initialising image views properties, with which I will fill the buttons
    self.mutedImage = [UIImage imageNamed:@"muted.png"];
    self.unMutedImage = [UIImage imageNamed:@"unmuted.png"];
    // setting default button images
    [self.kickMuteButton setImage:self.unMutedImage forState:UIControlStateNormal];
    [self.hiHatMuteButton setImage:self.unMutedImage forState:UIControlStateNormal];
    [self.snareMuteButton setImage:self.unMutedImage forState:UIControlStateNormal];
    [self.tomMuteButton setImage:self.unMutedImage forState:UIControlStateNormal];
    [self.masterMuteButton setImage:self.unMutedImage forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
# pragma mark KICK mix volume slider setter call
- (IBAction)didKickMixSliderChange:(UISlider *)sender {
        [Data setKickMixVolume:sender.value];
    // if volume is 0, mute button activates
    // otherwise deactivates
    if (self.KickMixSlider.value > 0) {self.kickMuteButton.selected = false;}
    else if (self.KickMixSlider.value == 0) {self.kickMuteButton.selected = true;}
}
# pragma mark KICK pan slider - setter call
- (IBAction)didKickPanSliderChange:(UISlider *)sender {
        [Data setKickPan:sender.value];
}
// to unmute a track, I just re-send the slider value
- (IBAction)didMuteKickPress:(UIButton *)sender {
    if ([sender isSelected]) {
        // changin status, image and trigger public method of model
        [sender setImage:self.unMutedImage forState:UIControlStateNormal];
        sender.selected = false;
        [Data unMuteKickTrack:(self.KickMixSlider.value/100)];
    }
    else {
        [sender setImage:self.mutedImage forState:UIControlStateNormal];
        sender.selected = true;
        [Data muteKickTrack];
    }
    
    
    
}

# pragma mark Master volume and mute
// I'm basically redoing the same thing I've done with the single tracks
- (IBAction)didMasterVolumeSliderChange:(UISlider *)sender {
    [Data setMasterVolume:(sender.value/100)];
    if (self.masterVolumeSlider.value > 0) {self.masterMuteButton.selected = false;}
    else if (self.masterVolumeSlider.value == 0) {self.masterMuteButton.selected = true;}
    
}
- (IBAction)didMasterMuteButtonPress:(UIButton *)sender {
    if ([sender isSelected]) {
        [sender setImage:self.unMutedImage forState:UIControlStateNormal];
        sender.selected = false;
        [Data unMuteMasterTrack:(self.masterVolumeSlider.value/100)];
    }
    else {
        [sender setImage:self.mutedImage forState:UIControlStateNormal];
        sender.selected = true;
        [Data muteMasterTrack];
    }
}


# pragma mark HiHat methods - pan, mix and mute

- (IBAction)didHIHatMixSliderChange:(UISlider *)sender {
    [Data setHiHatMixVolume:sender.value];
    if (self.hiHatMixSlider.value > 0) {self.hiHatMuteButton.selected = false;}
    else if (self.hiHatMixSlider.value == 0) {self.hiHatMuteButton.selected = true;}
}
- (IBAction)didHiHatPanSliderChange:(UISlider *)sender {
    [Data setHiHatPan:sender.value];
}
- (IBAction)didMuteHiHatPress:(UIButton *)sender {
    if ([sender isSelected]) {
        // changin status, image and trigger public method of model
        [sender setImage:self.unMutedImage forState:UIControlStateNormal];
        sender.selected = false;
        [Data unMuteHiHatTrack:(self.hiHatMixSlider.value/100)];
    }
    else {
        [sender setImage:self.mutedImage forState:UIControlStateNormal];
        sender.selected = true;
        [Data muteHiHatTrack];
}
}


# pragma mark Snare methods
- (IBAction)didSnareMixSliderChange:(UISlider *)sender {
    [Data setSnareMixVolume:sender.value];
    if (self.snareMixSlider.value > 0) {self.snareMuteButton.selected = false;}
    else if (self.snareMixSlider.value == 0) {self.snareMuteButton.selected = true;}
}

- (IBAction)didSnarePanSliderChange:(UISlider *)sender {
    [Data setSnarePan:sender.value];
}

- (IBAction)didMuteSnarePress:(UIButton *)sender {
    if ([sender isSelected]) {
        // changin status, image and trigger public method of model
        [sender setImage:self.unMutedImage forState:UIControlStateNormal];
        sender.selected = false;
        [Data unMuteSnareTrack:(self.snareMixSlider.value/100)];
    }
    else {
        [sender setImage:self.mutedImage forState:UIControlStateNormal];
        sender.selected = true;
        [Data muteSnareTrack];
    }
}



# pragma mark TOM

- (IBAction)didTomMixSliderChange:(UISlider *)sender {
    [Data setTomMixVolume:sender.value];
    if (self.tomMixSlider.value > 0) {self.tomMuteButton.selected = false;}
    else if (self.tomMixSlider.value == 0) {self.tomMuteButton.selected = true;}
}

- (IBAction)didTomPanSliderChange:(UISlider *)sender {
    [Data setTomPan:sender.value];
}

- (IBAction)didMuteTomPress:(UIButton *)sender {
    if ([sender isSelected]) {
        // changin status, image and trigger public method of model
        [sender setImage:self.unMutedImage forState:UIControlStateNormal];
        sender.selected = false;
        [Data unMuteTomTrack:(self.tomMixSlider.value/100)];
    }
    else {
        [sender setImage:self.mutedImage forState:UIControlStateNormal];
        sender.selected = true;
        [Data muteTomTrack];
    }
}
@end
