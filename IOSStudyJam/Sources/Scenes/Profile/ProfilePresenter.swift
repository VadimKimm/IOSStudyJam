//
//  ProfilePresenter.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import Foundation

protocol ProfileViewOutput: AnyObject {
    init(view: ProfileViewInput, router: ProfileRouterInput)
    func viewDidLoad()
    func edit()
    func removeSkill(at index: Int)
    func showActionsModule()
}

final class ProfilePresenter: ProfileViewOutput {

    // MARK: - Properties

    private weak var view: ProfileViewInput?
    private var router: ProfileRouterInput?
    private var skills = [Skill]()

    // MARK: - Internal methods

    init(view: ProfileViewInput, router: ProfileRouterInput) {
        self.view = view
        self.router = router
    }

    func viewDidLoad() {
        skills = Skill.createMockData()
        view?.reload(with: skills)
    }

    func edit() {
        view?.reload(with: skills)
    }

    func removeSkill(at index: Int) {
        skills.remove(at: index)
        view?.reload(with: skills)
    }

    func showActionsModule() {
        router?.showActionsModule(output: self)
    }
}

// MARK: - ActionsWithSkillModuleOutput

extension ProfilePresenter: ActionsWithSkillModuleOutput {
    func add(skill: String) {
        skills.insert(Skill(name: skill), at: skills.count)
        view?.reload(with: skills)
    }
}
