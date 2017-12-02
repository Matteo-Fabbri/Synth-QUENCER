//
//  Data.m
//  Synth
//
//  Created by Matteo Fabbri on 18/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import "Data.h"
#import <AVFoundation/AVFoundation.h>


@implementation Data

// synthesise properties (compiler creates getters and setters for me)
// TRY IF IT IS POSSIBLE TO LIVE WITHOUT SYNTHESISING
@synthesize kickSample1Volume =_kickSample1Volume;



static Data *_sharedInstance;



- (id) init {
    if (self = [super init]) {
        // custom initialization
        
        // I couldn't find a way to mute the pickers from the pickers' logic itself, so I change the AVAudioSession category
        // idea taken here: https://github.com/lionheart/openradar-mirror/issues/14597
        // implementation learned from Apple doc: https://developer.apple.com/documentation/avfoundation/avaudiosession
        // Basically, I access the app's audiosession singleton and call a method to set a category where the playback of sound is a priority (so that the pickers will be silent)
        _sharedInstance.thisAppAudioSession = [AVAudioSession sharedInstance];
        [_sharedInstance.thisAppAudioSession setCategory:@"AVAudioSessionCategoryPlayback" error:nil];
        // activate the session
        [_sharedInstance.thisAppAudioSession setActive:true error:nil];
        
        // set default sounds to be played for each track and initialise ALL audio files
        [self setUpKickAudioPlayersArray];
        [self setUpHiHatAudioPlayersArray];
        [self setSnareAudioPlayersArray];
        [self setUpTomAudioPlayersArray];
    }
    return self;
}







// if the shared instance doesn't already exist, this method creates it
+ (Data *) sharedInstance {
    if (!_sharedInstance) {
        _sharedInstance = [[Data alloc]init];
    }
    return _sharedInstance;
}



// Here I create a method which takes an argument (sampleNumber) and returns the relative amplitude
// Will do the Same for each track
+ (float) getKickAmplitudeAtSample:(int)sample {
    float volume = 0;
    if (sample == 0) {
        volume = _sharedInstance.kickSample1Volume;
    }
    else if (sample == 1) {
        volume = _sharedInstance.kickSample2Volume;
    }
    else if (sample == 2) {
        volume = _sharedInstance.kickSample3Volume;
    }
    else if (sample == 3) {
        volume = _sharedInstance.kickSample4Volume;
    }
    else if (sample == 4) {
        volume = _sharedInstance.kickSample5Volume;
    }
    else if (sample == 5) {
        volume = _sharedInstance.kickSample6Volume;
    }
    else if (sample == 6) {
        volume = _sharedInstance.kickSample7Volume;
    }
    else if (sample == 7) {
        volume = _sharedInstance.kickSample8Volume;
    }
    else if (sample == 8) {
        volume = _sharedInstance.kickSample9Volume;
    }
    else if (sample == 9) {
        volume = _sharedInstance.kickSample10Volume;
    }
    else if (sample == 10) {
        volume = _sharedInstance.kickSample11Volume;
    }
    else if (sample == 11) {
        volume = _sharedInstance.kickSample12Volume;
    }
    else if (sample == 12) {
        volume = _sharedInstance.kickSample13Volume;
    }
    else if (sample == 13) {
        volume = _sharedInstance.kickSample14Volume;
    }
    else if (sample == 14) {
        volume = _sharedInstance.kickSample15Volume;
    }
    else if (sample == 15) {
        volume = _sharedInstance.kickSample16Volume;
    }
        return volume;
}




// the same with a setter instead of getter (I will call this method in Velocities' picker viws didselectRow methods)
// this function doesn't return anything, but sets this class properties, which will be basically GLOBAL VARIABLES, since they exist into a _sharedInstance, which is always the same wherever is called
+ (void) setKickAmplitude:(float)amp atSample:(int)sample {
    if (sample == 0) {
    _sharedInstance.kickSample1Volume = amp;
    }
    else if (sample == 1) {
        _sharedInstance.kickSample2Volume = amp;
    }
    else if (sample == 2) {
        _sharedInstance.kickSample3Volume = amp;
    }
    else if (sample == 3) {
        _sharedInstance.kickSample4Volume = amp;
    }
    else if (sample == 4) {
        _sharedInstance.kickSample5Volume = amp;
    }
    else if (sample == 5) {
        _sharedInstance.kickSample6Volume = amp;
    }
    else if (sample == 6) {
        _sharedInstance.kickSample7Volume = amp;
    }
    else if (sample == 7) {
        _sharedInstance.kickSample8Volume = amp;
    }
    else if (sample == 8) {
        _sharedInstance.kickSample9Volume = amp;
    }
    else if (sample == 9) {
        _sharedInstance.kickSample10Volume = amp;
    }
    else if (sample == 10) {
        _sharedInstance.kickSample11Volume = amp;
    }
    else if (sample == 11) {
        _sharedInstance.kickSample12Volume = amp;
    }
    else if (sample == 12) {
        _sharedInstance.kickSample13Volume = amp;
    }
    else if (sample == 13) {
        _sharedInstance.kickSample14Volume = amp;
    }
    else if (sample == 14) {
        _sharedInstance.kickSample15Volume = amp;
    }
    else if (sample == 15) {
        _sharedInstance.kickSample16Volume = amp;
    }
}












# pragma mark setUpKickAudioPlayers

