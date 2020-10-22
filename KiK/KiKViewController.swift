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
}


class KiKViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    var currentSymbol: Symbol = .O
    
    // [.none, .none, .none, ...]
    var model: [Symbol] = Array(repeating: .none, count: 9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGame()
        
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        
        sender.setTitle(currentSymbol.rawValue, for: .normal)
        currentSymbol = currentSymbol.oposite
        
    }
    
    func setupGame() {
        model = Array(repeating: .none, count: 9)
        
        for button in buttons {
            button.setTitle(Symbol.none.rawValue, for: .normal)
        }
        
    }
}

