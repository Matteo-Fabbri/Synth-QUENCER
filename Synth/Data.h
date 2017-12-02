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

#pragma mark nextsequence start and end
// This will be the values requested from Sequencer at every timer firer's beginning
@property int nextSequenceFirstSample;
@property int nextSequenceLastSample;
+ (int) getNextSequenceFirstSample;
+ (int) getNextSequenceLastSample;


#pragma mark Various sections start and end
@property int section1FirstSample;
@property int section1LastSample;
@property int section2FirstSample;
@property int section2LastSample;
@property int section3FirstSample;
@property int section3LastSample;
@property int section4FirstSample;
@property int section4LastSample;



# pragma mark Various sections selectors (buttons)
// The following methods will be triggered via buttons
// They are basically setters for nextSequenceFirstSample and nextSequenceLastSample at once
// this method will set nextSequence first and last sample as section 1 first and last sample
+ (void) section1Selected;
// this method will set nextSequence first and last sample as section 1 first and last sample
+ (void) section2Selected;
// this method will set nextSequence first and last sample as section 1 first and last sample
+ (void) section3Selected;
// this method will set nextSequence first and last sample as section 1 first and last sample
+ (void) section4Selected;

# pragma mark SEQUENCES first and last samples setters
// to be called by the picker views in Arranger view
+ (void) setSection1FirstSample: (int) firstSample;
+ (void) setSection1LastSample: (int) lastSample;
+ (void) setSection2FirstSample: (int) firstSample;
+ (void) setSection2LastSample: (int) lastSample;
+ (void) setSection3FirstSample: (int) firstSample;
+ (void) setSection3LastSample: (int) lastSample;
+ (void) setSection4FirstSample: (int) firstSample;
+ (void) setSection4LastSample: (int) lastSample;



# pragma mark TOm audioplayers
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *tom1PlayerSample16;

@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *tom2PlayerSample16;

@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *tom3PlayerSample16;


# pragma mark Tom players array
@property (strong,nonatomic) NSMutableArray *tomPlayersArray;
-(void) setUpTomAudioPlayersArray;

# pragma mark Tom amplitudes
@property (nonatomic) float tomMixVolume;
+ (void) setTomMixVolume:(float) mixVolume;
+ (float) getTomMixVolume;

@property (nonatomic) float tomSample1Volume;
@property (nonatomic) float tomSample2Volume;
@property (nonatomic) float tomSample3Volume;
@property (nonatomic) float tomSample4Volume;
@property (nonatomic) float tomSample5Volume;
@property (nonatomic) float tomSample6Volume;
@property (nonatomic) float tomSample7Volume;
@property (nonatomic) float tomSample8Volume;
@property (nonatomic) float tomSample9Volume;
@property (nonatomic) float tomSample10Volume;
@property (nonatomic) float tomSample11Volume;
@property (nonatomic) float tomSample12Volume;
@property (nonatomic) float tomSample13Volume;
@property (nonatomic) float tomSample14Volume;
@property (nonatomic) float tomSample15Volume;
@property (nonatomic) float tomSample16Volume;

# pragma mark GET and SET tom amplitude at sample
+ (float) getTomAmplitudeAtSample:(int)sample;
+ (void) setTomAmplitude:(float)amp atSample:(int)sample;

# pragma mark GET and SET tom sounds
+(void) setTomSound:(int)sound atSample:(int)sampleNumber;
+(AVAudioPlayer *) getTomSoundAtSample:(int)sampleNumber;

# pragma mark SETTER tom PAN
+(void) setTomPan:(float)pan;

# pragma mark Mute unmute tom track
+(void) unMuteTomTrack:(float)withMixVolume;
+(void) muteTomTrack;


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




# pragma mark HIHAt audio players

@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *hiHat1PlayerSample16;

@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *hiHat2PlayerSample16;

@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *hiHat3PlayerSample16;



# pragma mark SNARE audio players

@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *snare1PlayerSample16;

@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *snare2PlayerSample16;

@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample1;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample2;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample3;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample4;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample5;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample6;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample7;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample8;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample9;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample10;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample11;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample12;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample13;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample14;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample15;
@property (strong,nonatomic) AVAudioPlayer *snare3PlayerSample16;



# pragma mark Snare players array

@property (strong,nonatomic) NSMutableArray *snarePlayersArray;
-(void) setSnareAudioPlayersArray;


# pragma mark Hi hat players array
@property (strong,nonatomic) NSMutableArray *hiHatPlayersArray;
-(void) setUpHiHatAudioPlayersArray;

