//
//  ViewController.swift
//  HW11-iOS12
//
//  Created by Anton Popeka on 17/01/24.
//

import UIKit

class MyView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var action = UIAction { _  in
        self.passwordTextField.isSecureTextEntry.toggle()
        
        if self.passwordTextField.isSecureTextEntry {
            self.hidenPassword.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        } else {
            self.hidenPassword.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginTexField: UITextField = {
        let textField = UITextField()
        textField.setLeftIcon(UIImage(systemName: "person") ?? UIImage())
        textField.placeholder = "Login"
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var viewLogin: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = true
        view.addSubview(loginTexField)
        
        NSLayoutConstraint.activate([
            loginTexField.topAnchor.constraint(equalTo: view.topAnchor),
            loginTexField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginTexField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            loginTexField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        return view
    }()
    
    private lazy var hidenPassword: UIButton = {
        let button = UIButton(primaryAction: action)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.layer.rasterizationScale = UIScreen.main.scale
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.setLeftIcon(UIImage(systemName: "lock") ?? UIImage())
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var viewPassword: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = true
        view.addSubview(passwordTextField)
        view.addSubview(hidenPassword)
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: view.topAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            hidenPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            hidenPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return view
    }()
    
    private lazy var buttonLogin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .colorBtn
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.titleLabel?.textColor = .blue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var bgImageView: UIImageView = {
        let image = UIImage(named: "bg")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var forgotPassword: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password?", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.addTarget(self, action: #selector(tapForgotPasswordButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var orConnect: UILabel = {
        let label = UILabel()
        label.text = "or connect with"
        label.textColor = .gray
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var lineHorizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            leftView, 
            orConnect,
            rightView
        ])
        stack.axis = .horizontal
        stack.spacing = 2
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftView.widthAnchor.constraint(equalToConstant: 80),
            leftView.heightAnchor.constraint(equalToConstant: 0.7),
            
            rightView.widthAnchor.constraint(equalToConstant: 80),
            rightView.heightAnchor.constraint(equalToConstant: 0.7)
        ])
        return stack
    }()
    
    private lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.setTitle("Facebook", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapFacebookButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var facebookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .facebookBtn
        imageView.layer.rasterizationScale = UIScreen.main.scale
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var facebookView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorBtn
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = false
        view.addSubViews([
            facebookImageView,
            facebookButton
        ])
        
        NSLayoutConstraint.activate([
            facebookButton.topAnchor.constraint(equalTo: view.topAnchor),
            facebookButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            facebookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            facebookButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            facebookImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            facebookImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return view
    }()
    
    private lazy var twitterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Twitter", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapTwitterButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var twitterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .twitterBtn
        imageView.layer.rasterizationScale = UIScreen.main.scale
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var twitterView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorBtn
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = false
        view.addSubViews([
           twitterImageView,
           twitterButton
        ])
        
        NSLayoutConstraint.activate([
            twitterButton.topAnchor.constraint(equalTo: view.topAnchor),
            twitterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            twitterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            twitterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            twitterImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            twitterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            facebookView, 
            twitterView
        ])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            facebookView.heightAnchor.constraint(equalToConstant: 44),
            twitterView.heightAnchor.constraint(equalToConstant: 44)
        ])
        return stack
    }()
    
    private lazy var dontHaveAccount: UILabel = {
        let label = UILabel()
        label.text = "Dont have account?"
        label.textColor = .gray
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.colorBtn, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.textColor = .colorBtn
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            dontHaveAccount,
            signUpButton
        ])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .firstBaseline
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Inits
    
    // MARK: - Lifecycle
    
    override func loadView() {
        let myView = MyView()
        view = myView
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        createGesture()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    deinit {
        
    }
    
    // MARK: - Setups
    
    private func createGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(gesture)
    }
    
    private func setupView() {
        
    }
    
    private func setupHierarchy() {
        view.addSubViews([bgImageView, 
                          loginLabel,
                          viewLogin,
                          viewPassword,
                          buttonLogin,
                          forgotPassword,
                          lineHorizontalStack,
                          buttonStackView,
                          signUpStack
                         ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            forgotPassword.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 20),
            forgotPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPassword.heightAnchor.constraint(equalToConstant: 14),
            
            bgImageView.topAnchor.constraint(equalTo: view.topAnchor),
            bgImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 200),
            
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            viewLogin.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50),
            viewLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            viewLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            viewLogin.heightAnchor.constraint(equalToConstant: 44),
            
            viewPassword.topAnchor.constraint(equalTo: viewLogin.bottomAnchor, constant: 20),
            viewPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            viewPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            viewPassword.heightAnchor.constraint(equalToConstant: 44),
            
            buttonLogin.topAnchor.constraint(equalTo: viewPassword.bottomAnchor, constant: 50),
            buttonLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            buttonLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            buttonLogin.heightAnchor.constraint(equalToConstant: 44),
            
            lineHorizontalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lineHorizontalStack.topAnchor.constraint(equalTo: forgotPassword.bottomAnchor, constant: 150),
            lineHorizontalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            lineHorizontalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            lineHorizontalStack.widthAnchor.constraint(equalToConstant: 15),
            
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.topAnchor.constraint(equalTo: lineHorizontalStack.bottomAnchor, constant: 20),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            
            signUpStack.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 20),
            signUpStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            signUpStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func tapLoginButton() {
        print("tapLogin")
    }
    
    @objc
    private func tapForgotPasswordButton() {
        print("tapForgot")
    }
    
    @objc
    private func tapFacebookButton() {
        print("tapFacebook")
    }
    
    @objc
    private func tapTwitterButton() {
        print("tapTwitter")
    }
    
    @objc
    private func tapSignUpButton() {
        print("tapSignUp")
    }
    
    @objc
    private func viewTapped() {
        view.endEditing(true)
    }
}

