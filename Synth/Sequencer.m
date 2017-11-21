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
    Data *data = [Data sharedInstance];
    // initialising states arrays
    [self initButtonsStatesArrays];
    // initialising default sounds volumes
    // this is the method that the pickerviews in Veocities view controller call in didSelectRowForComponent
    for (int i = 0; i <= 15; i++) {
    [Data setKickAmplitude:0.5 atSample:i];
    }
    
    
    
    
    // class method call to set up array of kick players
//    [Data setUpKickAudioPlayersArray];
    
    [self setUpSnareAudioPlayers];
    [self setUpHiHatAudioPlayers];
    [self setUpCymbalsAudioPlayers];
    [self setUpTomAudioPlayers];
    [self setUpClickNoiseAudioPlayers];
    // initialise BPM in case the user hits play before setting the tempo
    self.bpmLabel.text = @"60 bpm";
    self.BPM = 60;
    // initialising sampleNumber to 0 (default start sequence: beginning of sequence)
    self.sampleNumber = 0;
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





# pragma mark setUpSnareAudioPlayers

-(void) setUpSnareAudioPlayers {
    
    // In order to set up AudioPlayers for the drum sequencer we need to create path and URLs
    
    // Creating file paths for snare audio files
    NSString *snare1FilePath = [[NSBundle mainBundle] pathForResource:@"snare1" ofType:@"wav"];
    NSString *snare2FilePath = [[NSBundle mainBundle] pathForResource:@"snare2" ofType:@"wav"];
    NSString *snare3FilePath = [[NSBundle mainBundle] pathForResource:@"snare3" ofType:@"wav"];
    NSString *snare4FilePath = [[NSBundle mainBundle] pathForResource:@"snare4" ofType:@"wav"];
    NSString *snare5FilePath = [[NSBundle mainBundle] pathForResource:@"snare5" ofType:@"wav"];
    NSString *snare6FilePath = [[NSBundle mainBundle] pathForResource:@"snare6" ofType:@"wav"];
    
    
    // Creating URLs of snare file paths
    
    NSURL *snare1FileUrl = [[NSURL alloc] initFileURLWithPath: snare1FilePath];
    NSURL *snare2FileUrl = [[NSURL alloc] initFileURLWithPath: snare2FilePath];
    NSURL *snare3FileUrl = [[NSURL alloc] initFileURLWithPath: snare3FilePath];
    NSURL *snare4FileUrl = [[NSURL alloc] initFileURLWithPath: snare4FilePath];
    NSURL *snare5FileUrl = [[NSURL alloc] initFileURLWithPath: snare5FilePath];
    NSURL *snare6FileUrl = [[NSURL alloc] initFileURLWithPath: snare6FilePath];
    
    
    
    // initialising snare AudioPlayer objects
    
    self.snare1Player = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare2Player = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare3Player = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare4Player = [[AVAudioPlayer alloc] initWithContentsOfURL: snare4FileUrl error: nil];
    self.snare5Player = [[AVAudioPlayer alloc] initWithContentsOfURL: snare5FileUrl error: nil];
    self.snare6Player = [[AVAudioPlayer alloc] initWithContentsOfURL: snare6FileUrl error: nil];
    
    
    
    // And prepare them to play
    [self.snare1Player prepareToPlay];
    [self.snare2Player prepareToPlay];
    [self.snare3Player prepareToPlay];
    [self.snare4Player prepareToPlay];
    [self.snare5Player prepareToPlay];
    [self.snare6Player prepareToPlay];
    
}




# pragma mark setUpHiHatAudioPlayers


-(void) setUpHiHatAudioPlayers {
    
    // In order to set up AudioPlayers for the drum sequencer we need to create path and URLs
    
    // Creating file paths for hihat audio files
    NSString *hihat1FilePath = [[NSBundle mainBundle] pathForResource:@"hi-hat1" ofType:@"wav"];
    NSString *hihat2FilePath = [[NSBundle mainBundle] pathForResource:@"hi-hat2" ofType:@"wav"];
    NSString *hihat3FilePath = [[NSBundle mainBundle] pathForResource:@"hi-hat3" ofType:@"wav"];
    NSString *hihat4FilePath = [[NSBundle mainBundle] pathForResource:@"hi-hat4" ofType:@"wav"];
    NSString *hihat5FilePath = [[NSBundle mainBundle] pathForResource:@"hi-hat5" ofType:@"wav"];
    NSString *hihat6FilePath = [[NSBundle mainBundle] pathForResource:@"hi-hat6" ofType:@"wav"];
    
    
    // Creating URLs of hihat file paths
    
    NSURL *hihat1FileUrl = [[NSURL alloc] initFileURLWithPath: hihat1FilePath];
    NSURL *hihat2FileUrl = [[NSURL alloc] initFileURLWithPath: hihat2FilePath];
    NSURL *hihat3FileUrl = [[NSURL alloc] initFileURLWithPath: hihat3FilePath];
    NSURL *hihat4FileUrl = [[NSURL alloc] initFileURLWithPath: hihat4FilePath];
    NSURL *hihat5FileUrl = [[NSURL alloc] initFileURLWithPath: hihat5FilePath];
    NSURL *hihat6FileUrl = [[NSURL alloc] initFileURLWithPath: hihat6FilePath];
    
    
    
    // initialising hihat AudioPlayer objects
    
    self.hihat1Player = [[AVAudioPlayer alloc] initWithContentsOfURL: hihat1FileUrl error: nil];
    self.hihat2Player = [[AVAudioPlayer alloc] initWithContentsOfURL: hihat2FileUrl error: nil];
    self.hihat3Player = [[AVAudioPlayer alloc] initWithContentsOfURL: hihat3FileUrl error: nil];
    self.hihat4Player = [[AVAudioPlayer alloc] initWithContentsOfURL: hihat4FileUrl error: nil];
    self.hihat5Player = [[AVAudioPlayer alloc] initWithContentsOfURL: hihat5FileUrl error: nil];
    self.hihat6Player = [[AVAudioPlayer alloc] initWithContentsOfURL: hihat6FileUrl error: nil];
    
    
    
    // And prepare them to play
    [self.hihat1Player prepareToPlay];
    [self.hihat2Player prepareToPlay];
    [self.hihat3Player prepareToPlay];
    [self.hihat4Player prepareToPlay];
    [self.hihat5Player prepareToPlay];
    [self.hihat6Player prepareToPlay];
    
}



