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

    // (equivalent of objective-c) PROPERTIES
    // see also further down for oscillator banks declarations
    
    // buttons outlets (I need them to make buttons rounded programmatically)
    
    @IBOutlet var keysButtons: [UIButton]!
    
    // osc1 ADSR sliders "properties"
    @IBOutlet var osc1AttackSlider: UISlider!
    @IBOutlet var osc1DecaySlider: UISlider!
    @IBOutlet var osc1SustainSlider: UISlider!
    @IBOutlet var osc1ReleaseSlider: UISlider!
    
    // osc1 low pass filter sliders "properties"
    
    @IBOutlet var osc1FiltCutoffSlider: UISlider!
    @IBOutlet var osc1FiltResonanceSlider: UISlider!
    @IBOutlet var osc1FiltDryWetSlider: UISlider!
    
    // osc1 volume
    
    @IBOutlet var osc1VolumeSlider: UISlider!
    @IBOutlet var osc1MuteUnmuteButton: UIButton!
    
    
    
    // osc 2 adsr
    
    @IBOutlet var osc2AttackSlider: UISlider!
    @IBOutlet var osc2DecaySlider: UISlider!
    @IBOutlet var osc2SustainSlider: UISlider!
    @IBOutlet var osc2ReleaseSlider: UISlider!
    
    // osc 2 high pass filter
    
    @IBOutlet var osc2FilterCutoff: UISlider!
    @IBOutlet var osc2FilterResonance: UISlider!
    @IBOutlet var osc2FilterDryWet: UISlider!
    
    // osc 2 volume slider and mute button
    
    @IBOutlet var osc2VolumeSlider: UISlider!
    @IBOutlet var osc2MuteUnmuteButton: UIButton!
    
    
    // declaring a property where I will store the octave to be playing at for the oscillator
    // the ! is similar to an initialiser in Swift
    var octaveMultiplier: Int! = 4
    
    // interval between the two oscillator in semitones - label and buttons
    // it can reach up to 2 octaves
    var interval: Int! = 0
    @IBOutlet var intervalLabel: UILabel!
    @IBAction func didIntervalStepUpPress(_ sender: UIButton) {
        self.interval = self.interval + 1
        if (self.interval > 24)  {
            self.interval = 24
        }
        self.intervalLabel.text = String(format: "%i", self.interval)
        print(String(format: " Interval between oscillators (st): %i", self.interval))
    }
    
    @IBAction func didIntervalStepDownPress(_ sender: UIButton) {
        self.interval = self.interval - 1
        if (self.interval < 0)  {
            self.interval = 0
        }
        self.intervalLabel.text = String(format: "%i", self.interval)
        print(String(format: " Interval between oscillators (st): %i", self.interval))
    }
    
    
    
    // octave label property
    
    @IBOutlet var octaveLabel: UILabel!
    // formatting a string in Swift
    // https://stackoverflow.com/questions/24074479/how-to-create-a-string-with-format
    
    
    @IBAction func octaveUpPress(_ sender: UIButton) {
        self.octaveMultiplier = self.octaveMultiplier + 1
        if (self.octaveMultiplier > 7)  {
            self.octaveMultiplier = 7
        }
        self.octaveLabel.text = String(format: "%i", self.octaveMultiplier)
        print(String(format: " Current octave: %i", (self.octaveMultiplier+1)))
    }
    
    @IBAction func octaveDownPress(_ sender: UIButton) {
        self.octaveMultiplier = self.octaveMultiplier - 1
        if (self.octaveMultiplier < 0)  {
            self.octaveMultiplier = 0
        }
        self.octaveLabel.text = String(format: "%i", self.octaveMultiplier)
        print(String(format: "Current octave: %i", (self.octaveMultiplier+1)))
    }
    
    
    
    
    
    // Here I'm connecting each key's touch down events to MIDI Note On (could be not actual MIDI protocol the one involved in AudioKit, but the principle is the same) via a unique method
    // Each UIButton (key) has a different tag, similarly as I have different tag and different buttons connected to the same method for trackButtons in Sequencer
    // MIDI message will be get from the OscillatorBanks as information about the notes to be played
    // While the octaveMultiplier * 12 is needed in both oscillators, the interval value is added only in the second oscillator
    @IBAction func didPressKey(_ sender: UIButton) {
        if sender.tag==0 {
            print("C (down) Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(0+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+0+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==1 {
            print("C# Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(1+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+1+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==2 {
            print("D Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(2+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+2+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==3 {
            print("D# Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(3+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+3+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==4 {
            print("E Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(4+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+4+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==5 {
            print("F Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(5+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+5+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==6 {
            print("F# Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(6+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+6+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==7 {
            print("G Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(7+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+7+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==8 {
            print("G# Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(8+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+8+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==9 {
            print("A Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(9+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+9+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==10 {
            print("A# Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(10+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+10+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==11 {
            print("B Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(11+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+11+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }
        else if sender.tag==12 {
            print("C (up) Key pressed")
            oscillator1.play(noteNumber: MIDINoteNumber(12+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
            oscillator2.play(noteNumber: MIDINoteNumber((self.interval)+12+(12*self.octaveMultiplier)), velocity: MIDIVelocity(120))
        }

    }

    
    // Here I'm connecting touch up events (both inside and outside) to MIDI Note Off
    // I have to convert the value to Int in order to avoid "Ambigous use of operator "+"" error
    // https://stackoverflow.com/questions/29797231/ambiguous-use-of-operator
    @IBAction func didReleaseKey(_ sender: UIButton) {
        if sender.tag==0 {
            print("C (down) key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(0+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+0+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==1 {
            print("C# Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(1+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+1+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==2 {
            print("D Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(2+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+2+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==3 {
            print("D# Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(3+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+3+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==4 {
            print("E Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(4+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+4+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==5 {
            print("F Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(5+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+5+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==6 {
            print("F# Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(6+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+6+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==7 {
            print("G Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(7+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+7+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==8 {
            print("G# Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(8+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+8+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==9 {
            print("A Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(9+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+9+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==10 {
            print("A# Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(10+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+10+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==11 {
            print("B Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(11+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+11+(12 * (Int(self.octaveMultiplier)))))
        }
        else if sender.tag==12 {
            print("C (up) Key released")
            oscillator1.stop(noteNumber: MIDINoteNumber(12+(12 * (Int(self.octaveMultiplier)))))
            oscillator2.stop(noteNumber: MIDINoteNumber((self.interval)+12+(12 * (Int(self.octaveMultiplier)))))
        }

    }
    
    
    
    //Here I connect the segmented controls to a method that changes the index of the oscillators (their waveforms) accordingly to the segment currently selected
    
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
    
    @IBAction func didWaveformOsc2Changed(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex==0 {
            oscillator2.index = 0
        }
        if sender.selectedSegmentIndex==1 {
            oscillator2.index = 1
        }
        if sender.selectedSegmentIndex==2 {
            oscillator2.index = 2
        }
        if sender.selectedSegmentIndex==3 {
            oscillator2.index = 3
        }
    }
    
    
    // Here I connect the ADSR sliders to a method called whenever they are touched, and set oscillators ADSR envelopes values
    // The UISlider sends a float, we need then to convert it in double for the oscillator
    
    
    @IBAction func didOsc1AttackChanged(_ sender: UISlider) {
        // I set the attack slider between 0 and 6000, which are milliseconds. I divide then by 1000 for the osc to have an attack range between no time (useful to emulate drum sounds) and 6 s
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
    
    
    
    @IBAction func didOsc2AttackChange(_ sender: UISlider) {
        oscillator2.attackDuration = (Double(sender.value)) / 1000
    }
    
    @IBAction func didOsc2DecayChange(_ sender: UISlider) {
        oscillator2.decayDuration = (Double(sender.value)) / 1000
    }
    @IBAction func didOsc2SustainChange(_ sender: UISlider) {
        oscillator2.sustainLevel = Double(sender.value)
    }
    @IBAction func didOsc2ReleaseChange(_ sender: UISlider) {
        oscillator2.releaseDuration = (Double(sender.value)) / 1000
    }
    
    
    
    
    
    // Here I connect the osc1 VOLUME method
    // again, the sender value needs to be converted into a double for the AudioKit oscillator
    // Then the value is scaled down (divided by 100)
    
    @IBAction func didOsc1VolumeChange(_ sender: UISlider) {
        mixOsc1.volume = (Double(sender.value)) / 100
    }
    
    // method connection for mute/unmute button
    // change a button image in swift
    //https://stackoverflow.com/questions/26837371/how-to-change-uibutton-image-in-swift
    
    
    @IBAction func didOsc1MuteUnmuteButtonPress(_ sender: UIButton) {
        if (sender.isSelected) {
            sender.isSelected = false;
            sender.setImage(UIImage(named: "unmuted.png"), for: .normal);
            mixOsc1.volume = Double(osc1VolumeSlider.value) / 100;
        }
        else {
            sender.isSelected = true;
            sender.setImage(UIImage(named: "muted.png"), for: .normal);
            mixOsc1.volume = 0;
        }
    }
    
    // Here I connect the osc1 PAN method
    
    @IBAction func didOsc1PanChange(_ sender: UISlider) {
        panOsc1.pan = Double(sender.value) / 100
    }
    
    
    // I do the same for osc2
    
    
    @IBAction func didOsc2VolumeChange(_ sender: UISlider) {
        mixOsc2.volume = (Double(sender.value)) / 100
    }
    
    
    @IBAction func didOsc2MuteUnmuteButtonPress(_ sender: UIButton) {
        if (sender.isSelected) {
            sender.isSelected = false;
            sender.setImage(UIImage(named: "unmuted.png"), for: .normal);
            mixOsc2.volume = Double(osc2VolumeSlider.value) / 100;
        }
        else {
            sender.isSelected = true;
            sender.setImage(UIImage(named: "muted.png"), for: .normal);
            mixOsc2.volume = 0;
        }
    }
    
    
    @IBAction func didOsc2PanChange(_ sender: UISlider) {
        panOsc2.pan = Double(sender.value) / 100
    }
    
    
    
    
    
    // FILTERS: lpf for osc1, hpf for osc2
    
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
    

    @IBAction func didOsc2FiltCutoffChange(_ sender: UISlider) {
        filtOsc2.cutoffFrequency = Double(sender.value)
    }
    
    
    @IBAction func didOsc2FiltResonanceChange(_ sender: UISlider) {
        filtOsc2.resonance = Double(sender.value)

    }
    
    @IBAction func didOsc2FiltDryWetChange(_ sender: UISlider) {
        filtOsc2.dryWetMix = Double(sender.value)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // Here I create a morphing oscillator object (one for each oscillator), and initialise it with an array of four basic standard waveforms
    let oscillator1 = AKMorphingOscillatorBank(waveformArray: [AKTable(.sine),AKTable(.square),AKTable(.triangle),AKTable(.sawtooth)])
    
    let oscillator2 = AKMorphingOscillatorBank(waveformArray: [AKTable(.sine),AKTable(.square),AKTable(.triangle),AKTable(.sawtooth)])
    
    
    // Declare the oscillator1 processing units nodes, which I will connect to each other and to the oscillator in viewDidLoad
    // I set these to variables instead of constants (var instead of let)
    var filtOsc1 = AKLowPassFilter()
    var mixOsc1 = AKMixer()
    var panOsc1 = AKPanner()
    
    var filtOsc2 = AKHighPassFilter()
    var mixOsc2 = AKMixer()
    var panOsc2 = AKPanner()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Rounding buttons
        // I already used an algorithm similar to this with objective C elsewhere in this project, so I didn't really need to check for advises for that
        // Rather, I checked on stackoverflow how to define the border of a button
        // https://stackoverflow.com/questions/26961274/how-can-i-make-a-button-have-a-rounded-border-in-swift
        
        for button in keysButtons {
            button.layer.cornerRadius = 5;
            button.clipsToBounds = true
            button.layer.borderWidth = 1;
            button.layer.borderColor = UIColor.black.cgColor
        }
        
        
        // Setting initial octave: 4
        self.octaveMultiplier = 4
        // Setting octave label text with initial octaveMultiplier value
        self.octaveLabel.text = String(format: "%i", self.octaveMultiplier)

        // Setting default interval value and its label's text
        self.interval = 0
        self.intervalLabel.text = String(format: "%i", self.interval)
        
        
        
    // I set the global rampTime (s) of AudioKit synthesis engine to a reasonable value so that nothing produces an audio glitch if changed quickly
        AKSettings.rampTime = 0.01
        
        // Initialise oscillators' amplitude envelopes
        // Apart from sustain, all the values represent time (s)
        // I set minimum values for attack decay and release to 20 ms = sliders' minimum values
        self.oscillator1.attackDuration = 0.02
        self.oscillator1.decayDuration = 0.02
        self.oscillator1.sustainLevel = 0
        self.oscillator1.releaseDuration = 0.02
        
        self.oscillator2.attackDuration = 0.02
        self.oscillator2.decayDuration = 0.02
        self.oscillator2.sustainLevel = 0
        self.oscillator2.releaseDuration = 0.02
        
        // OSC 1
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

        // OSC 2
        // Connect oscillator to Low pass filter
        filtOsc2 = AKHighPassFilter(oscillator2)
        // Connect filter to mixer
        mixOsc2 = AKMixer(filtOsc2)
        // Connect mixer to panner
        panOsc2 = AKPanner(mixOsc2)
        
        // Connect audio chain's last audio node to AudioKit output (DAC)
        AudioKit.output = panOsc2
        // Initialise AudioKit rendering
        AudioKit.start()
  
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