// Here I create a custom method to initialise the AudioPlayers for the kick
// As default setting all the sounds played will be number 1
// THIS METHOD WILL BE CALLED IN THIS CLASS CONVENIENCE INIT METHOD
-(void) setUpKickAudioPlayersArray {
    
    // In order to set up AudioPlayers for the drum sequencer we need to create path and URLs
    // Creating file paths for different kick audio files
    NSString *kick1FilePath = [[NSBundle mainBundle] pathForResource:@"kick1" ofType:@"wav"];
    NSString *kick2FilePath = [[NSBundle mainBundle] pathForResource:@"kick2" ofType:@"wav"];
    NSString *kick3FilePath = [[NSBundle mainBundle] pathForResource:@"kick3" ofType:@"wav"];
    
    
    // Creating URLs of kick file paths
        NSURL *kick1FileUrl = [[NSURL alloc] initFileURLWithPath: kick1FilePath];
        NSURL *kick2FileUrl = [[NSURL alloc] initFileURLWithPath: kick2FilePath];
        NSURL *kick3FileUrl = [[NSURL alloc] initFileURLWithPath: kick3FilePath];
    
    
    
    
    // initialising kick AudioPlayer objects for kick sound 1
    
    self.kick1PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    self.kick1PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick1FileUrl error: nil];
    
    


    
    // prepare them to play
    [self.kick1PlayerSample1 prepareToPlay];
    [self.kick1PlayerSample2 prepareToPlay];
    [self.kick1PlayerSample3 prepareToPlay];
    [self.kick1PlayerSample4 prepareToPlay];
    [self.kick1PlayerSample5 prepareToPlay];
    [self.kick1PlayerSample6 prepareToPlay];
    [self.kick1PlayerSample7 prepareToPlay];
    [self.kick1PlayerSample8 prepareToPlay];
    [self.kick1PlayerSample9 prepareToPlay];
    [self.kick1PlayerSample10 prepareToPlay];
    [self.kick1PlayerSample11 prepareToPlay];
    [self.kick1PlayerSample12 prepareToPlay];
    [self.kick1PlayerSample13 prepareToPlay];
    [self.kick1PlayerSample14 prepareToPlay];
    [self.kick1PlayerSample15 prepareToPlay];
    [self.kick1PlayerSample16 prepareToPlay];
    
    
    
    // initialising kick AudioPlayer objects for kick sound 2
    
    self.kick2PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    self.kick2PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick2FileUrl error: nil];
    
    
    
    
    
    // prepare them to play
    [self.kick2PlayerSample1 prepareToPlay];
    [self.kick2PlayerSample2 prepareToPlay];
    [self.kick2PlayerSample3 prepareToPlay];
    [self.kick2PlayerSample4 prepareToPlay];
    [self.kick2PlayerSample5 prepareToPlay];
    [self.kick2PlayerSample6 prepareToPlay];
    [self.kick2PlayerSample7 prepareToPlay];
    [self.kick2PlayerSample8 prepareToPlay];
    [self.kick2PlayerSample9 prepareToPlay];
    [self.kick2PlayerSample10 prepareToPlay];
    [self.kick2PlayerSample11 prepareToPlay];
    [self.kick2PlayerSample12 prepareToPlay];
    [self.kick2PlayerSample13 prepareToPlay];
    [self.kick2PlayerSample14 prepareToPlay];
    [self.kick2PlayerSample15 prepareToPlay];
    [self.kick2PlayerSample16 prepareToPlay];
    
    
    // initialising kick AudioPlayer objects for kick sound 3
    
    self.kick3PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    self.kick3PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick3FileUrl error: nil];
    
    
    
    
    
    // prepare them to play
    [self.kick3PlayerSample1 prepareToPlay];
    [self.kick3PlayerSample2 prepareToPlay];
    [self.kick3PlayerSample3 prepareToPlay];
    [self.kick3PlayerSample4 prepareToPlay];
    [self.kick3PlayerSample5 prepareToPlay];
    [self.kick3PlayerSample6 prepareToPlay];
    [self.kick3PlayerSample7 prepareToPlay];
    [self.kick3PlayerSample8 prepareToPlay];
    [self.kick3PlayerSample9 prepareToPlay];
    [self.kick3PlayerSample10 prepareToPlay];
    [self.kick3PlayerSample11 prepareToPlay];
    [self.kick3PlayerSample12 prepareToPlay];
    [self.kick3PlayerSample13 prepareToPlay];
    [self.kick3PlayerSample14 prepareToPlay];
    [self.kick3PlayerSample15 prepareToPlay];
    [self.kick3PlayerSample16 prepareToPlay];
    
    
    
    // initialise array of audioplayers
    // By default the samples to be played will be the number 1 of each track
    // I will allow changes on this from the "Drum sounds and reverb" view controller
    self.kickPlayersArray = [[NSMutableArray alloc] initWithObjects:self.kick1PlayerSample1, self.kick1PlayerSample2, self.kick1PlayerSample3, self.kick1PlayerSample4, self.kick1PlayerSample5, self.kick1PlayerSample6, self.kick1PlayerSample7, self.kick1PlayerSample8, self.kick1PlayerSample9, self.kick1PlayerSample10, self.kick1PlayerSample11, self.kick1PlayerSample12, self.kick1PlayerSample13, self.kick1PlayerSample14, self.kick1PlayerSample15, self.kick1PlayerSample16, nil];
    
}

# pragma mark SetUpHiHat AudioPlayers

-(void) setUpHiHatAudioPlayersArray {
    
    // In order to set up AudioPlayers for the drum sequencer we need to create path and URLs
    // Creating file paths for different hi-hat audio files
    NSString *hiHat1FilePath = [[NSBundle mainBundle] pathForResource:@"hi-hat1" ofType:@"wav"];
    NSString *hiHat2FilePath = [[NSBundle mainBundle] pathForResource:@"hi-hat2" ofType:@"wav"];
    NSString *hiHat3FilePath = [[NSBundle mainBundle] pathForResource:@"hi-hat3" ofType:@"wav"];
   
    
    // Creating URLs of kick file paths
    NSURL *hiHat1FileUrl = [[NSURL alloc] initFileURLWithPath: hiHat1FilePath];
    NSURL *hiHat2FileUrl = [[NSURL alloc] initFileURLWithPath: hiHat2FilePath];
    NSURL *hiHat3FileUrl = [[NSURL alloc] initFileURLWithPath: hiHat3FilePath];
   
    
    
    // initialising kick AudioPlayer objects for kick sound 1
    
    self.hiHat1PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    self.hiHat1PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat1FileUrl error: nil];
    
    
    
    
    
    // prepare them to play
    [self.kick1PlayerSample1 prepareToPlay];
    [self.kick1PlayerSample2 prepareToPlay];
    [self.kick1PlayerSample3 prepareToPlay];
    [self.kick1PlayerSample4 prepareToPlay];
    [self.kick1PlayerSample5 prepareToPlay];
    [self.kick1PlayerSample6 prepareToPlay];
    [self.kick1PlayerSample7 prepareToPlay];
    [self.kick1PlayerSample8 prepareToPlay];
    [self.kick1PlayerSample9 prepareToPlay];
    [self.kick1PlayerSample10 prepareToPlay];
    [self.kick1PlayerSample11 prepareToPlay];
    [self.kick1PlayerSample12 prepareToPlay];
    [self.kick1PlayerSample13 prepareToPlay];
    [self.kick1PlayerSample14 prepareToPlay];
    [self.kick1PlayerSample15 prepareToPlay];
    [self.kick1PlayerSample16 prepareToPlay];
    
    
    
    // initialising kick AudioPlayer objects for kick sound 2
    
    self.hiHat2PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    self.hiHat2PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat2FileUrl error: nil];
    
    
    
    
    
    // prepare them to play
    [self.hiHat2PlayerSample1 prepareToPlay];
    [self.hiHat2PlayerSample2 prepareToPlay];
    [self.hiHat2PlayerSample3 prepareToPlay];
    [self.hiHat2PlayerSample4 prepareToPlay];
    [self.hiHat2PlayerSample5 prepareToPlay];
    [self.hiHat2PlayerSample6 prepareToPlay];
    [self.hiHat2PlayerSample7 prepareToPlay];
    [self.hiHat2PlayerSample8 prepareToPlay];
    [self.hiHat2PlayerSample9 prepareToPlay];
    [self.hiHat2PlayerSample10 prepareToPlay];
    [self.hiHat2PlayerSample11 prepareToPlay];
    [self.hiHat2PlayerSample12 prepareToPlay];
    [self.hiHat2PlayerSample13 prepareToPlay];
    [self.hiHat2PlayerSample14 prepareToPlay];
    [self.hiHat2PlayerSample15 prepareToPlay];
    [self.hiHat2PlayerSample16 prepareToPlay];
    
    
    // initialising kick AudioPlayer objects for kick sound 3
    
    self.hiHat3PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    self.hiHat3PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: hiHat3FileUrl error: nil];
    
    
    
    
    
    // prepare them to play
    [self.hiHat3PlayerSample1 prepareToPlay];
    [self.hiHat3PlayerSample2 prepareToPlay];
    [self.hiHat3PlayerSample3 prepareToPlay];
    [self.hiHat3PlayerSample4 prepareToPlay];
    [self.hiHat3PlayerSample5 prepareToPlay];
    [self.hiHat3PlayerSample6 prepareToPlay];
    [self.hiHat3PlayerSample7 prepareToPlay];
    [self.hiHat3PlayerSample8 prepareToPlay];
    [self.hiHat3PlayerSample9 prepareToPlay];
    [self.hiHat3PlayerSample10 prepareToPlay];
    [self.hiHat3PlayerSample11 prepareToPlay];
    [self.hiHat3PlayerSample12 prepareToPlay];
    [self.hiHat3PlayerSample13 prepareToPlay];
    [self.hiHat3PlayerSample14 prepareToPlay];
    [self.hiHat3PlayerSample15 prepareToPlay];
    [self.hiHat3PlayerSample16 prepareToPlay];
    
    // initialise array of audioplayers
    // By default the samples to be played will be the number 1 of each track
    // I will allow changes on this from the "Drum sounds and reverb" view controller
    self.hiHatPlayersArray = [[NSMutableArray alloc] initWithObjects:self.hiHat1PlayerSample1, self.hiHat1PlayerSample2, self.hiHat1PlayerSample3, self.hiHat1PlayerSample4, self.hiHat1PlayerSample5, self.hiHat1PlayerSample6, self.hiHat1PlayerSample7, self.hiHat1PlayerSample8, self.hiHat1PlayerSample9, self.hiHat1PlayerSample10, self.hiHat1PlayerSample11, self.hiHat1PlayerSample12, self.hiHat1PlayerSample13, self.hiHat1PlayerSample14, self.hiHat1PlayerSample15, self.hiHat1PlayerSample16, nil];
    
}


