//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Andrew Ruiz on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hasBeenAdded: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet{
            
        }
    }
}
