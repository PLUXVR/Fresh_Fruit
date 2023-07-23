//
//  ViewController.swift
//  LoginScreenFreshFruits
//
//  Created by Максим Беседин on 24.10.2022.
//

import UIKit

class ViewController: UIViewController {
    let backgroundImageView = UIImageView()
    let iconImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "ViewController"
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

    @IBAction func GetStartedButton(_: UIButton) {
//        let regViewController = storyboard?.instantiateViewController(withIdentifier: "RegViewController")
//        let regControler = regViewController as! RegViewController
//        self.navigationController?.pushViewController(regViewController!, animated: true)
    }
}

// @objc func stepNexButtonTaped(sender: UIButton){
//    let calculateController = storyboard?.instantiateViewController(withIdentifier: "CalculatingViewController")
//    let newControler = calculateController as! CalculatingViewController
//    if self.routeDistance != nil {
//        newControler.distance = self.routeDistance
//        self.navigationController?.pushViewController(calculateController!, animated: true)
//    }
//    else
//    {
//        alertError(title: "Ошибка", message: "Попробуйте еще раз")
//    }
//
//
// }

extension UIImageView {
    func blurImage() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemChromeMaterial)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 1
        blurEffectView.frame = bounds
        addSubview(blurEffectView)
    }
}
