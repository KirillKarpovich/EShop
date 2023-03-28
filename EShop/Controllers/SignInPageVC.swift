//
//  SignInPageVC.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

class SignInVC: UIViewController {
    
    private let titleLabel = UILabel()
    private let firstNameTextField = LoginTextField(placeholder: "First name")
    private let lastNameTextField = LoginTextField(placeholder: "Last name")
    private let emailTextField = LoginTextField(placeholder: "Email")
    private let passwordTextField = LoginTextField(placeholder: "Password")
    private let signInButton = ESButton(title: "Sign in")
    private let googleAuthButton = AuthButton(title: "Sign in with Google", imageName: "Google")
    private let appleAuthButton = AuthButton(title: "Sign in with Apple", imageName: "Apple")
    private let questionLabel = UILabel()
    private let loginButton = UIButton()
    
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
        createDismissKeyboardTabGesture()
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(hex: "#FAF9FF")
        view.addSubviews(
             titleLabel,
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
        
        questionLabel.text = "Already have an account?"
        questionLabel.font = EFonts.monsterrat(size: 10)
        questionLabel.textColor = .gray
        
        loginButton.setTitle("Log in", for: .normal)
        loginButton.titleLabel?.font = EFonts.monsterrat(size: 10)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        
        appleAuthButton.anchor(top: nil, leading: googleAuthButton.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 130, right: 20))
        
        googleAuthButton.centerXInSuperview()
        googleAuthButton.anchor(top: nil, leading: nil, bottom: appleAuthButton.topAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 20, right: 20))
        
    }
    
    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [
            firstNameTextField,
            emailTextField,
            passwordTextField,
            signInButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 33
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.centerXInSuperview()
        stackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: view.frame.size.height/3.1, left: 42, bottom: 0, right: 42))
    
        titleLabel.anchor(top: nil, leading: nil, bottom: stackView.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 75, right: 0))
        
        questionLabel.anchor(top: stackView.bottomAnchor, leading: stackView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 0, bottom: 0, right: 0))
        questionLabel.constrainHeight(constant: 15)
        questionLabel.constrainWidth(constant: 130)
        
        loginButton.anchor(top: stackView.bottomAnchor, leading: questionLabel.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 0, bottom: 0, right: 0))
        loginButton.constrainHeight(constant: 15)
        loginButton.constrainWidth(constant: 40)
    }
    
    @objc private func signInButtonTapped() {
        guard let firstName = firstNameTextField.text else {
            showAlert(withTitle: "No Name", message: "Please enter your name")
            return
        }

        guard let email = emailTextField.text, email.isValidEmail else {
            showAlert(withTitle: "Invalid email", message: "Please enter a valid email address.")
            return
        }

        guard let password = passwordTextField.text, password.count >= 6 else {
            showAlert(withTitle: "Invalid password", message: "Password must be at least 6 characters long.")
            return
        }
        
        let userData: [String: String] = ["firstName": firstName,
                                          "lastName": lastNameTextField.text ?? "",
                                          "email": email,
                                          "password": password]
        
        UserDefaults.standard.set(userData, forKey: firstName)
        
        coordinator.coordinateToTabBar()
    }
    
    @objc private func logInButtonTapped() {
        coordinator.coordinateToLogIn()
    }
    
    private func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func createDismissKeyboardTabGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}                                      