# pragma mark Hi hat amplitudes
+ (void) setHiHatMixVolume:(float) mixVolume {
    _sharedInstance.hiHatMixVolume = (mixVolume/100);
}
+ (float) getHiHatMixVolume {
    return _sharedInstance.hiHatMixVolume;
}

# pragma mark GET and SET hi hat amplitude at sample
+ (float) getHiHatAmplitudeAtSample:(int)sample {
    float volume = 0;
    if (sample == 0) {
        volume = _sharedInstance.hiHatSample1Volume;
    }
    else if (sample == 1) {
        volume = _sharedInstance.hiHatSample2Volume;
    }
    else if (sample == 2) {
        volume = _sharedInstance.hiHatSample3Volume;
    }
    else if (sample == 3) {
        volume = _sharedInstance.hiHatSample4Volume;
    }
    else if (sample == 4) {
        volume = _sharedInstance.hiHatSample5Volume;
    }
    else if (sample == 5) {
        volume = _sharedInstance.hiHatSample6Volume;
    }
    else if (sample == 6) {
        volume = _sharedInstance.hiHatSample7Volume;
    }
    else if (sample == 7) {
        volume = _sharedInstance.hiHatSample8Volume;
    }
    else if (sample == 8) {
        volume = _sharedInstance.hiHatSample9Volume;
    }
    else if (sample == 9) {
        volume = _sharedInstance.hiHatSample10Volume;
    }
    else if (sample == 10) {
        volume = _sharedInstance.hiHatSample11Volume;
    }
    else if (sample == 11) {
        volume = _sharedInstance.hiHatSample12Volume;
    }
    else if (sample == 12) {
        volume = _sharedInstance.hiHatSample13Volume;
    }
    else if (sample == 13) {
        volume = _sharedInstance.hiHatSample14Volume;
    }
    else if (sample == 14) {
        volume = _sharedInstance.hiHatSample15Volume;
    }
    else if (sample == 15) {
        volume = _sharedInstance.hiHatSample16Volume;
    }
    return volume;
}


+ (void) setHiHatAmplitude:(float)amp atSample:(int)sample {
    if (sample == 0) {
        _sharedInstance.hiHatSample1Volume = amp;
    }
    else if (sample == 1) {
        _sharedInstance.hiHatSample2Volume = amp;
    }
    else if (sample == 2) {
        _sharedInstance.hiHatSample3Volume = amp;
    }
    else if (sample == 3) {
        _sharedInstance.hiHatSample4Volume = amp;
    }
    else if (sample == 4) {
        _sharedInstance.hiHatSample5Volume = amp;
    }
    else if (sample == 5) {
        _sharedInstance.hiHatSample6Volume = amp;
    }
    else if (sample == 6) {
        _sharedInstance.hiHatSample7Volume = amp;
    }
    else if (sample == 7) {
        _sharedInstance.hiHatSample8Volume = amp;
    }
    else if (sample == 8) {
        _sharedInstance.hiHatSample9Volume = amp;
    }
    else if (sample == 9) {
        _sharedInstance.hiHatSample10Volume = amp;
    }
    else if (sample == 10) {
        _sharedInstance.hiHatSample11Volume = amp;
    }
    else if (sample == 11) {
        _sharedInstance.hiHatSample12Volume = amp;
    }
    else if (sample == 12) {
        _sharedInstance.hiHatSample13Volume = amp;
    }
    else if (sample == 13) {
        _sharedInstance.hiHatSample14Volume = amp;
    }
    else if (sample == 14) {
        _sharedInstance.hiHatSample15Volume = amp;
    }
    else if (sample == 15) {
        _sharedInstance.hiHatSample16Volume = amp;
    }
}


# pragma mark GET and SET hihat sounds
+(void) setHiHatSound:(int)sound atSample:(int)sampleNumber {
    if (sampleNumber == 0) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.hiHat1PlayerSample1];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.hiHat2PlayerSample1];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.hiHat3PlayerSample1];
        }
       
    }
    
    else if (sampleNumber == 1) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.hiHat1PlayerSample2];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.hiHat2PlayerSample2];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.hiHat3PlayerSample2];
        }
       
    }
    
    else if (sampleNumber == 2) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.hiHat1PlayerSample3];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.hiHat2PlayerSample3];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.hiHat3PlayerSample3];
        }
        
    }
    
    else if (sampleNumber == 3) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.hiHat1PlayerSample4];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.hiHat2PlayerSample4];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.hiHat3PlayerSample4];
        }
       
    }
    
    else if (sampleNumber == 4) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.hiHat1PlayerSample5];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.hiHat2PlayerSample5];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.hiHat3PlayerSample5];
        }
        
    }
    
    else if (sampleNumber == 5) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.hiHat1PlayerSample6];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.hiHat2PlayerSample6];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.hiHat3PlayerSample6];
        }
       
    }
    
    else if (sampleNumber == 6) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.hiHat1PlayerSample7];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.hiHat2PlayerSample7];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.hiHat3PlayerSample7];
        }
        
    }
    
    else if (sampleNumber == 7) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.hiHat1PlayerSample8];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.hiHat2PlayerSample8];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.hiHat3PlayerSample8];
        }
      
    }
    
    else if (sampleNumber == 8) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.hiHat1PlayerSample9];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.hiHat2PlayerSample9];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.hiHat3PlayerSample9];
        }
      
    }
    
    else if (sampleNumber == 9) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.hiHat1PlayerSample10];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.hiHat2PlayerSample10];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.hiHat3PlayerSample10];
        }
       
    }
    
    else if (sampleNumber == 10) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.hiHat1PlayerSample11];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.hiHat2PlayerSample11];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.hiHat3PlayerSample11];
        }
      
    }
    
    else if (sampleNumber == 11) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.hiHat1PlayerSample12];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.hiHat2PlayerSample12];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.hiHat3PlayerSample12];
        }
       
    }
    
    else if (sampleNumber == 12) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.hiHat1PlayerSample13];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.hiHat2PlayerSample13];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.hiHat3PlayerSample13];
        }
        
    }
    
    else if (sampleNumber == 13) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.hiHat1PlayerSample14];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.hiHat2PlayerSample14];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.hiHat3PlayerSample14];
        }
       
    }
    
    else if (sampleNumber == 14) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.hiHat1PlayerSample15];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.hiHat2PlayerSample15];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.hiHat3PlayerSample15];
        }
       
    }
    
    else if (sampleNumber == 15) {
        if (sound == 0) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.hiHat1PlayerSample16];
        }
        else if (sound == 1) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.hiHat2PlayerSample16];
        }
        else if (sound == 2) {
            [_sharedInstance.hiHatPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.hiHat3PlayerSample16];
        }
        
    }

}


