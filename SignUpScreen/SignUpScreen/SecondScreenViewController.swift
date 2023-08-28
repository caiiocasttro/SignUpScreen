//
//  SecondScreenViewController.swift
//  SignUpScreen
//
//  Created by Caio Chaves on 26.08.23.
//

import UIKit
import Combine

class SecondScreenViewController: UIViewController {
    
    //MARK: Properties
    private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = "Name"
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 20, height: 0))
        textField.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        textField.layer.shadowRadius = 4
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowOffset = CGSize(width: 0, height: 0)
        textField.clipsToBounds = true
        return textField
    }()
    
    private var emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = "Email"
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 20, height: 0))
        textField.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        textField.layer.shadowRadius = 4
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowOffset = CGSize(width: 0, height: 0)
        textField.clipsToBounds = true
        return textField
    }()
    
    private var passTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = "Password"
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 20, height: 0))
        textField.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        textField.layer.shadowRadius = 4
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowOffset = CGSize(width: 0, height: 0)
        textField.clipsToBounds = true
        return textField
    }()
    
    private var confirmPassTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = "Confirm password"
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 20, height: 0))
        textField.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        textField.layer.shadowRadius = 4
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowOffset = CGSize(width: 0, height: 0)
        textField.clipsToBounds = true
        return textField
    }()
    
    private var registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.3)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .disabled)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    @Published private var name = ""
    
    @Published private var email = ""
    
    @Published private var password = ""
    
    @Published private var confirmPass = ""
    
    var createButton: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        configuringTextField()
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        
        // Title
        navigationItem.title = "Sign up"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Setting background
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let background = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        background.image = UIImage(named: "Test")
        background.contentMode = .scaleAspectFill
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passTextField)
        view.addSubview(confirmPassTextField)
        view.addSubview(registerButton)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPassTextField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmPassTextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 20),
            confirmPassTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmPassTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmPassTextField.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: confirmPassTextField.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    private func configuringTextField() {
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passTextField.delegate = self
        confirmPassTextField.delegate = self
        
        registerButton.addTarget(self, action: #selector(registerDidTapped), for: .touchUpInside)
        
        createButton = validatedCredentials
            .map { $0 != nil }
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: registerButton)
            
        
    }
    
    var validateName: AnyPublisher<String?, Never> {
        return $name
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { name in
                return Future { promise in
                    self.nameAvailable(name) { available in
                        promise(.success(available ? name : nil))
                    }
                }
            }
            .eraseToAnyPublisher()
    }
    
    var validateEmail: AnyPublisher<String?, Never> {
        return $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .flatMap { emailText in
                return Future { promise in
                    self.nameAvailable(emailText) { available in
                        promise(.success(available ? emailText : nil))
                    }
                }
            }
            .eraseToAnyPublisher()
    }
    
    var validatePassword: AnyPublisher<String?, Never> {
        return Publishers.CombineLatest($password, $confirmPass)
            .map { pass, passAgain in
                guard pass == passAgain, pass.count > 0 else { return nil }
                return pass
            }
            .map {
                ($0 ?? "") == "password1" ? nil : $0
            }
            .eraseToAnyPublisher()
    }
    
    var validatedCredentials: AnyPublisher<(String, String, String)?, Never> {
        return Publishers.CombineLatest3(validateName, validateEmail, validatePassword)
            .receive(on: RunLoop.main)
            .map { nameText, emailText, passwordText in
                guard let name = nameText, let email = emailText, let password = passwordText else { return nil }
                return (name, email, password)
            }
            .eraseToAnyPublisher()
    }
    
    private func nameAvailable(_ name: String, completion: (Bool) -> Void) {
        completion(!name.isEmpty)
    }
    
    //MARK: Button action
    @objc private func registerDidTapped() {
        let vc = ThirdScreenViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SecondScreenViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldText = textField.text ?? ""
        let text = (textFieldText as NSString).replacingCharacters(in: range, with: string)
        
        if textField == nameTextField { name = text }
        if textField == emailTextField { email = text }
        if textField == passTextField { password = text }
        if textField == confirmPassTextField { confirmPass = text }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            passTextField.becomeFirstResponder()
        } else if textField == passTextField {
            confirmPassTextField.becomeFirstResponder()
        } else if textField == confirmPassTextField {
            textField.resignFirstResponder()
            if registerButton.isEnabled {
                registerButton.backgroundColor = UIColor.systemBlue
            }
        }
        
        return true
    }
    
}
