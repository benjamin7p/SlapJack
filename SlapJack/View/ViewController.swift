//
//  ViewController.swift
//  SlapJack
//
//  Created by Benjamin Poulsen PRO on 1/17/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck: Deck = Deck()

    @IBOutlet weak var cardsGoneThroughLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        DeckController.sharedController.GetNewDeck() { deck in
            if let deck = deck {
                self.deck = deck
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

