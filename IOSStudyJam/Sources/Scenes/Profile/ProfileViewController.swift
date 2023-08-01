//
//  ProfileViewController.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

protocol ProfileViewInput: AnyObject {
    func reload(with items: [Skill])
}

final class ProfileViewController: UIViewController {

    // MARK: - Properties

    var output: ProfileViewOutput?
    var adapter: ProfileCollectionViewAdapter?

    private lazy var customView: ProfileView = {
        let customView = ProfileView()
        return customView
    }()

    // MARK: - Lifecycle

    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        initialSetup()
        output?.viewDidLoad()
    }

    // MARK: - Settings

    private func initialSetup() {
        title = "Профиль"
        setupCollectionViewAdapter()
    }

    func setupCollectionViewAdapter() {
        adapter = ProfileCollectionViewAdapter(
            collectionView: customView.collectionView,
            output: self
        )
    }
}

// MARK: - ProfileViewInput

extension ProfileViewController: ProfileViewInput {
    func reload(with items: [Skill]) {
        adapter?.configure(with: items)
    }
}

// MARK: - ProfileCollectionViewAdapterOutput

extension ProfileViewController: ProfileCollectionViewAdapterOutput {
    func didTapEditButton() {
        output?.edit()
    }

    func didTapDeleteButton(at index: Int) {
        output?.removeSkill(at: index)
    }

    func addSkill() {
        output?.showActionsModule()
    }
}