# pragma mark setUpCymbalAudioPlayers

-(void) setUpCymbalsAudioPlayers {
    
    // In order to set up AudioPlayers for the drum sequencer we need to create path and URLs
    
    // Creating file paths for cymbals audio files
    NSString *cymbal1FilePath = [[NSBundle mainBundle] pathForResource:@"cymbals1" ofType:@"wav"];
    NSString *cymbal2FilePath = [[NSBundle mainBundle] pathForResource:@"cymbals2" ofType:@"wav"];
    NSString *cymbal3FilePath = [[NSBundle mainBundle] pathForResource:@"cymbals3" ofType:@"wav"];
    NSString *cymbal4FilePath = [[NSBundle mainBundle] pathForResource:@"cymbals4" ofType:@"wav"];
    NSString *cymbal5FilePath = [[NSBundle mainBundle] pathForResource:@"cymbals5" ofType:@"wav"];
    NSString *cymbal6FilePath = [[NSBundle mainBundle] pathForResource:@"cymbals6" ofType:@"wav"];
    
    
    // Creating URLs of cymbal file paths
    
    NSURL *cymbal1FileUrl = [[NSURL alloc] initFileURLWithPath: cymbal1FilePath];
    NSURL *cymbal2FileUrl = [[NSURL alloc] initFileURLWithPath: cymbal2FilePath];
    NSURL *cymbal3FileUrl = [[NSURL alloc] initFileURLWithPath: cymbal3FilePath];
    NSURL *cymbal4FileUrl = [[NSURL alloc] initFileURLWithPath: cymbal4FilePath];
    NSURL *cymbal5FileUrl = [[NSURL alloc] initFileURLWithPath: cymbal5FilePath];
    NSURL *cymbal6FileUrl = [[NSURL alloc] initFileURLWithPath: cymbal6FilePath];
    
    
    
    // initialising cymbal AudioPlayer objects
    
    self.cymbal1Player = [[AVAudioPlayer alloc] initWithContentsOfURL: cymbal1FileUrl error: nil];
    self.cymbal2Player = [[AVAudioPlayer alloc] initWithContentsOfURL: cymbal2FileUrl error: nil];
    self.cymbal3Player = [[AVAudioPlayer alloc] initWithContentsOfURL: cymbal3FileUrl error: nil];
    self.cymbal4Player = [[AVAudioPlayer alloc] initWithContentsOfURL: cymbal4FileUrl error: nil];
    self.cymbal5Player = [[AVAudioPlayer alloc] initWithContentsOfURL: cymbal5FileUrl error: nil];
    self.cymbal6Player = [[AVAudioPlayer alloc] initWithContentsOfURL: cymbal6FileUrl error: nil];
    
    
    
    // And prepare them to play
    [self.cymbal1Player prepareToPlay];
    [self.cymbal2Player prepareToPlay];
    [self.cymbal3Player prepareToPlay];
    [self.cymbal4Player prepareToPlay];
    [self.cymbal5Player prepareToPlay];
    [self.cymbal6Player prepareToPlay];
    
}




# pragma mark setUpTomAudioPlayers

-(void) setUpTomAudioPlayers {
    
    // In order to set up AudioPlayers for the drum sequencer we need to create path and URLs
    
    // Creating file paths for tom audio files
    NSString *tom1FilePath = [[NSBundle mainBundle] pathForResource:@"tom1" ofType:@"wav"];
    NSString *tom2FilePath = [[NSBundle mainBundle] pathForResource:@"tom2" ofType:@"wav"];
    NSString *tom3FilePath = [[NSBundle mainBundle] pathForResource:@"tom3" ofType:@"wav"];
    NSString *tom4FilePath = [[NSBundle mainBundle] pathForResource:@"tom4" ofType:@"wav"];
    NSString *tom5FilePath = [[NSBundle mainBundle] pathForResource:@"tom5" ofType:@"wav"];
    NSString *tom6FilePath = [[NSBundle mainBundle] pathForResource:@"tom6" ofType:@"wav"];
    
    
    // Creating URLs of tom file paths
    
    NSURL *tom1FileUrl = [[NSURL alloc] initFileURLWithPath: tom1FilePath];
    NSURL *tom2FileUrl = [[NSURL alloc] initFileURLWithPath: tom2FilePath];
    NSURL *tom3FileUrl = [[NSURL alloc] initFileURLWithPath: tom3FilePath];
    NSURL *tom4FileUrl = [[NSURL alloc] initFileURLWithPath: tom4FilePath];
    NSURL *tom5FileUrl = [[NSURL alloc] initFileURLWithPath: tom5FilePath];
    NSURL *tom6FileUrl = [[NSURL alloc] initFileURLWithPath: tom6FilePath];
    
    
    
    // initialising tom AudioPlayer objects
    
    self.tom1Player = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom2Player = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom3Player = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom4Player = [[AVAudioPlayer alloc] initWithContentsOfURL: tom4FileUrl error: nil];
    self.tom5Player = [[AVAudioPlayer alloc] initWithContentsOfURL: tom5FileUrl error: nil];
    self.tom6Player = [[AVAudioPlayer alloc] initWithContentsOfURL: tom6FileUrl error: nil];
    
    
    
    // And prepare them to play
    [self.tom1Player prepareToPlay];
    [self.tom2Player prepareToPlay];
    [self.tom3Player prepareToPlay];
    [self.tom4Player prepareToPlay];
    [self.tom5Player prepareToPlay];
    [self.tom6Player prepareToPlay];
    
}



