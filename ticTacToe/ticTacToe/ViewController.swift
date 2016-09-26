//
//  ViewController.swift
//  ticTacToe
//
//  Created by Johann Kerr on 9/26/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOfTurns = 0
    var buttonsAlreadyPressed = [[String]]()

    @IBOutlet weak var gameButton1x1: UIButton!
    @IBOutlet weak var gameButton1x2: UIButton!
    @IBOutlet weak var gameButton1x3: UIButton!
    @IBOutlet weak var gameButton2x1: UIButton!
    @IBOutlet weak var gameButton2x2: UIButton!
    @IBOutlet weak var gameButton2x3: UIButton!
    @IBOutlet weak var gameButton3x1: UIButton!
    @IBOutlet weak var gameButton3x2: UIButton!
    @IBOutlet weak var gameButton3x3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayMove(moveCharacter: String, nameOfButton: String) {
        switch nameOfButton {
        case "1x1"
        }
    }
    
    func gameIsOver() {
        
    }

    @IBAction func gameSquarePressed(_ sender: AnyObject) {
        
        if numberOfTurns == 9 {
            gameIsOver()
        } else if numberOfTurns % 2 == 0 {
            displayMove(moveCharacter: "X", nameOfButton: sender.title)
        } else {
            displayMove(moveCharacter: "O", sender.title)
        }
    }
}

