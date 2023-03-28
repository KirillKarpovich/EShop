//
//  LogInVC.swift
//  EShop
//
//  Created by Kirill Karpovich on 28.03.23.
//

import UIKit

class LogInVC: UIViewController {
    
    private let titleLabel = UILabel()
    private let firstNameTextField = LoginTextField(placeholder: "First name")
    private let passwordTextField = LoginTextField(placeholder: "Password")
    private let LoginButton = ESButton(title: "Login")
    
    private let coordinator: LoginFlow

    init(coordinator: LoginFlow) {
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
            firstNameTextField,
            passwordTextField,
            LoginButton
        )
        
        titleLabel.font = UIFont(name: "Montserrat-SemiBold", size: 26)
        titleLabel.text = "Welcome back"
        titleLabel.centerXInSuperview()
        
        passwordTextField.isSecureTextEntry = true
        
        LoginButton.constrainHeight(constant: 45)
        LoginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
    }
    
    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [
            firstNameTextField,
            passwordTextField,
        ])
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.centerXInSuperview()
        stackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: view.frame.size.height/3.7, left: 42, bottom: 0, right: 42))
    
        titleLabel.anchor(top: nil, leading: nil, bottom: stackView.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 75, right: 0))
        
        LoginButton.anchor(top: stackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 80, left: 42, bottom: 0, right: 42))
    }
    
    @objc private func loginButtonTapped() {
        guard let firstName = firstNameTextField.text else {
            showAlert(withTitle: "No Name", message: "Please enter your name")
            return
        }

        guard let password = passwordTextField.text, password.count >= 6 else {
            showAlert(withTitle: "Invalid password", message: "Password must be at least 6 characters long.")
            return
        }
        if let userData = UserDefaults.standard.dictionary(forKey: firstName) as? [String: String] {
            if userData["password"] == password {
                coordinator.coordinateToTabBar()
                return
            }
        }
        showAlert(withTitle: "Not found", message: "Wrong name or password")
        firstNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func createDismissKeyboardTabGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