# pragma mark setUpClickNoiseAudioPlayers

-(void) setUpClickNoiseAudioPlayers {
    
    // In order to set up AudioPlayers for the drum sequencer we need to create path and URLs
    
    // Creating file paths for click audio files
    NSString *clickNoise1FilePath = [[NSBundle mainBundle] pathForResource:@"noiseclick1" ofType:@"wav"];
    NSString *clickNoise2FilePath = [[NSBundle mainBundle] pathForResource:@"noiseclick2" ofType:@"wav"];
    NSString *clickNoise3FilePath = [[NSBundle mainBundle] pathForResource:@"noiseclick3" ofType:@"wav"];
    NSString *clickNoise4FilePath = [[NSBundle mainBundle] pathForResource:@"noiseclick4" ofType:@"wav"];
    NSString *clickNoise5FilePath = [[NSBundle mainBundle] pathForResource:@"noiseclick5" ofType:@"wav"];
    NSString *clickNoise6FilePath = [[NSBundle mainBundle] pathForResource:@"noiseclick6" ofType:@"wav"];
    
    
    // Creating URLs of click file paths
    
    NSURL *clickNoise1FileUrl = [[NSURL alloc] initFileURLWithPath: clickNoise1FilePath];
    NSURL *clickNoise2FileUrl = [[NSURL alloc] initFileURLWithPath: clickNoise2FilePath];
    NSURL *clickNoise3FileUrl = [[NSURL alloc] initFileURLWithPath: clickNoise3FilePath];
    NSURL *clickNoise4FileUrl = [[NSURL alloc] initFileURLWithPath: clickNoise4FilePath];
    NSURL *clickNoise5FileUrl = [[NSURL alloc] initFileURLWithPath: clickNoise5FilePath];
    NSURL *clickNoise6FileUrl = [[NSURL alloc] initFileURLWithPath: clickNoise6FilePath];
    
    
    
    // initialising click AudioPlayer objects
    
    self.clickNoise1Player = [[AVAudioPlayer alloc] initWithContentsOfURL: clickNoise1FileUrl error: nil];
    self.clickNoise1Player = [[AVAudioPlayer alloc] initWithContentsOfURL: clickNoise2FileUrl error: nil];
    self.clickNoise1Player = [[AVAudioPlayer alloc] initWithContentsOfURL: clickNoise3FileUrl error: nil];
    self.clickNoise1Player = [[AVAudioPlayer alloc] initWithContentsOfURL: clickNoise4FileUrl error: nil];
    self.clickNoise1Player = [[AVAudioPlayer alloc] initWithContentsOfURL: clickNoise5FileUrl error: nil];
    self.clickNoise1Player = [[AVAudioPlayer alloc] initWithContentsOfURL: clickNoise6FileUrl error: nil];
    
    
    
    // And prepare them to play
    [self.clickNoise1Player prepareToPlay];
    [self.clickNoise2Player prepareToPlay];
    [self.clickNoise3Player prepareToPlay];
    [self.clickNoise4Player prepareToPlay];
    [self.clickNoise5Player prepareToPlay];
    [self.clickNoise6Player prepareToPlay];
    
}



# pragma mark kickTrackButtonsMethodConnection

// When each kick track button is pressed: toggles itself (selected / unselected), changes background colour, prints to log track id and buton number and most importantly sets correspondent states in kickTrackStatesArray

// In order to treat the button as variables (as I do when I set their backgroundcolours, I created outlets for them)

- (IBAction)didKickTrackButtonPress:(UIButton *)sender {
    if ([sender isSelected]) {
        sender.selected = false;
        sender.backgroundColor = [UIColor lightGrayColor];
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
        kickTrackButtonsStateArray[b] = 0;
    }
    for (int c = 0; c < 16; c++) {
        kickTrackButtonsStateArray[c] = 0;
    }
    for (int d = 0; d < 16; d++) {
        kickTrackButtonsStateArray[d] = 0;
    }
    for (int e = 0; e < 16; e++) {
        kickTrackButtonsStateArray[e] = 0;
    }
    for (int f = 0; f < 16; f++) {
        kickTrackButtonsStateArray[f] = 0;
    }
        
        
        
}



# pragma mark TIMER FIRE METHOD

