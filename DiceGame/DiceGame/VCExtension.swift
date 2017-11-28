//
//  VCExtension.swift
//  DiceGame
//
//  Created by Dayakar Reddy on 11/27/17.
//  Copyright © 2017 Dayakar Reddy. All rights reserved.
//

import UIKit

extension ViewController {
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
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
}
