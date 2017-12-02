//
//  Sequencer.m
//  Synth
//
//  Created by Matteo Fabbri on 16/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import "Sequencer.h"


@interface Sequencer ()

@end

@implementation Sequencer

# pragma mark viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create singleton of model (velocities and loading samples logic) class
    self.data = [Data sharedInstance];
    // initialising states arrays
    [self initButtonsStatesArrays];
    // initialising default sounds volumes
    // this is the method that the pickerviews in Veocities view controller call in didSelectRowForComponent
    for (int i = 0; i <= 15; i++) {
    [Data setKickAmplitude:0.5 atSample:i];
    }
    for (int a = 0; a <= 15; a++) {
        [Data setHiHatAmplitude:0.5 atSample:a];
    }
    for (int b = 0; b <= 15; b++) {
        [Data setSnareAmplitude:0.5 atSample:b];
    }
    for (int c = 0; c <= 15; c++) {
        [Data setTomAmplitude:0.5 atSample:c];
    }
    
    
    // setting pickers' protocols delegates and datasources
    self.sequenceClearPicker.delegate = self;
    self.sequenceClearPicker.dataSource = self;
    [self pickerView:self.sequenceClearPicker didSelectRow:15 inComponent:1];
    sequenceLastSample = 15;
    // set default sequence clearing area
    firstSampleToBeCleared = 0;
    lastSampleToBeCleared = 15;
  
    
    // initialise BPM in case the user hits play before setting the tempo
    self.bpmLabel.text = @"60 bpm";
    self.BPM = 60;
    // initialising sampleNumber to 0 (default start sequence: beginning of sequence)
    self.sampleNumber = 0;
    
    // Setting default volumes
    self.data.masterVolume = 0.7;
    self.data.kickMixVolume = 0.7;
    self.data.hiHatMixVolume = 0.7;
    self.data.snareMixVolume = 0.7;
    self.data.tomMixVolume = 0.7;

    // Setting default sequences and activate sequence number 1
    // See also viewDidLoad of Arranger.m
    [Data setSection1FirstSample:0];
    [Data setSection1LastSample:15];
    [Data section1Selected];
    
    [Data setSection2FirstSample:0];
    [Data setSection2LastSample:7];

    [Data setSection3FirstSample:8];
    [Data setSection3LastSample:15];
    
    [Data setSection4FirstSample:15];
    [Data setSection4LastSample:0];
    
    
    
    // setting default alpha value for current sample number indicators
    for (UIButton *button in self.sampleNumberBeingPlayedIndicators) {
        button.alpha = 0.2;
    }
        
    // setting tracks buttons colors
    // I do it programatically because is much faster
        for (UIButton *button in self.kickTrackButtons) {
            button.backgroundColor = [UIColor whiteColor];
        }
        for (UIButton *button in self.hiHatTrackButtons) {
            button.backgroundColor = [UIColor whiteColor];
        }
        for (UIButton *button in self.snareTrackButtons) {
            button.backgroundColor = [UIColor whiteColor];
        }
        for (UIButton *button in self.tomTrackButtons) {
            button.backgroundColor = [UIColor whiteColor];
        }

        
        
        
        // Setting initial alpha values for loop selection buttons
        // Initially, button A is selected so its alpha values will be higher
        
        self.loopSelectionAButton.alpha = 1;
        self.loopSelectionBButton.alpha = 0.5;
        self.loopSelectionCButton.alpha = 0.5;
        self.loopSelectionDButton.alpha = 0.5;
    
    
    

// setting default alpha value and corners for buttons
for (UIButton *button in self.kickTrackButtons) {
    button.alpha = 0.45;
    button.layer.cornerRadius = 10;
    button.clipsToBounds = YES;
}
    
    for (UIButton *button in self.hiHatTrackButtons) {
        button.alpha = 0.45;
        button.layer.cornerRadius = 10;
        button.clipsToBounds = YES;
    }
    
    for (UIButton *button in self.snareTrackButtons) {
        button.alpha = 0.45;
        button.layer.cornerRadius = 10;
        button.clipsToBounds = YES;
    }
    
    for (UIButton *button in self.tomTrackButtons) {
        button.alpha = 0.45;
        button.layer.cornerRadius = 10;
        button.clipsToBounds = YES;
    }
    

    
    
   // set default clear area from sample 1 to sample 16
    [self.sequenceClearPicker selectRow:0 inComponent:0 animated:false];
    [self.sequenceClearPicker selectRow:15 inComponent:1 animated:false];

    [self pickerView:self.sequenceClearPicker didSelectRow:0 inComponent:0];
    [self pickerView:self.sequenceClearPicker didSelectRow:15 inComponent:1];

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


# pragma mark Sequence length methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    // all the pickerview in this controller class will need to have 2 components, to set the starting sample of the sequence or clear area, and to set the end of the sequence or clearing area
    return 2;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 16;
}

- (NSInteger)numberOfRowsInComponent:(NSInteger)component {
    // We got 16 possible samples
    return 16;
}
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    if (pickerView == self.sequenceClearPicker) {
        if (component == 0) {
            firstSampleToBeCleared = row;
            NSLog(@"Clear area set from sample %ld to sample %ld",(firstSampleToBeCleared+1),(lastSampleToBeCleared+1));
        }
        if (component == 1) {
            lastSampleToBeCleared = row;
NSLog(@"Clear area set from sample %ld to sample %ld",(firstSampleToBeCleared+1),(lastSampleToBeCleared+1));        }
    }
    
}


// Instead of loading specific icons, creates views and imageviews, I use this method to set the titles with strings, quicker and lighter
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    
    NSString *seqStartString;
    seqStartString = [NSString stringWithFormat:@"%ld",(row+1)];
    return seqStartString;
}




# pragma mark kickTrackButtonsMethodConnection

// When each kick track button is pressed: toggles itself (selected / unselected), changes background colour, prints to log track id and buton number and most importantly sets correspondent states in kickTrackStatesArray

// In order to treat the button as variables (as I do when I set their backgroundcolours, I created outlets for them)

- (IBAction)didKickTrackButtonPress:(UIButton *)sender {
    if ([sender isSelected]) {
        sender.selected = false;
        sender.backgroundColor = [UIColor whiteColor];
        kickTrackButtonsStateArray[sender.tag] = 0;
        NSLog(@"track: Kick, button: %ld is disabled", ((sender.tag)+1));
    }
    else {
        sender.selected = true;
        sender.backgroundColor = [UIColor grayColor];
        kickTrackButtonsStateArray[sender.tag] = 1;
        NSLog(@"track: Kick, button: %ld is enabled", ((sender.tag)+1));
    }
    
}




# pragma mark Initialise all states arrays members to 0

-(void) initButtonsStatesArrays {
    
    for (int a = 0; a < 16; a++) {
        kickTrackButtonsStateArray[a] = 0;
    }
    for (int b = 0; b < 16; b++) {
        hihatTrackButtonsStateArray[b] = 0;
    }
    for (int c = 0; c < 16; c++) {
        snareTrackButtonsStateArray[c] = 0;
    }
    for (int d = 0; d < 16; d++) {
        tomTrackButtonsStateArray[d] = 0;
    }

}



# pragma mark TIMER FIRE METHOD

