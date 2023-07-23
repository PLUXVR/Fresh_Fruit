//
//  ButtonCell.swift
//  LoginScreenFreshFruits
//
//  Created by Максим Беседин on 01.03.2023.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    // MARK: - IBOutlets

    @IBOutlet private var topButton: UIButton!
    @IBOutlet private var bottomButton: UIButton!

    // MARK: - Public

    func configure(topImage: UIImage?, bottomImage: UIImage?) {
        topButton.setImage(topImage, for: .normal)
        bottomButton.setImage(bottomImage, for: .normal)
    }
}
