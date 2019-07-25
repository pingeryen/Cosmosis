//
//  sleepViewController.swift
//  
//
//  Created by Ben Tsai on 7/23/19.
//

import UIKit

class SleepViewController: UIViewController{
    
    @IBOutlet weak var ambientTable: UITableView!
    
    var array = ["Ambient_Car", "River", "Goats", "", ""]
    var audio1 = gvr_audio_source_id()
    var audio2 = gvr_audio_source_id()
    var audio3 = gvr_audio_source_id()
    var audio4 = gvr_audio_source_id()
    var audio5 = gvr_audio_source_id()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audio1 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Ambient_Car.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, audio1, 1)
        audio2 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "River.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, audio2, 1)
        audio3 = gvr_audio_source_id(gvr_audio_create_sound_object(audiocontext.audio_context, "Goats.wav"))
        gvr_audio_set_sound_volume(audiocontext.audio_context, audio3, 1)
        gvr_audio_play_sound(audiocontext.audio_context, audio1, true)
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
    
}
