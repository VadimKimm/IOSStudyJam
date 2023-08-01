//
//  ProfilePresenter.swift
//  IOSStudyJam
//
//  Created by Vadim Kim on 01.08.2023.
//

import Foundation

protocol ProfileViewOutput: AnyObject {

}

final class ProfilePresenter: ProfileViewOutput {

    weak var view: ProfileViewInput?

}
