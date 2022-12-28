//
//  ProductSelectionVC.swift
//  Delegates-Protocols
//
//  Created by Sean Allen on 11/30/22.
//

import UIKit

protocol ProductSelectionDelegate {
    // think of this like the JOB DESCRIPTION
    // these are the things the INTERN will need to know how to do
    func didSelectProduct(name: String, imageName: String)
}

// THE BOSS!!
class ProductSelectionVC: UIViewController {

    let iPhoneButton = UIButton()
    let iPadButton = UIButton()
    let macBookButton = UIButton()

    // Now that we have our job description,
    // we need to have a product selection INTERN on our screen
    // the actual JOB POSITION
    // the INTERN will the BOSS, I'll do the work
    var delegate: ProductSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @objc func iPhoneButtonTapped() {
        delegate?.didSelectProduct(name: "iPhone 14", imageName: "iphone")
        dismiss(animated: true)
    }

    @objc func iPadButtonTapped() {
        delegate?.didSelectProduct(name: "iPad Air", imageName: "ipad")
        dismiss(animated: true)
    }

    @objc func macBookButtonTapped() {
        delegate?.didSelectProduct(name: "MacBook", imageName: "mac")
        dismiss(animated: true)
    }
    
    func setupUI() {
        view.addSubview(iPhoneButton)
        view.addSubview(iPadButton)
        view.addSubview(macBookButton)
        view.backgroundColor = .systemBackground

        iPhoneButton.translatesAutoresizingMaskIntoConstraints = false
        iPadButton.translatesAutoresizingMaskIntoConstraints = false
        macBookButton.translatesAutoresizingMaskIntoConstraints = false

        iPhoneButton.configuration = .tinted()
        iPhoneButton.configuration?.title = "iPhone"
        iPhoneButton.configuration?.image = UIImage(systemName: "iphone")
        iPhoneButton.configuration?.imagePadding = 8
        iPhoneButton.configuration?.baseForegroundColor = .systemBlue
        iPhoneButton.configuration?.baseBackgroundColor = .systemBlue
        iPhoneButton.addTarget(self, action: #selector(iPhoneButtonTapped), for: .touchUpInside)

        iPadButton.configuration = .tinted()
        iPadButton.configuration?.title = "iPad"
        iPadButton.configuration?.image = UIImage(systemName: "ipad")
        iPadButton.configuration?.imagePadding = 8
        iPadButton.configuration?.baseForegroundColor = .systemTeal
        iPadButton.configuration?.baseBackgroundColor = .systemTeal
        iPadButton.addTarget(self, action: #selector(iPadButtonTapped), for: .touchUpInside)

        macBookButton.configuration = .tinted()
        macBookButton.configuration?.title = "MacBook Pro"
        macBookButton.configuration?.image = UIImage(systemName: "laptopcomputer")
        macBookButton.configuration?.imagePadding = 8
        macBookButton.configuration?.baseForegroundColor = .systemIndigo
        macBookButton.configuration?.baseBackgroundColor = .systemIndigo
        macBookButton.addTarget(self, action: #selector(macBookButtonTapped), for: .touchUpInside)

        let padding: CGFloat = 20

        NSLayoutConstraint.activate([
            iPadButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iPadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPadButton.heightAnchor.constraint(equalToConstant: 50),
            iPadButton.widthAnchor.constraint(equalToConstant: 280),

            iPhoneButton.bottomAnchor.constraint(equalTo: iPadButton.topAnchor, constant: -padding),
            iPhoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPhoneButton.heightAnchor.constraint(equalToConstant: 50),
            iPhoneButton.widthAnchor.constraint(equalToConstant: 280),

            macBookButton.topAnchor.constraint(equalTo: iPadButton.bottomAnchor, constant: padding),
            macBookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            macBookButton.heightAnchor.constraint(equalToConstant: 50),
            macBookButton.widthAnchor.constraint(equalToConstant: 280),
        ])
    }
}