-(void) timerFire:(NSTimer *)timer{
    
    
    // with fast enumeration I check if the sample currently played correspond to the button of each track; if yes its alpha gets higher (highligthed), if no it alpha remains 0.65 which I set as default
    for (UIButton *button in self.kickTrackButtons) {
        
        if (button.tag == self.sampleNumber) {
            button.alpha = 1;
        }
        else {
            button.alpha = 0.65;
        }
    }
    
    
    // check current sample number and buttons states and play respective audiofiles
    
//    if (self.sampleNumber || self.sampleNumber) {
    if (kickTrackButtonsStateArray[self.sampleNumber] == 1) {
        
        // complete this: IF KICK SAMPLE 1 IS SELECTED IN PICKER VIEW //

        
        // getting sample1's amplitude from model and passing it to volume setter of kick sample's audioplayer
        [[Data getKickSoundAtSample:self.sampleNumber] setVolume:[Data getKickAmplitudeAtSample:self.sampleNumber]];
        // getting audioplayer object's pointer form model and playing it
        [[Data getKickSoundAtSample:self.sampleNumber] play];
    }
//    }
    
//    if (self.sampleNumber == 1) {
//        if (kickTrackButtonsStateArray[1] == 1) {
//
//            [[Data getKickSoundAtSample:1] setVolume:[Data getKickAmplitudeAtSample:1]];
//            [[Data getKickSoundAtSample:1] play];
//        }
//    }
//
//    if (self.sampleNumber == 2) {
//        if (kickTrackButtonsStateArray[2] == 1) {
//            [[Data getKickSoundAtSample:2] setVolume:[Data getKickAmplitudeAtSample:2]];
//            [[Data getKickSoundAtSample:2] play];
//        }
//    }
//
//    if (self.sampleNumber == 3) {
//        if (kickTrackButtonsStateArray[3] == 1) {
//            [[Data getKickSoundAtSample:3] setVolume:[Data getKickAmplitudeAtSample:3]];
//            [[Data getKickSoundAtSample:3] play];
//        }
//    }
//    if (self.sampleNumber == 4) {
//        if (kickTrackButtonsStateArray[4] == 1) {
//            [[Data getKickSoundAtSample:4] setVolume:[Data getKickAmplitudeAtSample:4]];
//            [[Data getKickSoundAtSample:4] play];
//        }
//    }
//    if (self.sampleNumber == 5) {
//        if (kickTrackButtonsStateArray[5] == 1) {
//            [[Data getKickSoundAtSample:5] setVolume:[Data getKickAmplitudeAtSample:5]];
//            [[Data getKickSoundAtSample:5] play];
//        }
//    }
//    if (self.sampleNumber == 6) {
//        if (kickTrackButtonsStateArray[6] == 1) {
//            [[Data getKickSoundAtSample:6] setVolume:[Data getKickAmplitudeAtSample:6]];
//            [[Data getKickSoundAtSample:6] play];
//        }
//    }
//    if (self.sampleNumber == 7) {
//        if (kickTrackButtonsStateArray[7] == 1) {
//            [[Data getKickSoundAtSample:7] setVolume:[Data getKickAmplitudeAtSample:7]];
//            [[Data getKickSoundAtSample:7] play];
//        }
//    }
//    if (self.sampleNumber == 8) {
//        if (kickTrackButtonsStateArray[8] == 1) {
////            [self.kick1PlayerSample9 setVolume:[Data getKickAmplitudeAtSample:8]];
////            [self.kick1PlayerSample9 play];
//        }
//    }
//    if (self.sampleNumber == 9) {
//        if (kickTrackButtonsStateArray[9] == 1) {
////            [self.kick1PlayerSample10 setVolume:[Data getKickAmplitudeAtSample:9]];
////            [self.kick1PlayerSample10 play];
//        }
//    }
//    if (self.sampleNumber == 10) {
//        if (kickTrackButtonsStateArray[10] == 1) {
////            [self.kick1PlayerSample11 setVolume:[Data getKickAmplitudeAtSample:10]];
////            [self.kick1PlayerSample11 play];
//        }
//    }
//    if (self.sampleNumber == 11) {
//        if (kickTrackButtonsStateArray[11] == 1) {
////            [self.kick1PlayerSample12 setVolume:[Data getKickAmplitudeAtSample:11]];
////            [self.kick1PlayerSample12 play];
//        }
//    }
//    if (self.sampleNumber == 12) {
//        if (kickTrackButtonsStateArray[12] == 1) {
////            [self.kick1PlayerSample13 setVolume:[Data getKickAmplitudeAtSample:12]];
////            [self.kick1PlayerSample13 play];
//        }
//    }
//    if (self.sampleNumber == 13) {
//        if (kickTrackButtonsStateArray[13] == 1) {
////            [self.kick1PlayerSample14 setVolume:[Data getKickAmplitudeAtSample:13]];
////            [self.kick1PlayerSample14 play];
//        }
//    }
//    if (self.sampleNumber == 14) {
//        if (kickTrackButtonsStateArray[14] == 1) {
////            [self.kick1PlayerSample15 setVolume:[Data getKickAmplitudeAtSample:15]];
////            [self.kick1PlayerSample15 play];
//        }
//    }
//    if (self.sampleNumber == 15) {
//        if (kickTrackButtonsStateArray[15] == 1) {
////            [self.kick1PlayerSample16 setVolume:[Data getKickAmplitudeAtSample:16]];
////            [self.kick1PlayerSample16 play];
//        }
//    }
    
    
    
    
    
    
    // increment the sampleNumber
    // normally when the end of the sequence has been reached, we start from the beginning
    
    self.sampleNumber++;
    if (self.sampleNumber > 15) {
        self.sampleNumber = 0;
    }
    NSLog(@"Sample n %i",(self.sampleNumber+1));
    
    
    // if loop is on and region to be looped is not the entire sequence, set here the if loops
}


# pragma mark IBAction Clear UIButton

