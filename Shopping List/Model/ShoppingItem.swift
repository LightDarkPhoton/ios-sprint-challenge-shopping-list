//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Andrew Ruiz on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItem: Codable {
    
    var shoppingItem: String
    var shoppingItemImageName: String
    var hasBeenAdded: Bool
    
    
    init(shoppingItem: String, hasBeenAdded: Bool = false) {
        self.shoppingItem = shoppingItem
        self.shoppingItemImageName = shoppingItem
        self.hasBeenAdded = hasBeenAdded
    }
    
    var image: UIImage {
        return UIImage(named: shoppingItemImageName)!
    }
}
