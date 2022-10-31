//
//  RegViewController.swift
//  LoginScreenFreshFruits
//
//  Created by Максим Беседин on 27.10.2022.
//

import UIKit

class RegViewController: UIViewController {
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
    super.viewDidLoad()
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
}
