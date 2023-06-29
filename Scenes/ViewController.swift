//
//  ViewController.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 13.06.23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    private let myFirstQuizView = MyFirstQuizView()
    private let typingView = TypingView()
    private let startQuizButtonView = StartQuizButtonView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMyFirstQuizView()
        setUpTypingView()
        setUpStartQuizButtonView()
    }
    
    //MARK: - Methods
    private func setUpMyFirstQuizView() {
        view.addSubview(myFirstQuizView)
                
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
    
    private func setUpTypingView() {
        view.addSubview(typingView)
        
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
    
    private func setUpStartQuizButtonView() {
        view.addSubview(startQuizButtonView)
        
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

//MARK: - Constants
extension ViewController {
    enum Constants {
        enum MyFirstQuizView {
            static let topPadding = 44.0
            static let bottomPadding = -389.0
            static let heightMultiplier = 0.5
        }
        enum TypingView {
            static let topPadding = 92.0
            static let leftPadding = 54.0
        }
        enum StartQuizButton {
            static let topPadding = 26.0
            static let bottomPadding = 183.0
            static let leftPadding = 117.0
        }
    }
}
