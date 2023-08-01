//
//  ProfileViewController.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

protocol ProfileViewInput: AnyObject {

}

final class ProfileViewController: UIViewController, ProfileViewInput {

    // MARK: - Properties

    var output: ProfileViewOutput?
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
    }

    // MARK: - Settings

    private func initialSetup() {
        title = "Профиль"
    }
}