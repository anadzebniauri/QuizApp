//
//  StartQuizButtonView.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 13.06.23.
//

import UIKit

class StartQuizButtonView: UIView {
    
    //MARK: - Properties
    private let startQuizButton = UIButton()
    
    //MARK: - Init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    //MARK: - Methods
    private func setUp() {
        setUpStartQuizButton()
    }
    
    private func setUpStartQuizButton() {
        addSubview(startQuizButton)
        startQuizButton.stretchOnParent()
        
        startQuizButton.setTitle(Constants.StartQuizButton.buttonText, for: .normal)
        startQuizButton.titleLabel?.textColor = .white
        startQuizButton.titleLabel?.textAlignment = .center
        startQuizButton.titleLabel?.font = Constants.Font.buttonTextFont
        
        startQuizButton.setHeight(Constants.StartQuizButton.height)
        startQuizButton.setWidth(Constants.StartQuizButton.width)
        startQuizButton.translatesAutoresizingMaskIntoConstraints = false
        startQuizButton.layer.cornerRadius = Constants.StartQuizButton.radius
        
        startQuizButton.backgroundColor = Constants.Color.buttonColor
    }
}

//MARK: - Constants

extension StartQuizButtonView {
    enum Constants {
        enum StartQuizButton {
            static let height = 44.0
            static let width = 141.0
            static let radius = 12.0
            static let buttonText = "ქვიზის დაწყება"
        }
        enum Color {
            static let buttonColor = UIColor(red: 255, green: 196, blue: 74, alpha: 1)
        }
        enum Font {
            static let buttonTextFont = UIFont(name: "systemFont-Bold", size: 12)
        }
    }
}