-(void) timerFire:(NSTimer *)timer{
    
    
    // with fast enumeration I check if the sample currently played correspond to the button of each track; if yes its alpha gets higher (highligthed), if no it alpha remains 0.45 which I set as default
    for (UIButton *button in self.kickTrackButtons) {
        
        if (button.tag == self.sampleNumber) {
            button.alpha = 1;
        }
        else {
            button.alpha = 0.45;
        }
    }
    
    for (UIButton *button in self.hiHatTrackButtons) {
        
        if (button.tag == self.sampleNumber) {
            button.alpha = 1;
        }
        else {
            button.alpha = 0.45;
        }
    }
    
    for (UIButton *button in self.snareTrackButtons) {
        
        if (button.tag == self.sampleNumber) {
            button.alpha = 1;
        }
        else {
            button.alpha = 0.45;
        }
    }
    
    for (UIButton *button in self.tomTrackButtons) {
        
        if (button.tag == self.sampleNumber) {
            button.alpha = 1;
        }
        else {
            button.alpha = 0.45;
        }
    }
    

    
    
    
    
    
    
    
    // same (almost the same) for the indicators of the current sample number being played (from 1 to 16)
    for (UIButton *button in self.sampleNumberBeingPlayedIndicators) {
        
        if (button.tag == self.sampleNumber) {
            button.alpha = 1;
        }
        else {
            button.alpha = 0.2;
        }
    }
    
    
    // check current sample number and buttons states and play respective audiofiles
    
    if (kickTrackButtonsStateArray[self.sampleNumber] == 1) {
        
        // getting sample1's amplitude from model, multiply it by the kick mix multiplier, multiply it by the master final volume, and passing it to volume setter of kick sample's audioplayer
        [[Data getKickSoundAtSample:self.sampleNumber] setVolume:[Data getKickAmplitudeAtSample:self.sampleNumber]*[Data getKickMixVolume]*[Data getMasterVolume]];
        // getting audioplayer object's pointer form model and playing it
        [[Data getKickSoundAtSample:self.sampleNumber] play];
    }

    // same for hi hat and then other tracks
    if (hihatTrackButtonsStateArray[self.sampleNumber] == 1) {
        
        [[Data getHiHatSoundAtSample:self.sampleNumber] setVolume:[Data getHiHatAmplitudeAtSample:self.sampleNumber]*[Data getHiHatMixVolume]*[Data getMasterVolume]];
        [[Data getHiHatSoundAtSample:self.sampleNumber] play];
    }
    
    
    
    if (snareTrackButtonsStateArray[self.sampleNumber] == 1) {
        
        [[Data getSnareSoundAtSample:self.sampleNumber] setVolume:[Data getSnareAmplitudeAtSample:self.sampleNumber]*[Data getSnareMixVolume]*[Data getMasterVolume]];
        [[Data getSnareSoundAtSample:self.sampleNumber] play];
    }
    
    
    if (tomTrackButtonsStateArray[self.sampleNumber] == 1) {
        
        [[Data getTomSoundAtSample:self.sampleNumber] setVolume:[Data getTomAmplitudeAtSample:self.sampleNumber]*[Data getTomMixVolume]*[Data getMasterVolume]];
        [[Data getTomSoundAtSample:self.sampleNumber] play];
    }
    
    
    
    
    
    // increment the sampleNumber
    // normally when the end of the sequence has been reached, we start from the beginning
    // To know where and when to restart I check sequencefistsample and sequencelastsample, set by the pickerview
    
    
    // Default: seq length = 16 samples, starting sample = first sample
    // Loop through a 4/4 16 16th (samples) bar
    if (sequenceFirstSample == 0 && sequenceLastSample == 15) {
        self.sampleNumber++;
        if (self.sampleNumber > 15) {
            self.sampleNumber = 0;
        }
    }
    // otherwise (for different sequence lengths), just reach end of sequence and start back over
    else if (sequenceFirstSample < sequenceLastSample) {
        self.sampleNumber++;
        if (self.sampleNumber > sequenceLastSample) {
            self.sampleNumber = sequenceFirstSample;
        }
        }
    
    //  just 1 16th loop (perhaps someone might find it useful!!)
    else if (sequenceFirstSample == sequenceLastSample) {
        self.sampleNumber = sequenceFirstSample;
    }
    
    
    
    // going backwards from first to last sample - from right to left
    else if (sequenceFirstSample > sequenceLastSample) {
        
        self.sampleNumber--;
        if (self.sampleNumber < sequenceLastSample) {
            self.sampleNumber = sequenceFirstSample;
        }
        
    }
    
    
    
    NSLog(@"Sample n %i",(self.sampleNumber+1));
    
    // Updating the first and last sample of the sequence calling a getter
    // The values are provided from the Data model and set every time a particular loop (somewhere I called them sections) is selected via its button
    // first and last sample are not set each time a different row in an Arranger's picker is selected, so I don't know why the timer firer is like slowed down when the user interacts with the Arranger's picker
    sequenceFirstSample = [Data getNextSequenceFirstSample];
    sequenceLastSample = [Data getNextSequenceLastSample];

}


# pragma mark IBAction Clear UIButton

- (IBAction)didClearButtonPress:(UIButton *)sender {

    // Here I just give instructions to erase (set to 0) the states of buttons BETWEEN the clear area (start and end samples are decided in the picker view).
    // If the first is after (larger, higher) than the last, the clear area will anyway be set between them, going backwards
    
    if (firstSampleToBeCleared <= lastSampleToBeCleared) {
        for (int i = firstSampleToBeCleared; i <= lastSampleToBeCleared; i++) {
            kickTrackButtonsStateArray[i] = 0;
            hihatTrackButtonsStateArray[i] = 0;
            snareTrackButtonsStateArray[i] = 0;
            tomTrackButtonsStateArray[i] = 0;

        }
        [self refreshUIButtonsStates];
    }
    

    else if (firstSampleToBeCleared >= lastSampleToBeCleared) {
        for (int i = firstSampleToBeCleared; i >= lastSampleToBeCleared; i--) {
            kickTrackButtonsStateArray[i] = 0;
            hihatTrackButtonsStateArray[i] = 0;
            snareTrackButtonsStateArray[i] = 0;
            tomTrackButtonsStateArray[i] = 0;
        }
        [self refreshUIButtonsStates];
    }


}





# pragma mark IBAction Playback UIbuttons and BPM slider

// every time the tempoSlider changes values, I call a method to update the relative property

- (IBAction)didBpmSliderValueChange:(UISlider *)sender {
    self.BPM = self.tempoSlider.value;
    self.bpmLabel.text = [NSString stringWithFormat:@"%.0f bpm",self.BPM];
}

- (IBAction)didBpmSliderTouchUp:(UISlider *)sender {
    // if Sequencer is playing, invalidate the timer and manually call play function again, so that timer schedule is reset accordingly to the new BPM value
    if (self.isSequencerPlaying) {
        [self.timer invalidate];
        [self didPlayButtonPress:nil];
    }
    NSLog(@"Tempo = %.0f",self.BPM);
}

- (IBAction)didPlayButtonPress:(UIButton *)sender {
    // initialise a scheduled timer object with time interval set by BPM
    // time interval is in seconds and Bpm are pulses per minute so we need to divide 60 by the bpm, example: (60/(Bpm=60)) = 1 sec
    // every time the timer bangs, it calls a function
    // I divide by 4 because I'm setting 4 samples per pulse, so that each sample = 1 16th
    self.isSequencerPlaying = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:((60.0/self.BPM)/4) target:self selector: @selector(timerFire:) userInfo:nil repeats:YES];
    NSLog(@"Sequencer is playing");
}

- (IBAction)didPauseButtonPress:(UIButton *)sender {
    self.isSequencerPlaying = false;
    [self.timer invalidate];
    
    NSLog(@"Sequencer is paused");
}

- (IBAction)didStopButtonPress:(UIButton *)sender {
    self.isSequencerPlaying = false;
    [self.timer invalidate];
    
    // rewind sequencer
    self.sampleNumber = 0;
    NSLog(@"Sequencer stopped");
    
}



# pragma mark BPM stepper

- (IBAction)didBpmPlusButtonPress:(UIButton *)sender {
    // stepping up the bpm, updating its label, and updating also the timer schedule if it is playing
    self.BPM++;
    self.bpmLabel.text = [NSString stringWithFormat:@"%.0f bpm",self.BPM];
    if (self.isSequencerPlaying) {
        [self.timer invalidate];
        [self didPlayButtonPress:nil];
    }
    NSLog(@"Tempo = %.0f",self.BPM);
}

- (IBAction)didBpmMinusButtonPress:(UIButton *)sender {
    // stepping down the bpm, updating its label, and updating also the timer schedule if it is playing
    self.BPM--;
    self.bpmLabel.text = [NSString stringWithFormat:@"%.0f bpm",self.BPM];
    if (self.isSequencerPlaying) {
        [self.timer invalidate];
        [self didPlayButtonPress:nil];
    }
    NSLog(@"Tempo = %.0f",self.BPM);
}




