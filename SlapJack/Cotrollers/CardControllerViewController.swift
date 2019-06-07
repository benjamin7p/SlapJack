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
    
    static let sharedController = CardInfoController()
    
    
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
