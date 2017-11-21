//
//  Sequencer.h
//  Synth
//
//  Created by Matteo Fabbri on 16/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//
/* The main idea of the sequencer is taken from Dr. Craig Evans screencast https://minerva.leeds.ac.uk/bbcswebdav/pid-5341615-dt-content-rid-9710025_2/courses/201718_27046_ELEC2660/podcasts/Lab%206.mp4 */

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

//Importing model
#import "Data.h"
// Importing the view to load drum sounds and set reverb amount
#import "Drum sounds and reverb.h"
// Importing the view to set velocities
#import "Velocities.h"


@interface Sequencer : UIViewController {
    
# pragma mark Arrays for buttons states
    
    // creating arrays in which I will store the (16 for each track) buttons states
    
    NSInteger kickTrackButtonsStateArray[16];
    NSInteger snareTrackButtonsStateArray[16];
    NSInteger hihatTrackButtonsStateArray[16];
    NSInteger tomTrackButtonsStateArray[16];
    NSInteger cymbalTrackButtonsStateArray[16];
    NSInteger clicknoiseTrackButtonsStateArray[16];

    
}




# pragma mark bpm label


@property (strong, nonatomic) IBOutlet UILabel *bpmLabel;


# pragma mark TIMER, sampleNumber, isPlaying properties

@property (strong,nonatomic) NSTimer *timer;
// the drum sample (16th of a 4/4 bar, 1/4 of a semiminimum note) currently being played
@property int sampleNumber;
@property BOOL isSequencerPlaying;

# pragma mark Tracks Buttons IBOutlet Collections and single buttons properties
// Here I create an outlet collection for each drum sequencer track
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *kickTrackButtons;
// I create also one single property for each button because I will need them singularly when I, after shifting a rhytmic sequence, will need to refresh the buttons states accordingly to the buttonsstatesarrays
@property (strong, nonatomic) IBOutlet UIButton *kickButton1;
@property (strong, nonatomic) IBOutlet UIButton *kickButton2;
@property (strong, nonatomic) IBOutlet UIButton *kickButton3;
@property (strong, nonatomic) IBOutlet UIButton *kickButton4;
@property (strong, nonatomic) IBOutlet UIButton *kickButton5;
@property (strong, nonatomic) IBOutlet UIButton *kickButton6;
@property (strong, nonatomic) IBOutlet UIButton *kickButton7;
@property (strong, nonatomic) IBOutlet UIButton *kickButton8;
@property (strong, nonatomic) IBOutlet UIButton *kickButton9;
@property (strong, nonatomic) IBOutlet UIButton *kickButton10;
@property (strong, nonatomic) IBOutlet UIButton *kickButton11;
@property (strong, nonatomic) IBOutlet UIButton *kickButton12;
@property (strong, nonatomic) IBOutlet UIButton *kickButton13;
@property (strong, nonatomic) IBOutlet UIButton *kickButton14;
@property (strong, nonatomic) IBOutlet UIButton *kickButton15;
@property (strong, nonatomic) IBOutlet UIButton *kickButton16;

# pragma mark Shift kick seq

- (IBAction)didKickShiftToRightPress:(UIButton *)sender;
- (IBAction)didKickShiftToLeftPress:(UIButton *)sender;


# pragma mark Tracks Buttons IBActions

// Here I create a method for each drum sequencer track

- (IBAction)didKickTrackButtonPress:(UIButton *)sender;


# pragma mark tempoSlider outlet & BPM property

@property (strong, nonatomic) IBOutlet UISlider *tempoSlider;

@property float BPM;



# pragma mark IBAction Playback UIbuttons and BPM slider
// slider method is actually connected via a touch up (both inside and outside) connection, so that the user can see (onthe label) the bpm value he/she is going to set the BPM to, before the actual change
// This also allows the timer to be invalidated less often and the Sequencer to be more fluid
// the valuechange method only triggers the Bpm label text updating
- (IBAction)didBpmSliderValueChange:(UISlider *)sender;
- (IBAction)didBpmSliderTouchUp:(UISlider *)sender;



- (IBAction)didPlayButtonPress:(UIButton *)sender;

- (IBAction)didPauseButtonPress:(UIButton *)sender;

- (IBAction)didStopButtonPress:(UIButton *)sender;


# pragma mark BPM stepper
// I simulate a stepper (the built in UIStepper isn't -easily- resizable) with 2 buttons
- (IBAction)didBpmPlusButtonPress:(UIButton *)sender;
- (IBAction)didBpmMinusButtonPress:(UIButton *)sender;



//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample1;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample2;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample3;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample4;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample5;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample6;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample7;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample8;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample9;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample10;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample11;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample12;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample13;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample14;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample15;
//@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample16;






@property (strong,nonatomic) AVAudioPlayer *snare1Player;
@property (strong,nonatomic) AVAudioPlayer *snare2Player;
@property (strong,nonatomic) AVAudioPlayer *snare3Player;
@property (strong,nonatomic) AVAudioPlayer *snare4Player;
@property (strong,nonatomic) AVAudioPlayer *snare5Player;
@property (strong,nonatomic) AVAudioPlayer *snare6Player;

@property (strong,nonatomic) AVAudioPlayer *hihat1Player;
@property (strong,nonatomic) AVAudioPlayer *hihat2Player;
@property (strong,nonatomic) AVAudioPlayer *hihat3Player;
@property (strong,nonatomic) AVAudioPlayer *hihat4Player;
@property (strong,nonatomic) AVAudioPlayer *hihat5Player;
@property (strong,nonatomic) AVAudioPlayer *hihat6Player;

@property (strong,nonatomic) AVAudioPlayer *cymbal1Player;
@property (strong,nonatomic) AVAudioPlayer *cymbal2Player;
@property (strong,nonatomic) AVAudioPlayer *cymbal3Player;
@property (strong,nonatomic) AVAudioPlayer *cymbal4Player;
@property (strong,nonatomic) AVAudioPlayer *cymbal5Player;
@property (strong,nonatomic) AVAudioPlayer *cymbal6Player;

@property (strong,nonatomic) AVAudioPlayer *tom1Player;
@property (strong,nonatomic) AVAudioPlayer *tom2Player;
@property (strong,nonatomic) AVAudioPlayer *tom3Player;
@property (strong,nonatomic) AVAudioPlayer *tom4Player;
@property (strong,nonatomic) AVAudioPlayer *tom5Player;
@property (strong,nonatomic) AVAudioPlayer *tom6Player;

@property (strong,nonatomic) AVAudioPlayer *clickNoise1Player;
@property (strong,nonatomic) AVAudioPlayer *clickNoise2Player;
@property (strong,nonatomic) AVAudioPlayer *clickNoise3Player;
@property (strong,nonatomic) AVAudioPlayer *clickNoise4Player;
@property (strong,nonatomic) AVAudioPlayer *clickNoise5Player;
@property (strong,nonatomic) AVAudioPlayer *clickNoise6Player;



// declaring reverb effects for drum sequencer
// one effect for each drum track (one for the kick, one for the snare, etc.)

@property (strong, nonatomic) AVAudioUnitReverb *kickReverb;
@property (strong, nonatomic) AVAudioUnitReverb *snareReverb;
@property (strong, nonatomic) AVAudioUnitReverb *hiHatReverb;
@property (strong, nonatomic) AVAudioUnitReverb *tomReverb;
@property (strong, nonatomic) AVAudioUnitReverb *cymbalReverb;
@property (strong, nonatomic) AVAudioUnitReverb *clickNoiseReverb;





@end
