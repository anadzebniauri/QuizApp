//
//  DetailsViewController.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 03.07.23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: - Properties

    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    //MARK: - Set Up
    private func setUp() {
        view.backgroundColor = .white
        setUpBackButton()
    }
    
    private func setUpBackButton() {
        let backButtonImage = Constants.Image.backButton
        self.navigationController?.navigationBar.backIndicatorImage = backButtonImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        self.navigationController?.navigationBar.backItem?.title = .none
    }
}

//MARK: - Constants
private extension DetailsViewController {
    enum Constants {
        enum Image {
            static let backButton = UIImage(named: "backButton")
        }
    }
}
