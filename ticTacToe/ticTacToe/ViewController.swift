//
//  ViewController.swift
//  ticTacToe
//
//  Created by Johann Kerr on 9/26/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameWon = false
    var computerPlayer = true
    var numberOfTurns = 0
    var openSquares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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
    
    @IBOutlet weak var turnLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getMove() -> String {
        if numberOfTurns % 2 == 0 {
            return "X"
        } else {
            return "O"
        }
    }
    
    func changeLabel() {
        if !gameWon {
            if numberOfTurns % 2 == 0 {
                turnLabel.text = "Player 1's Turn"
            } else {
                turnLabel.text = "Player 2's Turn"
            }
        }
    }
    
    func makeMove(chosenSquare: Int) {
        var currentMove: String
        switch chosenSquare {
        case 1:
            if buttonsAlreadyPressed[0][0] == "" {
                currentMove = getMove()
                label1.text = currentMove
                buttonsAlreadyPressed[0][0] = currentMove
                openSquares.remove(at: openSquares.index(of: 1)!)
                numberOfTurns += 1
            }
        case 2:
            if buttonsAlreadyPressed[0][1] == "" {
                currentMove = getMove()
                label2.text = currentMove
                buttonsAlreadyPressed[0][1] = currentMove
                openSquares.remove(at: openSquares.index(of: 2)!)
                numberOfTurns += 1
            }
        case 3:
            if buttonsAlreadyPressed[0][2] == "" {
                currentMove = getMove()
                label3.text = currentMove
                buttonsAlreadyPressed[0][2] = currentMove
                openSquares.remove(at: openSquares.index(of: 3)!)
                numberOfTurns += 1
            }
        case 4:
            if buttonsAlreadyPressed[1][0] == "" {
                currentMove = getMove()
                label4.text = currentMove
                buttonsAlreadyPressed[1][0] = currentMove
                openSquares.remove(at: openSquares.index(of: 4)!)
                numberOfTurns += 1
            }
        case 5:
            if buttonsAlreadyPressed[1][1] == "" {
                currentMove = getMove()
                label5.text = currentMove
                buttonsAlreadyPressed[1][1] = currentMove
                openSquares.remove(at: openSquares.index(of: 5)!)
                numberOfTurns += 1
            }
        case 6:
            if buttonsAlreadyPressed[1][2] == "" {
                currentMove = getMove()
                label6.text = currentMove
                buttonsAlreadyPressed[1][2] = currentMove
                openSquares.remove(at: openSquares.index(of: 6)!)
                numberOfTurns += 1
            }
        case 7:
            if buttonsAlreadyPressed[2][0] == "" {
                currentMove = getMove()
                label7.text = currentMove
                buttonsAlreadyPressed[2][0] = currentMove
                openSquares.remove(at: openSquares.index(of: 7)!)
                numberOfTurns += 1
            }
        case 8:
            if buttonsAlreadyPressed[2][1] == "" {
                currentMove = getMove()
                label8.text = currentMove
                buttonsAlreadyPressed[2][1] = currentMove
                openSquares.remove(at: openSquares.index(of: 8)!)
                numberOfTurns += 1
            }
        case 9:
            if buttonsAlreadyPressed[2][2] == "" {
                currentMove = getMove()
                label9.text = currentMove
                buttonsAlreadyPressed[2][2] = currentMove
                openSquares.remove(at: openSquares.index(of: 9)!)
                numberOfTurns += 1
            }
        default:
            break
        }
        
    }
    
    func isNotEmpty(sequence: [String]) -> Bool {
        if sequence[0] != "" && sequence[1] != "" && sequence[2] != "" {
            return true
        } else {
            return false
        }
    }
    
    func isHomogeneous(sequence: [String]) -> Bool {
        if sequence[0] == sequence[1] && sequence[1] == sequence[2] {
            return true
        } else {
            return false
        }
    }
    
    func getColumns() -> [[String]] {
        return [
            [buttonsAlreadyPressed[0][0], buttonsAlreadyPressed[1][0], buttonsAlreadyPressed[2][0]],
            [buttonsAlreadyPressed[0][1], buttonsAlreadyPressed[1][1], buttonsAlreadyPressed[2][1]],
            [buttonsAlreadyPressed[0][2], buttonsAlreadyPressed[1][2], buttonsAlreadyPressed[2][2]]
        ]
    }
    
    func getDiagonals() -> [[String]] {
        return [
            [buttonsAlreadyPressed[0][0], buttonsAlreadyPressed[1][1], buttonsAlreadyPressed[2][2]],
            [buttonsAlreadyPressed[0][2], buttonsAlreadyPressed[1][1], buttonsAlreadyPressed[2][0]]
        ]
    }
    
    func isGameOver() {
        let sequences = [
            "rows" : buttonsAlreadyPressed,
            "columns" : getColumns(),
            "diagonals" : getDiagonals()
        ]
        
        for (sequenceType, arrayOfSequences) in sequences {
            for sequence in arrayOfSequences {
                if isNotEmpty(sequence: sequence) && isHomogeneous(sequence: sequence) {
                    gameWon = true
                    
                    if sequence[0] == "X" {
                        displayWinner(winningPlayer: "Player 1")
                    } else {
                        displayWinner(winningPlayer: "Player 2")
                    }
                }
            }
        }
        
        // tie
        if numberOfTurns == 9 && !gameWon {
            displayTie()
        }
    }
    
    func displayWinner(winningPlayer: String) {
        turnLabel.text = "\(winningPlayer) wins!"
    }
    
    func displayTie() {
        turnLabel.text = "It's a tie!"
    }
    
    @IBAction func gameButtonPressed(_ sender: AnyObject) {
        
        // human
        if !gameWon {
            makeMove(chosenSquare: sender.tag)
            isGameOver()
            changeLabel()
        }
       
        // computer
        if !gameWon && computerPlayer && numberOfTurns < 9 {
            makeMove(chosenSquare: openSquares[Int(arc4random_uniform(UInt32(openSquares.count)))])
            isGameOver()
            changeLabel()
        }
    }
}

