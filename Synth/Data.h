//
//  Data.h
//  Synth
//
//  Created by Matteo Fabbri on 18/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Data : NSObject


# pragma mark AudioSession

@property (strong,nonatomic) AVAudioSession *thisAppAudioSession;


# pragma mark KICK AudioPlayers
// To avoid audio glitches with more than one sample in a row at fast tempos, I declare 1 different audiofileplayer for each sample (16)
// kick sound 1
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *kick1PlayerSample16;

// kick sound 2
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *kick2PlayerSample16;

// kick sound 3
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *kick3PlayerSample16;

// kick sound 4
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *kick4PlayerSample16;

// kick sound 5
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *kick5PlayerSample16;

// kick sound 6
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *kick6PlayerSample16;


// I create a mutable array where I will store the AVAudioPlayer objects, so that they are more well organised and it's easier to reach them
// with custom setters, I will rearrange this array by putting the wanted drum sound (kick1 rather than kick4, etc.) at the wanted array index, which correspond to the sampleNumber
@property (strong,nonatomic) NSMutableArray *kickPlayersArray;
// I will call this in this class convenience init method
-(void) setUpKickAudioPlayersArray;


# pragma mark Kick amplitudes
// declaring properties for each track's samples amplitudes (will be set by "Velocities"'s picker views)

@property (nonatomic) float kickSample1Volume;
@property (nonatomic) float kickSample2Volume;
@property (nonatomic) float kickSample3Volume;
@property (nonatomic) float kickSample4Volume;
@property (nonatomic) float kickSample5Volume;
@property (nonatomic) float kickSample6Volume;
@property (nonatomic) float kickSample7Volume;
@property (nonatomic) float kickSample8Volume;
@property (nonatomic) float kickSample9Volume;
@property (nonatomic) float kickSample10Volume;
@property (nonatomic) float kickSample11Volume;
@property (nonatomic) float kickSample12Volume;
@property (nonatomic) float kickSample13Volume;
@property (nonatomic) float kickSample14Volume;
@property (nonatomic) float kickSample15Volume;
@property (nonatomic) float kickSample16Volume;





// declaring puvlic method which will return a singleton of this class, and it will always be the same so that I will be sure I could access data either from "Sequencer" or "Drum sounds and reverb" classes
+ (Data *) sharedInstance;



# pragma mark GET and SET Kick amplitude at sample
// Here I create a method which takes an argument (sampleNumber) and returns the relative amplitude
// Same for each track
+ (float) getKickAmplitudeAtSample:(int)sample;

// the same with a setter instead of getter (I will call this method in Velocities' picker viws didselectRow methods)
+ (void) setKickAmplitude:(float)amp atSample:(int)sample;








# pragma mark GET and SET Kick sounds
// declaring a function that takes 2 arguments and sets audioplayers content (by changing the URL of the audio to be played, it changes audio files loading another sound) at correspondent sampleNumber (Sequencer property)
// Will call this from loading sounds class pickerviews
// The first argument is the index of soundsArray to be selected (equal to the selectedRow in Drum sounds selection pickerviews)
+(void) setKickSound:(int)sound atSample:(int)sampleNumber;


// declaring a function which returns the audioplayer object to be played at a specific sampleNumber (will call this from Sequencer)
+(AVAudioPlayer *) getKickSoundAtSample:(int)sampleNumber;


# pragma mark SETTER Kick PAN
+(void) setKickPan:(float)pan;



# pragma mark Reverbs

@property AVAudioUnitReverb *kickReverb;

@end
