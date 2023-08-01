//
//  TagCollectionViewCell.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

final class TagCollectionViewCell: UICollectionViewCell {

    // MARK: - Configuration

    func configure(with item: Skill, isEditing: Bool) {
        titleLabel.text = item.name

        if isEditing {
            addDeleteButton()
        } else {
            removeDeleteButton()
        }
    }

    func configure(with text: String) {
        titleLabel.text = text
        removeDeleteButton()
    }

    //MARK: - Properties

    static let identifier = "TagCollectionViewCell"

    // MARK: - Views

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()

    private var titleLabel = UILabel()

    var deleteButton = UIButton()

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
        stackView.addArrangedSubview(deleteButton)
    }

    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.topOffset),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.sideOffset),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.sideOffset),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.topOffset)
        ])
    }

    private func setupView() {
        backgroundColor = Colors.gray.color
        layer.cornerRadius = Metrics.cornerRadius

        titleLabel.font = .systemFont(ofSize: 14, weight: .light)
        titleLabel.textColor = Colors.black.color
    }

    private func addDeleteButton() {
        stackView.addArrangedSubview(deleteButton)

        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deleteButton.widthAnchor.constraint(equalToConstant: Metrics.deleteButtonWidth),
            deleteButton.heightAnchor.constraint(equalToConstant: Metrics.deleteButtonWidth)
        ])

        deleteButton.setImage(UIImage(named: "delete"), for: .normal)
    }

    private func removeDeleteButton() {
        guard deleteButton.isDescendant(of: stackView) else { return }
        deleteButton.removeFromSuperview()
    }
}

// MARK: - Metrics

extension TagCollectionViewCell {
    enum Metrics {
        static let topOffset: CGFloat = 12
        static let sideOffset: CGFloat = 24
        static let cornerRadius: CGFloat = 12

        static let deleteButtonWidth: CGFloat = 17
    }
}