# pragma mark refresh buttons UI appearance
// This method checks the sequencer's sequence for each track (...trackButtonsStateArray) and updates the UIButtons states and colors
// to be called when shifting sequence
-(void) refreshUIButtonsStates {
    // kick
    
    if (kickTrackButtonsStateArray[0] == 0) {
        self.kickButton1.selected = false;
        self.kickButton1.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[0] == 1) {
        self.kickButton1.selected = true;
        self.kickButton1.backgroundColor = [UIColor grayColor];}
    
    
    if (kickTrackButtonsStateArray[1] == 0) {
        self.kickButton2.selected = false;
        self.kickButton2.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[1] == 1){self.kickButton2.selected = true;
        self.kickButton2.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[2] == 0) {
        self.kickButton3.selected = false;
        self.kickButton3.backgroundColor = [UIColor whiteColor];
        
    }
    else if (kickTrackButtonsStateArray[2] == 1){self.kickButton3.selected = true;
        self.kickButton3.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[3] == 0) {
        self.kickButton4.selected = false;
        self.kickButton4.backgroundColor = [UIColor whiteColor];
        
    }
    else if (kickTrackButtonsStateArray[3] == 1) {self.kickButton4.selected = true;
        self.kickButton4.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[4] == 0) {
        self.kickButton5.selected = false;
        self.kickButton5.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[4] == 1) {self.kickButton5.selected = true;
        self.kickButton5.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[5] == 0) {
        self.kickButton6.selected = false;
        self.kickButton6.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[5] == 1) {self.kickButton6.selected = true;
        self.kickButton6.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[6] == 0) {
        self.kickButton7.selected = false;
        self.kickButton7.backgroundColor = [UIColor whiteColor];
    }
    
    else if (kickTrackButtonsStateArray[6] == 1){self.kickButton7.selected = true;
        self.kickButton7.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[7] == 0) {
        self.kickButton8.selected = false;
        self.kickButton8.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[7] == 1) {self.kickButton8.selected = true;
        self.kickButton8.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[8] == 0) {
        self.kickButton9.selected = false;
        self.kickButton9.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[8] == 1) {self.kickButton9.selected = true;
        self.kickButton9.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[9] == 0) {
        self.kickButton10.selected = false;
        self.kickButton10.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[9] == 1) {self.kickButton10.selected = true;
        self.kickButton10.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[10] == 0) {
        self.kickButton11.selected = false;
        self.kickButton11.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[10] == 1){self.kickButton11.selected = true;
        self.kickButton11.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[11] == 0) {
        self.kickButton12.selected = false;
        self.kickButton12.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[11] == 1){self.kickButton12.selected = true;
        self.kickButton12.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[12] == 0) {
        self.kickButton13.selected = false;
        self.kickButton13.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[12] == 1){self.kickButton13.selected = true;
        self.kickButton13.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[13] == 0) {
        self.kickButton14.selected = false;
        self.kickButton14.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[13] == 1) {self.kickButton14.selected = true;
        self.kickButton14.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[14] == 0) {
        self.kickButton15.selected = false;
        self.kickButton15.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[14] == 1) {self.kickButton15.selected = true;
        self.kickButton15.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[15] == 0) {
        self.kickButton16.selected = false;
        self.kickButton16.backgroundColor = [UIColor whiteColor];
    }
    else if (kickTrackButtonsStateArray[15] == 1){self.kickButton16.selected = true;
        self.kickButton16.backgroundColor = [UIColor grayColor];
    }
    
    
    // hihat
    
    
    if (hihatTrackButtonsStateArray[0] == 0) {
        self.hiHatButton1.selected = false;
        self.hiHatButton1.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[0] == 1) {
        self.hiHatButton1.selected = true;
        self.hiHatButton1.backgroundColor = [UIColor orangeColor];}
    
    
    if (hihatTrackButtonsStateArray[1] == 0) {
        self.hiHatButton2.selected = false;
        self.hiHatButton2.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[1] == 1){
        self.hiHatButton2.selected = true;
        self.hiHatButton2.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[2] == 0) {
        self.hiHatButton3.selected = false;
        self.hiHatButton3.backgroundColor = [UIColor whiteColor];
        
    }
    else if (hihatTrackButtonsStateArray[2] == 1){
        self.hiHatButton3.selected = true;
        self.hiHatButton3.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[3] == 0) {
        self.hiHatButton4.selected = false;
        self.hiHatButton4.backgroundColor = [UIColor whiteColor];
        
    }
    else if (hihatTrackButtonsStateArray[3] == 1) {
        self.hiHatButton4.selected = true;
        self.hiHatButton4.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[4] == 0) {
        self.hiHatButton5.selected = false;
        self.hiHatButton5.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[4] == 1) {
        self.hiHatButton5.selected = true;
        self.hiHatButton5.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[5] == 0) {
        self.hiHatButton6.selected = false;
        self.hiHatButton6.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[5] == 1) {
        self.hiHatButton6.selected = true;
        self.hiHatButton6.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[6] == 0) {
        self.hiHatButton7.selected = false;
        self.hiHatButton7.backgroundColor = [UIColor whiteColor];
    }
    
    else if (hihatTrackButtonsStateArray[6] == 1){
        self.hiHatButton7.selected = true;
        self.hiHatButton7.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[7] == 0) {
        self.hiHatButton8.selected = false;
        self.hiHatButton8.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[7] == 1) {
        self.hiHatButton8.selected = true;
        self.hiHatButton8.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[8] == 0) {
        self.hiHatButton9.selected = false;
        self.hiHatButton9.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[8] == 1) {
        self.hiHatButton9.selected = true;
        self.hiHatButton9.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[9] == 0) {
        self.hiHatButton10.selected = false;
        self.hiHatButton10.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[9] == 1) {
        self.hiHatButton10.selected = true;
        self.hiHatButton10.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[10] == 0) {
        self.hiHatButton11.selected = false;
        self.hiHatButton11.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[10] == 1){
        self.hiHatButton11.selected = true;
        self.hiHatButton11.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[11] == 0) {
        self.hiHatButton12.selected = false;
        self.hiHatButton12.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[11] == 1){
        self.hiHatButton12.selected = true;
        self.hiHatButton12.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[12] == 0) {
        self.hiHatButton13.selected = false;
        self.hiHatButton13.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[12] == 1){
        self.hiHatButton13.selected = true;
        self.hiHatButton13.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[13] == 0) {
        self.hiHatButton14.selected = false;
        self.hiHatButton14.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[13] == 1) {
        self.hiHatButton14.selected = true;
        self.hiHatButton14.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[14] == 0) {
        self.hiHatButton15.selected = false;
        self.hiHatButton15.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[14] == 1) {
        self.hiHatButton15.selected = true;
        self.hiHatButton15.backgroundColor = [UIColor orangeColor];
    }
    
    if (hihatTrackButtonsStateArray[15] == 0) {
        self.hiHatButton16.selected = false;
        self.hiHatButton16.backgroundColor = [UIColor whiteColor];
    }
    else if (hihatTrackButtonsStateArray[15] == 1){
        self.hiHatButton16.selected = true;
        self.hiHatButton16.backgroundColor = [UIColor orangeColor];
    }
    
    
    // refresh snare buttons appearance
    
    
    if (snareTrackButtonsStateArray[0] == 0) {
        self.snareButton1.selected = false;
        self.snareButton1.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[0] == 1) {
        self.snareButton1.selected = true;
        self.snareButton1.backgroundColor = [UIColor blueColor];}
    
    
    if (snareTrackButtonsStateArray[1] == 0) {
        self.snareButton2.selected = false;
        self.snareButton2.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[1] == 1){
        self.snareButton2.selected = true;
        self.snareButton2.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[2] == 0) {
        self.snareButton3.selected = false;
        self.snareButton3.backgroundColor = [UIColor whiteColor];
        
    }
    else if (snareTrackButtonsStateArray[2] == 1){
        self.snareButton3.selected = true;
        self.snareButton3.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[3] == 0) {
        self.snareButton4.selected = false;
        self.snareButton4.backgroundColor = [UIColor whiteColor];
        
    }
    else if (snareTrackButtonsStateArray[3] == 1) {
        self.snareButton4.selected = true;
        self.snareButton4.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[4] == 0) {
        self.snareButton5.selected = false;
        self.snareButton5.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[4] == 1) {
        self.snareButton5.selected = true;
        self.snareButton5.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[5] == 0) {
        self.snareButton6.selected = false;
        self.snareButton6.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[5] == 1) {
        self.snareButton6.selected = true;
        self.snareButton6.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[6] == 0) {
        self.snareButton7.selected = false;
        self.snareButton7.backgroundColor = [UIColor whiteColor];
    }
    
    else if (snareTrackButtonsStateArray[6] == 1){
        self.snareButton7.selected = true;
        self.snareButton7.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[7] == 0) {
        self.snareButton8.selected = false;
        self.snareButton8.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[7] == 1) {
        self.snareButton8.selected = true;
        self.snareButton8.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[8] == 0) {
        self.snareButton9.selected = false;
        self.snareButton9.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[8] == 1) {
        self.snareButton9.selected = true;
        self.snareButton9.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[9] == 0) {
        self.snareButton10.selected = false;
        self.snareButton10.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[9] == 1) {
        self.snareButton10.selected = true;
        self.snareButton10.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[10] == 0) {
        self.snareButton11.selected = false;
        self.snareButton11.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[10] == 1){
        self.snareButton11.selected = true;
        self.snareButton11.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[11] == 0) {
        self.snareButton12.selected = false;
        self.snareButton12.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[11] == 1){
        self.snareButton12.selected = true;
        self.snareButton12.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[12] == 0) {
        self.snareButton13.selected = false;
        self.snareButton13.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[12] == 1){
        self.snareButton13.selected = true;
        self.snareButton13.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[13] == 0) {
        self.snareButton14.selected = false;
        self.snareButton14.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[13] == 1) {
        self.snareButton14.selected = true;
        self.snareButton14.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[14] == 0) {
        self.snareButton15.selected = false;
        self.snareButton15.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[14] == 1) {
        self.snareButton15.selected = true;
        self.snareButton15.backgroundColor = [UIColor blueColor];
    }
    
    if (snareTrackButtonsStateArray[15] == 0) {
        self.snareButton16.selected = false;
        self.snareButton16.backgroundColor = [UIColor whiteColor];
    }
    else if (snareTrackButtonsStateArray[15] == 1){
        self.snareButton16.selected = true;
        self.snareButton16.backgroundColor = [UIColor blueColor];
    }
    
    // refresh tom buttons appearance

    
    if (tomTrackButtonsStateArray[0] == 0) {
        self.tomButton1.selected = false;
        self.tomButton1.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[0] == 1) {
        self.tomButton1.selected = true;
        self.tomButton1.backgroundColor = [UIColor redColor];}
    
    
    if (tomTrackButtonsStateArray[1] == 0) {
        self.tomButton2.selected = false;
        self.tomButton2.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[1] == 1){
        self.tomButton2.selected = true;
        self.tomButton2.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[2] == 0) {
        self.tomButton3.selected = false;
        self.tomButton3.backgroundColor = [UIColor whiteColor];
        
    }
    else if (tomTrackButtonsStateArray[2] == 1){
        self.tomButton3.selected = true;
        self.tomButton3.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[3] == 0) {
        self.tomButton4.selected = false;
        self.tomButton4.backgroundColor = [UIColor whiteColor];
        
    }
    else if (tomTrackButtonsStateArray[3] == 1) {
        self.tomButton4.selected = true;
        self.tomButton4.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[4] == 0) {
        self.tomButton5.selected = false;
        self.tomButton5.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[4] == 1) {
        self.tomButton5.selected = true;
        self.tomButton5.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[5] == 0) {
        self.tomButton6.selected = false;
        self.tomButton6.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[5] == 1) {
        self.tomButton6.selected = true;
        self.tomButton6.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[6] == 0) {
        self.tomButton7.selected = false;
        self.tomButton7.backgroundColor = [UIColor whiteColor];
    }
    
    else if (tomTrackButtonsStateArray[6] == 1){
        self.tomButton7.selected = true;
        self.tomButton7.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[7] == 0) {
        self.tomButton8.selected = false;
        self.tomButton8.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[7] == 1) {
        self.tomButton8.selected = true;
        self.tomButton8.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[8] == 0) {
        self.tomButton9.selected = false;
        self.tomButton9.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[8] == 1) {
        self.tomButton9.selected = true;
        self.tomButton9.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[9] == 0) {
        self.tomButton10.selected = false;
        self.tomButton10.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[9] == 1) {
        self.tomButton10.selected = true;
        self.tomButton10.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[10] == 0) {
        self.tomButton11.selected = false;
        self.tomButton11.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[10] == 1){
        self.tomButton11.selected = true;
        self.tomButton11.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[11] == 0) {
        self.tomButton12.selected = false;
        self.tomButton12.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[11] == 1){
        self.tomButton12.selected = true;
        self.tomButton12.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[12] == 0) {
        self.tomButton13.selected = false;
        self.tomButton13.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[12] == 1){
        self.tomButton13.selected = true;
        self.tomButton13.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[13] == 0) {
        self.tomButton14.selected = false;
        self.tomButton14.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[13] == 1) {
        self.tomButton14.selected = true;
        self.tomButton14.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[14] == 0) {
        self.tomButton15.selected = false;
        self.tomButton15.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[14] == 1) {
        self.tomButton15.selected = true;
        self.tomButton15.backgroundColor = [UIColor redColor];
    }
    
    if (tomTrackButtonsStateArray[15] == 0) {
        self.tomButton16.selected = false;
        self.tomButton16.backgroundColor = [UIColor whiteColor];
    }
    else if (tomTrackButtonsStateArray[15] == 1){
        self.tomButton16.selected = true;
        self.tomButton16.backgroundColor = [UIColor redColor];
    }
    

    
}

