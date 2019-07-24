//
//  sleepViewController.swift
//  
//
//  Created by Ben Tsai on 7/23/19.
//

import UIKit

class sleepViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    let audio_context = gvr_audio_create(Int32(GVR_AUDIO_RENDERING_BINAURAL_HIGH_QUALITY.rawValue))

    let array = ["Nothing", "River", "Goats"]
    var audio1 = gvr_audio_source_id()
    var audio2 = gvr_audio_source_id()
    var audio3 = gvr_audio_source_id()
    var audio4 = gvr_audio_source_id()
    var audio5 = gvr_audio_source_id()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audio1 = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, "Air Con.wav")) //ambisonic
        gvr_audio_set_sound_volume(audio_context, audio1, 0.5)
        audio2 = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, "Air Con.wav"))
        gvr_audio_set_sound_volume(audio_context, audio2, 0.5)
        audio3 = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, "Air Con.wav"))
        gvr_audio_set_sound_volume(audio_context, audio3, 0.5)
        audio4 = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, "Air Con.wav"))
        gvr_audio_set_sound_volume(audio_context, audio4, 0.5)
        audio5 = gvr_audio_source_id(gvr_audio_create_sound_object(audio_context, "Air Con.wav"))
        gvr_audio_set_sound_volume(audio_context, audio5, 0.5)
        
        // Do any additional setup after loading the view.
    }
    
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
        self.tableview.isHidden = false
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
