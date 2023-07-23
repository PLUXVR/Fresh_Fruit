//
//  UsersViewController.swift
//  LoginScreenFreshFruits
//
//  Created by Максим Беседин on 01.03.2023.
//

import UIKit

class UsersViewController: UIViewController {
    let backgroundImageView = UIImageView()

    @IBOutlet private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.hidesBackButton = true
        setBackground()
        collectionView.dataSource = self
        let buttonCellNib = UINib(nibName: "ButtonCell", bundle: nil)
        collectionView.register(buttonCellNib, forCellWithReuseIdentifier: "ButtonCell")
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
}

extension UsersViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
        return cell
    }
}
