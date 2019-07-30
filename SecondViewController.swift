//
//  SecondViewController.swift
//  
//
//  Created by Ben Tsai on 7/23/19.
//

import UIKit



var lastLogin = setup(lastSession: "07/23", duration: 500.0, stressLevel: 5)

class SecondViewController: UIViewController {
    

    
    @IBOutlet weak var sleepSettingOutlet: UIButton!
    
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var lastSessionOutlet: UILabel!
    @IBOutlet weak var durationOutlet: UILabel!
    @IBOutlet weak var stressLevelOutlet: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lastSessionOutlet.text = "Last Session: " + lastLogin.lastSession
        durationOutlet.text = "Duration: " + lastLogin.time()
        stressLevelOutlet.text = "Stress Level: " + String(lastLogin.stressLevel)
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(changeSleepAction(_:)))
        upSwipe.direction = .up
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeSleepAction(_ sender: UISwipeGestureRecognizer) {
        if (sender.direction == .up) {
            
        }
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
