//
//  ProfileView.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import UIKit

final class ProfileView: UIView {

    // MARK: - Settings

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private functions

    private func setupHierarchy() {}

    private func setupLayout() {}

    private func setupView() {
        backgroundColor = .red
    }
}
