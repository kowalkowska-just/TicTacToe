//
//  ViewController.swift
//  KiK
//
//  Created by Justyna Kowalkowska on 22/10/2020.
//

import UIKit

class KiKViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        print("'\(sender.titleLabel?.text) was tapped.")
    }
    

}

