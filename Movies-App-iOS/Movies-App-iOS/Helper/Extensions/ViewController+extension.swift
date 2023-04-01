//
//  ViewController+extension.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import UIKit

extension UIViewController {
    
    func alert(title: String = "", message: String, actions: [(String, UIAlertAction.Style)]) {
        
        let alerting = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alerting.addAction(UIAlertAction(title: action.0, style: action.1, handler: nil))
        }
        self.present(alerting, animated: true, completion: nil)
    }
}
