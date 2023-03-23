//
//  SignInPageVC.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

class SignInVC: UIViewController {
    
    let titleLabel = UILabel()
    let firstNameTextField = LoginTextField(placeholder: "First name")
    let lastNameTextField = LoginTextField(placeholder: "Last name")
    let emailTextField = LoginTextField(placeholder: "Email")
    let passwordTextField = LoginTextField(placeholder: "Password")
    let signInButton = ESButton(title: "Sign in")
    let googleAuthButton = AuthButton(title: "Sign in with Google", imageName: "Google")
    let appleAuthButton = AuthButton(title: "Sign in with Apple", imageName: "Apple")
    let questionLabel = UILabel()
    let loginButton = UIButton()
    
    private let coordinator: SignInFlow
    
    init(coordinator: SignInFlow) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupStackView()
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(hex: "#FAF9FF")
        view.addSubviews(
             titleLabel,
             firstNameTextField,
             lastNameTextField,
             emailTextField,
             passwordTextField,
             googleAuthButton,
             appleAuthButton,
             questionLabel,
             loginButton
        )

        titleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 26)
        titleLabel.text = "Sign in"
        titleLabel.centerXInSuperview()
        
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true

        signInButton.constrainHeight(constant: 45)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        appleAuthButton.anchor(top: nil, leading: googleAuthButton.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 130, right: 20))
        googleAuthButton.centerXInSuperview()
        googleAuthButton.anchor(top: nil, leading: nil, bottom: appleAuthButton.topAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 20, right: 20))
        
    }
    
    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [
            firstNameTextField,
            lastNameTextField,
            emailTextField,
            passwordTextField,
            signInButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.centerXInSuperview()
        stackView.centerYInSuperview()
        stackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 42, bottom: 0, right: 42))
    
        titleLabel.anchor(top: nil, leading: nil, bottom: stackView.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 75, right: 0))
    }
    
    @objc private func signInButtonTapped() {
//        guard let email = emailTextField.text, email.isValidEmail else {
//            showAlert(withTitle: "Invalid email", message: "Please enter a valid email address.")
//            return
//        }
//        
//        guard let password = passwordTextField.text, password.count >= 6 else {
//            showAlert(withTitle: "Invalid password", message: "Password must be at least 6 characters long.")
//            return
//        }
        coordinator.coordinateToTabBar()
    }
    
    private func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

              
                                                            


                                                            
                                                            