+(AVAudioPlayer *) getHiHatSoundAtSample:(int)sampleNumber {
    AVAudioPlayer *audioPlayerObject = [[AVAudioPlayer alloc]init];
    
    audioPlayerObject = _sharedInstance.hiHatPlayersArray[sampleNumber];
    
    return audioPlayerObject;
}




# pragma mark SETTER Kick PAN
// method called by slider on Load sounds view controller
// setting pan of ALL kick sounds at ALL sample numbers
+(void) setHiHatPan:(float)pan {
    float panScaled = (pan/100);
    [_sharedInstance.hiHat1PlayerSample1 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample2 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample3 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample4 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample5 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample6 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample7 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample8 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample9 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample10 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample11 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample12 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample13 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample14 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample15 setPan:panScaled];
    [_sharedInstance.hiHat1PlayerSample16 setPan:panScaled];
    
    [_sharedInstance.hiHat2PlayerSample1 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample2 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample3 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample4 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample5 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample6 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample7 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample8 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample9 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample10 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample11 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample12 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample13 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample14 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample15 setPan:panScaled];
    [_sharedInstance.hiHat2PlayerSample16 setPan:panScaled];
    
    [_sharedInstance.hiHat3PlayerSample1 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample2 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample3 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample4 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample5 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample6 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample7 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample8 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample9 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample10 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample11 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample12 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample13 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample14 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample15 setPan:panScaled];
    [_sharedInstance.hiHat3PlayerSample16 setPan:panScaled];
    
   
}



# pragma mark Mute unmute hihat track
+(void) unMuteHiHatTrack:(float)withMixVolume {
    _sharedInstance.hiHatMixVolume = withMixVolume;
}
+(void) muteHiHatTrack {
    _sharedInstance.hiHatMixVolume = 0;
}






# pragma mark GET and SET Kick amplitude at sample
// declaring a function that takes 2 arguments and sets a particular audioplayer object at a particular index of the track array (kickPlayersArray, snarePlayersArray)
// I Will call this from Drum sounds viewController class' pickerviews, where each component corresponds to a different index of the track array (which is analogous to a different sample number in the Sequencer), and the rows corresponds to different audioplayer objects "rearranged" (taken out or put back in) in a particular index of the track array
+(void) setKickSound:(int)sound atSample:(int)sampleNumber {
    
// I use else ifs so that the process will be faster
    if (sampleNumber == 0) {
    if (sound == 0) {
        [_sharedInstance.kickPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.kick1PlayerSample1];
    }
    else if (sound == 1) {
            [_sharedInstance.kickPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.kick2PlayerSample1];
        }
    else if (sound == 2) {
        [_sharedInstance.kickPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.kick3PlayerSample1];
    }
  
}
    
    else if (sampleNumber == 1) {
        if (sound == 0) {
            [_sharedInstance.kickPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.kick1PlayerSample2];
        }
        else if (sound == 1) {
            [_sharedInstance.kickPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.kick2PlayerSample2];
        }
        else if (sound == 2) {
            [_sharedInstance.kickPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.kick3PlayerSample2];
        }
       
    }
        
        else if (sampleNumber == 2) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.kick1PlayerSample3];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.kick2PlayerSample3];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.kick3PlayerSample3];
            }
           
         }
        
        else if (sampleNumber == 3) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.kick1PlayerSample4];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.kick2PlayerSample4];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.kick3PlayerSample4];
            }
          
        }

       else if (sampleNumber == 4) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.kick1PlayerSample5];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.kick2PlayerSample5];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.kick3PlayerSample5];
            }
           
        }

        else if (sampleNumber == 5) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.kick1PlayerSample6];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.kick2PlayerSample6];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.kick3PlayerSample6];
            }
          
        }
        
        else if (sampleNumber == 6) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.kick1PlayerSample7];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.kick2PlayerSample7];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.kick3PlayerSample7];
            }
          
        }

        else if (sampleNumber == 7) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.kick1PlayerSample8];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.kick2PlayerSample8];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.kick3PlayerSample8];
            }
          
        }

        else if (sampleNumber == 8) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.kick1PlayerSample9];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.kick2PlayerSample9];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.kick3PlayerSample9];
            }
         
        }

        else if (sampleNumber == 9) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.kick1PlayerSample10];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.kick2PlayerSample10];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.kick3PlayerSample10];
            }
       
        }

       else if (sampleNumber == 10) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.kick1PlayerSample11];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.kick2PlayerSample11];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.kick3PlayerSample11];
            }
        
        }

        else if (sampleNumber == 11) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.kick1PlayerSample12];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.kick2PlayerSample12];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.kick3PlayerSample12];
            }
        
        }

        else if (sampleNumber == 12) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.kick1PlayerSample13];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.kick2PlayerSample13];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.kick3PlayerSample13];
            }
          
        }

        else if (sampleNumber == 13) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.kick1PlayerSample14];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.kick2PlayerSample14];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.kick3PlayerSample14];
            }
          
        }

        else if (sampleNumber == 14) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.kick1PlayerSample15];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.kick2PlayerSample15];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.kick3PlayerSample15];
            }
           
        }

        else if (sampleNumber == 15) {
            if (sound == 0) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.kick1PlayerSample16];
            }
            else if (sound == 1) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.kick2PlayerSample16];
            }
            else if (sound == 2) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.kick3PlayerSample16];
            }
         
        }

}



# pragma mark GET and SET Kick sounds
// declaring a function which returns the audioplayer object to be played at a specific sampleNumber (will call this from Sequencer)
+(AVAudioPlayer *) getKickSoundAtSample:(int)sampleNumber {
    
    // This method returns an AVAudioPlayer corresponent to the wanted sampleNumber
    // The AVAudioPlayer object is taken from the correspondent index of the array
    AVAudioPlayer *audioPlayerObject = [[AVAudioPlayer alloc]init];
    
    audioPlayerObject = _sharedInstance.kickPlayersArray[sampleNumber];
    
    return audioPlayerObject;
}



# pragma mark SETTER Kick PAN
// method called by slider on Load sounds view controller
// setting pan of ALL kick sounds at ALL sample numbers
+(void) setKickPan:(float)pan {
    float panScaled = (pan/100);
    [_sharedInstance.kick1PlayerSample1 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample2 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample3 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample4 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample5 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample6 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample7 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample8 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample9 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample10 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample11 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample12 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample13 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample14 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample15 setPan:panScaled];
    [_sharedInstance.kick1PlayerSample16 setPan:panScaled];
    
    [_sharedInstance.kick2PlayerSample1 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample2 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample3 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample4 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample5 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample6 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample7 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample8 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample9 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample10 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample11 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample12 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample13 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample14 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample15 setPan:panScaled];
    [_sharedInstance.kick2PlayerSample16 setPan:panScaled];
    
    [_sharedInstance.kick3PlayerSample1 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample2 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample3 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample4 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample5 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample6 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample7 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample8 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample9 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample10 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample11 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample12 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample13 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample14 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample15 setPan:panScaled];
    [_sharedInstance.kick3PlayerSample16 setPan:panScaled];
    
   
}
                                    



