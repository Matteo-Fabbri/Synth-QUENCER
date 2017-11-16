//
//  Sequencer.h
//  Synth
//
//  Created by Matteo Fabbri on 16/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface Sequencer : UIViewController

- (IBAction)didPressButton:(UIButton *)sender;

@property (strong,nonatomic) AVAudioPlayer *player;

@end