- (IBAction)didClearButtonPress:(UIButton *)sender {
    // COMPLETE THIS
    // IF CLEAR AREA IS EQUAL TO ENTIRE SEQUENCE (CHECK PICKER VIEW)
    
    // reset buttons states arrays
    [self initButtonsStatesArrays];
    // reset alpha button values
    [self initButtonsAlpha];
    // disable all buttons and reset their colours
    for (UIButton *button in self.kickTrackButtons) {
        button.selected = false;
    }
    for (UIButton *button in self.kickTrackButtons) {
        button.backgroundColor = [UIColor lightGrayColor];
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
    self.isSequencerPlaying = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:((60.0/self.BPM)/4) target:self selector: @selector(timerFire:) userInfo:nil repeats:YES];
    NSLog(@"Sequencer is playing");
}

- (IBAction)didPauseButtonPress:(UIButton *)sender {
    self.isSequencerPlaying = false;
    [self.timer invalidate];
    
    // stop, rewind and prepare to re-play each sound
    
    
    
    
//    if ([self.kick1PlayerSample1 isPlaying]) {
//    [self.kick1PlayerSample1 stop];
//    self.kick1PlayerSample1.currentTime = 0;
//    [self.kick1PlayerSample1 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample2 isPlaying]) {
//        [self.kick1PlayerSample2 stop];
//        self.kick1PlayerSample2.currentTime = 0;
//        [self.kick1PlayerSample2 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample3 isPlaying]) {
//        [self.kick1PlayerSample3 stop];
//        self.kick1PlayerSample3.currentTime = 0;
//        [self.kick1PlayerSample3 prepareToPlay];
//    }
    
//    if ([self.kick1PlayerSample4 isPlaying]) {
//        [self.kick1PlayerSample4 stop];
//        self.kick1PlayerSample4.currentTime = 0;
//        [self.kick1PlayerSample4 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample5 isPlaying]) {
//        [self.kick1PlayerSample5 stop];
//        self.kick1PlayerSample5.currentTime = 0;
//        [self.kick1PlayerSample5 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample6 isPlaying]) {
//        [self.kick1PlayerSample6 stop];
//        self.kick1PlayerSample6.currentTime = 0;
//        [self.kick1PlayerSample6 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample7 isPlaying]) {
//        [self.kick1PlayerSample7 stop];
//        self.kick1PlayerSample7.currentTime = 0;
//        [self.kick1PlayerSample7 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample8 isPlaying]) {
//        [self.kick1PlayerSample8 stop];
//        self.kick1PlayerSample8.currentTime = 0;
//        [self.kick1PlayerSample8 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample9 isPlaying]) {
//        [self.kick1PlayerSample9 stop];
//        self.kick1PlayerSample9.currentTime = 0;
//        [self.kick1PlayerSample9 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample10 isPlaying]) {
//        [self.kick1PlayerSample10 stop];
//        self.kick1PlayerSample10.currentTime = 0;
//        [self.kick1PlayerSample10 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample11 isPlaying]) {
//        [self.kick1PlayerSample11 stop];
//        self.kick1PlayerSample11.currentTime = 0;
//        [self.kick1PlayerSample11 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample12 isPlaying]) {
//        [self.kick1PlayerSample12 stop];
//        self.kick1PlayerSample12.currentTime = 0;
//        [self.kick1PlayerSample12 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample13 isPlaying]) {
//        [self.kick1PlayerSample13 stop];
//        self.kick1PlayerSample13.currentTime = 0;
//        [self.kick1PlayerSample13 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample14 isPlaying]) {
//        [self.kick1PlayerSample14 stop];
//        self.kick1PlayerSample14.currentTime = 0;
//        [self.kick1PlayerSample14 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample15 isPlaying]) {
//        [self.kick1PlayerSample15 stop];
//        self.kick1PlayerSample15.currentTime = 0;
//        [self.kick1PlayerSample15 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample16 isPlaying]) {
//        [self.kick1PlayerSample16 stop];
//        self.kick1PlayerSample16.currentTime = 0;
//        [self.kick1PlayerSample16 prepareToPlay];
//    }
    
    
    
    
    
    
    
//    if ([self.kick2Player isPlaying]) {
//        [self.kick2Player stop];
//        self.kick2Player.currentTime = 0;
//        [self.kick2Player prepareToPlay];
//    }
//
//    if ([self.kick3Player isPlaying]) {
//        [self.kick3Player stop];
//        self.kick3Player.currentTime = 0;
//        [self.kick3Player prepareToPlay];
//    }
//
//    if ([self.kick4Player isPlaying]) {
//        [self.kick4Player stop];
//        self.kick4Player.currentTime = 0;
//        [self.kick4Player prepareToPlay];
//    }
//
//    if ([self.kick5Player isPlaying]) {
//        [self.kick5Player stop];
//        self.kick5Player.currentTime = 0;
//        [self.kick5Player prepareToPlay];
//    }
//
//    if ([self.kick6Player isPlaying]) {
//        [self.kick6Player stop];
//        self.kick6Player.currentTime = 0;
//        [self.kick6Player prepareToPlay];
//    }
    
    if ([self.snare1Player isPlaying]) {
        [self.snare1Player stop];
        self.snare1Player.currentTime = 0;
        [self.snare1Player prepareToPlay];
    }
    
    if ([self.snare2Player isPlaying]) {
        [self.snare2Player stop];
        self.snare2Player.currentTime = 0;
        [self.snare2Player prepareToPlay];
    }
    
    if ([self.snare3Player isPlaying]) {
        [self.snare3Player stop];
        self.snare3Player.currentTime = 0;
        [self.snare3Player prepareToPlay];
    }
    
    if ([self.snare4Player isPlaying]) {
        [self.snare4Player stop];
        self.snare4Player.currentTime = 0;
        [self.snare4Player prepareToPlay];
    }
    
    if ([self.snare5Player isPlaying]) {
        [self.snare5Player stop];
        self.snare5Player.currentTime = 0;
        [self.snare5Player prepareToPlay];
    }
    
    if ([self.snare6Player isPlaying]) {
        [self.snare6Player stop];
        self.snare6Player.currentTime = 0;
        [self.snare6Player prepareToPlay];
    }
    
    if ([self.tom1Player isPlaying]) {
        [self.tom1Player stop];
        self.tom1Player.currentTime = 0;
        [self.tom1Player prepareToPlay];
    }
    
    if ([self.tom2Player isPlaying]) {
        [self.tom2Player stop];
        self.tom2Player.currentTime = 0;
        [self.tom2Player prepareToPlay];
    }
    
    if ([self.tom3Player isPlaying]) {
        [self.tom3Player stop];
        self.tom3Player.currentTime = 0;
        [self.tom3Player prepareToPlay];
    }
    
    if ([self.tom4Player isPlaying]) {
        [self.tom4Player stop];
        self.tom4Player.currentTime = 0;
        [self.tom4Player prepareToPlay];
    }
    
    if ([self.tom5Player isPlaying]) {
        [self.tom5Player stop];
        self.tom5Player.currentTime = 0;
        [self.tom5Player prepareToPlay];
    }
    
    if ([self.tom6Player isPlaying]) {
        [self.tom6Player stop];
        self.tom6Player.currentTime = 0;
        [self.tom6Player prepareToPlay];
    }
    
    if ([self.hihat1Player isPlaying]) {
        [self.hihat1Player stop];
        self.hihat1Player.currentTime = 0;
        [self.hihat1Player prepareToPlay];
    }
    
    if ([self.hihat2Player isPlaying]) {
        [self.hihat2Player stop];
        self.hihat2Player.currentTime = 0;
        [self.hihat2Player prepareToPlay];
    }
    
    if ([self.hihat3Player isPlaying]) {
        [self.hihat3Player stop];
        self.hihat3Player.currentTime = 0;
        [self.hihat3Player prepareToPlay];
    }
    
    if ([self.hihat4Player isPlaying]) {
        [self.hihat4Player stop];
        self.hihat4Player.currentTime = 0;
        [self.hihat4Player prepareToPlay];
    }
    if ([self.hihat5Player isPlaying]) {
        [self.hihat5Player stop];
        self.hihat5Player.currentTime = 0;
        [self.hihat5Player prepareToPlay];
    }
    if ([self.hihat6Player isPlaying]) {
        [self.hihat6Player stop];
        self.hihat6Player.currentTime = 0;
        [self.hihat6Player prepareToPlay];
    }
    
    if ([self.cymbal1Player isPlaying]) {
        [self.cymbal1Player stop];
        self.cymbal1Player.currentTime = 0;
        [self.cymbal1Player prepareToPlay];
    }
    
    if ([self.cymbal2Player isPlaying]) {
        [self.cymbal2Player stop];
        self.cymbal2Player.currentTime = 0;
        [self.cymbal2Player prepareToPlay];
    }
    
    if ([self.cymbal3Player isPlaying]) {
        [self.cymbal3Player stop];
        self.cymbal3Player.currentTime = 0;
        [self.cymbal3Player prepareToPlay];
    }
    
    if ([self.cymbal4Player isPlaying]) {
        [self.cymbal4Player stop];
        self.cymbal4Player.currentTime = 0;
        [self.cymbal4Player prepareToPlay];
    }
    
    if ([self.cymbal5Player isPlaying]) {
        [self.cymbal5Player stop];
        self.cymbal5Player.currentTime = 0;
        [self.cymbal5Player prepareToPlay];
    }
    
    if ([self.cymbal6Player isPlaying]) {
        [self.cymbal6Player stop];
        self.cymbal6Player.currentTime = 0;
        [self.cymbal6Player prepareToPlay];
    }
    
    NSLog(@"Sequencer is paused");
}

