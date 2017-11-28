//
//  ViewController.swift
//  DiceGame
//
//  Created by Dayakar Reddy on 11/27/17.
//  Copyright © 2017 Dayakar Reddy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    @IBOutlet weak var rollBtn: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBOutlet weak var matchingLabel: UILabel!
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    let diceArray = ["dice1" , "dice2" , "dice3" , "dice4" , "dice5" , "dice6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        randomDice()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollBtnPressed(_ sender: UIButton) {
        randomDice()
        playSound()
        
        if (randomDiceIndex1 == randomDiceIndex2) {
            gifView.loadGif(name: "gif")
            gifView.isHidden = false
            playAgain.isHidden = false
            rollBtn.isHidden = true
            matchingLabel.isHidden = false
            matchingLabel.text = String(Int(arc4random_uniform(7)))
        }
    }
    func randomDice() {
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "shake", withExtension: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
            
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func playAgainBtnPressed(_ sender: UIButton) {
        gifView.isHidden = true
        playAgain.isHidden = true
        matchingLabel.isHidden = true
        rollBtn.isHidden = false
    }
}