# pragma mark Kick amplitudes
+ (void) setKickMixVolume:(float)mixVolume {
    _sharedInstance.kickMixVolume = (mixVolume/100);
}
+ (float) getKickMixVolume {
    return _sharedInstance.kickMixVolume;
}






# pragma mark Mute/unmute kick track
+(void) muteKickTrack {
    _sharedInstance.kickMixVolume = 0;
}
+(void) unMuteKickTrack:(float)withMixVolume {
    _sharedInstance.kickMixVolume = withMixVolume;
}



# pragma mark Master volume
+ (void) setMasterVolume:(float) withMasterVolume {
    _sharedInstance.masterVolume = withMasterVolume;
}
+ (float) getMasterVolume {
    return _sharedInstance.masterVolume;
}

+ (void) muteMasterTrack {
    _sharedInstance.masterVolume = 0;
}
+ (void) unMuteMasterTrack:(float) withVolume {
    _sharedInstance.masterVolume = withVolume;
}





#pragma mark nextsequence start and end
+ (int) getNextSequenceFirstSample {
    return _sharedInstance.nextSequenceFirstSample;
}
+ (int) getNextSequenceLastSample {
    return _sharedInstance.nextSequenceLastSample;
}



# pragma mark Various sections selectors (buttons)
// for each section n selected, set nexsequence values to their correspondent in section n
+ (void) section1Selected {
    _sharedInstance.nextSequenceFirstSample = _sharedInstance.section1FirstSample;
    _sharedInstance.nextSequenceLastSample = _sharedInstance.section1LastSample;
}
+ (void) section2Selected {
    _sharedInstance.nextSequenceFirstSample = _sharedInstance.section2FirstSample;
    _sharedInstance.nextSequenceLastSample = _sharedInstance.section2LastSample;
}
+ (void) section3Selected {
    _sharedInstance.nextSequenceFirstSample = _sharedInstance.section3FirstSample;
    _sharedInstance.nextSequenceLastSample = _sharedInstance.section3LastSample;
}
+ (void) section4Selected {
    _sharedInstance.nextSequenceFirstSample = _sharedInstance.section4FirstSample;
    _sharedInstance.nextSequenceLastSample = _sharedInstance.section4LastSample;
}


# pragma mark SEQUENCES first and last samples setters
// to be called by the picker views in Arranger view
+ (void) setSection1FirstSample: (int) firstSample {
    _sharedInstance.section1FirstSample = firstSample;
}
+ (void) setSection1LastSample: (int) lastSample {
    _sharedInstance.section1LastSample = lastSample;
}
+ (void) setSection2FirstSample: (int) firstSample {
    _sharedInstance.section2FirstSample = firstSample;
}
+ (void) setSection2LastSample: (int) lastSample {
    _sharedInstance.section2LastSample = lastSample;
}
+ (void) setSection3FirstSample: (int) firstSample {
    _sharedInstance.section3FirstSample = firstSample;
}
+ (void) setSection3LastSample: (int) lastSample {
    _sharedInstance.section3LastSample = lastSample;
}
+ (void) setSection4FirstSample: (int) firstSample {
    _sharedInstance.section4FirstSample = firstSample;
}
+ (void) setSection4LastSample: (int) lastSample {
    _sharedInstance.section4LastSample = lastSample;
}






# pragma mark setUP snare audio players array

-(void) setSnareAudioPlayersArray {
    
    // In order to set up AudioPlayers for the drum sequencer we need to create path and URLs
    // Creating file paths for different hi-hat audio files
    NSString *snare1FilePath = [[NSBundle mainBundle] pathForResource:@"snare1" ofType:@"wav"];
    NSString *snare2FilePath = [[NSBundle mainBundle] pathForResource:@"snare2" ofType:@"wav"];
    NSString *snare3FilePath = [[NSBundle mainBundle] pathForResource:@"snare3" ofType:@"wav"];
    
    
    // Creating URLs of kick file paths
    NSURL *snare1FileUrl = [[NSURL alloc] initFileURLWithPath: snare1FilePath];
    NSURL *snare2FileUrl = [[NSURL alloc] initFileURLWithPath: snare2FilePath];
    NSURL *snare3FileUrl = [[NSURL alloc] initFileURLWithPath: snare3FilePath];


    // initialising kick AudioPlayer objects for kick sound 1
    
    self.snare1PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    self.snare1PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare1FileUrl error: nil];
    
    
    
    
    
    
    // prepare them to play
    [self.snare1PlayerSample1 prepareToPlay];
    [self.snare1PlayerSample2 prepareToPlay];
    [self.snare1PlayerSample3 prepareToPlay];
    [self.snare1PlayerSample4 prepareToPlay];
    [self.snare1PlayerSample5 prepareToPlay];
    [self.snare1PlayerSample6 prepareToPlay];
    [self.snare1PlayerSample7 prepareToPlay];
    [self.snare1PlayerSample8 prepareToPlay];
    [self.snare1PlayerSample9 prepareToPlay];
    [self.snare1PlayerSample10 prepareToPlay];
    [self.snare1PlayerSample11 prepareToPlay];
    [self.snare1PlayerSample12 prepareToPlay];
    [self.snare1PlayerSample13 prepareToPlay];
    [self.snare1PlayerSample14 prepareToPlay];
    [self.snare1PlayerSample15 prepareToPlay];
    [self.snare1PlayerSample16 prepareToPlay];


    
    
    
    // initialising kick AudioPlayer objects for kick sound 2
    
    self.snare2PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    self.snare2PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare2FileUrl error: nil];
    
    
    
    
    
    
    // prepare them to play
    [self.snare2PlayerSample1 prepareToPlay];
    [self.snare2PlayerSample2 prepareToPlay];
    [self.snare2PlayerSample3 prepareToPlay];
    [self.snare2PlayerSample4 prepareToPlay];
    [self.snare2PlayerSample5 prepareToPlay];
    [self.snare2PlayerSample6 prepareToPlay];
    [self.snare2PlayerSample7 prepareToPlay];
    [self.snare2PlayerSample8 prepareToPlay];
    [self.snare2PlayerSample9 prepareToPlay];
    [self.snare2PlayerSample10 prepareToPlay];
    [self.snare2PlayerSample11 prepareToPlay];
    [self.snare2PlayerSample12 prepareToPlay];
    [self.snare2PlayerSample13 prepareToPlay];
    [self.snare2PlayerSample14 prepareToPlay];
    [self.snare2PlayerSample15 prepareToPlay];
    [self.snare2PlayerSample16 prepareToPlay];
    
    
    // initialising kick AudioPlayer objects for kick sound 3
    
    self.snare3PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    self.snare3PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: snare3FileUrl error: nil];
    
    
    
    
    
    
    // prepare them to play
    [self.snare3PlayerSample1 prepareToPlay];
    [self.snare3PlayerSample2 prepareToPlay];
    [self.snare3PlayerSample3 prepareToPlay];
    [self.snare3PlayerSample4 prepareToPlay];
    [self.snare3PlayerSample5 prepareToPlay];
    [self.snare3PlayerSample6 prepareToPlay];
    [self.snare3PlayerSample7 prepareToPlay];
    [self.snare3PlayerSample8 prepareToPlay];
    [self.snare3PlayerSample9 prepareToPlay];
    [self.snare3PlayerSample10 prepareToPlay];
    [self.snare3PlayerSample11 prepareToPlay];
    [self.snare3PlayerSample12 prepareToPlay];
    [self.snare3PlayerSample13 prepareToPlay];
    [self.snare3PlayerSample14 prepareToPlay];
    [self.snare3PlayerSample15 prepareToPlay];
    [self.snare3PlayerSample16 prepareToPlay];
    
    
    
    
    // initialise array of audioplayers
    // By default the samples to be played will be the number 1 of each track
    // I will allow changes on this from the "Drum sounds and reverb" view controller
    self.snarePlayersArray = [[NSMutableArray alloc] initWithObjects:self.snare1PlayerSample1, self.snare1PlayerSample2, self.snare1PlayerSample3, self.snare1PlayerSample4, self.snare1PlayerSample5, self.snare1PlayerSample6, self.snare1PlayerSample7, self.snare1PlayerSample8, self.snare1PlayerSample9, self.snare1PlayerSample10, self.snare1PlayerSample11, self.snare1PlayerSample12, self.snare1PlayerSample13, self.snare1PlayerSample14, self.snare1PlayerSample15, self.snare1PlayerSample16, nil];
    
}






