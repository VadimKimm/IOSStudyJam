//
//  ProfileView.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

final class ProfileView: UIView {

    // MARK: - Views

    lazy var collectionView: UICollectionView = {
        let layout = TagFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(
            top: Metrics.sectionTopInset,
            left: Metrics.sectionSideInset,
            bottom: Metrics.sectionBottomInset,
            right: Metrics.sectionSideInset
        )

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        return collectionView
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
        addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.collectionViewTopOffset),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupView() {
        backgroundColor = Colors.gray.color
        collectionView.backgroundColor = Colors.white.color
    }
}

// MARK: - Metrics

extension ProfileView {
    enum Metrics {
        static let collectionViewTopOffset: CGFloat = 24
        static let sectionTopInset: CGFloat = 20
        static let sectionSideInset: CGFloat = 16
        static let sectionBottomInset: CGFloat = 24
    }
}