# pragma mark Snare amplitudes
@property (nonatomic) float snareMixVolume;
+ (void) setSnareMixVolume:(float) mixVolume;
+ (float) getSnareMixVolume;

@property (nonatomic) float snareSample1Volume;
@property (nonatomic) float snareSample2Volume;
@property (nonatomic) float snareSample3Volume;
@property (nonatomic) float snareSample4Volume;
@property (nonatomic) float snareSample5Volume;
@property (nonatomic) float snareSample6Volume;
@property (nonatomic) float snareSample7Volume;
@property (nonatomic) float snareSample8Volume;
@property (nonatomic) float snareSample9Volume;
@property (nonatomic) float snareSample10Volume;
@property (nonatomic) float snareSample11Volume;
@property (nonatomic) float snareSample12Volume;
@property (nonatomic) float snareSample13Volume;
@property (nonatomic) float snareSample14Volume;
@property (nonatomic) float snareSample15Volume;
@property (nonatomic) float snareSample16Volume;

# pragma mark get and set SNARE amplitude at sample
+ (float) getSnareAmplitudeAtSample:(int)sample;
+ (void) setSnareAmplitude:(float)amp atSample:(int)sample;


# pragma mark GET and SET snare sounds
+(void) setSnareSound:(int)sound atSample:(int)sampleNumber;
+(AVAudioPlayer *) getSnareSoundAtSample:(int)sampleNumber;


# pragma mark SETTER SNARE PAN
+(void) setSnarePan:(float)pan;

# pragma mark Mute unmute SNARE track
+(void) unMuteSnareTrack:(float)withMixVolume;
+(void) muteSnareTrack;



# pragma mark Hi hat amplitudes
@property (nonatomic) float hiHatMixVolume;
+ (void) setHiHatMixVolume:(float) mixVolume;
+ (float) getHiHatMixVolume;



@property (nonatomic) float hiHatSample1Volume;
@property (nonatomic) float hiHatSample2Volume;
@property (nonatomic) float hiHatSample3Volume;
@property (nonatomic) float hiHatSample4Volume;
@property (nonatomic) float hiHatSample5Volume;
@property (nonatomic) float hiHatSample6Volume;
@property (nonatomic) float hiHatSample7Volume;
@property (nonatomic) float hiHatSample8Volume;
@property (nonatomic) float hiHatSample9Volume;
@property (nonatomic) float hiHatSample10Volume;
@property (nonatomic) float hiHatSample11Volume;
@property (nonatomic) float hiHatSample12Volume;
@property (nonatomic) float hiHatSample13Volume;
@property (nonatomic) float hiHatSample14Volume;
@property (nonatomic) float hiHatSample15Volume;
@property (nonatomic) float hiHatSample16Volume;


# pragma mark GET and SET hi hat amplitude at sample
+ (float) getHiHatAmplitudeAtSample:(int)sample;
+ (void) setHiHatAmplitude:(float)amp atSample:(int)sample;

# pragma mark GET and SET hihat sounds
+(void) setHiHatSound:(int)sound atSample:(int)sampleNumber;
+(AVAudioPlayer *) getHiHatSoundAtSample:(int)sampleNumber;

# pragma mark SETTER hihat PAN
+(void) setHiHatPan:(float)pan;

# pragma mark Mute unmute hihat track
+(void) unMuteHiHatTrack:(float)withMixVolume;
+(void) muteHiHatTrack;






# pragma mark Kick Players array
// I create a mutable array where I will store the AVAudioPlayer objects, so that they are more well organised and it's easier to reach them
// with custom setters, I will rearrange this array by putting the wanted drum sound (kick1 rather than kick4, etc.) at the wanted array index, which correspond to the sampleNumber
@property (strong,nonatomic) NSMutableArray *kickPlayersArray;
// I will call this in this class convenience init method
-(void) setUpKickAudioPlayersArray;



# pragma mark Master volume and muting mastertrack
@property (nonatomic) float masterVolume;
+ (void) setMasterVolume:(float) withMasterVolume;
+ (float) getMasterVolume;
+ (void) muteMasterTrack;
+ (void) unMuteMasterTrack:(float) withVolume;



# pragma mark Kick amplitudes
@property (nonatomic) float kickMixVolume;
+ (void) setKickMixVolume:(float) mixVolume;
+ (float) getKickMixVolume;


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

# pragma mark Mute unmute kick track
+(void) unMuteKickTrack:(float)withMixVolume;
+(void) muteKickTrack;


# pragma mark Reverbs

@property AVAudioUnitReverb *kickReverb;

@end
