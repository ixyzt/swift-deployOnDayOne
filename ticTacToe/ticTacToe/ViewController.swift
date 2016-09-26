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
    var buttonsAlreadyPressed = [["", "", ""], ["", "", ""], ["", "", ""]]
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getMove() -> String {
        if numberOfTurns % 2 == 0{
            return "X"
        } else {
            return "O"
        }
    }
    
    func gameIsOver() {
    }
    
    
    @IBAction func gameButtonPressed(_ sender: AnyObject) {
        var currentMove: String
        
        switch sender.tag {
        case 1:
            if buttonsAlreadyPressed[0][0] == "" {
                currentMove = getMove()
                label1.text = currentMove
                buttonsAlreadyPressed[0][0] = currentMove
                numberOfTurns += 1
            }
        case 2:
            if buttonsAlreadyPressed[0][1] == "" {
                currentMove = getMove()
                label2.text = currentMove
                buttonsAlreadyPressed[0][1] = currentMove
                numberOfTurns += 1
            }
        case 3:
            if buttonsAlreadyPressed[0][2] == "" {
                currentMove = getMove()
                label3.text = currentMove
                buttonsAlreadyPressed[0][2] = currentMove
                numberOfTurns += 1
            }
        case 4:
            if buttonsAlreadyPressed[1][0] == "" {
                currentMove = getMove()
                label4.text = currentMove
                buttonsAlreadyPressed[1][0] = currentMove
                numberOfTurns += 1
            }
        case 5:
            if buttonsAlreadyPressed[1][1] == "" {
                currentMove = getMove()
                label5.text = currentMove
                buttonsAlreadyPressed[1][1] = currentMove
                numberOfTurns += 1
            }
        case 6:
            if buttonsAlreadyPressed[1][2] == "" {
                currentMove = getMove()
                label6.text = currentMove
                buttonsAlreadyPressed[1][2] = currentMove
                numberOfTurns += 1
            }
        case 7:
            if buttonsAlreadyPressed[2][0] == "" {
                currentMove = getMove()
                label7.text = currentMove
                buttonsAlreadyPressed[2][0] = currentMove
                numberOfTurns += 1
            }
        case 8:
            if buttonsAlreadyPressed[2][1] == "" {
                currentMove = getMove()
                label8.text = currentMove
                buttonsAlreadyPressed[2][1] = currentMove
                numberOfTurns += 1
            }
        default:
            if buttonsAlreadyPressed[2][2] == "" {
                currentMove = getMove()
                label9.text = currentMove
                buttonsAlreadyPressed[2][2] = currentMove
                numberOfTurns += 1
            }
        }
    }
}

