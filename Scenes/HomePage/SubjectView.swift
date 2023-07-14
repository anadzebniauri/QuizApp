//
//  SubjectView.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 14.07.23.
//

import UIKit

class SubjectView: UIView {
    
    //MARK: - Properties
    private let subjectIcon: UIImageView = {
        let subjectIcon = UIImageView()
        subjectIcon.image = Constants.Image.geography
        subjectIcon.setHeight(Constants.SubjectIcon.height)
        subjectIcon.translatesAutoresizingMaskIntoConstraints = false
        return subjectIcon
    }()
    
    private let subjectName: UILabel = {
        let subjectName = UILabel()
        subjectName.textAlignment = .left
        subjectName.font = Constants.Font.subjectName
        subjectName.text = Constants.SubjectName.text
        subjectName.setHeight(Constants.SubjectName.height)
        subjectName.translatesAutoresizingMaskIntoConstraints = false
        return subjectName
    }()
    
    private let subjectDescription: UILabel = {
        let subjectDescription = UILabel()
        subjectDescription.textAlignment = .left
        subjectDescription.font = Constants.Font.descriptionName
        subjectDescription.text = Constants.SubjectDescription.text
        subjectDescription.textColor = Constants.Color.descriptionColor
        subjectDescription.setHeight(Constants.SubjectDescription.height)
        subjectDescription.translatesAutoresizingMaskIntoConstraints = false
        return subjectDescription
    }()
    
    private let startQuizIcon: UILabel = {
        let startQuizIcon = UILabel()
        startQuizIcon.clipsToBounds = true
        startQuizIcon.setHeight(Constants.StartQuizIcon.height)
        startQuizIcon.setWidth(Constants.StartQuizIcon.width)
        startQuizIcon.translatesAutoresizingMaskIntoConstraints = false
        startQuizIcon.backgroundColor = Constants.Color.startQuizIconColor
        startQuizIcon.layer.cornerRadius = Constants.StartQuizIcon.cornerRadius
        return startQuizIcon
    }()
    
    private let startQuizArrow: UIImageView = {
        let startQuizArrow = UIImageView()
        startQuizArrow.image = Constants.Image.arrow
        startQuizArrow.translatesAutoresizingMaskIntoConstraints = false
        return startQuizArrow
    }()
    
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
        setUpView()
        setUpSubjectIcon()
        setUpSubjectName()
        setUpSubjectDescription()
        setUpStartQuizIcon()
    }
    
    private func setUpView() {
        backgroundColor = Constants.Color.backgroundColor
        layer.cornerRadius = Constants.View.cornerRadius
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpSubjectIcon() {
        addSubview(subjectIcon)
        
        NSLayoutConstraint.activate([
            subjectIcon.centerYAnchor.constraint(
                equalTo: centerYAnchor
            ),
            subjectIcon.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.SubjectIcon.leftPadding
            )
        ])
    }
    
    private func setUpSubjectName() {
        addSubview(subjectName)
        
        NSLayoutConstraint.activate([
            subjectName.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.SubjectName.topPadding
            ),
            subjectName.leadingAnchor.constraint(
                equalTo: subjectIcon.trailingAnchor,
                constant: Constants.SubjectName.leftPadding
            )
        ])
    }
    
    private func setUpSubjectDescription() {
        addSubview(subjectDescription)
        
        NSLayoutConstraint.activate([
            subjectDescription.topAnchor.constraint(
                equalTo: subjectName.bottomAnchor,
                constant: Constants.SubjectDescription.topPadding
            ),
            subjectDescription.leadingAnchor.constraint(
                equalTo: subjectIcon.trailingAnchor,
                constant: Constants.SubjectDescription.leftPadding
            )
        ])
    }
    
    private func setUpStartQuizIcon() {
        addSubview(startQuizIcon)
        
        startQuizIcon.addSubview(startQuizArrow)
        startQuizArrow.centre(in: startQuizIcon)
    
        NSLayoutConstraint.activate([
            startQuizIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            startQuizIcon.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.StartQuizIcon.rightPadding
            )
        ])
    }
}

private extension SubjectView {
    enum Constants {
        enum View {
            static let height = 106.0
            static let width = 295.0
            static let cornerRadius = 26.0
        }
        enum SubjectIcon {
            static let height = 62.0
            static let topPadding = 22.0
            static let leftPadding = 24.0
        }
        enum SubjectName {
            static let text = "გეოგრაფია"
            static let height = 21.0
            static let topPadding = 35.0
            static let leftPadding = 18.0
        }
        enum SubjectDescription {
            static let text = "აღწერა"
            static let height = 16.0
            static let topPadding = 2.0
            static let leftPadding = 18.0
        }
        enum StartQuizIcon {
            static let height = 45.0
            static let width = 45.0
            static let cornerRadius = 22.5
            static let rightPadding = -24.0
        }
        enum Color {
            static let backgroundColor = UIColor(red: 246, green: 246, blue: 246, alpha: 1)
            static let startQuizIconColor = UIColor(red: 255, green: 196, blue: 74, alpha: 1)
            static let descriptionColor = UIColor(red: 179, green: 179, blue: 179, alpha: 1)
        }
        enum Image {
            static let arrow = UIImage(named: "arrow")
            static let geography = UIImage(named: "geography")
        }
        enum Font {
            static let subjectName = UIFont(name: "Georgia", size: 16)
            static let descriptionName = UIFont(name: "Georgia", size: 12)
        }
    }
}
