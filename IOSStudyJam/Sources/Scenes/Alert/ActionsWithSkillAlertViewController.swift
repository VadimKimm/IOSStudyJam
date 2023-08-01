//
//  ActionsWithSkillAlertViewController.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

protocol ActionsWithSkillModuleOutput {
    func add(skill: String)
}

final class ActionsWithSkillAlertViewController: UIAlertController {

    // MARK: - Properties

    private var output: ActionsWithSkillModuleOutput!

    // MARK: - UIAlertController

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.title
        message = Strings.message

        let cancelAction = UIAlertAction(title: Strings.cancel, style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: Strings.add, style: .default) { [weak self] _ in
            guard let sself = self,
                  let skillName = sself.textFields?[0].text
            else { return }
            sself.output?.add(skill: skillName)
        }

        self.addTextField()
        self.addAction(cancelAction)
        self.addAction(addAction)
    }

    // MARK: - Internal methods

    func configure(output: ActionsWithSkillModuleOutput) {
        self.output = output
    }
}

extension ActionsWithSkillAlertViewController {
    enum Strings {
        static let title = "Добавление навыка"
        static let message = "Введите название навыка которым вы владеете"
        static let add = "Добавить"
        static let cancel = "Отмена"
    }
}
