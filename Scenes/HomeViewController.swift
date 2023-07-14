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
    
    private let chooseSubjectLabel: UILabel = {
        let chooseSubjectLabel = UILabel()
        chooseSubjectLabel.text = Constants.ChooseSubjectLabel.text
        chooseSubjectLabel.setHeight(Constants.ChooseSubjectLabel.height)
        chooseSubjectLabel.translatesAutoresizingMaskIntoConstraints = false
        return chooseSubjectLabel
    }()
    
    private lazy var subjectTableView: UITableView = {
        let subjectTableView = UITableView()
        subjectTableView.delegate = self
        subjectTableView.dataSource = self
        subjectTableView.register(
            SubjectTableViewCell.self,
            forCellReuseIdentifier: Constants.SubjectTableView.cell
        )
        subjectTableView.separatorStyle = .none
        subjectTableView.backgroundColor = .clear
        subjectTableView.translatesAutoresizingMaskIntoConstraints = false
        return subjectTableView
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
        setUpChooseSubjectLabel()
        setUpDividerView()
        setUpLogOutButton()
        setUpSubjectTableView()
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
    
    private func setUpChooseSubjectLabel() {
        view.addSubview(chooseSubjectLabel)
        
        NSLayoutConstraint.activate([
            chooseSubjectLabel.topAnchor.constraint(equalTo: GpaView.bottomAnchor, constant: Constants.ChooseSubjectLabel.topPadding),
            chooseSubjectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.ChooseSubjectLabel.leftPadding)
        ])
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
    
    private func setUpSubjectTableView() {
        view.addSubview(subjectTableView)
        
        NSLayoutConstraint.activate([
            subjectTableView.topAnchor.constraint(
                equalTo: chooseSubjectLabel.bottomAnchor,
                constant: Constants.SubjectTableView.topPadding
            ),
            subjectTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.SubjectTableView.leftPadding
            ),
            subjectTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.SubjectTableView.rightPadding
            ),
            subjectTableView.bottomAnchor.constraint(equalTo: dividerView.topAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.SubjectTableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.SubjectTableView.cell,
            for: indexPath) as! SubjectTableViewCell
        return cell
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
        enum ChooseSubjectLabel {
            static let text = "აირჩიე საგანი"
            static let height = 18.0
            static let topPadding = 32.0
            static let leftPadding = 16.0
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
        enum SubjectTableView {
            static let cell = "SubjectTableViewCell"
            static let topPadding = 16.0
            static let leftPadding = 16.0
            static let rightPadding = -16.0
            static let rowHeight = 126.0
            
        }
        enum Image {
            static let button = UIImage(named: "logOut")
        }
        enum Color {
            static let yellow = UIColor(red: 255, green: 196, blue: 74, alpha: 1)
            static let divider = UIColor(red: 241, green: 241, blue: 241, alpha: 1)
        }
        enum Font {
            static let textFont = UIFont(name: "Georgia", size: 16)
        }
    }
}

//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//
//struct ViewControllerRepresentable: UIViewControllerRepresentable {
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        return UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//    }
//}
//struct ViewController_Preview: PreviewProvider {
//    static var previews: some View {
//         ViewControllerRepresentable()
//    }
//}
//#endif
