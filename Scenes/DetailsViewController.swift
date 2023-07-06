//
//  DetailsViewController.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 03.07.23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: - Properties
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
        dividerView.setHeight(Constants.DividerView.height)
        dividerView.backgroundColor = Constants.Color.divider
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        return dividerView
    }()
    
    private let noPointsLabel: UILabel = {
        let noPointsLabel = UILabel()
        noPointsLabel.text = Constants.Title.noPointsTitle
        noPointsLabel.numberOfLines = Constants.Title.numberOfLines
        noPointsLabel.textAlignment = .center
        noPointsLabel.textColor = .black
        noPointsLabel.translatesAutoresizingMaskIntoConstraints = false
        return noPointsLabel
    }()
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    //MARK: - Set Up
    private func setUp() {
        view.backgroundColor = .white
        navigationItem.title = Constants.Title.navigationBarTitle
        setUpBackButton()
        setUpDividerView()
        setUpLogOutButton()
        setUpNoPointsLabel()
    }

    private func setUpBackButton() {
        let backButtonImage = Constants.Image.backButton
        let backButton = UIBarButtonItem(image: backButtonImage,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setUpDividerView() {
        view.addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            dividerView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: Constants.DividerView.bottomPadding
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
    
    private func setUpNoPointsLabel() {
        view.addSubview(noPointsLabel)
        
        NSLayoutConstraint.activate([
            noPointsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noPointsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

//MARK: - Constants
private extension DetailsViewController {
    enum Constants {
        enum Title {
            static let navigationBarTitle = "დაგროვილი ქულები ⭐️"
            static let noPointsTitle = """
                                        🧐
                                        სამწუხაროდ,
                                        ქულები ჯერ არ გაქვს
                                        დაგროვილი.
                                        """
            static let numberOfLines = 0
        }
        enum DividerView {
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
            static let backButton = UIImage(named: "backButton")
            static let button = UIImage(named: "logOut")
        }
        enum Color {
            static let divider = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
        }
    }
}
