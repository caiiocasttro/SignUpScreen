//
//  ViewController.swift
//  SignUpScreen
//
//  Created by Caio Chaves on 26.08.23.
//

import UIKit

class FirstScreenViewController: UIViewController {
    
    //MARK: Properties
    private var signUp: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }

    
    //MARK: Configuring layout
    private func configureLayout() {
        
        // Setting background
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let background = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        background.image = UIImage(named: "Test")
        background.contentMode = .scaleAspectFill
        
        //Adding subviews
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(signUp)
        
        signUp.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            signUp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signUp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signUp.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            signUp.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }

}

