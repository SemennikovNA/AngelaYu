//
//  ViewController.swift
//  Dice
//
//  Created by Nikita on 23.10.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    let diceImage = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"), UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix")]
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        let backImage = UIImage(named: "GreenBackground")
        image.frame = .zero
        image.image = backImage
        image.contentMode = .scaleToFill
        return image
    }()
    
    let logoImage: UIImageView = {
        let image = UIImageView()
        let backImage = UIImage(named: "DiceeLogo")
        image.frame = .zero
        image.image = backImage
        return image
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    let leftImage: UIImageView = {
        let left = UIImageView()
        left.frame = .zero
        left.layer.cornerRadius = 20
        left.clipsToBounds = true
        return left
    }()
    
    let rightImage: UIImageView = {
        let right = UIImageView()
        right.frame = .zero
        right.layer.cornerRadius = 20
        right.clipsToBounds = true
        return right
    }()
    
    let rollbutton: UIButton = {
        let rollButton = UIButton()
        rollButton.frame = .zero
        rollButton.setTitle("Roll", for: .normal)
        rollButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        rollButton.backgroundColor = UIColor(red: 155 / 255, green: 28 / 255, blue: 32 / 255, alpha: 1)
        rollButton.layer.cornerRadius = 20
        return rollButton
    }()

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomImageDice()
        addSubviewsAndTargets()
        makeConstaints()
    }
    
    //MARK: - Methods
    
    func addSubviewsAndTargets() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImage)
        view.addSubview(stackView)
        stackView.addSubview(leftImage)
        stackView.addSubview(rightImage)
        view.addSubview(rollbutton)
        rollbutton.addTarget(self, action: #selector(rollButtonTap), for: .touchUpInside)
    }
    
    func randomImageDice() {
        leftImage.image = diceImage.randomElement()!
        rightImage.image = diceImage.randomElement()!
    }
    
    //MARK: - @objc methods
    
    @objc func rollButtonTap() {
        randomImageDice()
    }

}

//MARK: - Extension

extension ViewController {
    
    func makeConstaints() {
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 150),
            logoImage.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 100),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftImage.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            leftImage.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 20),
            leftImage.widthAnchor.constraint(equalToConstant: 125),
            leftImage.heightAnchor.constraint(equalToConstant: 125)
        ])
        
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightImage.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            rightImage.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -20),
            rightImage.widthAnchor.constraint(equalToConstant: 125),
            rightImage.heightAnchor.constraint(equalToConstant: 125)
        ])
        
        rollbutton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rollbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            rollbutton.widthAnchor.constraint(equalToConstant: 135),
            rollbutton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }

}
