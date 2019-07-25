//
//  MyClasses.swift
//  GoogleVRSwift
//
//  Created by Ben Tsai on 7/25/19.
//  Copyright © 2019 Ben Tsai. All rights reserved.
//

import Foundation

class audiocontext{
    static var audio_context = gvr_audio_create(Int32(GVR_AUDIO_RENDERING_BINAURAL_HIGH_QUALITY.rawValue))
}

class session{
    var audio : String
    var loudness : Float
    var soundPack : String
    init(audio: String, loudness: Float, soundPack: String){
        self.audio = audio
        self.loudness = loudness
        self.soundPack = soundPack
    }
}

