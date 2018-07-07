//
//  AudioManager.swift
//  OneLine
//
//  Created by ABD on 26/11/2017.
//  Copyright © 2017 ABD. All rights reserved.
//

import AVFoundation


class AudioManager {
    
    static let instance = AudioManager()
    private init() {}
    private var audioPlayer : AVAudioPlayer?
    
    
    func playBGMusic(){
        let url = Bundle.main.url(forResource: "music", withExtension: "mp3")
        //var err : Error
        do {
            
            try audioPlayer = AVAudioPlayer(contentsOf: url!)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            
        } catch let err1 as NSError {
            print(err1.debugDescription)
            
            
        }
        
        
    }
    func stopBgMusic(){
        if (audioPlayer?.isPlaying) == true{
            audioPlayer?.stop()
            
            
        }
        
        
    }
    func isAudioPlayerInitialzed()-> Bool{
        
        
        return audioPlayer == nil
    }
    
    
    
}
