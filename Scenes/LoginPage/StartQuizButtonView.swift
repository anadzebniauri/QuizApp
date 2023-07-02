//
//  StartQuizButtonView.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 13.06.23.
//

import UIKit

protocol StartQuizButtonViewDelegate: AnyObject {
    func startQuizButtonDidTap()
}

class StartQuizButtonView: UIView {
    
    weak var delegate: StartQuizButtonViewDelegate?
    
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
        setUpButtonTitle()
        startQuizButtonDidTap()
    }
    
    private func setUpStartQuizButton() {
        addSubview(startQuizButton)
        startQuizButton.stretchOnParent()
        
        startQuizButton.setHeight(Constants.StartQuizButton.height)
        startQuizButton.setWidth(Constants.StartQuizButton.width)
        startQuizButton.translatesAutoresizingMaskIntoConstraints = false
        
        startQuizButton.backgroundColor = Constants.Color.buttonColor
        startQuizButton.layer.cornerRadius = Constants.StartQuizButton.radius
        
        startQuizButton.addTarget(self,
                         action: #selector(startQuizButtonDidTap),
                         for: .touchUpInside)
    }
    
    @objc private func startQuizButtonDidTap() {
        delegate?.startQuizButtonDidTap()
    }
    
    private func setUpButtonTitle() {
        let title = Constants.StartQuizButton.buttonText
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.tailIndent = 97
        paragraphStyle.maximumLineHeight = 16
        startQuizButton.titleLabel?.font = Constants.Font.buttonTextFont

        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle
        ]
        
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        startQuizButton.setAttributedTitle(attributedTitle, for: .normal)
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
            static let buttonTextFont = UIFont(name: "Georgia-Bold", size: 12)
        }
    }
}