- (IBAction)didStopButtonPress:(UIButton *)sender {
    self.isSequencerPlaying = false;
    [self.timer invalidate];
    
    // stop, rewind and prepare to re-play each sound
    
//    if ([self.kick1PlayerSample1 isPlaying]) {
//        [self.kick1PlayerSample1 stop];
//        self.kick1PlayerSample1.currentTime = 0;
//        [self.kick1PlayerSample1 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample2 isPlaying]) {
//        [self.kick1PlayerSample2 stop];
//        self.kick1PlayerSample2.currentTime = 0;
//        [self.kick1PlayerSample2 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample3 isPlaying]) {
//        [self.kick1PlayerSample3 stop];
//        self.kick1PlayerSample3.currentTime = 0;
//        [self.kick1PlayerSample3 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample4 isPlaying]) {
//        [self.kick1PlayerSample4 stop];
//        self.kick1PlayerSample4.currentTime = 0;
//        [self.kick1PlayerSample4 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample5 isPlaying]) {
//        [self.kick1PlayerSample5 stop];
//        self.kick1PlayerSample5.currentTime = 0;
//        [self.kick1PlayerSample5 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample6 isPlaying]) {
//        [self.kick1PlayerSample6 stop];
//        self.kick1PlayerSample6.currentTime = 0;
//        [self.kick1PlayerSample6 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample7 isPlaying]) {
//        [self.kick1PlayerSample7 stop];
//        self.kick1PlayerSample7.currentTime = 0;
//        [self.kick1PlayerSample7 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample8 isPlaying]) {
//        [self.kick1PlayerSample8 stop];
//        self.kick1PlayerSample8.currentTime = 0;
//        [self.kick1PlayerSample8 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample9 isPlaying]) {
//        [self.kick1PlayerSample9 stop];
//        self.kick1PlayerSample9.currentTime = 0;
//        [self.kick1PlayerSample9 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample10 isPlaying]) {
//        [self.kick1PlayerSample10 stop];
//        self.kick1PlayerSample10.currentTime = 0;
//        [self.kick1PlayerSample10 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample11 isPlaying]) {
//        [self.kick1PlayerSample11 stop];
//        self.kick1PlayerSample11.currentTime = 0;
//        [self.kick1PlayerSample11 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample12 isPlaying]) {
//        [self.kick1PlayerSample12 stop];
//        self.kick1PlayerSample12.currentTime = 0;
//        [self.kick1PlayerSample12 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample13 isPlaying]) {
//        [self.kick1PlayerSample13 stop];
//        self.kick1PlayerSample13.currentTime = 0;
//        [self.kick1PlayerSample13 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample14 isPlaying]) {
//        [self.kick1PlayerSample14 stop];
//        self.kick1PlayerSample14.currentTime = 0;
//        [self.kick1PlayerSample14 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample15 isPlaying]) {
//        [self.kick1PlayerSample15 stop];
//        self.kick1PlayerSample15.currentTime = 0;
//        [self.kick1PlayerSample15 prepareToPlay];
//    }
//    if ([self.kick1PlayerSample16 isPlaying]) {
//        [self.kick1PlayerSample16 stop];
//        self.kick1PlayerSample16.currentTime = 0;
//        [self.kick1PlayerSample16 prepareToPlay];
//    }
    
    
    
    
    
    
    
    
    
    
    
//    if ([self.kick2Player isPlaying]) {
//        [self.kick2Player stop];
//        self.kick2Player.currentTime = 0;
//        [self.kick2Player prepareToPlay];
//    }
//
//    if ([self.kick3Player isPlaying]) {
//        [self.kick3Player stop];
//        self.kick3Player.currentTime = 0;
//        [self.kick3Player prepareToPlay];
//    }
//
//    if ([self.kick4Player isPlaying]) {
//        [self.kick4Player stop];
//        self.kick4Player.currentTime = 0;
//        [self.kick4Player prepareToPlay];
//    }
//    
//    if ([self.kick5Player isPlaying]) {
//        [self.kick5Player stop];
//        self.kick5Player.currentTime = 0;
//        [self.kick5Player prepareToPlay];
//    }
//
//    if ([self.kick6Player isPlaying]) {
//        [self.kick6Player stop];
//        self.kick6Player.currentTime = 0;
//        [self.kick6Player prepareToPlay];
//    }
    
    if ([self.snare1Player isPlaying]) {
        [self.snare1Player stop];
        self.snare1Player.currentTime = 0;
        [self.snare1Player prepareToPlay];
    }
    
    if ([self.snare2Player isPlaying]) {
        [self.snare2Player stop];
        self.snare2Player.currentTime = 0;
        [self.snare2Player prepareToPlay];
    }
    
    if ([self.snare3Player isPlaying]) {
        [self.snare3Player stop];
        self.snare3Player.currentTime = 0;
        [self.snare3Player prepareToPlay];
    }
    
    if ([self.snare4Player isPlaying]) {
        [self.snare4Player stop];
        self.snare4Player.currentTime = 0;
        [self.snare4Player prepareToPlay];
    }
    
    if ([self.snare5Player isPlaying]) {
        [self.snare5Player stop];
        self.snare5Player.currentTime = 0;
        [self.snare5Player prepareToPlay];
    }
    
    if ([self.snare6Player isPlaying]) {
        [self.snare6Player stop];
        self.snare6Player.currentTime = 0;
        [self.snare6Player prepareToPlay];
    }
    
    if ([self.tom1Player isPlaying]) {
        [self.tom1Player stop];
        self.tom1Player.currentTime = 0;
        [self.tom1Player prepareToPlay];
    }
    
    if ([self.tom2Player isPlaying]) {
        [self.tom2Player stop];
        self.tom2Player.currentTime = 0;
        [self.tom2Player prepareToPlay];
    }
    
    if ([self.tom3Player isPlaying]) {
        [self.tom3Player stop];
        self.tom3Player.currentTime = 0;
        [self.tom3Player prepareToPlay];
    }
    
    if ([self.tom4Player isPlaying]) {
        [self.tom4Player stop];
        self.tom4Player.currentTime = 0;
        [self.tom4Player prepareToPlay];
    }
    
    if ([self.tom5Player isPlaying]) {
        [self.tom5Player stop];
        self.tom5Player.currentTime = 0;
        [self.tom5Player prepareToPlay];
    }
    
    if ([self.tom6Player isPlaying]) {
        [self.tom6Player stop];
        self.tom6Player.currentTime = 0;
        [self.tom6Player prepareToPlay];
    }
    
    if ([self.hihat1Player isPlaying]) {
        [self.hihat1Player stop];
        self.hihat1Player.currentTime = 0;
        [self.hihat1Player prepareToPlay];
    }
    
    if ([self.hihat2Player isPlaying]) {
        [self.hihat2Player stop];
        self.hihat2Player.currentTime = 0;
        [self.hihat2Player prepareToPlay];
    }
    
    if ([self.hihat3Player isPlaying]) {
        [self.hihat3Player stop];
        self.hihat3Player.currentTime = 0;
        [self.hihat3Player prepareToPlay];
    }
    
    if ([self.hihat4Player isPlaying]) {
        [self.hihat4Player stop];
        self.hihat4Player.currentTime = 0;
        [self.hihat4Player prepareToPlay];
    }
    if ([self.hihat5Player isPlaying]) {
        [self.hihat5Player stop];
        self.hihat5Player.currentTime = 0;
        [self.hihat5Player prepareToPlay];
    }
    if ([self.hihat6Player isPlaying]) {
        [self.hihat6Player stop];
        self.hihat6Player.currentTime = 0;
        [self.hihat6Player prepareToPlay];
    }
    
    if ([self.cymbal1Player isPlaying]) {
        [self.cymbal1Player stop];
        self.cymbal1Player.currentTime = 0;
        [self.cymbal1Player prepareToPlay];
    }
    
    if ([self.cymbal2Player isPlaying]) {
        [self.cymbal2Player stop];
        self.cymbal2Player.currentTime = 0;
        [self.cymbal2Player prepareToPlay];
    }
    
    if ([self.cymbal3Player isPlaying]) {
        [self.cymbal3Player stop];
        self.cymbal3Player.currentTime = 0;
        [self.cymbal3Player prepareToPlay];
    }
    
    if ([self.cymbal4Player isPlaying]) {
        [self.cymbal4Player stop];
        self.cymbal4Player.currentTime = 0;
        [self.cymbal4Player prepareToPlay];
    }
    
    if ([self.cymbal5Player isPlaying]) {
        [self.cymbal5Player stop];
        self.cymbal5Player.currentTime = 0;
        [self.cymbal5Player prepareToPlay];
    }
    
    if ([self.cymbal6Player isPlaying]) {
        [self.cymbal6Player stop];
        self.cymbal6Player.currentTime = 0;
        [self.cymbal6Player prepareToPlay];
    }
    
    
    // rewind sequencer
    self.sampleNumber = 0;
    NSLog(@"Sequencer stopped");

}




