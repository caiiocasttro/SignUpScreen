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
        button.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
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
            signUp.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            signUp.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        signUp.addTarget(self, action: #selector(signUpDidTapped), for: .touchUpInside)
        
    }
    
    //MARK: Button action
    
    @objc func signUpDidTapped() {
        let vc = SecondScreenViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