# pragma mark Shift kick seq
// shift to right : each kickTrackButtonsStateArray index is set to be equal to the one to its immediate left, where the first element is equal to the last
// I tried with a for loop but the sequencer started to go backwards
// So I use internal variables where I store the array states one by one, and then I copy them back
- (IBAction)didKickShiftToRightPress:(UIButton *)sender {
    // I use longs instead of ints just because otherwise a warning about loosing precision would come up
    long a = 0;
    long b = 0;
    long c = 0;
    long d = 0;
    long e = 0;
    long f = 0;
    long g = 0;
    long h = 0;
    long i = 0;
    long j = 0;
    long k = 0;
    long l = 0;
    long m = 0;
    long n = 0;
    long o = 0;
    long p = 0;
    
    
    if (self.isSequencerPlaying) {
        [self.timer invalidate];
    }
    a = kickTrackButtonsStateArray[0];
    b = kickTrackButtonsStateArray[1];
    c = kickTrackButtonsStateArray[2];
    d = kickTrackButtonsStateArray[3];
    e = kickTrackButtonsStateArray[4];
    f = kickTrackButtonsStateArray[5];
    g = kickTrackButtonsStateArray[6];
    h = kickTrackButtonsStateArray[7];
    i = kickTrackButtonsStateArray[8];
    j = kickTrackButtonsStateArray[9];
    k = kickTrackButtonsStateArray[10];
    l = kickTrackButtonsStateArray[11];
    m = kickTrackButtonsStateArray[12];
    n = kickTrackButtonsStateArray[13];
    o = kickTrackButtonsStateArray[14];
    p = kickTrackButtonsStateArray[15];
    
    kickTrackButtonsStateArray[1] = a;
    kickTrackButtonsStateArray[2] = b;
    kickTrackButtonsStateArray[3] = c;
    kickTrackButtonsStateArray[4] = d;
    kickTrackButtonsStateArray[5] = e;
    kickTrackButtonsStateArray[6] = f;
    kickTrackButtonsStateArray[7] = g;
    kickTrackButtonsStateArray[8] = h;
    kickTrackButtonsStateArray[9] = i;
    kickTrackButtonsStateArray[10] = j;
    kickTrackButtonsStateArray[11] = k;
    kickTrackButtonsStateArray[12] = l;
    kickTrackButtonsStateArray[13] = m;
    kickTrackButtonsStateArray[14] = n;
    kickTrackButtonsStateArray[15] = o;
    kickTrackButtonsStateArray[0] = p;
    
    [self refreshUIButtonsStates];
    
    if (self.isSequencerPlaying) {
        [self didPlayButtonPress:nil];
    }
    
}

// I do the opposite here, IN THE OPPOSITE DIRECTION AND ORDER
- (IBAction)didKickShiftToLeftPress:(UIButton *)sender {
    long a = 0;
    long b = 0;
    long c = 0;
    long d = 0;
    long e = 0;
    long f = 0;
    long g = 0;
    long h = 0;
    long i = 0;
    long j = 0;
    long k = 0;
    long l = 0;
    long m = 0;
    long n = 0;
    long o = 0;
    long p = 0;
    
    if (self.isSequencerPlaying) {
        [self.timer invalidate];
    }
    a = kickTrackButtonsStateArray[0];
    b = kickTrackButtonsStateArray[1];
    c = kickTrackButtonsStateArray[2];
    d = kickTrackButtonsStateArray[3];
    e = kickTrackButtonsStateArray[4];
    f = kickTrackButtonsStateArray[5];
    g = kickTrackButtonsStateArray[6];
    h = kickTrackButtonsStateArray[7];
    i = kickTrackButtonsStateArray[8];
    j = kickTrackButtonsStateArray[9];
    k = kickTrackButtonsStateArray[10];
    l = kickTrackButtonsStateArray[11];
    m = kickTrackButtonsStateArray[12];
    n = kickTrackButtonsStateArray[13];
    o = kickTrackButtonsStateArray[14];
    p = kickTrackButtonsStateArray[15];
    
    kickTrackButtonsStateArray[15] = a;
    kickTrackButtonsStateArray[0] = b;
    kickTrackButtonsStateArray[1] = c;
    kickTrackButtonsStateArray[2] = d;
    kickTrackButtonsStateArray[3] = e;
    kickTrackButtonsStateArray[4] = f;
    kickTrackButtonsStateArray[5] = g;
    kickTrackButtonsStateArray[6] = h;
    kickTrackButtonsStateArray[7] = i;
    kickTrackButtonsStateArray[8] = j;
    kickTrackButtonsStateArray[9] = k;
    kickTrackButtonsStateArray[10] = l;
    kickTrackButtonsStateArray[11] = m;
    kickTrackButtonsStateArray[12] = n;
    kickTrackButtonsStateArray[13] = o;
    kickTrackButtonsStateArray[14] = p;
    
    [self refreshUIButtonsStates];
    
    if (self.isSequencerPlaying) {
        [self didPlayButtonPress:nil];
    }
}














