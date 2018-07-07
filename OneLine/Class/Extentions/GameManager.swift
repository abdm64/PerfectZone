//
//  GameManager.swift
//  OneLine
//
//  Created by ABD on 29/11/2017.
//  Copyright © 2017 ABD. All rights reserved.
//

import SpriteKit
import Foundation


class GameManager {
    
    
    static let instance = GameManager()
    private init() {}
    private var gameData : GameData?;
    
    func initializeGameData(){
        
        if !FileManager.default.fileExists(atPath: getFilePath() as String){
            gameData = GameData()
            
            
            gameData?.setMusicOn(isMusicOn: true)
            
            saveData()
            
            
        }
        loadData()
        
    }
    
    func loadData(){
        gameData = NSKeyedUnarchiver.unarchiveObject(withFile: (getFilePath()as String?)!) as? GameData
    }
    func saveData(){
        if gameData != nil{
            NSKeyedArchiver.archiveRootObject(gameData!, toFile: getFilePath() as String)
        }
    }
    private func getFilePath() -> String{
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first as NSURL!
        
        
        
        return (url?.appendingPathComponent("Game Data")?.path)!
    }
    
    func setHighscore(_ highscore: Int) {
        UserDefaults.standard.set(highscore, forKey: "Highscore");
    }
    
    func getHighscore() -> Int {
        return UserDefaults.standard.integer(forKey: "Highscore");
    }
    
    func setIsMusicOn(isMusicOn : Bool){
       // GameData.setMusicOn(isMusicOn: isMusicOn)
        gameData!.setMusicOn(isMusicOn: isMusicOn)
        
        
    }
    func getIsMusicOn()-> Bool{
        return gameData!.getMusic()
        
        
    }
    
    
}

