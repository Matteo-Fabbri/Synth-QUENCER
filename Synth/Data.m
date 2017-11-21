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
    NSString *kick4FilePath = [[NSBundle mainBundle] pathForResource:@"kick4" ofType:@"wav"];
    NSString *kick5FilePath = [[NSBundle mainBundle] pathForResource:@"kick5" ofType:@"wav"];
    NSString *kick6FilePath = [[NSBundle mainBundle] pathForResource:@"kick6" ofType:@"wav"];
    
    // Creating URLs of kick file paths
        NSURL *kick1FileUrl = [[NSURL alloc] initFileURLWithPath: kick1FilePath];
        NSURL *kick2FileUrl = [[NSURL alloc] initFileURLWithPath: kick2FilePath];
        NSURL *kick3FileUrl = [[NSURL alloc] initFileURLWithPath: kick3FilePath];
        NSURL *kick4FileUrl = [[NSURL alloc] initFileURLWithPath: kick4FilePath];
        NSURL *kick5FileUrl = [[NSURL alloc] initFileURLWithPath: kick5FilePath];
        NSURL *kick6FileUrl = [[NSURL alloc] initFileURLWithPath: kick6FilePath];
    
    
    
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
    
    
    // initialising kick AudioPlayer objects for kick sound 4
    
    self.kick4PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    self.kick4PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick4FileUrl error: nil];
    
    
    
    
    
    // prepare them to play
    [self.kick4PlayerSample1 prepareToPlay];
    [self.kick4PlayerSample2 prepareToPlay];
    [self.kick4PlayerSample3 prepareToPlay];
    [self.kick4PlayerSample4 prepareToPlay];
    [self.kick4PlayerSample5 prepareToPlay];
    [self.kick4PlayerSample6 prepareToPlay];
    [self.kick4PlayerSample7 prepareToPlay];
    [self.kick4PlayerSample8 prepareToPlay];
    [self.kick4PlayerSample9 prepareToPlay];
    [self.kick4PlayerSample10 prepareToPlay];
    [self.kick4PlayerSample11 prepareToPlay];
    [self.kick4PlayerSample12 prepareToPlay];
    [self.kick4PlayerSample13 prepareToPlay];
    [self.kick4PlayerSample14 prepareToPlay];
    [self.kick4PlayerSample15 prepareToPlay];
    [self.kick4PlayerSample16 prepareToPlay];
    
    
    // initialising kick AudioPlayer objects for kick sound 3
    
    self.kick5PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    self.kick5PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick5FileUrl error: nil];
    
    
    
    
    
    // prepare them to play
    [self.kick5PlayerSample1 prepareToPlay];
    [self.kick5PlayerSample2 prepareToPlay];
    [self.kick5PlayerSample3 prepareToPlay];
    [self.kick5PlayerSample4 prepareToPlay];
    [self.kick5PlayerSample5 prepareToPlay];
    [self.kick5PlayerSample6 prepareToPlay];
    [self.kick5PlayerSample7 prepareToPlay];
    [self.kick5PlayerSample8 prepareToPlay];
    [self.kick5PlayerSample9 prepareToPlay];
    [self.kick5PlayerSample10 prepareToPlay];
    [self.kick5PlayerSample11 prepareToPlay];
    [self.kick5PlayerSample12 prepareToPlay];
    [self.kick5PlayerSample13 prepareToPlay];
    [self.kick5PlayerSample14 prepareToPlay];
    [self.kick5PlayerSample15 prepareToPlay];
    [self.kick5PlayerSample16 prepareToPlay];
    
    
    // initialising kick AudioPlayer objects for kick sound 3
    
    self.kick6PlayerSample1 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample2 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample3 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample4 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample5 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample6 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample7 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample8 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample9 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample10 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample11 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample12 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample13 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample14 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample15 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    self.kick6PlayerSample16 = [[AVAudioPlayer alloc] initWithContentsOfURL: kick6FileUrl error: nil];
    
    
    
    
    
    // prepare them to play
    [self.kick6PlayerSample1 prepareToPlay];
    [self.kick6PlayerSample2 prepareToPlay];
    [self.kick6PlayerSample3 prepareToPlay];
    [self.kick6PlayerSample4 prepareToPlay];
    [self.kick6PlayerSample5 prepareToPlay];
    [self.kick6PlayerSample6 prepareToPlay];
    [self.kick6PlayerSample7 prepareToPlay];
    [self.kick6PlayerSample8 prepareToPlay];
    [self.kick6PlayerSample9 prepareToPlay];
    [self.kick6PlayerSample10 prepareToPlay];
    [self.kick6PlayerSample11 prepareToPlay];
    [self.kick6PlayerSample12 prepareToPlay];
    [self.kick6PlayerSample13 prepareToPlay];
    [self.kick6PlayerSample14 prepareToPlay];
    [self.kick6PlayerSample15 prepareToPlay];
    [self.kick6PlayerSample16 prepareToPlay];
    
    
    
   
    
    // initialise array of audioplayers
    // By default the samples to be played will be the number 1 of each track
    // I will allow changes on this from the "Drum sounds and reverb" view controller
    self.kickPlayersArray = [[NSMutableArray alloc] initWithObjects:self.kick1PlayerSample1, self.kick1PlayerSample2, self.kick1PlayerSample3, self.kick1PlayerSample4, self.kick1PlayerSample5, self.kick1PlayerSample6, self.kick1PlayerSample7, self.kick1PlayerSample8, self.kick1PlayerSample9, self.kick1PlayerSample10, self.kick1PlayerSample11, self.kick1PlayerSample12, self.kick1PlayerSample13, self.kick1PlayerSample14, self.kick1PlayerSample15, self.kick1PlayerSample16, nil];
    
}




