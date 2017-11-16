//
//  ViewController.swift
//  Synth
//
//  Created by Matteo Fabbri on 15/11/2017.
//  Copyright © 2017 Matteo Fabbri. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI


class ViewController: UIViewController {

    
    // DECLARATION AND CONNECTIONS OF OUTLETS
    // Osc1 ADSR
    
    @IBOutlet var osc1AttackLabel: UILabel!
    @IBOutlet var osc1DecayLabel: UILabel!
    @IBOutlet var osc1SustainLabel: UILabel!
    @IBOutlet var osc1ReleaseLabel: UILabel!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
/* User defined runtime attributes applied to UIButtons to make them rounded
 source: StackOverflow https://stackoverflow.com/questions/1513380/multi-line-comments-in-xcode */
 
 


    // Here I'm connecting each key's touch down events to MIDI Note On via a unique method
    // Each UIButton (key) has a different tag
    @IBAction func didPressKey(_ sender: UIButton) {
        if sender.tag==0 {
            print("C (down) Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(60), velocity: MIDIVelocity(120))
        }
        if sender.tag==1 {
            print("C# Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(61), velocity: MIDIVelocity(120))
        }
        if sender.tag==2 {
            print("D Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(62), velocity: MIDIVelocity(120))
        }
        if sender.tag==3 {
            print("D# Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(63), velocity: MIDIVelocity(120))
        }
        if sender.tag==4 {
            print("E Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(64), velocity: MIDIVelocity(120))
        }
        if sender.tag==5 {
            print("F Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(65), velocity: MIDIVelocity(120))
        }
        if sender.tag==6 {
            print("F# Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(66), velocity: MIDIVelocity(120))
        }
        if sender.tag==7 {
            print("G Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(67), velocity: MIDIVelocity(120))
        }
        if sender.tag==8 {
            print("G# Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(68), velocity: MIDIVelocity(120))
        }
        if sender.tag==9 {
            print("A Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(69), velocity: MIDIVelocity(120))
        }
        if sender.tag==10 {
            print("A# Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(70), velocity: MIDIVelocity(120))
        }
        if sender.tag==11 {
            print("B Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(71), velocity: MIDIVelocity(120))
        }
        if sender.tag==12 {
            print("C (up) Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(72), velocity: MIDIVelocity(120))
        }

    }

    
    // Here I'm connecting touch up events (both inside and outside) to MIDI Note Off
    @IBAction func didReleaseKey(_ sender: UIButton) {
        if sender.tag==0 {
            print("C (down) key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(60))
        }
        if sender.tag==1 {
            print("C# Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(61))
        }
        if sender.tag==2 {
            print("D Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(62))
        }
        if sender.tag==3 {
            print("D# Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(63))
        }
        if sender.tag==4 {
            print("E Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(64))
        }
        if sender.tag==5 {
            print("F Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(65))
        }
        if sender.tag==6 {
            print("F# Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(66))
        }
        if sender.tag==7 {
            print("G Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(67))
        }
        if sender.tag==8 {
            print("G# Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(68))
        }
        if sender.tag==9 {
            print("A Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(69))
        }
        if sender.tag==10 {
            print("A# Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(70))
        }
        if sender.tag==11 {
            print("B Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(71))
        }
        if sender.tag==12 {
            print("C (up) Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(72))
        }

    }
    
    
    
    //Here I connect the segmented controls to a method that changes the index of the oscillators (their waveforms) accordingly to segment currently selected
    
    @IBAction func didWaveformOsc1Changed(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex==0 {
            oscillator1.index = 0
        }
        if sender.selectedSegmentIndex==1 {
            oscillator1.index = 1
        }
        if sender.selectedSegmentIndex==2 {
            oscillator1.index = 2
        }
        if sender.selectedSegmentIndex==3 {
            oscillator1.index = 3
        }
    }
    
    
    // Here I connect the ADSR sliders to a method called whenever they are touched, and set oscillators ADSR envelopes values
    // The UISlider sends a float, we need then to convert it in double for the oscillator
    
    
    @IBAction func didOsc1AttackChanged(_ sender: UISlider) {
        // I set the attack slider between 20 and 6000, which are milliseconds. I divide then by 1000 for the osc to have an attack range between 20 ms and 6 s
        oscillator1.attackDuration = (Double(sender.value)) / 1000
    }
    
    @IBAction func didOsc1DecayChanged(_ sender: UISlider) {
        oscillator1.decayDuration = (Double(sender.value)) / 1000
    }
    
    @IBAction func didOsc1SustainChanged(_ sender: UISlider) {
        // I do not need to scale the sustain since the slider is set between 0 and 1
        oscillator1.sustainLevel = Double(sender.value)
    }
    
    @IBAction func didOsc1ReleaseChanged(_ sender: UISlider) {
        oscillator1.releaseDuration = (Double(sender.value)) / 1000
    }
    
    
    
    
    // Here I connect the osc1 VOLUME method
    
    @IBAction func didOsc1VolumeChange(_ sender: UISlider) {
        mixOsc1.volume = (Double(sender.value)) / 100
    }
    
    
    
    
    // Here I connect the osc1 PAN method
    
    @IBAction func didOsc1PanChange(_ sender: UISlider) {
        panOsc1.pan = Double(sender.value) / 100
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
 // I set the UISlider osc1 filter cutoff freq between 10 hZ and 20050 hZ, according to AudioKit documentation  http://audiokit.io/docs/Classes/AKLowPassFilter.html#/c:@M@AudioKit@objc(cs)AKLowPassFilter(py)cutoffFrequency
    
    @IBAction func didOsc1FiltCutoffChanged(_ sender: UISlider) {
        filtOsc1.cutoffFrequency = Double(sender.value)
    }
    
    
 // I set the UISlider osc1 filter resonance between -20 and 40 dB  http://audiokit.io/docs/Classes/AKLowPassFilter.html#/c:@M@AudioKit@objc(cs)AKLowPassFilter(py)resonance
    
    @IBAction func didOsc1FiltResoChanged(_ sender: UISlider) {
        filtOsc1.resonance = Double(sender.value)
    }
    
// I set the UISlider osc1 filter dryWet mix between 0 and 100
    @IBAction func didOsc1FiltDryWetMixChange(_ sender: UISlider) {
        filtOsc1.dryWetMix = Double(sender.value)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // THE FOLLOWING LINES UNTIL viewDidLoad ARE LIKE PROPERTIES IN OBJECTIVE C
    
    
    
    
    // Here I create a morphing oscillator object, and initialise it with an array of four basic standard waveforms
    let oscillator1 = AKMorphingOscillatorBank(waveformArray: [AKTable(.sine),AKTable(.square),AKTable(.triangle),AKTable(.sawtooth)])
    
    
    // Declare the oscillator1 processing units nodes, which I will connect to each other and to the oscillator in viewDidLoad
    // I set these to variables instead of constants because I will need to connect and disconnect them in implementation accordingly to user's choice
    var filtOsc1 = AKLowPassFilter()
    var revOsc1 = AKReverb()
    var delOsc1 = AKDelay()
    var mixOsc1 = AKMixer()
    var panOsc1 = AKPanner()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // I set the global rampTime (s) of AudioKit synthesis engine to a reasonable value so that nothing produces an audio glitch if changed quickly
        AKSettings.rampTime = 0.01
        
        // Initialise oscillators' amplitude envelopes
        // Apart from sustain, all the values represent time (s)
        // I set minimum values for attack decay and release to 20 ms = sliders' minimum values
        self.oscillator1.attackDuration = 0.02
        self.oscillator1.decayDuration = 0.02
        self.oscillator1.sustainLevel = 0
        self.oscillator1.releaseDuration = 0.02
        
    // Connect oscillator to Low pass filter
        filtOsc1 = AKLowPassFilter(oscillator1)
   // Connect filter to mixer
        mixOsc1 = AKMixer(filtOsc1)
// Connect mixer to panner
        panOsc1 = AKPanner(mixOsc1)
        
    // Connect audio chain's last audio node to AudioKit output (DAC)
        AudioKit.output = panOsc1
    // Initialise AudioKit rendering
        AudioKit.start()

        
        // Setting the ADSR sliders vertically. source: https://stackoverflow.com/questions/8118033/how-to-change-the-uislider-to-vertical
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

