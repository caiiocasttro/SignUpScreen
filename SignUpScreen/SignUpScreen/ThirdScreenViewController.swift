//
//  ThirdScreenViewController.swift
//  SignUpScreen
//
//  Created by Caio Chaves on 27.08.23.
//

import UIKit

class ThirdScreenViewController: UIViewController {
    
    //MARK: Properties
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Registered"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        return label
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
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
    }

}
