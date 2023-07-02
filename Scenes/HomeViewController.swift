//
//  HomeViewController.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 02.07.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    private var greetingLabel: UILabel = {
        let greetingLabel = UILabel()
        greetingLabel.text = Constants.GreetingLabel.text
        greetingLabel.textColor = Constants.Color.yellow
        greetingLabel.font = Constants.Font.textFont
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        return greetingLabel
    }()
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    //MARK: - Set Up
    private func setup() {
        setUpGreetingLabel()
    }
    
    //MARK: - Greeting Label
    private func setUpGreetingLabel() {
        view.addSubview(greetingLabel)
        
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

//MARK: - Constants
private extension HomeViewController {
    enum Constants {
        enum GreetingLabel {
            static let text = "გამარჯობა, ანა"
        }
        enum Color {
            static let yellow = UIColor(red: 255, green: 196, blue: 74, alpha: 1)
        }
        enum Font {
            static let textFont = UIFont(name: "Georgia-Bold", size: 16)
        }
    }
}
