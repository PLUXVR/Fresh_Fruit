//
//  RegViewController.swift
//  LoginScreenFreshFruits
//
//  Created by Максим Беседин on 27.10.2022.
//

import UIKit
import FirebaseAuth

class RegViewController: UIViewController {
    
    @IBOutlet weak var createAccountLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var registrationButton: YellowButton!
    @IBOutlet weak var haveAccountButton: WhiteButton!
    @IBOutlet weak var googleAuthButton: WhiteButton!
    @IBOutlet weak var faceBookAuthButton: WhiteButton!
    @IBOutlet weak var appleAuthButton: WhiteButton!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var navBarItem: UINavigationItem!
    
    
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
    super.viewDidLoad()
//        title = "RegViewController"
       setBackground()
    }
    func setBackground () {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named:"Fruits")
        
        backgroundImageView.frame = self.view.bounds
        backgroundImageView.blurImage()
        self.view.addSubview(self.backgroundImageView)
        
        
        view.sendSubviewToBack(backgroundImageView)
    }
    @IBAction func GoogleRegistration(_ sender: Any) {
        
    }
    @IBAction func RegistrationButton(_ sender: Any) {
        print("Get started tapped")
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
                  return
              }
    // Get auth instance
    // attemp sign in
    // if failure, present alert to create account
    // if user continues, create account
        
    // check sign in on app launch
    // allow user to sign out with button
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else {
                // show account creation
                strongSelf.showCreateAccount(email: email, password: password)
                
                
                
                return
            }
            print("You have sign in")
            strongSelf.createAccountLabel.isHidden = true
            strongSelf.nameField.isHidden = true
            strongSelf.emailField.isHidden = true
            strongSelf.passwordField.isHidden = true
            strongSelf.registrationButton.isHidden = true
            strongSelf.haveAccountButton.isHidden = true
//            strongSelf.navBarItem.isHidden.
            strongSelf.googleAuthButton.isHidden = true
            strongSelf.faceBookAuthButton.isHidden = true
            strongSelf.appleAuthButton.isHidden = true
            
        })
    }
    func showCreateAccount(email: String, password: String) {
        let alert  = UIAlertController(title: "Create account", message: "Would you like to create an account", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self]result, error in
                
                guard let strongSelf = self else {
                    return
                }
                guard error == nil else {
                    // show account creation
                    print("Account creation failed")
                    return
                }
                print("You have sign in")
                strongSelf.createAccountLabel.isHidden = true
                strongSelf.nameField.isHidden = true
                strongSelf.emailField.isHidden = true
                strongSelf.passwordField.isHidden = true
                strongSelf.registrationButton.isHidden = true
                strongSelf.haveAccountButton.isHidden = true
    //            strongSelf.navBarItem.isHidden.
                strongSelf.googleAuthButton.isHidden = true
                strongSelf.faceBookAuthButton.isHidden = true
                strongSelf.appleAuthButton.isHidden = true
                
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in}))
        present(alert,animated: true)
    }
}
