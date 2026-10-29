//
//  HomeController.swift
//  NurApp
//
//  Created by Ferid Suleymanzade on 27.10.26.
//

import UIKit

final class HomeController: BaseController {
    
    private lazy var illustrationImageView: UIView = {
        let imageView = UIImageView()
        let image = UIImage(named: "welcomeIllustration")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageRatio = (image?.size.height ?? 500) / (image?.size.width ?? 390)
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: imageRatio).isActive = true
        return imageView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "nurlogo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        return imageView
    }()
    
    private lazy var  skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.green1, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var dot1: UIView = {
        let dot = UIView()
        dot.backgroundColor = .green1
        dot.layer.cornerRadius = 2
        dot.translatesAutoresizingMaskIntoConstraints = false
        return dot
    }()
    
    private lazy var dot2: UIView = {
        let dot = UIView()
        dot.backgroundColor = .dotInactive
        dot.layer.cornerRadius = 2
        dot.translatesAutoresizingMaskIntoConstraints = false
        return dot
    }()
    
    private lazy var dot3: UIView = {
        let dot = UIView()
        dot.backgroundColor = .dotInactive
        dot.layer.cornerRadius = 2
        dot.translatesAutoresizingMaskIntoConstraints = false
        return dot
    }()
    
    private lazy var dot4: UIView = {
        let dot = UIView()
        dot.backgroundColor = .dotInactive
        dot.layer.cornerRadius = 2
        dot.translatesAutoresizingMaskIntoConstraints = false
        return dot
    }()
    
    private lazy var dotsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dot1, dot2, dot3, dot4])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bring the Quran closer to your everyday life."
        label.font = .newsReader(34)
        label.textColor = .green1
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Read, listen, reflect, and build a meaningful connection with the Holy Quran."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .muted
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .green1
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(getStartedTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("I already have an account", for: .normal)
        button.setTitleColor(.green1, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func configureConstraints() {
        view.addSubview(illustrationImageView)
        view.addSubview(logoImageView)
        view.addSubview(skipButton)
        view.addSubview(dotsStackView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(getStartedButton)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            
            illustrationImageView.topAnchor.constraint(equalTo: view.topAnchor),
            illustrationImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            illustrationImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoImageView.centerYAnchor.constraint(equalTo: skipButton.centerYAnchor),
            
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            skipButton.heightAnchor.constraint(equalToConstant: 44),
            
            dot1.widthAnchor.constraint(equalToConstant: 28),
            dot1.heightAnchor.constraint(equalToConstant: 4),
            dot2.widthAnchor.constraint(equalToConstant: 8),
            dot2.heightAnchor.constraint(equalToConstant: 4),
            dot3.widthAnchor.constraint(equalToConstant: 8),
            dot3.heightAnchor.constraint(equalToConstant: 4),
            dot4.widthAnchor.constraint(equalToConstant: 8),
            dot4.heightAnchor.constraint(equalToConstant: 4),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 54),
            
            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            getStartedButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -8),
            getStartedButton.heightAnchor.constraint(equalToConstant: 54),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            subtitleLabel.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -32),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -14),
            
            dotsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dotsStackView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -20)
        ])
    }
    
    @objc private func skipTapped() {
        
    }
    
    @objc private func getStartedTapped() {
        
    }
    
    @objc private func loginTapped() {
        
    }
}


