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
    var soundPack : [String]
    init(audio: String, soundPack: [String]){
        self.audio = audio
        self.soundPack = soundPack
    }
}

class setup{
    var lastSession : String
    var duration : Double
    var stressLevel : Int
    init(lastSession: String, duration: Double, stressLevel: Int){
        self.lastSession = lastSession
        self.duration = duration
        self.stressLevel = stressLevel
    }
    func time() -> String{
        let min = Int(self.duration / 60.0)
        let sec = Int(Int(self.duration) % 60)
        return "\(min):\(sec)"
        
    }
}

