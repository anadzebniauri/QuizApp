//
//  GPA.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 02.07.23.
//

import UIKit

class GPAView: UIView {
    
    //MARK: - Properties
    private let gpaLabel: UILabel = {
        let gpaLabel = UILabel()
        gpaLabel.clipsToBounds = true
        gpaLabel.setHeight(Constants.GPALabel.height)
        gpaLabel.setWidth(Constants.GPALabel.width)
        gpaLabel.backgroundColor = Constants.Color.gpaBackground
        gpaLabel.translatesAutoresizingMaskIntoConstraints = false
        gpaLabel.layer.cornerRadius = Constants.GPALabel.cornerRadius
        return gpaLabel
    }()
    
    private let gpaTextLabel: UILabel = {
        let gpaTextLabel = UILabel()
        gpaTextLabel.text = Constants.GPAText.text
        gpaTextLabel.backgroundColor = .clear
        gpaTextLabel.textColor = .white
        gpaTextLabel.font = Constants.Font.gpaText
        gpaTextLabel.textAlignment = .center
        gpaTextLabel.setHeight(Constants.GPAText.height)
        gpaTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return gpaTextLabel
    }()
    
    private let gpaValueLabel: UILabel = {
        let gpaValueLabel = UILabel()
        gpaValueLabel.text = Constants.GPAValue.text
        gpaValueLabel.backgroundColor = .clear
        gpaValueLabel.textAlignment = .center
        gpaValueLabel.textColor = Constants.Color.gpaYellow
        gpaValueLabel.font = Constants.Font.gpaValue
        gpaValueLabel.setHeight(Constants.GPAValue.height)
        gpaValueLabel.translatesAutoresizingMaskIntoConstraints = false
        return gpaValueLabel
    }()
    
    private let detailsLabel: UILabel = {
        let detailsLabel = UILabel()
        detailsLabel.text = Constants.DetailsButton.text
        detailsLabel.backgroundColor = .clear
        detailsLabel.textColor = .white
        detailsLabel.font = Constants.Font.details
        detailsLabel.textAlignment = .center
        detailsLabel.setHeight(Constants.DetailsButton.textHeight)
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailsLabel
    }()
    
    private let detailsImage: UIImageView = {
        let detailsImage = UIImageView()
        detailsImage.image = UIImage(named: "detailsIcon")
        detailsImage.setHeight(Constants.DetailsButton.iconHeight)
        detailsImage.translatesAutoresizingMaskIntoConstraints = false
        return detailsImage
    }()
    
    private let detailsButton: UIButton = {
        let detailsButton = UIButton()
        detailsButton.backgroundColor = .clear
        detailsButton.setHeight(Constants.DetailsButton.height)
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        return detailsButton
    }()
    
    private let gpaStackView = UIStackView()
    private let detailsStackView = UIStackView()
    
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
        setUpGpaLabel()
        setUpGpaStackView()
        setUpDetailsButton()
        setUpDetailsStackView()
    }
    
    private func setUpView() {
        backgroundColor = Constants.Color.blueBackground
        layer.cornerRadius = Constants.BlueBackground.cornerRadius
        translatesAutoresizingMaskIntoConstraints = false
        setHeight(Constants.BlueBackground.height)
    }
    
    private func setUpGpaLabel() {
        addSubview(gpaLabel)
        
        NSLayoutConstraint.activate([
            gpaLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.GPALabel.topPadding
            ),
            gpaLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.GPALabel.leftPadding
            ),
            gpaLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.GPALabel.bottomPadding
            )
        ])
    }
    
    private func setUpGpaStackView() {
        addSubview(gpaStackView)
        gpaStackView.stretch(on: gpaLabel)
        gpaStackView.addArrangedSubview(gpaTextLabel)
        gpaStackView.addArrangedSubview(gpaValueLabel)
        gpaStackView.translatesAutoresizingMaskIntoConstraints = false
        
        gpaStackView.spacing = Constants.GPAStackView.spacing
        gpaStackView.axis = .horizontal
        gpaStackView.alignment = .center
        gpaStackView.distribution = .fill
        gpaStackView.isLayoutMarginsRelativeArrangement = true
        gpaStackView.layoutMargins = Constants.GPAStackView.layoutMargins
    }
    
    private func setUpDetailsButton() {
        addSubview(detailsButton)
        
        NSLayoutConstraint.activate([
            detailsButton.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.DetailsButton.topPadding
            ),
            detailsButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.DetailsButton.rightPadding
            ),
            detailsButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.DetailsButton.bottomPadding
            )
        ])
        detailsButton.addTarget(self,
                                action: #selector(detailsButtonDidTap),
                                for: .touchUpInside)
    }
    
    @objc private func detailsButtonDidTap() {
        print("tap")
    }
    
    private func setUpDetailsStackView() {
        addSubview(detailsStackView)
        detailsStackView.stretch(on: detailsButton)
        detailsStackView.addArrangedSubview(detailsLabel)
        detailsStackView.addArrangedSubview(detailsImage)
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        detailsStackView.spacing = Constants.DetailsButton.spacing
        detailsStackView.axis = .horizontal
        detailsStackView.alignment = .center
        detailsStackView.distribution = .fill
        detailsStackView.isLayoutMarginsRelativeArrangement = true
        detailsStackView.layoutMargins = Constants.DetailsButton.layoutMargins
    }
}

//MARK: - Constants
private extension GPAView {
    enum Constants {
        enum BlueBackground {
            static let cornerRadius = 26.0
            static let height = 75.0
        }
        enum GPALabel {
            static let height = 35.0
            static let width = 85.0
            static let topPadding = 20.0
            static let leftPadding = 18.0
            static let bottomPadding = -20.0
            static let cornerRadius = 14.0
        }
        enum GPAText {
            static let text = "GPA -"
            static let height = 21.0
        }
        enum GPAValue {
            static let text = "4.0"
            static let height = 21.0
        }
        enum GPAStackView {
            static let spacing = 4.0
            static let layoutMargins = UIEdgeInsets(top: 7, left: 10, bottom: 10, right: 7)
        }
        enum DetailsButton {
            static let text = "დეტალურად"
            static let textHeight = 18.0
            static let iconHeight = 10.0
            static let spacing = 4.0
            static let layoutMargins = UIEdgeInsets(top: 7, left: 10, bottom: 10, right: 7)
            static let height = 32.0
            static let topPadding = 20.0
            static let rightPadding = -24.0
            static let bottomPadding = -20.0
        }
        enum Image {
            static let detailsImage = UIImage(named: "detailsIcon")
        }
        enum Color {
            static let blueBackground = UIColor(red: 83, green: 127, blue: 231, alpha: 1)
            static let gpaBackground = UIColor(red: 107, green: 145, blue: 234, alpha: 1)
            static let gpaYellow = UIColor(red: 255, green: 196, blue: 74, alpha: 1)
        }
        enum Font {
            static let details = UIFont(name: "Georgia", size: 12)
            static let gpaText = UIFont(name: "Georgia", size: 14)
            static let gpaValue = UIFont(name: "Georgia-Bold", size: 12)
            
        }
    }
    
}
