//
//  SleepViewController.swift
//  
//
//  Created by Ben Tsai on 7/23/19.
//

import UIKit


var file : String = ""
var currentSession = session(audio: "Ambient_Car.wav", soundPack: soundpack1)
var totalTime : Float = 500.0
var fileName : String = ""
var audio = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, file))
var soundpack1 = ["Tapping.wav", "UpTheWall.wav", "TapMusicStand.wav"]
var soundpack2 = ["Swing.wav", "Cracks.wav", "Water_Drops.wav"]
var soundpack3 = ["Engine.wav", "Goose.wav", "Cocowater.wav"]

class SleepViewController: UIViewController{
    
    let audio_context = gvr_audio_create(Int32(GVR_AUDIO_RENDERING_BINAURAL_HIGH_QUALITY.rawValue))
    
    @IBAction func cancelAction(_ sender: UIButton) {
        gvr_audio_stop_sound(audiocontext.audio_context, audio)
    }
    
    func playSound(file : String){
        audio = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, file))
        gvr_audio_set_sound_object_position(audiocontext.audio_context, audio, 0, 0, 0)
        gvr_audio_play_sound(audiocontext.audio_context, audio, false)
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        gvr_audio_stop_sound(audiocontext.audio_context, audio)

    }
    @IBOutlet weak var timerOutlet: UILabel!
    
    

    @IBAction func sliderAction(_ sender: UISlider) {
        totalTime = sender.value * 1000.0
        timerOutlet.text = "\(Int(totalTime)) Seconds"
        if sender.value * 1000.0 == 1.0 {
            timerOutlet.text = "\(Int(totalTime)) Second"
        }
    }
    
    @IBOutlet weak var ambientTable: UITableView!
    
    
    var audioArray = ["Ambient_Car + Soothing","Ambient_Car + Nature","Ambient_Car + Others", "River + Soothing", "River + Nature", "River + Others", "Goats + Soothing", "Goats + Nature", "Goats + Others"]
    var soundpackArray = ["Soothing", "Nature", "Others"]
    var audio1 = gvr_audio_source_id()
    var audio2 = gvr_audio_source_id()
    var audio3 = gvr_audio_source_id()
    
    
    /*
    var soundpack1_1 = gvr_audio_source_id()
    var soundpack1_2 = gvr_audio_source_id()
    var soundpack1_3 = gvr_audio_source_id()
    
    var soundpack2_1 = gvr_audio_source_id()
    var soundpack2_2 = gvr_audio_source_id()
    var soundpack2_3 = gvr_audio_source_id()
    
    var soundpack3_1 = gvr_audio_source_id()
    var soundpack3_2 = gvr_audio_source_id()
    var soundpack3_3 = gvr_audio_source_id()
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ambientTable.isHidden = false
        
        /*
        audio1 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Ambient_Car.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, audio1, 1)
        audio2 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "River.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, audio2, 0.6)
        audio3 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Goats.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, audio3, 0.7)
        
        
        soundpack1_1 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Tapping.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, soundpack1_1, 1)
        soundpack1_2 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "UpTheWall.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, soundpack1_2, 1)
        soundpack1_3 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "TapMusicStand.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, soundpack1_3, 1)

        soundpack2_1 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Swing.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, soundpack2_1, 1)
        soundpack2_2 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Cracks.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, soundpack2_2, 1)
        soundpack2_3 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Water_Drops.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, soundpack2_3, 1)

        soundpack3_1 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Engine.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, soundpack3_1, 1)
        soundpack3_2 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Goose.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, soundpack3_2, 1)
        soundpack3_3 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Cocowater.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, soundpack3_3, 1)
        */

        
        /*
        audio4 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, ".wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, audio4, 0.5)
        audio5 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, ".wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, audio5, 0.5)
        */
        
        // Do any additional setup after loading the view.
    }
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) 
        
        var file : String = "\((cell?.textLabel?.text)!).wav"
        
        var audio = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, file))
        print(file)
        gvr_audio_set_sound_object_position(audiocontext.audio_context, audio, 0, 0, 0)
        gvr_audio_play_sound(audiocontext.audio_context, audio, true)
        
        /*
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            gvr_audio_play_sound(self.audiocontext.audio_context, audio, false)
        })
 */
        self.ambientTable.isHidden = false
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SleepViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return audioArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = audioArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        fileName = (cell?.textLabel?.text)!
        gvr_audio_stop_sound(audiocontext.audio_context, audio)

        
        if fileName == "Ambient_Car + Soothing"{
            file = "Ambient_Car_Preview.wav"
            playSound(file: file)
            currentSession.audio = "Ambient_Car.wav"
            currentSession.soundPack = soundpack1
        }
            
        else if fileName == "Ambient_Car + Nature"{
            file = "Ambient_Car_Preview.wav"
            playSound(file: file)
            currentSession.audio = "Ambient_Car.wav"
            currentSession.soundPack = soundpack2

        }
        else if fileName == "Ambient_Car + Others"{
            file = "Ambient_Car_Preview.wav"
            playSound(file: file)
            currentSession.audio = "Ambient_Car.wav"
            currentSession.soundPack = soundpack3
        }
        else if fileName == "River + Soothing"{
            file = "River_Preview.wav"
            playSound(file: file)
            currentSession.audio = "River.wav"
            currentSession.soundPack = soundpack1
        }
        else if fileName == "River + Nature"{
            file = "River_Preview.wav"
            playSound(file: file)
            currentSession.audio = "River.wav"
            currentSession.soundPack = soundpack2
        }
        else if fileName == "River + Others"{
            file = "River_Preview.wav"
            playSound(file: file)
            currentSession.audio = "River.wav"
            currentSession.soundPack = soundpack3
        }
        else if fileName == "Goats + Soothing"{
            file = "Goats_Preview.wav"
            playSound(file: file)
            currentSession.audio = "Goats.wav"
            currentSession.soundPack = soundpack1
        }
        else if fileName == "Goats + Nature"{
            file = "Goats_Preview.wav"
            playSound(file: file)
            currentSession.audio = "Goats.wav"
            currentSession.soundPack = soundpack2
        }
        else if fileName == "Goats + Others"{
            file = "Goats_Preview.wav"
            playSound(file: file)
            currentSession.audio = "Goats.wav"
            currentSession.soundPack = soundpack3
        }
        
        /*
        fileName = file
        audio = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, file))
        playSound(file: file)
        */
                /*
            else {
                let audio = gvr_audio_source_id(gvr_audio_create_soundfield(audiocontext.audio_context, "StudentCenter.WAV"))
                currentSession.audio = "StudentCenter.WAV"
                gvr_audio_set_sound_volume(audiocontext.audio_context, audio, 0.5)
                gvr_audio_play_sound(audiocontext.audio_context, audio, true)
                

                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                    gvr_audio_stop_sound(audiocontext.audio_context, audio)
            })
            }
             */
    }
            /*
        else if tableView == soundpackTable{
            if (cell?.textLabel?.text)! == "Soothing"{
                print("Soothing")
                currentSession.soundPack = "Soothing"
                 
                /*
                gvr_audio_play_sound(audiocontext.audio_context, soundpack1_1, true)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    gvr_audio_stop_sound(audiocontext.audio_context, self.soundpack1_1)
                })
                gvr_audio_play_sound(audiocontext.audio_context, soundpack1_2, true)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    gvr_audio_stop_sound(audiocontext.audio_context, self.soundpack1_2)
                })
                gvr_audio_play_sound(audiocontext.audio_context, soundpack1_3, true)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    gvr_audio_stop_sound(audiocontext.audio_context, self.soundpack1_3)
                })
                */
            }
            else if (cell?.textLabel?.text)! == "Nature"{
                print("Nature")
                currentSession.soundPack = "Nature"

                
                /*
                gvr_audio_play_sound(audiocontext.audio_context, soundpack2_1, true)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    gvr_audio_stop_sound(audiocontext.audio_context, self.soundpack2_1)
                })
                gvr_audio_play_sound(audiocontext.audio_context, soundpack2_2, true)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    gvr_audio_stop_sound(audiocontext.audio_context, self.soundpack2_2)
                })
                gvr_audio_play_sound(audiocontext.audio_context, soundpack2_3, true)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    gvr_audio_stop_sound(audiocontext.audio_context, self.soundpack2_3)
                })
                 */
            }
                
            else if (cell?.textLabel?.text)! == "Others"{
                print("Others")
                currentSession.soundPack = "Others"


                /*
                gvr_audio_play_sound(audiocontext.audio_context, soundpack3_1, true)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    gvr_audio_stop_sound(audiocontext.audio_context, self.soundpack3_1)
                })
                gvr_audio_play_sound(audiocontext.audio_context, soundpack3_2, true)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    gvr_audio_stop_sound(audiocontext.audio_context, self.soundpack3_2)
                })
                gvr_audio_play_sound(audiocontext.audio_context, soundpack3_3, true)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    gvr_audio_stop_sound(audiocontext.audio_context, self.soundpack3_3)
                })
                 */
 
            }
 
        }
        */
    }
    

