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
        setUpMyFirstQuizLabel()
        setUpMainIllustrationItemView()
    }

    private func setUpBlueBackgroundItemView() {
        addSubview(blueBackgroundItemView)
        blueBackgroundItemView.stretchOnParent()
        blueBackgroundItemView.image = Constants.Image.blueBackground
        blueBackgroundItemView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setUpMainIllustrationItemView() {
        blueBackgroundItemView.addSubview(mainIllustrationItemView)
        mainIllustrationItemView.image = Constants.Image.mainIllustration
        mainIllustrationItemView.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            mainIllustrationItemView.topAnchor.constraint(
                equalTo: myFirstQuizLabel.bottomAnchor,
                constant: Constants.MainIllustrationItemView.topPadding),
            
            mainIllustrationItemView.centerXAnchor.constraint(
                equalTo: blueBackgroundItemView.centerXAnchor),
            
            mainIllustrationItemView.bottomAnchor.constraint(
                equalTo: blueBackgroundItemView.bottomAnchor,
                constant: Constants.MainIllustrationItemView.bottomPadding),
            
            mainIllustrationItemView.heightAnchor.constraint(
                equalTo: blueBackgroundItemView.heightAnchor,
                multiplier: Constants.MainIllustrationItemView.heightMultiplier),
            
            mainIllustrationItemView.widthAnchor.constraint(
                equalTo: mainIllustrationItemView.heightAnchor,
                multiplier: Constants.MainIllustrationItemView.aspectRatio
            )
        ])
    }

    private func setUpMyFirstQuizLabel() {
        blueBackgroundItemView.addSubview(myFirstQuizLabel)
        myFirstQuizLabel.text = Constants.MyFirstQuizLabel.text
        myFirstQuizLabel.textColor = Constants.Color.labelTextColor
        myFirstQuizLabel.font = Constants.Font.labelFont
        myFirstQuizLabel.textAlignment = .center
        myFirstQuizLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myFirstQuizLabel.centerXAnchor.constraint(
                equalTo: blueBackgroundItemView.centerXAnchor),
        ])
    }
}

//MARK: - Constants
private extension MyFirstQuizView {
    enum Constants {
        enum MainIllustrationItemView {
            static let topPadding = 34.0
            static let bottomPadding = -23.0
            static let heightMultiplier = 0.6
            static let aspectRatio = 1.0
        }
        enum MyFirstQuizLabel {
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
            static let labelFont = UIFont(name: "Georgia-Bold", size: 20)
        }
    }
}