# pragma mark Snare amplitudes
+ (void) setSnareMixVolume:(float) mixVolume {
    _sharedInstance.snareMixVolume = (mixVolume/100);
}
+ (float) getSnareMixVolume {
    return _sharedInstance.snareMixVolume;
}


# pragma mark get and set SNARE amplitude at sample
+ (float) getSnareAmplitudeAtSample:(int)sample {
    float volume = 0;
    if (sample == 0) {
        volume = _sharedInstance.snareSample1Volume;
    }
    else if (sample == 1) {
        volume = _sharedInstance.snareSample2Volume;
    }
    else if (sample == 2) {
        volume = _sharedInstance.snareSample3Volume;
    }
    else if (sample == 3) {
        volume = _sharedInstance.snareSample4Volume;
    }
    else if (sample == 4) {
        volume = _sharedInstance.snareSample5Volume;
    }
    else if (sample == 5) {
        volume = _sharedInstance.snareSample6Volume;
    }
    else if (sample == 6) {
        volume = _sharedInstance.snareSample7Volume;
    }
    else if (sample == 7) {
        volume = _sharedInstance.snareSample8Volume;
    }
    else if (sample == 8) {
        volume = _sharedInstance.snareSample9Volume;
    }
    else if (sample == 9) {
        volume = _sharedInstance.snareSample10Volume;
    }
    else if (sample == 10) {
        volume = _sharedInstance.snareSample11Volume;
    }
    else if (sample == 11) {
        volume = _sharedInstance.kickSample12Volume;
    }
    else if (sample == 12) {
        volume = _sharedInstance.snareSample13Volume;
    }
    else if (sample == 13) {
        volume = _sharedInstance.snareSample14Volume;
    }
    else if (sample == 14) {
        volume = _sharedInstance.snareSample15Volume;
    }
    else if (sample == 15) {
        volume = _sharedInstance.snareSample16Volume;
    }
    return volume;
}

# pragma mark set snare amplitude
+ (void) setSnareAmplitude:(float)amp atSample:(int)sample {
    if (sample == 0) {
        _sharedInstance.snareSample1Volume = amp;
    }
    else if (sample == 1) {
        _sharedInstance.snareSample2Volume = amp;
    }
    else if (sample == 2) {
        _sharedInstance.snareSample3Volume = amp;
    }
    else if (sample == 3) {
        _sharedInstance.snareSample4Volume = amp;
    }
    else if (sample == 4) {
        _sharedInstance.snareSample5Volume = amp;
    }
    else if (sample == 5) {
        _sharedInstance.snareSample6Volume = amp;
    }
    else if (sample == 6) {
        _sharedInstance.snareSample7Volume = amp;
    }
    else if (sample == 7) {
        _sharedInstance.snareSample8Volume = amp;
    }
    else if (sample == 8) {
        _sharedInstance.snareSample9Volume = amp;
    }
    else if (sample == 9) {
        _sharedInstance.snareSample10Volume = amp;
    }
    else if (sample == 10) {
        _sharedInstance.snareSample11Volume = amp;
    }
    else if (sample == 11) {
        _sharedInstance.snareSample12Volume = amp;
    }
    else if (sample == 12) {
        _sharedInstance.snareSample13Volume = amp;
    }
    else if (sample == 13) {
        _sharedInstance.snareSample14Volume = amp;
    }
    else if (sample == 14) {
        _sharedInstance.snareSample15Volume = amp;
    }
    else if (sample == 15) {
        _sharedInstance.snareSample16Volume = amp;
    }
}


# pragma mark GET and SET snare sounds
+(void) setSnareSound:(int)sound atSample:(int)sampleNumber {
    if (sampleNumber == 0) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.snare1PlayerSample1];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.snare2PlayerSample1];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.snare3PlayerSample1];
        }
    }
    
    else if (sampleNumber == 1) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.snare1PlayerSample2];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.snare2PlayerSample2];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.snare3PlayerSample2];
        }
       
    }
    
    else if (sampleNumber == 2) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.snare1PlayerSample3];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.snare2PlayerSample3];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.snare3PlayerSample3];
        }
        
    }
    
    else if (sampleNumber == 3) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.snare1PlayerSample4];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.snare2PlayerSample4];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.snare3PlayerSample4];
        }
      
    }
    
    else if (sampleNumber == 4) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.snare1PlayerSample5];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.snare2PlayerSample5];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.snare3PlayerSample5];
        }
       
    }
    
    else if (sampleNumber == 5) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.snare1PlayerSample6];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.snare2PlayerSample6];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.snare3PlayerSample6];
        }
        
    }
    
    else if (sampleNumber == 6) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.snare1PlayerSample7];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.snare2PlayerSample7];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.snare3PlayerSample7];
        }
        
    }
    
    else if (sampleNumber == 7) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.snare1PlayerSample8];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.snare2PlayerSample8];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.snare3PlayerSample8];
        }
        
    }
    
    else if (sampleNumber == 8) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.snare1PlayerSample9];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.snare2PlayerSample9];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.snare3PlayerSample9];
        }
      
    }
    
    else if (sampleNumber == 9) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.snare1PlayerSample10];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.snare2PlayerSample10];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.snare3PlayerSample10];
        }
       
    }
    
    else if (sampleNumber == 10) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.snare1PlayerSample11];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.snare2PlayerSample11];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.snare3PlayerSample11];
        }
       
    }
    
    else if (sampleNumber == 11) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.snare1PlayerSample12];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.snare2PlayerSample12];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.snare3PlayerSample12];
        }
       
    }
    
    else if (sampleNumber == 12) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.snare1PlayerSample13];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.snare2PlayerSample13];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.snare3PlayerSample13];
        }
        
    }
    
    else if (sampleNumber == 13) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.snare1PlayerSample14];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.snare2PlayerSample14];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.snare3PlayerSample14];
        }
       
    }
    
    else if (sampleNumber == 14) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.snare1PlayerSample15];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.snare2PlayerSample15];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.snare3PlayerSample15];
        }
        
    }
    
    else if (sampleNumber == 15) {
        if (sound == 0) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.snare1PlayerSample16];
        }
        else if (sound == 1) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.snare2PlayerSample16];
        }
        else if (sound == 2) {
            [_sharedInstance.snarePlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.snare3PlayerSample16];
        }
       
    }
}

# pragma mark set snare sound
+(AVAudioPlayer *) getSnareSoundAtSample:(int)sampleNumber {
    // Will call this method from the Sequencer every time timer firer method is triggered
    // This method returns an AVAudioPlayer corresponent to the wanted sampleNumber
    // The AVAudioPlayer object is taken from the correspondent index of the track array
    AVAudioPlayer *audioPlayerObject = [[AVAudioPlayer alloc]init];
    
    audioPlayerObject = _sharedInstance.snarePlayersArray[sampleNumber];
    
    return audioPlayerObject;
    
}


