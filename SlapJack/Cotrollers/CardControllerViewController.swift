//
//  CardControllerViewController.swift
//  SlapJack
//
//  Created by Benjamin Poulsen PRO on 1/29/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit
import CoreData

class CardInfoController: UIViewController {
    
//    let baseURL = "https://deckofcardsapi.com/static/img/9C.png"
//
    static let sharedController = CardInfoController()
//
//    var cardImage: [Card] {
//        let request: NSFetchRequest<Card> = Card.fetchRequest()
//
//        do {
//            return try Stack.context.fetch(request)
//        } catch {
//            return []
//        }
//    }
// what i am getting returned = uiImage
    // how do i index through cards
    func searchCardImage(imageURL: URL, completion: ((UIImage?) -> Void)? = nil) {
        NetworkController.performNetworkRequest(for: imageURL) { (data, error) in
            guard let data = data,
                let image = UIImage(data: data) else {return}
            if let completion = completion {
                completion(image)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    

}
