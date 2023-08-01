//
//  ProfileFooterCollectionReusableView.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

class ProfileFooterCollectionReusableView: UICollectionReusableView {

    // MARK: - Properties

    static let identifier = "ProfileFooterCollectionReusableView"

    // MARK: - Views

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = Metrics.stackViewSpacing
        return stack
    }()

    private var titleLabel = UILabel()

    private var aboutLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
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
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(aboutLabel)
    }

    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.stackViewSideOffet),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Metrics.stackViewSideOffet),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupView() {
        backgroundColor = Colors.white.color

        titleLabel.text = Strings.title
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = Colors.black.color

        aboutLabel.text = Strings.about
        aboutLabel.font = .systemFont(ofSize: 14, weight: .regular)
        aboutLabel.textColor = Colors.black.color
    }
}

// MARK: - Metrics

extension ProfileFooterCollectionReusableView {
    enum Metrics {
        static let stackViewSideOffet: CGFloat = 16
        static let stackViewSpacing: CGFloat = 8
        static let aboutLabelTopOffset: CGFloat = 8
    }

    enum Strings {
        static let title = "О себе"
        static let about = "Experienced software engineer skilled in developing scalable and maintainable systems"
    }
}
