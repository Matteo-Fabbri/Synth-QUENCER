//
//  Sequencer.h
//  Synth
//
//  Created by Matteo Fabbri on 16/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//
/* The main idea of the sequencer is taken from Dr. Craig Evans screencast https://minerva.leeds.ac.uk/bbcswebdav/pid-5341615-dt-content-rid-9710025_2/courses/201718_27046_ELEC2660/podcasts/Lab%206.mp4 */


/*

 
 The application is conceived to be a live instrument as well as a compositional tool.
 
 The Sequencer is meant to explore the rhythmic, dynamic and sonic possibilities of a 16 samples drum sequence, which can be “”sliced” in 4 different loops with settable start and end point. If the starting sample is higher than the end sample, the Sequencer will loop backwards. There are 10 possible dynamics and 3 possible sounds for each sample in each track.
 The sequence of each of the four tracks can be inverted and moved right and left. The dynamics and sounds can be set individually for each sample, as well as randomised or reset to the default choice. The sounds can also be stepped up or down all together, useful when we want to have just one sound for all the samples in a track.
 The synthesiser is meant to be played live and features 2 oscillators with settable octave, transposition interval, waveform, filter  and amplitude envelope parameters, as well as panpot and volume controls.
 

The GUI is optimised for iPhone 6
 
Application optimised for iOS 11.1
 
The simulator is often very slow in loading the app, sometimes it needs to be relaunched
 
I wrote this application using Xcode 9. For tips on opening this project with an older Xcode version see:
https://stackoverflow.com/questions/44772760/run-project-in-xcode-8-after-xcode-9

Most of the application (Sequencer) is written in Objective C, while the Synthesiser is written in Swift by using AudioKit, an imported external 3rd party framework. I could not let Swift and Objective C interact with each other, so they just live together completely independently.

You should not have compatibility issues with the external framework (which is loaded into the project itself), but I provide a guide for installation of CocoaPods and AudioKit pod, just in case.

CocoaPods:
https://cocoapods.org/

AudioKit:
https://cocoapods.org/?q=audiokit
 
I used http://appiconmaker.co/Home/Index/43962bc3-580e-434f-8ab0-f1a635efba7a to create correct-size icons

 
 POSSIBLE IMPROVEMENTS:
 
Optimisation for all other Apple devices an platforms are omitted for reasons of lacking of time
 
 The lackness of a control over the playback speed of each single audio object is also due to simple lacking of time, since it would be fairly easily to implement by following a similar method used in "Velocities" and "Drum sounds" view controller classes
 
 I wanted the Loop selection buttons (A,B,C,D in Sequencer view and "Play" buttons in Arranger view) to refresh automatically, which means if I select a particular loop in Sequencer view the correspondent button highlights also in Arranger view and viceversa. After some attempts, I found out that Key-Value Observing (Apple KVO, https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html ) may be the right solution. Again, unfortunately I do not have enough time to implement this.
 
 
 
 
*/



#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

//Importing model
#import "Data.h"
// Importing the view to load drum sounds and set reverb amount
#import "Drum sounds and reverb.h"
// Importing the view to set velocities
#import "Velocities.h"
// Importing a class to round the buttons' corners
//stackoverflow.com/questions/5047818/how-to-round-the-corners-of-a-button
#import <QuartzCore/QuartzCore.h>



@interface Sequencer : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate> {
    
# pragma mark Arrays for buttons states
    
    // creating arrays in which I will store the (16 for each track) buttons states
    
    NSInteger kickTrackButtonsStateArray[16];
    NSInteger snareTrackButtonsStateArray[16];
    NSInteger hihatTrackButtonsStateArray[16];
    NSInteger tomTrackButtonsStateArray[16];

    NSInteger sequenceFirstSample;
    NSInteger sequenceLastSample;
    
    NSInteger firstSampleToBeCleared;
    NSInteger lastSampleToBeCleared;
}


# pragma mark Loop selection buttons properties

@property (strong, nonatomic) IBOutlet UIButton *loopSelectionAButton;
@property (strong, nonatomic) IBOutlet UIButton *loopSelectionBButton;
@property (strong, nonatomic) IBOutlet UIButton *loopSelectionCButton;
@property (strong, nonatomic) IBOutlet UIButton *loopSelectionDButton;




# pragma mark Tom buttons outlet collection
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tomTrackButtons;

# pragma mark Tom buttons method
- (IBAction)didTomTrackButtonPress:(UIButton *)sender;

# pragma mark Tom buttons single outlets