#pragma mark SECTIONS SELECTION BUTTONS
// for each button pressed I activate the correspondent sequence (or section), updating the data of nexsequence first and last sample in the Data model, which the timer firer method in this class will get at each fire
- (IBAction)didSequence1ButtonPress:(UIButton *)sender {
    self.loopSelectionAButton.alpha = 1;
    self.loopSelectionBButton.alpha = 0.5;
    self.loopSelectionCButton.alpha = 0.5;
    self.loopSelectionDButton.alpha = 0.5;
    [Data section1Selected];
}

- (IBAction)didSequence2ButtonPress:(UIButton *)sender {
    self.loopSelectionAButton.alpha = 0.5;
    self.loopSelectionBButton.alpha = 1;
    self.loopSelectionCButton.alpha = 0.5;
    self.loopSelectionDButton.alpha = 0.5;
    [Data section2Selected];
}

- (IBAction)didSequence4ButtonPress:(UIButton *)sender {
    self.loopSelectionAButton.alpha = 0.5;
    self.loopSelectionBButton.alpha = 0.5;
    self.loopSelectionCButton.alpha = 0.5;
    self.loopSelectionDButton.alpha = 1;
    [Data section4Selected];
}







# pragma mark Inverting sequence buttons methods

- (IBAction)didKickInvertButtonPress:(UIButton *)sender {
    
    // invert every button states in kick track and update UIButtons
    
    if (kickTrackButtonsStateArray[0] == 1) {
        kickTrackButtonsStateArray[0] = 0;
    }
    else if (kickTrackButtonsStateArray[0] == 0) {
        kickTrackButtonsStateArray[0] = 1;
    }
    
    if (kickTrackButtonsStateArray[1] == 1) {
        kickTrackButtonsStateArray[1] = 0;
    }
    else if (kickTrackButtonsStateArray[1] == 0) {
        kickTrackButtonsStateArray[1] = 1;
    }
    
    if (kickTrackButtonsStateArray[2] == 1) {
        kickTrackButtonsStateArray[2] = 0;
    }
    else if (kickTrackButtonsStateArray[2] == 0) {
        kickTrackButtonsStateArray[2] = 1;
    }
    
    if (kickTrackButtonsStateArray[3] == 1) {
        kickTrackButtonsStateArray[3] = 0;
    }
    else if (kickTrackButtonsStateArray[3] == 0) {
        kickTrackButtonsStateArray[3] = 1;
    }
    
    if (kickTrackButtonsStateArray[4] == 1) {
        kickTrackButtonsStateArray[4] = 0;
    }
    else if (kickTrackButtonsStateArray[4] == 0) {
        kickTrackButtonsStateArray[4] = 1;
    }
    
    if (kickTrackButtonsStateArray[5] == 1) {
        kickTrackButtonsStateArray[5] = 0;
    }
    else if (kickTrackButtonsStateArray[5] == 0) {
        kickTrackButtonsStateArray[5] = 1;
    }
    
    if (kickTrackButtonsStateArray[6] == 1) {
        kickTrackButtonsStateArray[6] = 0;
    }
    else if (kickTrackButtonsStateArray[6] == 0) {
        kickTrackButtonsStateArray[6] = 1;
    }
    
    if (kickTrackButtonsStateArray[7] == 1) {
        kickTrackButtonsStateArray[7] = 0;
    }
    else if (kickTrackButtonsStateArray[7] == 0) {
        kickTrackButtonsStateArray[7] = 1;
    }
    
    if (kickTrackButtonsStateArray[8] == 1) {
        kickTrackButtonsStateArray[8] = 0;
    }
    else if (kickTrackButtonsStateArray[8] == 0) {
        kickTrackButtonsStateArray[8] = 1;
    }
    
    if (kickTrackButtonsStateArray[9] == 1) {
        kickTrackButtonsStateArray[9] = 0;
    }
    else if (kickTrackButtonsStateArray[9] == 0) {
        kickTrackButtonsStateArray[9] = 1;
    }
    
    if (kickTrackButtonsStateArray[10] == 1) {
        kickTrackButtonsStateArray[10] = 0;
    }
    else if (kickTrackButtonsStateArray[10] == 0) {
        kickTrackButtonsStateArray[10] = 1;
    }
    
    if (kickTrackButtonsStateArray[11] == 1) {
        kickTrackButtonsStateArray[11] = 0;
    }
    else if (kickTrackButtonsStateArray[11] == 0) {
        kickTrackButtonsStateArray[11] = 1;
    }
    
    if (kickTrackButtonsStateArray[12] == 1) {
        kickTrackButtonsStateArray[12] = 0;
    }
    else if (kickTrackButtonsStateArray[12] == 0) {
        kickTrackButtonsStateArray[12] = 1;
    }
    
    if (kickTrackButtonsStateArray[13] == 1) {
        kickTrackButtonsStateArray[13] = 0;
    }
    else if (kickTrackButtonsStateArray[13] == 0) {
        kickTrackButtonsStateArray[13] = 1;
    }
    
    if (kickTrackButtonsStateArray[14] == 1) {
        kickTrackButtonsStateArray[14] = 0;
    }
    else if (kickTrackButtonsStateArray[14] == 0) {
        kickTrackButtonsStateArray[14] = 1;
    }
    
    if (kickTrackButtonsStateArray[15] == 1) {
        kickTrackButtonsStateArray[15] = 0;
    }
    else if (kickTrackButtonsStateArray[15] == 0) {
        kickTrackButtonsStateArray[15] = 1;
    }
    
    [self refreshUIButtonsStates];
    
}

- (IBAction)didSequence3ButtonPress:(UIButton *)sender {
    self.loopSelectionAButton.alpha = 0.5;
    self.loopSelectionBButton.alpha = 0.5;
    self.loopSelectionCButton.alpha = 1;
    self.loopSelectionDButton.alpha = 0.5;
    [Data section3Selected];
}

#pragma mark didHiHat Button Press method

- (IBAction)didHiHatTrackButtonPress:(UIButton *)sender {
    if ([sender isSelected]) {
        sender.selected = false;
        sender.backgroundColor = [UIColor whiteColor];
        hihatTrackButtonsStateArray[sender.tag] = 0;
        NSLog(@"track: hi-hat, button: %ld is disabled", ((sender.tag)+1));
    }
    else {
        sender.selected = true;
        // a yellow darker than the one with button deselected
        sender.backgroundColor = [UIColor orangeColor];
        hihatTrackButtonsStateArray[sender.tag] = 1;
        NSLog(@"track: hi-hat, button: %ld is enabled", ((sender.tag)+1));
    }
}



# pragma mark hi hat shift right

- (IBAction)didHiHatShiftToRightPress:(UIButton *)sender {
    long a = 0;
    long b = 0;
    long c = 0;
    long d = 0;
    long e = 0;
    long f = 0;
    long g = 0;
    long h = 0;
    long i = 0;
    long j = 0;
    long k = 0;
    long l = 0;
    long m = 0;
    long n = 0;
    long o = 0;
    long p = 0;
    
    
    if (self.isSequencerPlaying) {
        [self.timer invalidate];
    }
    a = hihatTrackButtonsStateArray[0];
    b = hihatTrackButtonsStateArray[1];
    c = hihatTrackButtonsStateArray[2];
    d = hihatTrackButtonsStateArray[3];
    e = hihatTrackButtonsStateArray[4];
    f = hihatTrackButtonsStateArray[5];
    g = hihatTrackButtonsStateArray[6];
    h = hihatTrackButtonsStateArray[7];
    i = hihatTrackButtonsStateArray[8];
    j = hihatTrackButtonsStateArray[9];
    k = hihatTrackButtonsStateArray[10];
    l = hihatTrackButtonsStateArray[11];
    m = hihatTrackButtonsStateArray[12];
    n = hihatTrackButtonsStateArray[13];
    o = hihatTrackButtonsStateArray[14];
    p = hihatTrackButtonsStateArray[15];
    
    hihatTrackButtonsStateArray[1] = a;
    hihatTrackButtonsStateArray[2] = b;
    hihatTrackButtonsStateArray[3] = c;
    hihatTrackButtonsStateArray[4] = d;
    hihatTrackButtonsStateArray[5] = e;
    hihatTrackButtonsStateArray[6] = f;
    hihatTrackButtonsStateArray[7] = g;
    hihatTrackButtonsStateArray[8] = h;
    hihatTrackButtonsStateArray[9] = i;
    hihatTrackButtonsStateArray[10] = j;
    hihatTrackButtonsStateArray[11] = k;
    hihatTrackButtonsStateArray[12] = l;
    hihatTrackButtonsStateArray[13] = m;
    hihatTrackButtonsStateArray[14] = n;
    hihatTrackButtonsStateArray[15] = o;
    hihatTrackButtonsStateArray[0] = p;
    
    [self refreshUIButtonsStates];
    
    if (self.isSequencerPlaying) {
        [self didPlayButtonPress:nil];
    }
    
}

