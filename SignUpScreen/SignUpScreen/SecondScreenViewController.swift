//
//  SecondScreenViewController.swift
//  SignUpScreen
//
//  Created by Caio Chaves on 26.08.23.
//

import UIKit

class SecondScreenViewController: UIViewController {

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
        
        view.addSubview(background)
        view.sendSubviewToBack(background)
        
    }

}
