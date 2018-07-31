//  ViewController.swift
//  Xylophone
//
//  Created by Jesus Perez on Monday June 17, 2018
//  Copyright © 2016 Jesus Perez All rights reserved.

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer : AVAudioPlayer!
    
    //Sound file array to cycle through the different sound files with the selectedSoundFileName
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    //Buttons all in one like a class, will play a sound here
    @IBAction func notePressed(_ sender: UIButton) {
        
        //Calls to the function as a local variable so no global variables!
        playSound(soundFileName: soundArray[sender.tag - 1])
        
    }
    
    
    
    func playSound(soundFileName : String) {
        
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav") //Sets up the location of the sound file
        
        do  {
            //Try to initialize the content with the soundURL
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            //Catch errors if there is some errors
            print(error)
        }
        
        audioPlayer.play()
    }

}

