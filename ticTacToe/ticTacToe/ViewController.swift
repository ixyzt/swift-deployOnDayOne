//
//  ViewController.swift
//  ticTacToe
//
//  Created by Johann Kerr on 9/26/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var players = ["", ""]
    var firstPlayer = ""
    var gameWon = false
    var gameTied = false
    var winningPlayer: String?
    var turnsPlayed = 0
    var currentMove = ""
    var selectedSquare = 0
    var openSquares = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    var movesOnBoard = [String?](repeating: nil, count: 9)
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var gameBoardView: UIView!
    @IBOutlet weak var boardButton0: UIButton!
    @IBOutlet weak var boardButton1: UIButton!
    @IBOutlet weak var boardButton2: UIButton!
    @IBOutlet weak var boardButton3: UIButton!
    @IBOutlet weak var boardButton4: UIButton!
    @IBOutlet weak var boardButton5: UIButton!
    @IBOutlet weak var boardButton6: UIButton!
    @IBOutlet weak var boardButton7: UIButton!
    @IBOutlet weak var boardButton8: UIButton!
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var moveLabel: UILabel!
    
    @IBOutlet weak var playerVsPlayerButton: UIButton!
    @IBOutlet weak var playerVsComputerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        turnLabel.isHidden = true
        moveLabel.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getMove() -> String {
        if turnsPlayed % 2 == 0 {
            return "X"
        } else {
            return "O"
        }
    }
    
    func changeLabel() {
        if gameWon {
            turnLabel.text = "\(winningPlayer) wins!"
        } else {
            if turnsPlayed == 9 {
                gameTied = true
                turnLabel.text = "It's a tie!"
            } else if turnsPlayed % 2 == 0 {
                turnLabel.text = "Player 1's Turn"
            } else {
                if computerPlayer { // fix this and insert short delay for computer turn
                    turnLabel.text = "Computer's Turn"
                } else {
                    turnLabel.text = "Player 2's Turn"
                }
            }
        }
    }
    
    func makeMove(chosenSquare: Int) {
        var currentMove: String
        switch chosenSquare {
        case 1:
            if gameBoard[0][0] == "" {
                currentMove = getMove()
                label1.text = currentMove
                gameBoard[0][0] = currentMove
                openSquares.remove(at: openSquares.index(of: 1)!)
                turnsPlayed += 1
            }
        case 2:
            if gameBoard[0][1] == "" {
                currentMove = getMove()
                label2.text = currentMove
                gameBoard[0][1] = currentMove
                openSquares.remove(at: openSquares.index(of: 2)!)
                turnsPlayed += 1
            }
        case 3:
            if gameBoard[0][2] == "" {
                currentMove = getMove()
                label3.text = currentMove
                gameBoard[0][2] = currentMove
                openSquares.remove(at: openSquares.index(of: 3)!)
                turnsPlayed += 1
            }
        case 4:
            if gameBoard[1][0] == "" {
                currentMove = getMove()
                label4.text = currentMove
                gameBoard[1][0] = currentMove
                openSquares.remove(at: openSquares.index(of: 4)!)
                turnsPlayed += 1
            }
        case 5:
            if gameBoard[1][1] == "" {
                currentMove = getMove()
                label5.text = currentMove
                gameBoard[1][1] = currentMove
                openSquares.remove(at: openSquares.index(of: 5)!)
                turnsPlayed += 1
            }
        case 6:
            if gameBoard[1][2] == "" {
                currentMove = getMove()
                label6.text = currentMove
                gameBoard[1][2] = currentMove
                openSquares.remove(at: openSquares.index(of: 6)!)
                turnsPlayed += 1
            }
        case 7:
            if gameBoard[2][0] == "" {
                currentMove = getMove()
                label7.text = currentMove
                gameBoard[2][0] = currentMove
                openSquares.remove(at: openSquares.index(of: 7)!)
                turnsPlayed += 1
            }
        case 8:
            if gameBoard[2][1] == "" {
                currentMove = getMove()
                label8.text = currentMove
                gameBoard[2][1] = currentMove
                openSquares.remove(at: openSquares.index(of: 8)!)
                turnsPlayed += 1
            }
        case 9:
            if gameBoard[2][2] == "" {
                currentMove = getMove()
                label9.text = currentMove
                gameBoard[2][2] = currentMove
                openSquares.remove(at: openSquares.index(of: 9)!)
                turnsPlayed += 1
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
            [movesOnBoard[0][0], gameBoard[1][0], gameBoard[2][0]],
            [gameBoard[0][1], gameBoard[1][1], gameBoard[2][1]],
            [gameBoard[0][2], gameBoard[1][2], gameBoard[2][2]]
        ]
    }
    
    func getDiagonals() -> [[String]] {
        return [
            [movesOnBoard[0][0], gameBoard[1][1], gameBoard[2][2]],
            [gameBoard[0][2], gameBoard[1][1], gameBoard[2][0]]
        ]
    }
    
    func isGameOver() {
        let sequences = [
            "rows" : movesOnBoard,
            "columns" : getColumns(),
            "diagonals" : getDiagonals()
        ]
        
        for arrayOfSequences in sequences.values { // use dictionary keys to represent winning sequence with highlighted color
            for sequence in arrayOfSequences {
                if isNotEmpty(sequence: sequence) && isHomogeneous(sequence: sequence) {
                    gameWon = true
                    
                    if sequence[0] == "X" {
                        winningPlayer = "Player 1"
                    } else {
                        if computerPlayer {
                            winningPlayer = "Computer"
                        } else {
                            winningPlayer = "Player 2"
                        }
                    }
                }
            }
        }
    }
    
    func displayWinner(winningPlayer: String) {
        turnLabel.text = "\(winningPlayer) wins!"
    }
    
    func finalScreen() {
        playAgainButton.isHidden = false
    }
    
    func startGame() {
        playerVsPlayerButton.isHidden = true
        playerVsComputerButton.isHidden = true
        firstPlayer = players[Int(arc4random_uniform(2))]
        currentMove = getMove()
        turnLabel.text = "\(firstPlayer)'s Turn"
        moveLabel.text = currentMove
        turnLabel.isHidden = false
        moveLabel.isHidden = false
        if firstPlayer == "Computer" {
            makeComputerMove()
        }
    }
    
    func makeComputerMove() {
        mainView.isUserInteractionEnabled = false
        self.selectedSquare = self.openSquares[Int(arc4random_uniform(UInt32(self.openSquares.count)))]
        })
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
            self.mainView.isUserInteractionEnabled = true
        })
    }
    
    @IBAction func gameTypeButtonPressed(_ sender: AnyObject) {
        if sender.title == "Player vs. Player" {
            players = ["Player One", "Player Two"]
        } else {
            players = ["Player", "Computer"]
        }
        startGame()
    }
    
    @IBAction func gameButtonPressed(_ sender: AnyObject) {
        
        // human
        if !gameWon {
            makeMove(chosenSquare: sender.tag)
            isGameOver()
            changeLabel()
        }
        
        // computer
        if !gameWon && computerPlayer && turnsPlayed < 9 {
            makeMove(chosenSquare: openSquares[Int(arc4random_uniform(UInt32(openSquares.count)))])
            isGameOver()
            changeLabel()
        }
        
        if gameWon || gameTied {
            finalScreen()
        }
    }
    
//    @IBAction func newGame(_ sender: AnyObject) {
//        playAgainButton.isHidden = true
//        boardCoveringButton.isHidden = false
//        pvcButton.isHidden = false
//        pvpButton.isHidden = false
//        turnLabel.isHidden = true
//        computerPlayer = false
//        gameWon = false
//        gameTied = false
//        winningPlayer = ""
//        turnsPlayed = 0
//        openSquares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//        gameBoard = [["", "", ""], ["", "", ""], ["", "", ""]]
//        label1.text = ""
//        label2.text = ""
//        label3.text = ""
//        label4.text = ""
//        label5.text = ""
//        label6.text = ""
//        label7.text = ""
//        label8.text = ""
//        label9.text = ""
//    }
}

