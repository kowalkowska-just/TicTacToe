//
//  ViewController.swift
//  KiK
//
//  Created by Justyna Kowalkowska on 22/10/2020.
//

import UIKit

enum Symbol: String {
    case X      = "X"
    case O      = "O"
    case none   = "-"
}

extension Symbol {
    
    var oposite: Symbol {
        switch self {
        case .X:    return  .O
        case .O:    return .X
        case .none: return .none
        }
    }
    
    var isNone: Bool {
        Symbol.none == self
    }
}

enum GameStateResult {
    case winner
    case tie
    case playing
}


class KiKViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    var currentSymbol: Symbol = .O
    
    // [.none, .none, .none, ...]
    var model: [Symbol] = Array(repeating: .none, count: 9)
    
    let winningLineIndexes = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        
        [0,3,6],
        [1,4,7],
        [2,5,8],
        
        [0,4,8],
        [2,4,6]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGame()
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        
        let tappedSymbol: Symbol = model[ sender.tag ]
        
        guard tappedSymbol.isNone else { return }
            
        sender.setTitle(currentSymbol.rawValue, for: .normal)
        model[ sender.tag ] = currentSymbol
        
        switch gameEnded() {
            case .winner:   showWinner()
            case .tie:      showTie()
            case .playing:  break
        }

        currentSymbol = currentSymbol.oposite
    }
    
    func showWinner() {
        let ok = UIAlertAction(title: "New Game", style: .default) { _ in
            self.setupGame()
        }
        
        let alert = UIAlertController(title: "Geme won by: \(currentSymbol.rawValue)!",
                                      message: nil,
                                      preferredStyle: .alert)
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func showTie() {
        let ok = UIAlertAction(title: "New Game", style: .default) { _ in
            self.setupGame()
        }
        
        let alert = UIAlertController(title: "No one won!",
                                      message: nil,
                                      preferredStyle: .alert)
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func setupGame() {
        model = Array(repeating: .none, count: 9)
        
        for button in buttons {
            button.setTitle(Symbol.none.rawValue, for: .normal)
        }
        
    }
    
    func gameEnded() -> GameStateResult {
        
        var linesOfSymbols: [ [Symbol] ] = []
        
        for line in winningLineIndexes {
            let symbolLine = convertLinesToSymbols(line: line)
            linesOfSymbols.append(symbolLine)
        }
        
        for symbolLine in linesOfSymbols {
            if checkIfAllSymbolsAreTheSame(symbolLine: symbolLine) {
                return .winner
            }
        }
        
        if model.contains(.none) == false {
            return .tie
        }
    
        return .playing
    }
    
    func checkIfAllSymbolsAreTheSame(symbolLine: [Symbol]) -> Bool {
        if symbolLine.contains(.none) {
            return false
        }
        
        let symbolSet: Set<Symbol> = Set(symbolLine)
        return symbolSet.count == 1
    }
    
    func convertLinesToSymbols(line: [Int]) -> [Symbol] {
        var symbols: [Symbol] = []
        
        for index in line {
            symbols.append( model[index] )
        }
        
        return symbols
    }
    
}

