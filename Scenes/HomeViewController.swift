//
//  HomeViewController.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 02.07.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    private let greetingLabel: UILabel = {
        let greetingLabel = UILabel()
        greetingLabel.text = Constants.GreetingLabel.text
        greetingLabel.textColor = Constants.Color.yellow
        greetingLabel.font = Constants.Font.textFont
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        return greetingLabel
    }()
    
    private let logOutButton: UIButton = {
        let logOutButton = UIButton(type: .custom)
        if let image = Constants.Image.button {
            logOutButton.setImage(image, for: .normal)
        }
        logOutButton.layer.cornerRadius = Constants.LogOutButton.cornerRadius
        logOutButton.setHeight(Constants.LogOutButton.height)
        logOutButton.setWidth(Constants.LogOutButton.width)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        return logOutButton
    }()
    
    private let dividerView: UIView = {
        let dividerView = UIView()
        dividerView.setHeight(Constants.dividerView.height)
        dividerView.backgroundColor = Constants.Color.divider
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        return dividerView
    }()
    
    private let GpaView = GPAView()
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    //MARK: - Set Up
    private func setup() {
        setUpGreetingLabel()
        setUpGpaView()
        setUpDividerView()
        setUpLogOutButton()
        setUpBackButton()
    }
    
    //MARK: - Methods
    private func setUpGreetingLabel() {
        view.addSubview(greetingLabel)
        
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.GreetingLabel.topPadding
            ),
            greetingLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.GreetingLabel.leftPadding
            )
        ])
    }
    
    private func setUpGpaView() {
        view.addSubview(GpaView)
        
        NSLayoutConstraint.activate([
            GpaView.topAnchor.constraint(
                equalTo: greetingLabel.bottomAnchor,
                constant: Constants.GPAView.topPadding
            ),
            GpaView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.GPAView.leftPadding
            ),
            GpaView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.GPAView.rightPadding
            )
        ])
        GpaView.translatesAutoresizingMaskIntoConstraints = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GPAViewTap))
        GpaView.addGestureRecognizer(tapGestureRecognizer)
        GpaView.isUserInteractionEnabled = true
    }
    
    @objc private func GPAViewTap() {
        let detailsViewController = DetailsViewController()
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    private func setUpDividerView() {
        view.addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            dividerView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: Constants.dividerView.bottomPadding
            ),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setUpLogOutButton() {
        view.addSubview(logOutButton)
        
        NSLayoutConstraint.activate([
            logOutButton.topAnchor.constraint(
                equalTo: dividerView.bottomAnchor,
                constant: Constants.LogOutButton.topPadding
            ),
            logOutButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.LogOutButton.rightPadding
            )
        ])
        logOutButton.addTarget(self,
                               action: #selector(logOutButtonDidTap),
                               for: .touchUpInside)
    }
    
    @objc private func logOutButtonDidTap() {
        let loginViewController = LoginViewController()
        navigationController?.setViewControllers([loginViewController], animated: true)
    }
    
    private func setUpBackButton() {
        let backButtonImage = Constants.Image.backButton
        self.navigationController?.navigationBar.backIndicatorImage = backButtonImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        self.navigationController?.navigationBar.backItem?.title = .none
    }
}


//MARK: - Constants
private extension HomeViewController {
    enum Constants {
        enum GreetingLabel {
            static let text = "გამარჯობა, ანა"
            static let topPadding = 52.0
            static let leftPadding = 16.0
        }
        enum GPAView {
            static let topPadding = 20.0
            static let leftPadding = 16.0
            static let rightPadding = -16.0
        }
        enum dividerView {
            static let bottomPadding = -65.0
            static let height = 1.0
        }
        enum LogOutButton {
            static let topPadding = 12.0
            static let rightPadding = -16.0
            static let cornerRadius = 42.0
            static let width = 42.0
            static let height = 42.0
        }
        enum Image {
            static let button = UIImage(named: "logOut")
            static let backButton = UIImage(named: "backButton")
        }
        enum Color {
            static let yellow = UIColor(red: 255, green: 196, blue: 74, alpha: 1)
            static let divider = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
        }
        enum Font {
            static let textFont = UIFont(name: "Georgia-Bold", size: 16)
        }
    }
}
