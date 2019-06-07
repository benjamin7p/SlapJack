//
//  ViewController.swift
//  SlapJack
//
//  Created by Benjamin Poulsen PRO on 1/17/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck: Deck?
    var currentCard: Card?
    var seconds = 52
    var timer = Timer()
    var scoreCount = 0
    
    
    @IBOutlet weak var cardsGoneThroughLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var newGameButton: UIButton!
    
    
    @IBAction func newGameButtonTapped(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fire(timer:)), userInfo: nil, repeats: true)
    }
    
    
    @objc func fire(timer: Timer) {
        
        guard let deck = deck,
            let cards = deck.card,
            let singleCard = cards.allObjects[seconds - 1] as? Card,
            let imageURLString = singleCard.cardImage,
            //https://deckofcardsapi.com/static/img/QS.png
            let cardURL = URL(string: imageURLString) else {return}
        
        currentCard = singleCard
        CardInfoController.sharedController.searchCardImage(imageURL: cardURL) { (image) in
            DispatchQueue.main.async {
                self.cardImageView.image = image
            }
        }
        
        seconds -= 1
        cardsGoneThroughLabel.text = "Card \(seconds)"
        if seconds == 0 {
            newGameButton.isHidden = false
            cardPic()
            DeckController.sharedController.deleteDeck(deckToDelete: deck)
            timer.invalidate()
        }
    }
    
    
    func cardPic() {
        let backgroundImage = cardImageView
        backgroundImage?.image = UIImage(named: "aceOfSpades")!
    }
    
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard sender.view != nil else {return}
        if sender.state == .ended {
            if currentCard?.cardValue == "JACK" {
                scoreCount += 1
                scoreLabel.text = "Score \(scoreCount)"
            } else {
                scoreCount -= 1
                scoreLabel.text = "Score \(scoreCount)"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score \(scoreCount)"
        newGameButton.isHidden = true
        newGameButton.layer.cornerRadius = 5.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender: )))
        self.view.addGestureRecognizer(tap)
        
        deck = DeckController.sharedController.performNewDeckFetchRequest.first
        guard let deck = deck,
            let cards = deck.card,
            let singleCard = cards.allObjects[0] as? Card,
            let imageURLString = singleCard.cardImage,
            //https://deckofcardsapi.com/static/img/QS.png
            let cardURL = URL(string: imageURLString) else {return}
        
        CardInfoController.sharedController.searchCardImage(imageURL: cardURL) { (image) in
            DispatchQueue.main.async {
                self.cardImageView.image = image
            }
        }
        cardsGoneThroughLabel.text = "Card \(cards.count)"
        runTimer()
    }
    
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        cardPic()
        if pauseButton.titleLabel?.text == "Pause" {
            timer.invalidate()
            pauseButton.setTitle("Play", for: .normal)
        } else {
            if pauseButton.titleLabel?.text == "Play" {
                runTimer()
                pauseButton.setTitle("Pause", for: .normal)
            }
        }
    }
}
