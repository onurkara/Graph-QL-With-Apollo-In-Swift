//
//  LaunchGenerator.swift
//
//  Created by Onur on 16.05.2022.
//

@testable import Apollo_Swift

class LaunchGenerator {

    static func generateLaunchPast() -> [LaunchesQuery.Data.LaunchesPast] {
        [LaunchesQuery.Data.LaunchesPast(id: "", missionName: "", details: "", launchYear: "", launchSuccess: true)]
    }

    static func generateMultipleLaunch() -> [LaunchesQuery.Data.LaunchesPast] {
        [
            LaunchesQuery.Data.LaunchesPast(id: "", missionName: "", details: "", launchYear: "", launchSuccess: true),
            LaunchesQuery.Data.LaunchesPast(id: "", missionName: "", details: "", launchYear: "", launchSuccess: true),
            LaunchesQuery.Data.LaunchesPast(id: "", missionName: "", details: "", launchYear: "", launchSuccess: true)
        ]
    }
}