# pragma mark SETTER SNARE PAN
+(void) setSnarePan:(float)pan {
    float panScaled = (pan/100);
    [_sharedInstance.snare1PlayerSample1 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample2 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample3 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample4 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample5 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample6 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample7 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample8 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample9 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample10 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample11 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample12 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample13 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample14 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample15 setPan:panScaled];
    [_sharedInstance.snare1PlayerSample16 setPan:panScaled];
    
    
    [_sharedInstance.snare2PlayerSample1 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample2 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample3 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample4 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample5 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample6 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample7 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample8 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample9 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample10 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample11 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample12 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample13 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample14 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample15 setPan:panScaled];
    [_sharedInstance.snare2PlayerSample16 setPan:panScaled];

    
    [_sharedInstance.snare3PlayerSample1 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample2 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample3 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample4 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample5 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample6 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample7 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample8 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample9 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample10 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample11 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample12 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample13 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample14 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample15 setPan:panScaled];
    [_sharedInstance.snare3PlayerSample16 setPan:panScaled];


}

# pragma mark Mute unmute SNARE track
+(void) unMuteSnareTrack:(float)withMixVolume {
    _sharedInstance.snareMixVolume = withMixVolume;
}
+(void) muteSnareTrack {
    _sharedInstance.snareMixVolume = 0;
}

# pragma mark Mute unmute tom track
+(void) unMuteTomTrack:(float)withMixVolume {
    _sharedInstance.tomMixVolume = withMixVolume;
}
+(void) muteTomTrack {
    _sharedInstance.tomMixVolume = 0;
}


# pragma mark SETTER tom PAN
+(void) setTomPan:(float)pan {
    float panScaled = (pan/100);
    [_sharedInstance.tom1PlayerSample1 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample2 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample3 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample4 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample5 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample6 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample7 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample8 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample9 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample10 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample11 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample12 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample13 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample14 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample15 setPan:panScaled];
    [_sharedInstance.tom1PlayerSample16 setPan:panScaled];
    
    
    [_sharedInstance.tom2PlayerSample1 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample2 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample3 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample4 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample5 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample6 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample7 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample8 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample9 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample10 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample11 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample12 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample13 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample14 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample15 setPan:panScaled];
    [_sharedInstance.tom2PlayerSample16 setPan:panScaled];
    
    
    [_sharedInstance.tom3PlayerSample1 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample2 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample3 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample4 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample5 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample6 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample7 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample8 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample9 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample10 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample11 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample12 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample13 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample14 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample15 setPan:panScaled];
    [_sharedInstance.tom3PlayerSample16 setPan:panScaled];
}



# pragma mark set tom sound
+(AVAudioPlayer *) getTomSoundAtSample:(int)sampleNumber {
    // Will call this method from the Sequencer every time timer firer method is triggered
    // This method returns an AVAudioPlayer corresponent to the wanted sampleNumber
    // The AVAudioPlayer object is taken from the correspondent index of the track array
    AVAudioPlayer *tomPlayerObject = [[AVAudioPlayer alloc]init];
    
    tomPlayerObject = _sharedInstance.tomPlayersArray[sampleNumber];
    
    return tomPlayerObject;
    
}



# pragma mark GET and SET tom sounds
+(void) setTomSound:(int)sound atSample:(int)sampleNumber {
    if (sampleNumber == 0) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.tom1PlayerSample1];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.tom2PlayerSample1];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.tom3PlayerSample1];
        }
    }
    
    else if (sampleNumber == 1) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.tom1PlayerSample2];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.tom2PlayerSample2];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.tom3PlayerSample2];
        }
        
    }
    
    else if (sampleNumber == 2) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.tom1PlayerSample3];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.tom2PlayerSample3];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.tom3PlayerSample3];
        }
        
    }
    
    else if (sampleNumber == 3) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.tom1PlayerSample4];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.tom2PlayerSample4];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.tom3PlayerSample4];
        }
        
    }
    
    else if (sampleNumber == 4) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.tom1PlayerSample5];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.tom2PlayerSample5];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.tom3PlayerSample5];
        }
        
    }
    
    else if (sampleNumber == 5) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.tom1PlayerSample6];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.tom2PlayerSample6];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.tom3PlayerSample6];
        }
        
    }
    
    else if (sampleNumber == 6) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.tom1PlayerSample7];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.tom2PlayerSample7];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.tom3PlayerSample7];
        }
        
    }
    
    else if (sampleNumber == 7) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.tom1PlayerSample8];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.tom2PlayerSample8];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.tom3PlayerSample8];
        }
        
    }
    
    else if (sampleNumber == 8) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.tom1PlayerSample9];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.tom2PlayerSample9];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.tom3PlayerSample9];
        }
        
    }
    
    else if (sampleNumber == 9) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.tom1PlayerSample10];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.tom2PlayerSample10];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.tom3PlayerSample10];
        }
        
    }
    
    else if (sampleNumber == 10) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.tom1PlayerSample11];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.tom2PlayerSample11];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.tom3PlayerSample11];
        }
        
    }
    
    else if (sampleNumber == 11) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.tom1PlayerSample12];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.tom2PlayerSample12];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.tom3PlayerSample12];
        }
        
    }
    
    else if (sampleNumber == 12) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.tom1PlayerSample13];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.tom2PlayerSample13];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.tom3PlayerSample13];
        }
        
    }
    
    else if (sampleNumber == 13) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.tom1PlayerSample14];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.tom2PlayerSample14];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.tom3PlayerSample14];
        }
        
    }
    
    else if (sampleNumber == 14) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.tom1PlayerSample15];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.tom2PlayerSample15];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.tom3PlayerSample15];
        }
        
    }
    
    else if (sampleNumber == 15) {
        if (sound == 0) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.tom1PlayerSample16];
        }
        else if (sound == 1) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.tom2PlayerSample16];
        }
        else if (sound == 2) {
            [_sharedInstance.tomPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.tom3PlayerSample16];
        }
        
    }
}


# pragma mark set tom amplitude
+ (void) setTomAmplitude:(float)amp atSample:(int)sample {
    if (sample == 0) {
        _sharedInstance.tomSample1Volume = amp;
    }
    else if (sample == 1) {
        _sharedInstance.tomSample2Volume = amp;
    }
    else if (sample == 2) {
        _sharedInstance.tomSample3Volume = amp;
    }
    else if (sample == 3) {
        _sharedInstance.tomSample4Volume = amp;
    }
    else if (sample == 4) {
        _sharedInstance.tomSample5Volume = amp;
    }
    else if (sample == 5) {
        _sharedInstance.tomSample6Volume = amp;
    }
    else if (sample == 6) {
        _sharedInstance.tomSample7Volume = amp;
    }
    else if (sample == 7) {
        _sharedInstance.tomSample8Volume = amp;
    }
    else if (sample == 8) {
        _sharedInstance.tomSample9Volume = amp;
    }
    else if (sample == 9) {
        _sharedInstance.tomSample10Volume = amp;
    }
    else if (sample == 10) {
        _sharedInstance.tomSample11Volume = amp;
    }
    else if (sample == 11) {
        _sharedInstance.tomSample12Volume = amp;
    }
    else if (sample == 12) {
        _sharedInstance.tomSample13Volume = amp;
    }
    else if (sample == 13) {
        _sharedInstance.tomSample14Volume = amp;
    }
    else if (sample == 14) {
        _sharedInstance.tomSample15Volume = amp;
    }
    else if (sample == 15) {
        _sharedInstance.tomSample16Volume = amp;
    }
}



