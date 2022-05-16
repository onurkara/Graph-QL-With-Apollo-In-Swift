//
//  Launch.swift
//
//  Created by Onur on 15.05.2022.
//

import Foundation

struct Launch {
    let uuid = UUID()
    var missionName: String?
    var details: String?
    var launchYear: String?

    init(missionName: String?, details: String?, launchYear: String?) {
        self.missionName = missionName
        self.details = details
        self.launchYear = launchYear
    }
}

// MARK: - Hashable
extension Launch: Hashable {

    static func == (lhs: Launch, rhs: Launch) -> Bool {
        lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
