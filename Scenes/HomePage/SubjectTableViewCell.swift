//
//  SubjectTableViewCell.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 14.07.23.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private var subjectView = SubjectView()
    
    //<MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubjectViewCell()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setUpSubjectViewCell() {
        addSubview(subjectView)
        selectionStyle = .none
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            subjectView.topAnchor.constraint(equalTo: topAnchor),
            subjectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subjectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subjectView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Constants.bottomPadding
            )
        ])
        subjectView.translatesAutoresizingMaskIntoConstraints = false

    }
}

extension SubjectTableViewCell {
    enum Constants {
        static let bottomPadding = -20.0
    }
}