# pragma mark Hi hat shif left
- (IBAction)didHiHatShiftToLeftPress:(UIButton *)sender {
    long a = 0;
    long b = 0;
    long c = 0;
    long d = 0;
    long e = 0;
    long f = 0;
    long g = 0;
    long h = 0;
    long i = 0;
    long j = 0;
    long k = 0;
    long l = 0;
    long m = 0;
    long n = 0;
    long o = 0;
    long p = 0;
    
    if (self.isSequencerPlaying) {
        [self.timer invalidate];
    }
    a = hihatTrackButtonsStateArray[0];
    b = hihatTrackButtonsStateArray[1];
    c = hihatTrackButtonsStateArray[2];
    d = hihatTrackButtonsStateArray[3];
    e = hihatTrackButtonsStateArray[4];
    f = hihatTrackButtonsStateArray[5];
    g = hihatTrackButtonsStateArray[6];
    h = hihatTrackButtonsStateArray[7];
    i = hihatTrackButtonsStateArray[8];
    j = hihatTrackButtonsStateArray[9];
    k = hihatTrackButtonsStateArray[10];
    l = hihatTrackButtonsStateArray[11];
    m = hihatTrackButtonsStateArray[12];
    n = hihatTrackButtonsStateArray[13];
    o = hihatTrackButtonsStateArray[14];
    p = hihatTrackButtonsStateArray[15];
    
    hihatTrackButtonsStateArray[15] = a;
    hihatTrackButtonsStateArray[0] = b;
    hihatTrackButtonsStateArray[1] = c;
    hihatTrackButtonsStateArray[2] = d;
    hihatTrackButtonsStateArray[3] = e;
    hihatTrackButtonsStateArray[4] = f;
    hihatTrackButtonsStateArray[5] = g;
    hihatTrackButtonsStateArray[6] = h;
    hihatTrackButtonsStateArray[7] = i;
    hihatTrackButtonsStateArray[8] = j;
    hihatTrackButtonsStateArray[9] = k;
    hihatTrackButtonsStateArray[10] = l;
    hihatTrackButtonsStateArray[11] = m;
    hihatTrackButtonsStateArray[12] = n;
    hihatTrackButtonsStateArray[13] = o;
    hihatTrackButtonsStateArray[14] = p;
    
    [self refreshUIButtonsStates];
    
    if (self.isSequencerPlaying) {
        [self didPlayButtonPress:nil];
    }

}

# pragma mark Hi hat invert
- (IBAction)didHiHatInvertButtonPress:(UIButton *)sender {
    
    if (hihatTrackButtonsStateArray[0] == 1) {
        hihatTrackButtonsStateArray[0] = 0;
    }
    else if (hihatTrackButtonsStateArray[0] == 0) {
        hihatTrackButtonsStateArray[0] = 1;
    }
    
    if (hihatTrackButtonsStateArray[1] == 1) {
        hihatTrackButtonsStateArray[1] = 0;
    }
    else if (hihatTrackButtonsStateArray[1] == 0) {
        hihatTrackButtonsStateArray[1] = 1;
    }
    
    if (hihatTrackButtonsStateArray[2] == 1) {
        hihatTrackButtonsStateArray[2] = 0;
    }
    else if (hihatTrackButtonsStateArray[2] == 0) {
        hihatTrackButtonsStateArray[2] = 1;
    }
    
    if (hihatTrackButtonsStateArray[3] == 1) {
        hihatTrackButtonsStateArray[3] = 0;
    }
    else if (hihatTrackButtonsStateArray[3] == 0) {
        hihatTrackButtonsStateArray[3] = 1;
    }
    
    if (hihatTrackButtonsStateArray[4] == 1) {
        hihatTrackButtonsStateArray[4] = 0;
    }
    else if (hihatTrackButtonsStateArray[4] == 0) {
        hihatTrackButtonsStateArray[4] = 1;
    }
    
    if (hihatTrackButtonsStateArray[5] == 1) {
        hihatTrackButtonsStateArray[5] = 0;
    }
    else if (hihatTrackButtonsStateArray[5] == 0) {
        hihatTrackButtonsStateArray[5] = 1;
    }
    
    if (hihatTrackButtonsStateArray[6] == 1) {
        hihatTrackButtonsStateArray[6] = 0;
    }
    else if (hihatTrackButtonsStateArray[6] == 0) {
        hihatTrackButtonsStateArray[6] = 1;
    }
    
    if (hihatTrackButtonsStateArray[7] == 1) {
        hihatTrackButtonsStateArray[7] = 0;
    }
    else if (hihatTrackButtonsStateArray[7] == 0) {
        hihatTrackButtonsStateArray[7] = 1;
    }
    
    if (hihatTrackButtonsStateArray[8] == 1) {
        hihatTrackButtonsStateArray[8] = 0;
    }
    else if (hihatTrackButtonsStateArray[8] == 0) {
        hihatTrackButtonsStateArray[8] = 1;
    }
    
    if (hihatTrackButtonsStateArray[9] == 1) {
        hihatTrackButtonsStateArray[9] = 0;
    }
    else if (hihatTrackButtonsStateArray[9] == 0) {
        hihatTrackButtonsStateArray[9] = 1;
    }
    
    if (hihatTrackButtonsStateArray[10] == 1) {
        hihatTrackButtonsStateArray[10] = 0;
    }
    else if (hihatTrackButtonsStateArray[10] == 0) {
        hihatTrackButtonsStateArray[10] = 1;
    }
    
    if (hihatTrackButtonsStateArray[11] == 1) {
        hihatTrackButtonsStateArray[11] = 0;
    }
    else if (hihatTrackButtonsStateArray[11] == 0) {
        hihatTrackButtonsStateArray[11] = 1;
    }
    
    if (hihatTrackButtonsStateArray[12] == 1) {
        hihatTrackButtonsStateArray[12] = 0;
    }
    else if (hihatTrackButtonsStateArray[12] == 0) {
        hihatTrackButtonsStateArray[12] = 1;
    }
    
    if (hihatTrackButtonsStateArray[13] == 1) {
        hihatTrackButtonsStateArray[13] = 0;
    }
    else if (hihatTrackButtonsStateArray[13] == 0) {
        hihatTrackButtonsStateArray[13] = 1;
    }
    
    if (hihatTrackButtonsStateArray[14] == 1) {
        hihatTrackButtonsStateArray[14] = 0;
    }
    else if (hihatTrackButtonsStateArray[14] == 0) {
        hihatTrackButtonsStateArray[14] = 1;
    }
    
    if (hihatTrackButtonsStateArray[15] == 1) {
        hihatTrackButtonsStateArray[15] = 0;
    }
    else if (hihatTrackButtonsStateArray[15] == 0) {
        hihatTrackButtonsStateArray[15] = 1;
    }
    
    [self refreshUIButtonsStates];
}

# pragma mark Snare button pressed
- (IBAction)didSnareTrackButtonPress:(UIButton *)sender {
    if ([sender isSelected]) {
        sender.selected = false;
        sender.backgroundColor = [UIColor whiteColor];
        snareTrackButtonsStateArray[sender.tag] = 0;
        NSLog(@"track: snare, button: %ld is disabled", ((sender.tag)+1));
    }
    else {
        sender.selected = true;
        sender.backgroundColor = [UIColor blueColor];
        snareTrackButtonsStateArray[sender.tag] = 1;
        NSLog(@"track: snare, button: %ld is enabled", ((sender.tag)+1));
    }
}

# pragma mark tom button pressed
- (IBAction)didTomTrackButtonPress:(UIButton *)sender {
    if ([sender isSelected]) {
        sender.selected = false;
        sender.backgroundColor = [UIColor whiteColor];
        tomTrackButtonsStateArray[sender.tag] = 0;
        NSLog(@"track: tom, button: %ld is disabled", ((sender.tag)+1));
    }
    else {
        sender.selected = true;
        sender.backgroundColor = [UIColor redColor];
        tomTrackButtonsStateArray[sender.tag] = 1;
        NSLog(@"track: tom, button: %ld is enabled", ((sender.tag)+1));
    }
}




# pragma mark Shift and Inv Snare

