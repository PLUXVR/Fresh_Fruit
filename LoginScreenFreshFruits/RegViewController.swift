//
//  RegViewController.swift
//  LoginScreenFreshFruits
//
//  Created by Максим Беседин on 27.10.2022.
//

import FirebaseAuth
import UIKit

class RegViewController: UIViewController {
    @IBOutlet var createAccountLabel: UILabel!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var registrationButton: YellowButton!
    @IBOutlet var haveAccountButton: WhiteButton!
    @IBOutlet var googleAuthButton: WhiteButton!
    @IBOutlet var faceBookAuthButton: WhiteButton!
    @IBOutlet var appleAuthButton: WhiteButton!
    @IBOutlet var cancelButton: UIBarButtonItem!
    @IBOutlet var navBarItem: UINavigationItem!

    let backgroundImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "RegViewController"
        setBackground()
    }

    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        backgroundImageView.image = UIImage(named: "Fruits")

        backgroundImageView.frame = view.bounds
        backgroundImageView.blurImage()
        view.addSubview(backgroundImageView)

        view.sendSubviewToBack(backgroundImageView)
    }

    @IBAction func GoogleRegistration(_: Any) {}

    @IBAction func RegistrationButton(_: Any) {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty
        else {
            return
        }

        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] _, error in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else {
                // show account creation
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }

            print("You have sign in")
            //            strongSelf.createAccountLabel.isHidden = true
            //            strongSelf.nameField.isHidden = true
            //            strongSelf.emailField.isHidden = true
            //            strongSelf.passwordField.isHidden = true
            //            strongSelf.registrationButton.isHidden = true
            //            strongSelf.haveAccountButton.isHidden = true
            ////            strongSelf.navBarItem.isHidden.
            //            strongSelf.googleAuthButton.isHidden = true
            //            strongSelf.faceBookAuthButton.isHidden = true
            //            strongSelf.appleAuthButton.isHidden = true

            let usersViewController = strongSelf.storyboard?.instantiateViewController(withIdentifier: "UsersViewController")
            strongSelf.navigationController?.pushViewController(usersViewController!, animated: true)

        })
    }

    func showCreateAccount(email: String, password: String) {
        let alert = UIAlertController(title: "Create account", message: "Would you like to create an account", preferredStyle: .alert)
//        let alertSuccesfulRegistration = UIAlertController(title: "You have registered", message: "Сongratulations, you have registered", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] _, error in

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
                strongSelf.emailField.isHidden = true
                strongSelf.passwordField.isHidden = true
                strongSelf.registrationButton.isHidden = true
                strongSelf.haveAccountButton.isHidden = true
                strongSelf.googleAuthButton.isHidden = true
                strongSelf.faceBookAuthButton.isHidden = true
                strongSelf.appleAuthButton.isHidden = true
            })

//            alertSuccesfulRegistration.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in }))
        present(alert, animated: true)
    }
}
