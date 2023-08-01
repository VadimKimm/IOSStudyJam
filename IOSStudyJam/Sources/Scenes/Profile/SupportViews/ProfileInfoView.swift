//
//  ProfileInfoView.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

final class ProfileInfoView: UIView {

    // MARK: - Views

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 16
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

    private var locationLabel = UILabel()


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

        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.widthAnchor.constraint(lessThanOrEqualToConstant: Metrics.userImageWidth),
            userImageView.heightAnchor.constraint(lessThanOrEqualToConstant: Metrics.userImageWidth),
            userImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    private func setupView() {
        userImageView.image = UIImage(named: "profileImage")

        nameLabel.text = Strings.name
        nameLabel.font = .systemFont(ofSize: 24)
        nameLabel.textColor = .black

        mottoLabel.text = Strings.motto
        mottoLabel.font = .systemFont(ofSize: 14)
        mottoLabel.textColor = Colors.darkGray.color

        locationLabel.text = Strings.location
        locationLabel.font = .systemFont(ofSize: 14)
        locationLabel.textColor = Colors.darkGray.color
        locationLabel.addLeading(image: UIImage(named: "locationIcon"))
    }
}

// MARK: - Metrics

extension ProfileInfoView {
    enum Metrics {
        static let scrollViewTopOffset: CGFloat = 24
        static let scrollViewSideOffset: CGFloat = 16
        static let userImageWidth: CGFloat = 120
    }

    enum Strings {
        static let name = "Ким Вадим\nВитальевич"
        static let motto = "Middle iOS-разработчик, опыт более 2-х лет"
        static let location = "Москва"
    }
}