- (IBAction)didSnareShiftToRightPress:(UIButton *)sender {
    
    long a = 0;
    long b = 0;
    long c = 0;
    long d = 0;
    long e = 0;
    long f = 0;
    long g = 0;
    long h = 0;
    long i = 0;
    long j = 0;
    long k = 0;
    long l = 0;
    long m = 0;
    long n = 0;
    long o = 0;
    long p = 0;
    
    
    if (self.isSequencerPlaying) {
        [self.timer invalidate];
    }
    a = snareTrackButtonsStateArray[0];
    b = snareTrackButtonsStateArray[1];
    c = snareTrackButtonsStateArray[2];
    d = snareTrackButtonsStateArray[3];
    e = snareTrackButtonsStateArray[4];
    f = snareTrackButtonsStateArray[5];
    g = snareTrackButtonsStateArray[6];
    h = snareTrackButtonsStateArray[7];
    i = snareTrackButtonsStateArray[8];
    j = snareTrackButtonsStateArray[9];
    k = snareTrackButtonsStateArray[10];
    l = snareTrackButtonsStateArray[11];
    m = snareTrackButtonsStateArray[12];
    n = snareTrackButtonsStateArray[13];
    o = snareTrackButtonsStateArray[14];
    p = snareTrackButtonsStateArray[15];
    
    snareTrackButtonsStateArray[1] = a;
    snareTrackButtonsStateArray[2] = b;
    snareTrackButtonsStateArray[3] = c;
    snareTrackButtonsStateArray[4] = d;
    snareTrackButtonsStateArray[5] = e;
    snareTrackButtonsStateArray[6] = f;
    snareTrackButtonsStateArray[7] = g;
    snareTrackButtonsStateArray[8] = h;
    snareTrackButtonsStateArray[9] = i;
    snareTrackButtonsStateArray[10] = j;
    snareTrackButtonsStateArray[11] = k;
    snareTrackButtonsStateArray[12] = l;
    snareTrackButtonsStateArray[13] = m;
    snareTrackButtonsStateArray[14] = n;
    snareTrackButtonsStateArray[15] = o;
    snareTrackButtonsStateArray[0] = p;
    
    [self refreshUIButtonsStates];
    
    if (self.isSequencerPlaying) {
        [self didPlayButtonPress:nil];
    }
    
    
}

- (IBAction)didSnareShiftToLeftPress:(UIButton *)sender {
    
    long a = 0;
    long b = 0;
    long c = 0;
    long d = 0;
    long e = 0;
    long f = 0;
    long g = 0;
    long h = 0;
    long i = 0;
    long j = 0;
    long k = 0;
    long l = 0;
    long m = 0;
    long n = 0;
    long o = 0;
    long p = 0;
    
    if (self.isSequencerPlaying) {
        [self.timer invalidate];
    }
    a = snareTrackButtonsStateArray[0];
    b = snareTrackButtonsStateArray[1];
    c = snareTrackButtonsStateArray[2];
    d = snareTrackButtonsStateArray[3];
    e = snareTrackButtonsStateArray[4];
    f = snareTrackButtonsStateArray[5];
    g = snareTrackButtonsStateArray[6];
    h = snareTrackButtonsStateArray[7];
    i = snareTrackButtonsStateArray[8];
    j = snareTrackButtonsStateArray[9];
    k = snareTrackButtonsStateArray[10];
    l = snareTrackButtonsStateArray[11];
    m = snareTrackButtonsStateArray[12];
    n = snareTrackButtonsStateArray[13];
    o = snareTrackButtonsStateArray[14];
    p = snareTrackButtonsStateArray[15];
    
    snareTrackButtonsStateArray[15] = a;
    snareTrackButtonsStateArray[0] = b;
    snareTrackButtonsStateArray[1] = c;
    snareTrackButtonsStateArray[2] = d;
    snareTrackButtonsStateArray[3] = e;
    snareTrackButtonsStateArray[4] = f;
    snareTrackButtonsStateArray[5] = g;
    snareTrackButtonsStateArray[6] = h;
    snareTrackButtonsStateArray[7] = i;
    snareTrackButtonsStateArray[8] = j;
    snareTrackButtonsStateArray[9] = k;
    snareTrackButtonsStateArray[10] = l;
    snareTrackButtonsStateArray[11] = m;
    snareTrackButtonsStateArray[12] = n;
    snareTrackButtonsStateArray[13] = o;
    snareTrackButtonsStateArray[14] = p;
    
    [self refreshUIButtonsStates];
    
    if (self.isSequencerPlaying) {
        [self didPlayButtonPress:nil];
    }

    
}

- (IBAction)didSnareInvertButtonPress:(UIButton *)sender {
    
    if (snareTrackButtonsStateArray[0] == 1) {
        snareTrackButtonsStateArray[0] = 0;
    }
    else if (snareTrackButtonsStateArray[0] == 0) {
        snareTrackButtonsStateArray[0] = 1;
    }
    
    if (snareTrackButtonsStateArray[1] == 1) {
        snareTrackButtonsStateArray[1] = 0;
    }
    else if (snareTrackButtonsStateArray[1] == 0) {
        snareTrackButtonsStateArray[1] = 1;
    }
    
    if (snareTrackButtonsStateArray[2] == 1) {
        snareTrackButtonsStateArray[2] = 0;
    }
    else if (snareTrackButtonsStateArray[2] == 0) {
        snareTrackButtonsStateArray[2] = 1;
    }
    
    if (snareTrackButtonsStateArray[3] == 1) {
        snareTrackButtonsStateArray[3] = 0;
    }
    else if (snareTrackButtonsStateArray[3] == 0) {
        snareTrackButtonsStateArray[3] = 1;
    }
    
    if (snareTrackButtonsStateArray[4] == 1) {
        snareTrackButtonsStateArray[4] = 0;
    }
    else if (snareTrackButtonsStateArray[4] == 0) {
        snareTrackButtonsStateArray[4] = 1;
    }
    
    if (snareTrackButtonsStateArray[5] == 1) {
        snareTrackButtonsStateArray[5] = 0;
    }
    else if (snareTrackButtonsStateArray[5] == 0) {
        snareTrackButtonsStateArray[5] = 1;
    }
    
    if (snareTrackButtonsStateArray[6] == 1) {
        snareTrackButtonsStateArray[6] = 0;
    }
    else if (snareTrackButtonsStateArray[6] == 0) {
        snareTrackButtonsStateArray[6] = 1;
    }
    
    if (snareTrackButtonsStateArray[7] == 1) {
        snareTrackButtonsStateArray[7] = 0;
    }
    else if (snareTrackButtonsStateArray[7] == 0) {
        snareTrackButtonsStateArray[7] = 1;
    }
    
    if (snareTrackButtonsStateArray[8] == 1) {
        snareTrackButtonsStateArray[8] = 0;
    }
    else if (snareTrackButtonsStateArray[8] == 0) {
        snareTrackButtonsStateArray[8] = 1;
    }
    
    if (snareTrackButtonsStateArray[9] == 1) {
        snareTrackButtonsStateArray[9] = 0;
    }
    else if (snareTrackButtonsStateArray[9] == 0) {
        snareTrackButtonsStateArray[9] = 1;
    }
    
    if (snareTrackButtonsStateArray[10] == 1) {
        snareTrackButtonsStateArray[10] = 0;
    }
    else if (snareTrackButtonsStateArray[10] == 0) {
        snareTrackButtonsStateArray[10] = 1;
    }
    
    if (snareTrackButtonsStateArray[11] == 1) {
        snareTrackButtonsStateArray[11] = 0;
    }
    else if (snareTrackButtonsStateArray[11] == 0) {
        snareTrackButtonsStateArray[11] = 1;
    }
    
    if (snareTrackButtonsStateArray[12] == 1) {
        snareTrackButtonsStateArray[12] = 0;
    }
    else if (snareTrackButtonsStateArray[12] == 0) {
        snareTrackButtonsStateArray[12] = 1;
    }
    
    if (snareTrackButtonsStateArray[13] == 1) {
        snareTrackButtonsStateArray[13] = 0;
    }
    else if (snareTrackButtonsStateArray[13] == 0) {
        snareTrackButtonsStateArray[13] = 1;
    }
    
    if (snareTrackButtonsStateArray[14] == 1) {
        snareTrackButtonsStateArray[14] = 0;
    }
    else if (snareTrackButtonsStateArray[14] == 0) {
        snareTrackButtonsStateArray[14] = 1;
    }
    
    if (snareTrackButtonsStateArray[15] == 1) {
        snareTrackButtonsStateArray[15] = 0;
    }
    else if (snareTrackButtonsStateArray[15] == 0) {
        snareTrackButtonsStateArray[15] = 1;
    }
    
    [self refreshUIButtonsStates];
    
    
}

