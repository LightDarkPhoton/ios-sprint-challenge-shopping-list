//
//  ShoppingListOrderViewController.swift
//  Shopping List
//
//  Created by Andrew Ruiz on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListOrderViewController: UIViewController {
    
    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController : ShoppingItemController!
    let localNotificationHelper = LocalNotificationHelper()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        shoppingLabel.text = "You currently have \(shoppingItemController.shoppingItems.filter({$0.hasBeenAdded}).count) shopping items."
    }
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        
        localNotificationHelper.getAuthorizationStatus { (status) in
            
            switch status {
                
            case .authorized:
                
                self.localNotificationHelper.scheduleOrderDeliveryNotification(withName: name, andAddress: address)
                
            case .denied:
                
                NSLog("User has denied authorization to receive local notifications")
                
            case .notDetermined:
                
                self.localNotificationHelper.requestAuthorization(completion: { (success) in
                    
                    guard success else { NSLog("User has denied authorization to receive local notifications"); return }
                    
                    self.localNotificationHelper.scheduleOrderDeliveryNotification(withName: name, andAddress: address)
                })
            default:
                break
            }
        }
    }
}