# pragma mark GET and SET Kick amplitude at sample
// declaring a function that takes 2 arguments and sets audioplayers content (by changing the URL of the audio to be played, it changes audio files loading another sound) at correspondent sampleNumber (Sequencer property)
// Will call this from loading sounds class pickerviews
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
    else if (sound == 3) {
        [_sharedInstance.kickPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.kick4PlayerSample1];
    }
    else if (sound == 4) {
        [_sharedInstance.kickPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.kick5PlayerSample1];
    }
    else if (sound == 5) {
        [_sharedInstance.kickPlayersArray replaceObjectAtIndex:0 withObject:_sharedInstance.kick6PlayerSample1];
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
        else if (sound == 3) {
            [_sharedInstance.kickPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.kick4PlayerSample2];
        }
        else if (sound == 4) {
            [_sharedInstance.kickPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.kick5PlayerSample2];
        }
        else if (sound == 5) {
            [_sharedInstance.kickPlayersArray replaceObjectAtIndex:1 withObject:_sharedInstance.kick6PlayerSample2];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.kick4PlayerSample3];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.kick5PlayerSample3];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:2 withObject:_sharedInstance.kick6PlayerSample3];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.kick4PlayerSample4];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.kick5PlayerSample4];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:3 withObject:_sharedInstance.kick6PlayerSample4];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.kick4PlayerSample5];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.kick5PlayerSample5];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:4 withObject:_sharedInstance.kick6PlayerSample5];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.kick4PlayerSample6];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.kick5PlayerSample6];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:5 withObject:_sharedInstance.kick6PlayerSample6];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.kick4PlayerSample7];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.kick5PlayerSample7];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:6 withObject:_sharedInstance.kick6PlayerSample7];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.kick4PlayerSample8];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.kick5PlayerSample8];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:7 withObject:_sharedInstance.kick6PlayerSample8];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.kick4PlayerSample9];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.kick5PlayerSample9];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:8 withObject:_sharedInstance.kick6PlayerSample9];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.kick4PlayerSample10];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.kick5PlayerSample10];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:9 withObject:_sharedInstance.kick6PlayerSample10];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.kick4PlayerSample11];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.kick5PlayerSample11];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:10 withObject:_sharedInstance.kick6PlayerSample11];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.kick4PlayerSample12];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.kick5PlayerSample12];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:11 withObject:_sharedInstance.kick6PlayerSample12];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.kick4PlayerSample13];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.kick5PlayerSample13];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:12 withObject:_sharedInstance.kick6PlayerSample13];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.kick4PlayerSample14];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.kick5PlayerSample14];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:13 withObject:_sharedInstance.kick6PlayerSample14];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.kick4PlayerSample15];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.kick5PlayerSample15];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:14 withObject:_sharedInstance.kick6PlayerSample15];
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
            else if (sound == 3) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.kick4PlayerSample16];
            }
            else if (sound == 4) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.kick5PlayerSample16];
            }
            else if (sound == 5) {
                [_sharedInstance.kickPlayersArray replaceObjectAtIndex:15 withObject:_sharedInstance.kick6PlayerSample16];
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
    
    [_sharedInstance.kick4PlayerSample1 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample2 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample3 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample4 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample5 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample6 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample7 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample8 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample9 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample10 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample11 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample12 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample13 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample14 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample15 setPan:panScaled];
    [_sharedInstance.kick4PlayerSample16 setPan:panScaled];
    
    [_sharedInstance.kick5PlayerSample1 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample2 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample3 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample4 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample5 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample6 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample7 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample8 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample9 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample10 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample11 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample12 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample13 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample14 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample15 setPan:panScaled];
    [_sharedInstance.kick5PlayerSample16 setPan:panScaled];
    
    [_sharedInstance.kick6PlayerSample1 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample2 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample3 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample4 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample5 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample6 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample7 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample8 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample9 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample10 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample11 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample12 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample13 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample14 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample15 setPan:panScaled];
    [_sharedInstance.kick6PlayerSample16 setPan:panScaled];
}
                                    


//# pragma mark SETTER Kick PAN
//-(void) initReverbs {
//
//    _sharedInstance.kickReverb = [[AVAudioUnitReverb alloc] init
//
//}






@end
