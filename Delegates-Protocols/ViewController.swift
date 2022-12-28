//
//  ViewController.swift
//  Delegates-Protocols
//
//  Created by Sean Allen on 11/30/22.
//

import UIKit

/*
  Big picture context: BOSS and INTERN
  Great for 1-to-1 communication
  A delegate sits back and waits to be told when and what to do
  You don't call delegate methods themselves
  They get called automatically when they're told what to do
 */

// THE INTERN - sitting back and waiting to be told what to do
class ViewController: UIViewController, ProductSelectionDelegate {
    // the intern has to apply for the job: ProductSelectionDelegate

    let productImageView = UIImageView()
    let productNameLabel = UILabel()
    let chooseProductButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // this INTERN needs to how to do this job from the JOB DESCRIPTION
    // this method will not be called in this VC!!
    func didSelectProduct(name: String, imageName: String) {
        productNameLabel.text = name
        productImageView.image = UIImage(named: imageName)
    }

    @objc func presentProductSelectionVC() {
        let destinationVC = ProductSelectionVC()
        
        // this is the INTERN telling the BOSS I'm signing up for the job
        destinationVC.delegate = self

        destinationVC.modalPresentationStyle = .pageSheet
        destinationVC.sheetPresentationController?.detents = [.medium()]
        destinationVC.sheetPresentationController?.prefersGrabberVisible = true
        present(destinationVC, animated: true)
    }

    func setupUI() {
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
        view.addSubview(chooseProductButton)

        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseProductButton.translatesAutoresizingMaskIntoConstraints = false

        productImageView.image = UIImage(named: "all-products")

        productNameLabel.text = "Apple Product Line"
        productNameLabel.textAlignment = .center
        productNameLabel.font = .systemFont(ofSize: 20, weight: .medium)
        productNameLabel.textColor = .darkGray

        chooseProductButton.configuration = .tinted()
        chooseProductButton.configuration?.title = "Choose Product"
        chooseProductButton.configuration?.image = UIImage(systemName: "apple.logo")
        chooseProductButton.configuration?.imagePadding = 8
        chooseProductButton.addTarget(self, action: #selector(presentProductSelectionVC), for: .touchUpInside)

        let padding: CGFloat = 20

        NSLayoutConstraint.activate([
            productImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 225),
            productImageView.widthAnchor.constraint(equalToConstant: 300),

            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: padding),
            productNameLabel.centerXAnchor.constraint(equalTo: productImageView.centerXAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            productNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),

            chooseProductButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            chooseProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseProductButton.heightAnchor.constraint(equalToConstant: 50),
            chooseProductButton.widthAnchor.constraint(equalToConstant: 260)
        ])
    }
}

