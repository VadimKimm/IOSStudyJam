//
//  MainModuleConfigurator.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

final class ProfileModuleConfigurator {

    // MARK: Internal methods

    func configure(router: ProfileRouterInput) -> ProfileViewController {
        let view = ProfileViewController()
        let presenter = ProfilePresenter(view: view, router: router)
        view.output = presenter
        return view
    }
}