# pragma mark tom shift and Inv
- (IBAction)didTomShiftToRightPress:(UIButton *)sender {
    
    long a = 0;
    long b = 0;
    long c = 0;
    long d = 0;
    long e = 0;
    long f = 0;
    long g = 0;
    long h = 0;
    long i = 0;
    long j = 0;
    long k = 0;
    long l = 0;
    long m = 0;
    long n = 0;
    long o = 0;
    long p = 0;
    
    
    if (self.isSequencerPlaying) {
        [self.timer invalidate];
    }
    a = tomTrackButtonsStateArray[0];
    b = tomTrackButtonsStateArray[1];
    c = tomTrackButtonsStateArray[2];
    d = tomTrackButtonsStateArray[3];
    e = tomTrackButtonsStateArray[4];
    f = tomTrackButtonsStateArray[5];
    g = tomTrackButtonsStateArray[6];
    h = tomTrackButtonsStateArray[7];
    i = tomTrackButtonsStateArray[8];
    j = tomTrackButtonsStateArray[9];
    k = tomTrackButtonsStateArray[10];
    l = tomTrackButtonsStateArray[11];
    m = tomTrackButtonsStateArray[12];
    n = tomTrackButtonsStateArray[13];
    o = tomTrackButtonsStateArray[14];
    p = tomTrackButtonsStateArray[15];
    
    tomTrackButtonsStateArray[1] = a;
    tomTrackButtonsStateArray[2] = b;
    tomTrackButtonsStateArray[3] = c;
    tomTrackButtonsStateArray[4] = d;
    tomTrackButtonsStateArray[5] = e;
    tomTrackButtonsStateArray[6] = f;
    tomTrackButtonsStateArray[7] = g;
    tomTrackButtonsStateArray[8] = h;
    tomTrackButtonsStateArray[9] = i;
    tomTrackButtonsStateArray[10] = j;
    tomTrackButtonsStateArray[11] = k;
    tomTrackButtonsStateArray[12] = l;
    tomTrackButtonsStateArray[13] = m;
    tomTrackButtonsStateArray[14] = n;
    tomTrackButtonsStateArray[15] = o;
    tomTrackButtonsStateArray[0] = p;
    
    [self refreshUIButtonsStates];
    
    if (self.isSequencerPlaying) {
        [self didPlayButtonPress:nil];
    }
    
}

- (IBAction)didTomShiftToLeftPress:(UIButton *)sender {
    long a = 0;
    long b = 0;
    long c = 0;
    long d = 0;
    long e = 0;
    long f = 0;
    long g = 0;
    long h = 0;
    long i = 0;
    long j = 0;
    long k = 0;
    long l = 0;
    long m = 0;
    long n = 0;
    long o = 0;
    long p = 0;
    
    if (self.isSequencerPlaying) {
        [self.timer invalidate];
    }
    a = tomTrackButtonsStateArray[0];
    b = tomTrackButtonsStateArray[1];
    c = tomTrackButtonsStateArray[2];
    d = tomTrackButtonsStateArray[3];
    e = tomTrackButtonsStateArray[4];
    f = tomTrackButtonsStateArray[5];
    g = tomTrackButtonsStateArray[6];
    h = tomTrackButtonsStateArray[7];
    i = tomTrackButtonsStateArray[8];
    j = tomTrackButtonsStateArray[9];
    k = tomTrackButtonsStateArray[10];
    l = tomTrackButtonsStateArray[11];
    m = tomTrackButtonsStateArray[12];
    n = tomTrackButtonsStateArray[13];
    o = tomTrackButtonsStateArray[14];
    p = tomTrackButtonsStateArray[15];
    
    tomTrackButtonsStateArray[15] = a;
    tomTrackButtonsStateArray[0] = b;
    tomTrackButtonsStateArray[1] = c;
    tomTrackButtonsStateArray[2] = d;
    tomTrackButtonsStateArray[3] = e;
    tomTrackButtonsStateArray[4] = f;
    tomTrackButtonsStateArray[5] = g;
    tomTrackButtonsStateArray[6] = h;
    tomTrackButtonsStateArray[7] = i;
    tomTrackButtonsStateArray[8] = j;
    tomTrackButtonsStateArray[9] = k;
    tomTrackButtonsStateArray[10] = l;
    tomTrackButtonsStateArray[11] = m;
    tomTrackButtonsStateArray[12] = n;
    tomTrackButtonsStateArray[13] = o;
    tomTrackButtonsStateArray[14] = p;
    [self refreshUIButtonsStates];
    if (self.isSequencerPlaying) {
        [self didPlayButtonPress:nil];
    }
}

- (IBAction)didTomInvertButtonPress:(UIButton *)sender {

    if (tomTrackButtonsStateArray[0] == 1) {
        tomTrackButtonsStateArray[0] = 0;
    }
    else if (tomTrackButtonsStateArray[0] == 0) {
        tomTrackButtonsStateArray[0] = 1;
    }
    
    if (tomTrackButtonsStateArray[1] == 1) {
        tomTrackButtonsStateArray[1] = 0;
    }
    else if (tomTrackButtonsStateArray[1] == 0) {
        tomTrackButtonsStateArray[1] = 1;
    }
    
    if (tomTrackButtonsStateArray[2] == 1) {
        tomTrackButtonsStateArray[2] = 0;
    }
    else if (tomTrackButtonsStateArray[2] == 0) {
        tomTrackButtonsStateArray[2] = 1;
    }
    
    if (tomTrackButtonsStateArray[3] == 1) {
        tomTrackButtonsStateArray[3] = 0;
    }
    else if (tomTrackButtonsStateArray[3] == 0) {
        tomTrackButtonsStateArray[3] = 1;
    }
    
    if (tomTrackButtonsStateArray[4] == 1) {
        tomTrackButtonsStateArray[4] = 0;
    }
    else if (tomTrackButtonsStateArray[4] == 0) {
        tomTrackButtonsStateArray[4] = 1;
    }
    
    if (tomTrackButtonsStateArray[5] == 1) {
        tomTrackButtonsStateArray[5] = 0;
    }
    else if (tomTrackButtonsStateArray[5] == 0) {
        tomTrackButtonsStateArray[5] = 1;
    }
    
    if (tomTrackButtonsStateArray[6] == 1) {
        tomTrackButtonsStateArray[6] = 0;
    }
    else if (tomTrackButtonsStateArray[6] == 0) {
        tomTrackButtonsStateArray[6] = 1;
    }
    
    if (tomTrackButtonsStateArray[7] == 1) {
        tomTrackButtonsStateArray[7] = 0;
    }
    else if (tomTrackButtonsStateArray[7] == 0) {
        tomTrackButtonsStateArray[7] = 1;
    }
    
    if (tomTrackButtonsStateArray[8] == 1) {
        tomTrackButtonsStateArray[8] = 0;
    }
    else if (tomTrackButtonsStateArray[8] == 0) {
        tomTrackButtonsStateArray[8] = 1;
    }
    
    if (tomTrackButtonsStateArray[9] == 1) {
        tomTrackButtonsStateArray[9] = 0;
    }
    else if (tomTrackButtonsStateArray[9] == 0) {
        tomTrackButtonsStateArray[9] = 1;
    }
    
    if (tomTrackButtonsStateArray[10] == 1) {
        tomTrackButtonsStateArray[10] = 0;
    }
    else if (tomTrackButtonsStateArray[10] == 0) {
        tomTrackButtonsStateArray[10] = 1;
    }
    
    if (tomTrackButtonsStateArray[11] == 1) {
        tomTrackButtonsStateArray[11] = 0;
    }
    else if (tomTrackButtonsStateArray[11] == 0) {
        tomTrackButtonsStateArray[11] = 1;
    }
    
    if (tomTrackButtonsStateArray[12] == 1) {
        tomTrackButtonsStateArray[12] = 0;
    }
    else if (tomTrackButtonsStateArray[12] == 0) {
        tomTrackButtonsStateArray[12] = 1;
    }
    
    if (tomTrackButtonsStateArray[13] == 1) {
        tomTrackButtonsStateArray[13] = 0;
    }
    else if (tomTrackButtonsStateArray[13] == 0) {
        tomTrackButtonsStateArray[13] = 1;
    }
    
    if (tomTrackButtonsStateArray[14] == 1) {
        tomTrackButtonsStateArray[14] = 0;
    }
    else if (tomTrackButtonsStateArray[14] == 0) {
        tomTrackButtonsStateArray[14] = 1;
    }
    
    if (tomTrackButtonsStateArray[15] == 1) {
        tomTrackButtonsStateArray[15] = 0;
    }
    else if (tomTrackButtonsStateArray[15] == 0) {
        tomTrackButtonsStateArray[15] = 1;
    }
    [self refreshUIButtonsStates];
}


@end








