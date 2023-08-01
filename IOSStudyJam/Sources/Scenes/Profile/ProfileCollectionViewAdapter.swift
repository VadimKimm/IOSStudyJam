//
//  ProfileCollectionViewAdapter.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

protocol ProfileCollectionViewAdapterOutput: AnyObject {
    func didTapEditButton()
    func didTapDeleteButton(at index: Int)
    func addSkill()
}

final class ProfileCollectionViewAdapter: NSObject {

    // MARK: - Properties

    private let output: ProfileCollectionViewAdapterOutput

    private var isEditMode = false
    private var items = [Skill]()
    private var collectionView: UICollectionView

    // MARK: - Initialization and deinitialization

    init(collectionView: UICollectionView, output: ProfileCollectionViewAdapterOutput) {
        self.output = output
        self.collectionView = collectionView
        self.items = []
        super.init()
        setupCollection()
    }

    // MARK: - Internal methods

    func configure(with items: [Skill]) {
        self.items = items
        collectionView.reloadData()
    }

    // MARK: - Private methods

    private func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(
            TagCollectionViewCell.self,
            forCellWithReuseIdentifier: TagCollectionViewCell.identifier
        )
        collectionView.register(
            ProfileHeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ProfileHeaderCollectionReusableView.identifier
        )
        collectionView.register(
            ProfileFooterCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: ProfileFooterCollectionReusableView.identifier
        )
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension ProfileCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let indexPath = IndexPath(row: 0, section: section)
        let header = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)
        return header.systemLayoutSizeFitting(
            CGSize(
                width: collectionView.frame.width,
                height: UIView.layoutFittingExpandedSize.height
            ),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let indexPath = IndexPath(row: 0, section: section)
        let footer = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionFooter, at: indexPath)
        return footer.systemLayoutSizeFitting(
            CGSize(
                width: collectionView.frame.width,
                height: UIView.layoutFittingExpandedSize.height
            ),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row == items.count else { return }
        output.addSkill()
    }
}

// MARK: - UICollectionViewDataSource

extension ProfileCollectionViewAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        isEditMode ? items.count + 1 : items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TagCollectionViewCell.identifier,
            for: indexPath
        ) as? TagCollectionViewCell else { return UICollectionViewCell() }

        if indexPath.row != items.count || !isEditMode {
            cell.configure(with: items[indexPath.row], isEditing: isEditMode)
            cell.deleteButton.addAction(UIAction(handler: { [weak self] _ in
                guard let sself = self else { return }
                sself.output.didTapDeleteButton(at: indexPath.row)
            }), for: .touchUpInside)
        } else {
            cell.configure(with: "+")
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: ProfileHeaderCollectionReusableView.identifier,
                for: indexPath
            ) as? ProfileHeaderCollectionReusableView else { return UICollectionReusableView() }

            header.configure(with: isEditMode)
            header.editButton.addAction(UIAction(handler: { [weak self] _ in
                guard let sself = self else { return }
                sself.isEditMode.toggle()
                sself.output.didTapEditButton()
            }), for: .touchUpInside)

            return header
        } else {
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: ProfileFooterCollectionReusableView.identifier,
                for: indexPath
            ) as? ProfileFooterCollectionReusableView else { return UICollectionReusableView() }
            return footer
        }
    }
}
