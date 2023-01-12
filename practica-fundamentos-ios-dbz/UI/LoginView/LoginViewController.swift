//
//  LoginViewController.swift
//  practica-fundamentos-ios-dbz
//
//  Created by Pablo Gómez on 7/1/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        emailText.center.x -= view.bounds.width
        passwordText.center.x -= view.bounds.width
        signInButton.center.x += view.bounds.width
        
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0){
            self.emailText.center.x += self.view.bounds.width
            self.passwordText.center.x += self.view.bounds.width
            self.signInButton.center.x -= self.view.bounds.width
        }
        
        
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        signInButton.configuration?.showsActivityIndicator = true
        guard let email=emailText.text, !email.isEmpty else {
            print("email is empty!")
            signInButton.configuration?.showsActivityIndicator = false
            return
        }
        
        guard let password = passwordText.text, !password.isEmpty else {
            print("password is empty!")
            signInButton.configuration?.showsActivityIndicator = false
            return
        }
        
        NetworkLayer.shared.login(email: email, password: password) { token, error in
            if let token = token {
                LocalDataLayer.shared.save(value: token, key: .token)
                print("Valid token: \(token)")
                
                LocalDataLayer.shared.save(value: email, key: .email)
                
                DispatchQueue.main.async {
                    UIApplication.shared.connectedScenes.compactMap{($0 as? UIWindowScene)?.keyWindow}.first?.rootViewController = HomeTabBarController()
                }

                
            } else {
                print("Login Error: ", error?.localizedDescription ?? "")
            }
        }
        
    }
    
}
