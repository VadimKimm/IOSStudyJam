//
//  ProfileHeaderCollectionReusableView.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {

    // MARK: - Configuration

    func configure(with isEditMode: Bool) {
        editButton.setImage(
            UIImage(named: isEditMode ? "pencil" : "checkmark"),
            for: .normal
        )
    }

    // MARK: - Properties

    static let identifier = "ProfileHeaderCollectionReusableView"

    // MARK: - Views

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = Metrics.stackViewSpacing
        return stack
    }()

    private lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()

    private lazy var mottoLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    private lazy var skillsView = UIView()
    private var skillsLabel = UILabel()

    lazy var editButton: UIButton = {
        let button = UIButton()
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()


    // MARK: - Settings

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
        setupView()
    }

    // MARK: - Private functions

    private func setupHierarchy() {
        addSubview(stackView)

        stackView.addArrangedSubview(userImageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(mottoLabel)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(skillsView)

        skillsView.addSubview(skillsLabel)
        skillsView.addSubview(editButton)
    }

    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        stackView.setCustomSpacing(4, after: nameLabel)
        stackView.setCustomSpacing(0, after: mottoLabel)
        stackView.setCustomSpacing(20, after: locationLabel)

        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.widthAnchor.constraint(lessThanOrEqualToConstant: Metrics.userImageWidth),
            userImageView.heightAnchor.constraint(lessThanOrEqualToConstant: Metrics.userImageWidth)
        ])

        skillsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillsView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            skillsView.heightAnchor.constraint(lessThanOrEqualToConstant: Metrics.skillsViewHeight)
        ])

        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillsLabel.topAnchor.constraint(equalTo: skillsView.topAnchor, constant: Metrics.skillsLabelTopOffset),
            skillsLabel.leadingAnchor.constraint(equalTo: skillsView.leadingAnchor, constant: Metrics.skillsLabelSideOffset),
        ])

        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: skillsLabel.topAnchor),
            editButton.trailingAnchor.constraint(equalTo: skillsView.trailingAnchor, constant: -Metrics.skillsLabelSideOffset),
            editButton.widthAnchor.constraint(equalToConstant: Metrics.editButtonWidth),
            editButton.heightAnchor.constraint(equalToConstant: Metrics.editButtonWidth)
        ])
    }

    private func setupView() {
        backgroundColor = Colors.gray.color

        userImageView.image = UIImage(named: "profileImage")

        nameLabel.text = Strings.name
        nameLabel.font = .systemFont(ofSize: 24)
        nameLabel.textColor = Colors.black.color

        mottoLabel.text = Strings.motto
        mottoLabel.font = .systemFont(ofSize: 14)
        mottoLabel.textColor = Colors.darkGray.color

        locationLabel.text = Strings.location
        locationLabel.font = .systemFont(ofSize: 14)
        locationLabel.textColor = Colors.darkGray.color
        locationLabel.addLeading(image: UIImage(named: "location"))

        skillsView.backgroundColor = Colors.white.color

        skillsLabel.text = Strings.skills
        skillsLabel.textColor = Colors.black.color

        editButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        editButton.tintColor = Colors.black.color
    }
}

// MARK: - Metrics

extension ProfileHeaderCollectionReusableView {
    enum Metrics {
        static let stackViewSpacing: CGFloat = 16
        static let userImageWidth: CGFloat = 120
        static let skillsViewHeight: CGFloat = 40
        static let skillsLabelTopOffset: CGFloat = 20
        static let skillsLabelSideOffset: CGFloat = 16
        static let editButtonWidth: CGFloat = 24
    }

    enum Strings {
        static let name = "Ким Вадим\nВитальевич"
        static let motto = "Middle iOS-разработчик, опыт более 2-х лет"
        static let location = "Москва"
        static let skills = "Мои навыки"
    }
}
