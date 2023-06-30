//
//  TypingView.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 13.06.23.
//

import UIKit

class TypingView: UIView {
    
    //MARK: - Properties
    private let typingFiled = UITextField()
    
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
        setUpTypingField()
        setUpTypingFieldSpaces()
        setUpPlaceholder()
    }
    
    private func setUpTypingField() {
        addSubview(typingFiled)
        typingFiled.stretchOnParent()
        typingFiled.layer.borderColor = Constants.Color.borderColor
        typingFiled.layer.borderWidth = Constants.TypingField.borderWidth
        typingFiled.layer.cornerRadius = Constants.TypingField.radius
        typingFiled.textAlignment = .center
        typingFiled.font = Constants.Font.text
        
        typingFiled.setHeight(Constants.TypingField.height)
        typingFiled.setWidth(Constants.TypingField.width)
        typingFiled.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setUpTypingFieldSpaces() {
        typingFiled.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 34.5, height: 16))
        typingFiled.leftViewMode = .always
        typingFiled.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 34.5, height: 16))
        typingFiled.rightViewMode = .always
    }
    
    private func setUpPlaceholder() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.tailIndent = 199
        paragraphStyle.maximumLineHeight = 16

        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle
        ]
        let attributedPlaceholder = NSAttributedString(
            string: Constants.Placeholder.text,
            attributes: attributes
        )

        typingFiled.attributedPlaceholder = attributedPlaceholder
    }

}

//MARK: - Constants
extension TypingView {
    enum Constants {
        enum TypingField {
            static let height = 44.0
            static let width = 268.0
            static let radius = 12.0
            static let borderWidth = 1.0
        }
        enum Placeholder {
            static let height = 199.0
            static let width = 16.0
            static let text = "შეიყვანე სახელი"
        }
        enum Font {
            static let text = UIFont(name: "Georgia", size: 12)
        }
        enum Color {
            static let borderColor = UIColor(red: 255, green: 196, blue: 74, alpha: 1).cgColor
            static let placeholderTextColor = UIColor(red: 179, green: 179, blue: 179, alpha: 1)
        }
    }
}
