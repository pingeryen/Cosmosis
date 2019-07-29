//
//  ViewController.swift
//  GoogleVRSwift
//
//  Created by Ben Tsai on 7/21/19.
//  Copyright © 2019 Ben Tsai. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let audio_context = gvr_audio_create(Int32(GVR_AUDIO_RENDERING_BINAURAL_HIGH_QUALITY.rawValue))
    var sound = gvr_audio_source_id()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sound = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Ambient_Car.wav")) //ambisonic
        gvr_audio_set_sound_volume(audiocontext.audio_context, sound, 0.5)
        
        //let sound2 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Air Con.wav"))//monosound

        //Create new sounds
        /*
        let sound1 = gvr_audio_source_id(gvr_audio_create_soundfield(audiocontext.audio_context, "190717_032.WAV"))
        let sound2 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Air Con.wav"))
        
        gvr_audio_play_sound(audiocontext.audio_context, sound1, true)
        
        gvr_audio_set_sound_object_position(audiocontext.audio_context, sound2, -10, 0, 0)
        gvr_audio_set_sound_volume(audiocontext.audio_context, sound2, 1)
        gvr_audio_play_sound(audiocontext.audio_context, sound2, false)
        */
        
        // Do any additional setup after loading the view.
        
        
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        
        gvr_audio_set_sound_object_position(audiocontext.audio_context, sound, sender.value, 0, 0)
        
        /*
        gvr_audio_set_sound_object_position(audiocontext.audio_context, sound2, -10, 0, 0)
        gvr_audio_set_sound_volume(audiocontext.audio_context, sound2, sender.value)
        gvr_audio_play_sound(audiocontext.audio_context, sound2, false)
        */
    }
}

