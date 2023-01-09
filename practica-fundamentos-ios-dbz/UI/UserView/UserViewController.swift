//
//  UserViewController.swift
//  practica-fundamentos-ios-dbz
//
//  Created by Pablo Gómez on 9/1/23.
//

import UIKit

class UserViewController: UIViewController {

    
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userEmail.text = LocalDataLayer.shared.getValue(key: .email)
    }
    
    @IBAction func logOutTapped(_ sender: UIButton) {
        LocalDataLayer.shared.deleteAll()
        
        DispatchQueue.main.async {
            UIApplication.shared.connectedScenes.compactMap{($0 as? UIWindowScene)?.keyWindow}.first?.rootViewController = LoginViewController()
        }
        
    }
    
    

}
