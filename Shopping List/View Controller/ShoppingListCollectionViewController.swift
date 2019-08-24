//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Andrew Ruiz on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    // Properties
    let shoppingItemController = ShoppingItemController()
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = shoppingItemController.shoppingItems[indexPath.row]
        
        shoppingItemController.updateHasSeen(forShoppingItem: item)
        
        collectionView.reloadItems(at: [indexPath])
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell() }
        
        let item = shoppingItemController.shoppingItems[indexPath.row]
        
        cell.shoppingItem = item
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "ToSendOrderVC" else { return }
        
        let sendOrderVC = segue.destination as? ShoppingListOrderViewController
        
        sendOrderVC?.shoppingItemController = shoppingItemController
    }

}
