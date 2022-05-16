//
//  LaunchesRepositories.swift
//  MidasAssignmentTests
//
//  Created by Onur on 16.05.2022.
//

@testable import Apollo_Swift

final class LaunchesRepositoriesySpy: LaunchesRepositoryProtocol {

    var isFetchLaunchCalled = false

    func fetchLaunches(limit: Int, offset: Int, completion: @escaping ([LaunchesQuery.Data.LaunchesPast]?, String?) -> Void) {
        isFetchLaunchCalled = true
        completion(LaunchGenerator.generateLaunchPast(), nil)
    }
}

final class LaunchesRepositoriesMock: LaunchesRepositoryProtocol {

    var launchesPast: [LaunchesQuery.Data.LaunchesPast]?
    var errorMessage: String?

    func fetchLaunches(limit: Int, offset: Int, completion: @escaping ([LaunchesQuery.Data.LaunchesPast]?, String?) -> Void) {
        completion(launchesPast, errorMessage)
    }
}
