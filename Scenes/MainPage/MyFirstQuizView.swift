//
//  MainPageView.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 13.06.23.
//

import UIKit

class MyFirstQuizView: UIView {
    
    //MARK: - Properties
    private let blueBackgroundItemView = UIImageView()
    private let mainIllustrationItemView = UIImageView()
    private let myFirstQuizLabel = UILabel()
    
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
        setUpBlueBackgroundItemView()
        setUpMainIllustrationItemView()
        setUpMyFirstQuizLabel()
    }
    
    private func setUpBlueBackgroundItemView() {
        addSubview(blueBackgroundItemView)
        blueBackgroundItemView.stretchOnParent()
        blueBackgroundItemView.image = Constants.Image.blueBackground
        
//        blueBackgroundItemView.setHeight(Constants.BlueBackgroundItemView.height)
//        blueBackgroundItemView.setWidth(Constants.BlueBackgroundItemView.width)
        blueBackgroundItemView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpMainIllustrationItemView() {
        blueBackgroundItemView.addSubview(mainIllustrationItemView)
        mainIllustrationItemView.image = Constants.Image.mainIllustration
        
//        mainIllustrationItemView.setHeight(Constants.MainIllustrationItemView.height)
//        mainIllustrationItemView.setWidth(Constants.MainIllustrationItemView.width)
        mainIllustrationItemView.centre(in: blueBackgroundItemView)
        mainIllustrationItemView.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            mainIllustrationItemView.topAnchor.constraint(
                equalTo: blueBackgroundItemView.topAnchor,
                constant: Constants.MainIllustrationItemView.topPadding
            ),
            mainIllustrationItemView.bottomAnchor.constraint(
                equalTo: blueBackgroundItemView.bottomAnchor,
                constant: -Constants.MainIllustrationItemView.bottomPadding
            )
        ])
    }
    
    private func setUpMyFirstQuizLabel() {
        blueBackgroundItemView.addSubview(myFirstQuizLabel)
        myFirstQuizLabel.text = Constants.MyFirstQuizLabel.text
        myFirstQuizLabel.textColor = Constants.Color.labelTextColor
        myFirstQuizLabel.font = Constants.Font.labelFont
        myFirstQuizLabel.textAlignment = .center
        
//        myFirstQuizLabel.setHeight(Constants.MyFirstQuizLabel.height)
//        myFirstQuizLabel.setWidth(Constants.MyFirstQuizLabel.width)
        myFirstQuizLabel.centre(in: blueBackgroundItemView)
        myFirstQuizLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myFirstQuizLabel.topAnchor.constraint(
                equalTo: blueBackgroundItemView.topAnchor,
                constant: Constants.MyFirstQuizLabel.topPadding
            ),
            myFirstQuizLabel.bottomAnchor.constraint(
                equalTo: mainIllustrationItemView.topAnchor,
                constant: -Constants.MyFirstQuizLabel.bottomPadding
            )
        ])
    }
}

//MARK: - Constants
private extension MyFirstQuizView {
    enum Constants {
        enum BlueBackgroundItemView {
            static let topPadding = 44.0
            static let height = 433.0
            static let width = 375.0
        }
        enum MainIllustrationItemView {
            static let topPadding = 181.0
            static let leftPadding = 73.0
            static let rightPadding = 73.0
            static let bottomPadding = 23.0
            static let height = 229.0
            static let width = 229.0
        }
        enum MyFirstQuizLabel {
            static let topPadding = 121.0
            static let leftPadding = 88.0
            static let bottomPadding = 34.0
            static let height = 26.0
            static let width = 198.0
            static let text = "ჩემი პირველი ქვიზი"
        }
        enum Image {
            static let blueBackground = UIImage(named: "blueBackground")
            static let mainIllustration = UIImage(named: "mainIllustration")
        }
        enum Color {
            static let labelTextColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        }
        enum Font {
            static let labelFont = UIFont(name: "systemFont-Bold", size: 20)
        }
    }
}
