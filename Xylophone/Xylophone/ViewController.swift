//
//  ViewController.swift
//  Xylophone
//
//  Created by Nikita on 27.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UI Elements
    
    let mainView: UIView = {
        let main = UIView()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.frame = .zero
        main.backgroundColor = .black
        return main
    }()
    
    let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.frame = .zero
        stack.backgroundColor = .black
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    //MARK: - Properties
    
    let soundPlayer = Player()
    let buttonsArrayTitleLabel = ["C", "D", "E", "F", "G", "A", "B"]
    let buttonsColor = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.systemBlue, UIColor.blue, UIColor.purple]
    
    
    //MARK: - Life cyclce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstreints()
        createButtons()
    }
    
    //MARK: - Private methods
    
    private func addSubviews() {
        view.addSubview(mainView)
        mainView.addSubview(buttonStack)
    }
    
   private func createButtons() {
        
        for (index, element) in buttonsArrayTitleLabel.enumerated() {

            let button: UIButton = {
                let button = UIButton()
                button.tag = index
                button.setTitle(element, for: .normal)
                button.backgroundColor = buttonsColor[index]
                button.isHighlighted = true
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                button.setTitleColor(.black, for: .normal)
                button.layer.cornerRadius = 20
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                return button
            }()
            buttonStack.addArrangedSubview(button)
        }
    }
    
    
    //MARK: - @objc methods
    
    @objc func buttonTapped(sender: UIButton) {
        guard let letter = sender.titleLabel?.text else { return }
        sender.alpha = 0.5
        print("Start")
        soundPlayer.play(nameButton: letter)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
            print("End ")
        }
    }
}

    //MARK: - Extension

extension ViewController {
    
    //MARK: - NSLayoutConstraints
    
    func makeConstreints() {
        
        // Main view
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mainView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            
        ])
        // Button stack view
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            buttonStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            buttonStack.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            buttonStack.rightAnchor.constraint(equalTo: mainView.rightAnchor)
        ])
    }
}
