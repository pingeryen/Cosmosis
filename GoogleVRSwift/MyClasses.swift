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

struct session{
    var audio : String
    var soundPack : String
    init(audio: String, soundPack: String){
        self.audio = audio
        self.soundPack = soundPack
    }
}

class sessionData{
    var date : String
    var duration : Int
    var stress: Int
    init(date : String, duration : Int, stress : Int){
        self.date = date
        self.duration = duration
        self.stress = stress
    }
}

