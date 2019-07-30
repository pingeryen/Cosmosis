//
//  SessionViewController.swift
//  GoogleVRSwift
//
//  Created by Ben Tsai on 7/25/19.
//  Copyright © 2019 Ben Tsai. All rights reserved.
//

import UIKit


class SessionViewController: UIViewController {
    
    @IBAction func stopAction(_ sender: UIButton) {
        gvr_audio_stop_sound(audiocontext.audio_context, sound1)
        gvr_audio_stop_sound(audiocontext.audio_context, sound2)
        gvr_audio_stop_sound(audiocontext.audio_context, sound3)
        gvr_audio_stop_sound(audiocontext.audio_context, audio1)
        gvr_audio_stop_sound(audiocontext.audio_context, audio2)
        gvr_audio_stop_sound(audiocontext.audio_context, audio3)
        
    }
    
    
    let audio_context = gvr_audio_create(Int32(GVR_AUDIO_RENDERING_BINAURAL_HIGH_QUALITY.rawValue))

    var audio1 = gvr_audio_source_id()
    var audio2 = gvr_audio_source_id()
    var audio3 = gvr_audio_source_id()

    var sound1 = gvr_audio_source_id()
    var sound2 = gvr_audio_source_id()
    var sound3 = gvr_audio_source_id()
    
    @IBOutlet weak var timeLeft: UILabel!
    
    @IBOutlet weak var timerOutlet: UILabel!
    
    var soundpack1 = ["Tapping.wav", "UpTheWall.wav", "TapMusicStand.wav"]
    var soundpack2 = ["Swing.wav", "Cracks.wav", "Water_Drops.wav"]
    var soundpack3 = ["Engine.wav", "Goose.wav", "Cocowater.wav"]
    
    var timer : Timer?
    var startTime : TimeInterval?
    var counter : Float = 0.0
    
   
    @objc func increaseCounter(){
        
        counter += 1
        timeLeft.text = "\(Int(totalTime - counter)) Seconds"
        if totalTime - counter == 1.0 {
            timerOutlet.text = "\(Int(totalTime - counter)) Second"
        }
        if counter <= 0 {
            stopTimer()
        }
    }
    
    func stopTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
            print("Timer Deallocated")
            counter = 0.0
        }
    }
    
    func randFloat() -> [Float]{
        let x = Float.random(in: -2 ..< 2)
        let y = Float.random(in: -2 ..< 2)
        let z = Float.random(in: -2 ..< 2)
        
        return [x, y, z]
    }
    
    func randTime(){
         sleep(UInt32.random(in: 1 ..< 3))
    }
    
    func testrandomizeAudio(audio: [String]){
        sound1 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, audio[0]))
        gvr_audio_set_sound_volume(audio_context, sound1, 0.7)
        gvr_audio_play_sound(audiocontext.audio_context, sound1, false)
    }

    func randomizeAudio(audio: [String]){
        
        sound1 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, audio[0]))
        gvr_audio_set_sound_volume(audio_context, sound1, 0.7)
        sound2 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, audio[1]))
        gvr_audio_set_sound_volume(audio_context, sound2, 1)
        sound3 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, audio[2]))
        gvr_audio_set_sound_volume(audio_context, sound3, 1)
 
        var coord : [Float]
        let list = [sound1, sound2, sound3]
        
        while counter <= totalTime{
            print("playing")
            for sound in list{
                coord = randFloat()
                gvr_audio_set_sound_object_position(audiocontext.audio_context, sound, coord[0], coord[1], coord[2])
                gvr_audio_play_sound(audiocontext.audio_context, sound, false)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                    gvr_audio_stop_sound(audiocontext.audio_context, sound)
                })
            }
            
            /*
            coord = randFloat()
            gvr_audio_set_sound_object_position(audiocontext.audio_context, sound2, coord[0], coord[1], coord[2])
            gvr_audio_play_sound(audiocontext.audio_context, sound2, true)
            randTime()
            gvr_audio_stop_sound(audiocontext.audio_context, sound2)
            
            
            coord = randFloat()
            gvr_audio_set_sound_object_position(audiocontext.audio_context, sound3, coord[0], coord[1], coord[2])
            gvr_audio_play_sound(audiocontext.audio_context, sound3, true)
            randTime()
            gvr_audio_stop_sound(audiocontext.audio_context, sound3)
                */
        }
        gvr_audio_stop_sound(audiocontext.audio_context, sound1)
        gvr_audio_stop_sound(audiocontext.audio_context, sound2)
        gvr_audio_stop_sound(audiocontext.audio_context, sound3)
        gvr_audio_stop_sound(audiocontext.audio_context, audio1)
        gvr_audio_stop_sound(audiocontext.audio_context, audio2)
        gvr_audio_stop_sound(audiocontext.audio_context, audio3)


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(String(currentSession.audio))
        print(String(currentSession.soundPack))
        
        timer = Timer()
        let aSelector : Selector = #selector(self.increaseCounter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        
        audio1 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Ambient_Car.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, audio1, 0.5)
        audio2 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "River.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, audio2, 0.2)
        audio3 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Goats.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, audio3, 0.3)
        
        if currentSession.audio == "Ambient_Car"{
            gvr_audio_play_sound(audiocontext.audio_context, audio1, true)
        }
        else if currentSession.audio == "River"{
            gvr_audio_play_sound(audiocontext.audio_context, audio2, true)
        }
        else if currentSession.audio == "Goats"{
            gvr_audio_play_sound(audiocontext.audio_context, audio3, true)
        }
        
        if currentSession.soundPack == "Soothing"{
            print("soundpack1")
            randomizeAudio(audio: soundpack1)
        }
        else if currentSession.soundPack == "Nature"{
            print("soundpack2")
            randomizeAudio(audio: soundpack2)
        }
        else if currentSession.soundPack == "Others"{
            print("soundpack3")
            randomizeAudio(audio: soundpack3)
        }
        
        
        
     
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

