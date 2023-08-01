//
//  ProfileRouter.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

protocol ProfileRouterInput {
    func showActionsModule(output: ActionsWithSkillModuleOutput)
}

final class ProfileRouter: ProfileRouterInput {
    var navigationController: UINavigationController?
    var moduleConfigurator: ProfileModuleConfigurator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func setRootViewController() {
        guard let navigationController = navigationController else { return }
        let profileViewController = ProfileModuleConfigurator().configure(router: self)
        navigationController.viewControllers = [profileViewController]
    }

    func showActionsModule(output: ActionsWithSkillModuleOutput) {
        guard let navigationController = navigationController else { return }
        let alertController = ActionsWithSkillAlertViewController(title: nil, message: nil, preferredStyle: .alert)
        alertController.configure(output: output)
        navigationController.present(alertController, animated: true)
    }
}
