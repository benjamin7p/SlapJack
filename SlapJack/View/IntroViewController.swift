//
//  IntroViewController.swift
//  SlapJack
//
//  Created by Benjamin Poulsen PRO on 1/25/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    var deck: Deck = Deck()
    static let sharedController = IntroViewController()
    
    
    @IBOutlet weak var slapJackButton: UIButton!
    
    
    @IBAction func slapJackButtonTapped(_ sender: Any) {
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if DeckController.sharedController.performNewDeckFetchRequest.count == 0 {
            
            DeckController.sharedController.GetNewDeck() { deck in
                DispatchQueue.main.async {
                    if let deck = deck {
                        self.deck = deck
                        DeckController.sharedController.saveToPersistentStorage()
                    }
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        slapJackButton.layer.cornerRadius = 5.0
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "aceOfDiamondsImage")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
}