# pragma mark get and set tom amplitude at sample
+ (float) getTomAmplitudeAtSample:(int)sample {
    float volume = 0;
    if (sample == 0) {
        volume = _sharedInstance.tomSample1Volume;
    }
    else if (sample == 1) {
        volume = _sharedInstance.tomSample2Volume;
    }
    else if (sample == 2) {
        volume = _sharedInstance.tomSample3Volume;
    }
    else if (sample == 3) {
        volume = _sharedInstance.tomSample4Volume;
    }
    else if (sample == 4) {
        volume = _sharedInstance.tomSample5Volume;
    }
    else if (sample == 5) {
        volume = _sharedInstance.tomSample6Volume;
    }
    else if (sample == 6) {
        volume = _sharedInstance.tomSample7Volume;
    }
    else if (sample == 7) {
        volume = _sharedInstance.tomSample8Volume;
    }
    else if (sample == 8) {
        volume = _sharedInstance.tomSample9Volume;
    }
    else if (sample == 9) {
        volume = _sharedInstance.tomSample10Volume;
    }
    else if (sample == 10) {
        volume = _sharedInstance.tomSample11Volume;
    }
    else if (sample == 11) {
        volume = _sharedInstance.tomSample12Volume;
    }
    else if (sample == 12) {
        volume = _sharedInstance.tomSample13Volume;
    }
    else if (sample == 13) {
        volume = _sharedInstance.tomSample14Volume;
    }
    else if (sample == 14) {
        volume = _sharedInstance.tomSample15Volume;
    }
    else if (sample == 15) {
        volume = _sharedInstance.tomSample16Volume;
    }
    return volume;
}



# pragma mark tom amplitudes
+ (void) setTomMixVolume:(float)mixVolume {
    _sharedInstance.tomMixVolume = (mixVolume/100);
}
+ (float) getTomMixVolume {
    return _sharedInstance.tomMixVolume;
}




# pragma mark SetUpHiHat AudioPlayers

-(void) setUpTomAudioPlayersArray {
    
    // In order to set up AudioPlayers for the drum sequencer we need to create path and URLs
    // Creating file paths for different hi-hat audio files
    NSString *tom1FilePath = [[NSBundle mainBundle] pathForResource:@"tom1" ofType:@"wav"];
    NSString *tom2FilePath = [[NSBundle mainBundle] pathForResource:@"tom2" ofType:@"wav"];
    NSString *tom3FilePath = [[NSBundle mainBundle] pathForResource:@"tom3" ofType:@"wav"];
    
    
    // Creating URLs of kick file paths
    NSURL *tom1FileUrl = [[NSURL alloc] initFileURLWithPath: tom1FilePath];
    NSURL *tom2FileUrl = [[NSURL alloc] initFileURLWithPath: tom2FilePath];
    NSURL *tom3FileUrl = [[NSURL alloc] initFileURLWithPath: tom3FilePath];
    
    
    
    // initialising kick AudioPlayer objects for kick sound 1
    
    self.tom1PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    self.tom1PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom1FileUrl error: nil];
    
    
    
    
    
    // prepare them to play
    [self.tom1PlayerSample1 prepareToPlay];
    [self.tom1PlayerSample2 prepareToPlay];
    [self.tom1PlayerSample3 prepareToPlay];
    [self.tom1PlayerSample4 prepareToPlay];
    [self.tom1PlayerSample5 prepareToPlay];
    [self.tom1PlayerSample6 prepareToPlay];
    [self.tom1PlayerSample7 prepareToPlay];
    [self.tom1PlayerSample8 prepareToPlay];
    [self.tom1PlayerSample9 prepareToPlay];
    [self.tom1PlayerSample10 prepareToPlay];
    [self.tom1PlayerSample11 prepareToPlay];
    [self.tom1PlayerSample12 prepareToPlay];
    [self.tom1PlayerSample13 prepareToPlay];
    [self.tom1PlayerSample14 prepareToPlay];
    [self.tom1PlayerSample15 prepareToPlay];
    [self.tom1PlayerSample16 prepareToPlay];

    
    
    
    // initialising kick AudioPlayer objects for kick sound 2
    
    self.tom2PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    self.tom2PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom2FileUrl error: nil];
    
    
    
    
    
    // prepare them to play
    [self.tom2PlayerSample1 prepareToPlay];
    [self.tom2PlayerSample2 prepareToPlay];
    [self.tom2PlayerSample3 prepareToPlay];
    [self.tom2PlayerSample4 prepareToPlay];
    [self.tom2PlayerSample5 prepareToPlay];
    [self.tom2PlayerSample6 prepareToPlay];
    [self.tom2PlayerSample7 prepareToPlay];
    [self.tom2PlayerSample8 prepareToPlay];
    [self.tom2PlayerSample9 prepareToPlay];
    [self.tom2PlayerSample10 prepareToPlay];
    [self.tom2PlayerSample11 prepareToPlay];
    [self.tom2PlayerSample12 prepareToPlay];
    [self.tom2PlayerSample13 prepareToPlay];
    [self.tom2PlayerSample14 prepareToPlay];
    [self.tom2PlayerSample15 prepareToPlay];
    [self.tom2PlayerSample16 prepareToPlay];

    
    
    // initialising kick AudioPlayer objects for kick sound 3
    
    self.tom3PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    self.tom3PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: tom3FileUrl error: nil];
    
    
    
    
    
    // prepare them to play
    [self.tom3PlayerSample1 prepareToPlay];
    [self.tom3PlayerSample2 prepareToPlay];
    [self.tom3PlayerSample3 prepareToPlay];
    [self.tom3PlayerSample4 prepareToPlay];
    [self.tom3PlayerSample5 prepareToPlay];
    [self.tom3PlayerSample6 prepareToPlay];
    [self.tom3PlayerSample7 prepareToPlay];
    [self.tom3PlayerSample8 prepareToPlay];
    [self.tom3PlayerSample9 prepareToPlay];
    [self.tom3PlayerSample10 prepareToPlay];
    [self.tom3PlayerSample11 prepareToPlay];
    [self.tom3PlayerSample12 prepareToPlay];
    [self.tom3PlayerSample13 prepareToPlay];
    [self.tom3PlayerSample14 prepareToPlay];
    [self.tom3PlayerSample15 prepareToPlay];
    [self.tom3PlayerSample16 prepareToPlay];

    
    // initialise array of audioplayers
    // By default the samples to be played will be the number 1 of each track
    // I will allow changes on this from the "Drum sounds and reverb" view controller
    self.tomPlayersArray = [[NSMutableArray alloc] initWithObjects:self.tom1PlayerSample1, self.tom1PlayerSample2, self.tom1PlayerSample3, self.tom1PlayerSample4, self.tom1PlayerSample5, self.tom1PlayerSample6, self.tom1PlayerSample7, self.tom1PlayerSample8, self.tom1PlayerSample9, self.tom1PlayerSample10, self.tom1PlayerSample11, self.tom1PlayerSample12, self.tom1PlayerSample13, self.tom1PlayerSample14, self.tom1PlayerSample15, self.tom1PlayerSample16, nil];
    
}


@end