@property (strong, nonatomic) IBOutlet UIButton *tomButton1;
@property (strong, nonatomic) IBOutlet UIButton *tomButton2;
@property (strong, nonatomic) IBOutlet UIButton *tomButton3;
@property (strong, nonatomic) IBOutlet UIButton *tomButton4;
@property (strong, nonatomic) IBOutlet UIButton *tomButton5;
@property (strong, nonatomic) IBOutlet UIButton *tomButton6;
@property (strong, nonatomic) IBOutlet UIButton *tomButton7;
@property (strong, nonatomic) IBOutlet UIButton *tomButton8;
@property (strong, nonatomic) IBOutlet UIButton *tomButton9;
@property (strong, nonatomic) IBOutlet UIButton *tomButton10;
@property (strong, nonatomic) IBOutlet UIButton *tomButton11;
@property (strong, nonatomic) IBOutlet UIButton *tomButton12;
@property (strong, nonatomic) IBOutlet UIButton *tomButton13;
@property (strong, nonatomic) IBOutlet UIButton *tomButton14;
@property (strong, nonatomic) IBOutlet UIButton *tomButton15;
@property (strong, nonatomic) IBOutlet UIButton *tomButton16;

# pragma mark Shift and Inv Tom
- (IBAction)didTomShiftToRightPress:(UIButton *)sender;
- (IBAction)didTomShiftToLeftPress:(UIButton *)sender;
- (IBAction)didTomInvertButtonPress:(UIButton *)sender;



# pragma mark Snare buttons outlet collection
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *snareTrackButtons;

# pragma mark Snare buttons method
- (IBAction)didSnareTrackButtonPress:(UIButton *)sender;

# pragma mark Snare buttons single outlets
@property (strong, nonatomic) IBOutlet UIButton *snareButton1;
@property (strong, nonatomic) IBOutlet UIButton *snareButton2;
@property (strong, nonatomic) IBOutlet UIButton *snareButton3;
@property (strong, nonatomic) IBOutlet UIButton *snareButton4;
@property (strong, nonatomic) IBOutlet UIButton *snareButton5;
@property (strong, nonatomic) IBOutlet UIButton *snareButton6;
@property (strong, nonatomic) IBOutlet UIButton *snareButton7;
@property (strong, nonatomic) IBOutlet UIButton *snareButton8;
@property (strong, nonatomic) IBOutlet UIButton *snareButton9;
@property (strong, nonatomic) IBOutlet UIButton *snareButton10;
@property (strong, nonatomic) IBOutlet UIButton *snareButton11;
@property (strong, nonatomic) IBOutlet UIButton *snareButton12;
@property (strong, nonatomic) IBOutlet UIButton *snareButton13;
@property (strong, nonatomic) IBOutlet UIButton *snareButton14;
@property (strong, nonatomic) IBOutlet UIButton *snareButton15;
@property (strong, nonatomic) IBOutlet UIButton *snareButton16;



# pragma mark Hi-Hat buttons outlet collection
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *hiHatTrackButtons;

# pragma mark Hi-Hat buttons method
- (IBAction)didHiHatTrackButtonPress:(UIButton *)sender;


# pragma mark Hi-Hat buttons single outlets
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton1;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton2;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton3;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton4;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton5;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton6;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton7;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton8;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton9;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton10;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton11;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton12;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton13;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton14;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton15;
@property (strong, nonatomic) IBOutlet UIButton *hiHatButton16;





# pragma mark sharedInstance as property
// I create this property so that I can initialise some of the values stored in the model
@property Data *data;

# pragma mark Inverting sequence buttons methods
- (IBAction)didKickInvertButtonPress:(UIButton *)sender;


# pragma mark Sequence length and clear (picker methods)

- (IBAction)didClearButtonPress:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIPickerView *sequenceClearPicker;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)numberOfRowsInComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component;


# pragma mark bpm label
@property (strong, nonatomic) IBOutlet UILabel *bpmLabel;


# pragma mark TIMER, sampleNumber, isPlaying properties

@property (strong,nonatomic) NSTimer *timer;
// the drum sample (16th of a 4/4 bar, 1/4 of a semiminimum note) currently being played
@property int sampleNumber;
@property BOOL isSequencerPlaying;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *sampleNumberBeingPlayedIndicators;



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

# pragma mark Shift and Inv hi-hat

- (IBAction)didHiHatShiftToRightPress:(UIButton *)sender;
- (IBAction)didHiHatShiftToLeftPress:(UIButton *)sender;
- (IBAction)didHiHatInvertButtonPress:(UIButton *)sender;

# pragma mark Shift and Inv snare
- (IBAction)didSnareShiftToRightPress:(UIButton *)sender;
- (IBAction)didSnareShiftToLeftPress:(UIButton *)sender;
- (IBAction)didSnareInvertButtonPress:(UIButton *)sender;


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



#pragma mark Sections buttons

@property (strong, nonatomic) IBOutlet UIButton *sequence1Button;
- (IBAction)didSequence1ButtonPress:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *sequence2Button;
- (IBAction)didSequence2ButtonPress:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *sequence3Button;
- (IBAction)didSequence3ButtonPress:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *sequence4Button;
- (IBAction)didSequence4ButtonPress:(UIButton *)sender;




@end
