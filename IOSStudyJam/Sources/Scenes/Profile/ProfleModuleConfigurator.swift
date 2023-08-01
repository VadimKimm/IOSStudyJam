//
//  MainModuleConfigurator.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

final class ProfileModuleConfigurator {

    // MARK: Internal methods

    func configure() -> ProfileViewController {
        let view = ProfileViewController()
        let presenter = ProfilePresenter()

        presenter.view = view
        view.output = presenter

        return view
    }
}
