//
//  SessionViewController.swift
//  GoogleVRSwift
//
//  Created by Ben Tsai on 7/25/19.
//  Copyright © 2019 Ben Tsai. All rights reserved.
//

import UIKit


var timeElapsed : Int = 0


class SessionViewController: UIViewController {
    
    var audioArray: [String] = currentSession.soundPack
    
    @IBAction func stopAction(_ sender: UIButton) {
        gvr_audio_stop_sound(audio_context, sound1)
        gvr_audio_stop_sound(audio_context, sound2)
        gvr_audio_stop_sound(audio_context, sound3)
        gvr_audio_stop_sound(audio_context, targetAudio)
        lastLogin.duration = Double(timeElapsed)
        lastLogin.lastSession = "7/30"
        lastLogin.stressLevel = 3        
        stopTimer()
    }
    
    let audio_context = gvr_audio_create(Int32(GVR_AUDIO_RENDERING_BINAURAL_HIGH_QUALITY.rawValue))

    var targetAudio = gvr_audio_source_id()

    var sound1 = gvr_audio_source_id()
    var sound2 = gvr_audio_source_id()
    var sound3 = gvr_audio_source_id()
    
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var timerOutlet: UILabel!
    
    var timer : Timer?
    
    var timerSound : Timer?
    
    var mark1 : Int = 2
    var mark2 : Int = 3
    var mark3 : Int = 4
    
    var counterSound : Float = 0.0

    var startTime : TimeInterval?
    var counter : Float = 0.0
    
    @objc func increaseCounter(){
        counter += 1
        timeElapsed = Int(counter)
        timeLeft.text = "\(Int(totalTime - counter)) Seconds"
        
        if totalTime - counter == 1.0 {
            timerOutlet.text = "\(Int(totalTime - counter)) Second"
        }
        if counter >= totalTime {
            stopTimer()
        }
        var coord : [Float]
        
        if Int(counter) > mark1 {
            mark1 = Int(counter) + randInt3To10()
            coord = randFloat()
            sound1 = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, audioArray[0]))
            gvr_audio_set_sound_volume(audio_context, sound1, 0.3)
            gvr_audio_set_sound_object_position(audio_context, sound1, coord[0], coord[1], coord[2])
            gvr_audio_play_sound(audio_context, sound1, false)
            
        }
        if Int(counter) > mark2 {
            mark2 = Int(counter) + randInt3To10()
            coord = randFloat()
            sound2 = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, audioArray[1]))
            gvr_audio_set_sound_volume(audio_context, sound2, 1)
            gvr_audio_set_sound_object_position(audio_context, sound2, coord[0], coord[1], coord[2])
            gvr_audio_play_sound(audio_context, sound2, false)
            
        }
        if Int(counter) > mark3 {
            mark3 = Int(counter) + randInt3To10()
            coord = randFloat()
            sound3 = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, audioArray[2]))
            gvr_audio_set_sound_volume(audio_context, sound3, 0.6)
            gvr_audio_set_sound_object_position(audio_context, sound3, coord[0], coord[1], coord[2])
            gvr_audio_play_sound(audio_context, sound3, false)
            
        }
        
    }
    
    func stopTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
            counter = 0.0
        }
    }
    
    func randFloat() -> [Float]{
        let x = Float.random(in: -3 ..< 3)
        let y = Float.random(in: -3 ..< 3)
        let z = Float.random(in: -3 ..< 3)
        
        return [x, y, z]
    }
    
    func randInt3To10() -> Int{
        return Int.random(in: 3 ..< 10)
    }
    
    func randomizeAudio(audio: [String]){
        
        sound1 = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, audio[0]))
        gvr_audio_set_sound_volume(audio_context, sound1, 1)
        sound2 = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, audio[1]))
        gvr_audio_set_sound_volume(audio_context, sound2, 1)
        sound3 = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, audio[2]))
        gvr_audio_set_sound_volume(audio_context, sound3, 1)
        
        mark1 = randInt3To10()
        mark2 = randInt3To10()
        mark3 = randInt3To10()
        
        /*
        while counter <= totalTime{
            if Int(counter1) >= limit1 {
                coord = randFloat()
                gvr_audio_set_sound_object_position(audiocontext.audio_context, sound1, coord[0], coord[1], coord[2])
                gvr_audio_play_sound(audio_context, sound1, false)
                limit1 = randInt5To30()
                resetTimer1()
            }
            if Int(counter2) >= limit2 {
                coord = randFloat()
                gvr_audio_set_sound_object_position(audiocontext.audio_context, sound2, coord[0], coord[1], coord[2])
                gvr_audio_play_sound(audio_context, sound2, false)
                limit2 = randInt5To30()
                resetTimer2()
            }
            if Int(counter3) >= limit3 {
                coord = randFloat()
                gvr_audio_set_sound_object_position(audiocontext.audio_context, sound3, coord[0], coord[1], coord[2])
                gvr_audio_play_sound(audio_context, sound3, false)
                limit3 = randInt5To30()
                resetTimer3()
            }
        }
        */
        
            
            
            
            
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
        
        gvr_audio_stop_sound(audiocontext.audio_context, sound1)
        gvr_audio_stop_sound(audiocontext.audio_context, sound2)
        gvr_audio_stop_sound(audiocontext.audio_context, sound3)
        gvr_audio_stop_sound(audiocontext.audio_context, targetAudio)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer()
        let aSelector : Selector = #selector(self.increaseCounter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        
        targetAudio = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, currentSession.audio))
        gvr_audio_set_sound_object_position(audio_context, targetAudio, 0, 0, 0)
        gvr_audio_set_sound_volume(audio_context, targetAudio, 0.5)
        gvr_audio_play_sound(audio_context, targetAudio, true)
        
        randomizeAudio(audio: currentSession.soundPack)
        
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
    