# pragma mark Init Buttons alpha values
// optional to be called in viewDidLoad
// compulsory to be called when clearing sequence
-(void) initButtonsAlpha {
    
    for (UIButton *button in self.kickTrackButtons) {
        button.alpha = 0.65;
    }
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





// This method checks the sequencer's sequence for each track (...trackButtonsStateArray) and updates the UIButtons states and colors
// to be called when shifting sequence
-(void) refreshUIButtonsStates {
    if (kickTrackButtonsStateArray[0] == 0) {
        self.kickButton1.selected = false;
        self.kickButton1.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[0] == 01) {self.kickButton1.selected = true;
        self.kickButton1.backgroundColor = [UIColor grayColor];}
    
    
    if (kickTrackButtonsStateArray[1] == 0) {
        self.kickButton2.selected = false;
        self.kickButton2.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[1] == 1){self.kickButton2.selected = true;
        self.kickButton2.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[2] == 0) {
        self.kickButton3.selected = false;
        self.kickButton3.backgroundColor = [UIColor lightGrayColor];

    }
    else if (kickTrackButtonsStateArray[2] == 1){self.kickButton3.selected = true;
        self.kickButton3.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[3] == 0) {
        self.kickButton4.selected = false;
        self.kickButton4.backgroundColor = [UIColor lightGrayColor];

    }
    else if (kickTrackButtonsStateArray[3] == 1) {self.kickButton4.selected = true;
        self.kickButton4.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[4] == 0) {
        self.kickButton5.selected = false;
        self.kickButton5.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[4] == 1) {self.kickButton5.selected = true;
        self.kickButton5.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[5] == 0) {
        self.kickButton6.selected = false;
        self.kickButton6.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[5] == 1) {self.kickButton6.selected = true;
        self.kickButton6.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[6] == 0) {
        self.kickButton7.selected = false;
        self.kickButton7.backgroundColor = [UIColor lightGrayColor];
    }
    
    else if (kickTrackButtonsStateArray[6] == 1){self.kickButton7.selected = true;
        self.kickButton7.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[7] == 0) {
        self.kickButton8.selected = false;
        self.kickButton8.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[7] == 1) {self.kickButton8.selected = true;
        self.kickButton8.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[8] == 0) {
        self.kickButton9.selected = false;
        self.kickButton9.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[8] == 1) {self.kickButton9.selected = true;
        self.kickButton9.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[9] == 0) {
        self.kickButton10.selected = false;
        self.kickButton10.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[9] == 1) {self.kickButton10.selected = true;
        self.kickButton10.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[10] == 0) {
        self.kickButton11.selected = false;
        self.kickButton11.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[10] == 1){self.kickButton11.selected = true;
        self.kickButton11.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[11] == 0) {
        self.kickButton12.selected = false;
        self.kickButton12.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[11] == 1){self.kickButton12.selected = true;
        self.kickButton12.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[12] == 0) {
        self.kickButton13.selected = false;
        self.kickButton13.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[12] == 1){self.kickButton13.selected = true;
        self.kickButton13.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[13] == 0) {
        self.kickButton14.selected = false;
        self.kickButton14.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[13] == 1) {self.kickButton14.selected = true;
        self.kickButton14.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[14] == 0) {
        self.kickButton15.selected = false;
        self.kickButton15.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[14] == 1) {self.kickButton15.selected = true;
        self.kickButton15.backgroundColor = [UIColor grayColor];
    }
    
    if (kickTrackButtonsStateArray[15] == 0) {
        self.kickButton16.selected = false;
        self.kickButton16.backgroundColor = [UIColor lightGrayColor];
    }
    else if (kickTrackButtonsStateArray[15] == 1){self.kickButton16.selected = true;
        self.kickButton16.backgroundColor = [UIColor grayColor];
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














@end








