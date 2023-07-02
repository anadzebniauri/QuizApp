//
//  ViewController.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 13.06.23.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    private let scrollView = UIScrollView()
    private let myFirstQuizView = MyFirstQuizView()
    private let typingView = TypingView()
    private let startQuizButtonView = StartQuizButtonView()
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    //MARK: - Set Up
    private func setUp() {
        setUpScrollView()
        setUpMyFirstQuizView()
        setUpTypingView()
        setUpStartQuizButtonView()
        registerKeyboardNotifications()
    }
    
    //MARK: - Scroll View
    private func setUpScrollView() {
        view.addSubview(scrollView)
        scrollView.stretchOnParent()
        scrollView.isScrollEnabled = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - My First Quiz View
    private func setUpMyFirstQuizView() {
        scrollView.addSubview(myFirstQuizView)
        
        NSLayoutConstraint.activate([
            myFirstQuizView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.MyFirstQuizView.topPadding
            ),
            myFirstQuizView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            myFirstQuizView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            myFirstQuizView.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: Constants.MyFirstQuizView.heightMultiplier)
        ])
        
        myFirstQuizView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Typing View
    private func setUpTypingView() {
        scrollView.addSubview(typingView)
        
        NSLayoutConstraint.activate([
            typingView.topAnchor.constraint(
                equalTo: myFirstQuizView.bottomAnchor,
                constant: Constants.TypingView.topPadding
            ),
            typingView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.TypingView.leftPadding
            )
        ])
        typingView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Start Quiz Button View
    private func setUpStartQuizButtonView() {
        scrollView.addSubview(startQuizButtonView)
        startQuizButtonView.delegate = self
        
        NSLayoutConstraint.activate([
            startQuizButtonView.topAnchor.constraint(
                equalTo: typingView.bottomAnchor,
                constant: Constants.StartQuizButton.topPadding
            ),
            startQuizButtonView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.StartQuizButton.leftPadding
            )
        ])
        startQuizButtonView.translatesAutoresizingMaskIntoConstraints = false
    }
}

//MARK: - scroll when keyboard appears
private extension LoginViewController {
    
    private func registerKeyboardNotifications() {
        hideKeyboardWhenTappedOnView()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func hideKeyboardWhenTappedOnView() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        let frame = startQuizButtonView.frame
        let convertedOrigin = view.convert(frame.origin, to: startQuizButtonView.superview)
        let buttonYCoordinate = view.bounds.height - convertedOrigin.y
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                if keyboardSize.height > buttonYCoordinate {
                    view.frame.origin.y -= keyboardSize.height
                } else {
                    view.frame.origin.y -= keyboardSize.height + Constants.StartQuizButton.bottomPadding
                }
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
}

//MARK: - Delegate
extension LoginViewController: StartQuizButtonViewDelegate {
    func startQuizButtonDidTap() {
        let homeViewController = HomeViewController()
        navigationController?.setViewControllers([homeViewController], animated: true)
    }
}

//MARK: - Constants
extension LoginViewController {
    enum Constants {
        enum MyFirstQuizView {
            static let topPadding = 44.0
            static let heightMultiplier = 0.5
        }
        enum TypingView {
            static let topPadding = 92.0
            static let leftPadding = 54.0
        }
        enum StartQuizButton {
            static let topPadding = 26.0
            static let leftPadding = 117.0
            static let bottomPadding = -150.0
        }
    }
}
