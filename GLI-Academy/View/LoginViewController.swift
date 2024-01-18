//
//  ViewController.swift
//  GLI-Academy
//
//  Created by beni garcia on 17/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    var loginVM = LoginViewModel()
    var titleLabel = UILabel()
    var usernameTF = UITextField()
    var passwordTF = UITextField()
    var buttonLogin = UIButton()
    var errorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setAll()
    }
    
    func setAll() {
        titleLabel.text = "Login"
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        usernameTF.placeholder = "Username"
        usernameTF.borderStyle = .roundedRect
        usernameTF.layer.borderColor = UIColor.blue.cgColor
        usernameTF.layer.borderWidth = 1.0
        usernameTF.layer.cornerRadius = 8
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTF)
        
        passwordTF.placeholder = "Password"
        passwordTF.borderStyle = .roundedRect
        passwordTF.layer.borderColor = UIColor.blue.cgColor
        passwordTF.layer.borderWidth = 1.0
        passwordTF.layer.cornerRadius = 8
        passwordTF.isSecureTextEntry = true
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTF)
        
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.backgroundColor = .systemBlue
        buttonLogin.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        buttonLogin.layer.cornerRadius = 8
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonLogin)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            
            usernameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            usernameTF.widthAnchor.constraint(equalToConstant: 120),
            usernameTF.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 14),
            passwordTF.widthAnchor.constraint(equalToConstant: 120),
            passwordTF.heightAnchor.constraint(equalToConstant: 44),
            
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogin.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 14),
            buttonLogin.widthAnchor.constraint(equalToConstant: 120),
            buttonLogin.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    func setErrorLabel(errorInfo: String){
        errorLabel.text = errorInfo
        errorLabel.font = .preferredFont(forTextStyle: .body)
        errorLabel.textColor = .red
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 14)
        ])
    }
    
    @objc func loginTapped() {
        guard let username = usernameTF.text, let password = passwordTF.text else {
            return
        }
        if loginVM.validationLogin(username: username, password: password) == "Success" {
            navigationController?.pushViewController(StudentViewController(), animated: true)
            errorLabel.text = ""
            passwordTF.text = ""
        }else {
            setErrorLabel(errorInfo: loginVM.validationLogin(username: username, password: password))
            usernameTF.text = ""
            passwordTF.text = ""
        }
    }
}

