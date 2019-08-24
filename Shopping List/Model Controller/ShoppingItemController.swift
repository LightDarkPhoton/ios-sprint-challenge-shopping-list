//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Andrew Ruiz on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
    
    private var shoppingItemFileURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let fileName = "shoppingItems.plist"
        
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
    init() {
        createMovie()
        loadFromPersistentStore()
    }
    
    func createMovie() {
        guard UserDefaults.standard.bool(forKey: "ItemsHaveBeenCreated") != true else { return }
        
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for itemName in itemNames {
            let item = ShoppingItem(shoppingItem: itemName)
            shoppingItems.append(item)
        }
        
        saveToPersistentStore()
        
        UserDefaults.standard.set(true, forKey: "ItemsHaveBeenCreated")
    }
    
    func updateHasSeen(forShoppingItem shoppingItem: ShoppingItem) {
        shoppingItem.hasBeenAdded = !shoppingItem.hasBeenAdded
        saveToPersistentStore()
    }
    
    private func loadFromPersistentStore() {
        
        
        do {
            
            guard let fileURL = shoppingItemFileURL else { return }
            
            let shoppingData = try Data(contentsOf: fileURL)
            
            let plistDecoder = PropertyListDecoder()
            
            self.shoppingItems = try plistDecoder.decode([ShoppingItem].self, from: shoppingData)
            
        } catch {
            NSLog("Error decoding shopping list items from property list: \(error)")
        }
    }
    
    private func saveToPersistentStore() {
        
        let plistEncoder = PropertyListEncoder()
        
        do {
            
            let memoriesData = try plistEncoder.encode(shoppingItems)
            
            guard let fileURL = shoppingItemFileURL else { return }
            
            try memoriesData.write(to: fileURL)
        } catch {
            NSLog("Error encoding shopping list to property list: \(error)")
        }
    }
    
    
}
