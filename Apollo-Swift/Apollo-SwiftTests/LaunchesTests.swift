//
//  LaunchesTests.swift
//  MidasAssignmentTests
//
//  Created by Onur on 16.05.2022.
//

import XCTest
@testable import Apollo_Swift

class LaunchesTests: XCTestCase {

    func testLaunchListFetchedCalled() {
        let spy = LaunchesRepositoriesySpy()
        let viewModel = LaunchesViewModel(launchesRepository: spy)
        viewModel.fetchLaunches()
        XCTAssertEqual(spy.isFetchLaunchCalled, true)
    }

    func testLaunchListSucceededOffset() {
        let mock = LaunchesRepositoriesMock()
        mock.launchesPast = LaunchGenerator.generateLaunchPast()
        let viewModel = LaunchesViewModel(launchesRepository: mock)
        viewModel.fetchLaunches()
        XCTAssertEqual(viewModel.offset, 20)
    }

    func testLaunchListSucceededCount() {
        let mock = LaunchesRepositoriesMock()
        mock.launchesPast = LaunchGenerator.generateLaunchPast()
        let viewModel = LaunchesViewModel(launchesRepository: mock)
        viewModel.fetchLaunches()
        XCTAssertEqual(viewModel.currentLaunchCount, 1)
    }

    func testLaunchListFailedOffset() {
        let mock = LaunchesRepositoriesMock()
        mock.errorMessage = "Failed"
        let viewModel = LaunchesViewModel(launchesRepository: mock)
        viewModel.fetchLaunches()
        XCTAssertEqual(viewModel.offset, 10)
    }

    func testLaunchListFailedCount() {
        let mock = LaunchesRepositoriesMock()
        mock.errorMessage = "Failed"
        let viewModel = LaunchesViewModel(launchesRepository: mock)
        viewModel.fetchLaunches()
        XCTAssertEqual(viewModel.currentLaunchCount, 0)
    }

    func testLaunchListFetchedWithIndexIncreasedOffset() {
        let mock = LaunchesRepositoriesMock()
        mock.launchesPast = LaunchGenerator.generateLaunchPast()
        let viewModel = LaunchesViewModel(launchesRepository: mock)
        viewModel.fetchLaunchesIfIndexSatisfied(displayedIndex: 1)
        XCTAssertEqual(viewModel.offset, 20)
    }

    func testLaunchListFetchedWithIndexIncreasedCount() {
        let mock = LaunchesRepositoriesMock()
        mock.launchesPast = LaunchGenerator.generateLaunchPast()
        let viewModel = LaunchesViewModel(launchesRepository: mock)
        viewModel.fetchLaunchesIfIndexSatisfied(displayedIndex: 1)
        XCTAssertEqual(viewModel.currentLaunchCount, 1)
    }

    func testLaunchListFetchedWithIndexNotIncreasedOffset() {
        let mock = LaunchesRepositoriesMock()
        mock.errorMessage = "Failed"
        let viewModel = LaunchesViewModel(launchesRepository: mock)
        viewModel.fetchLaunchesIfIndexSatisfied(displayedIndex: 1)
        XCTAssertEqual(viewModel.offset, 10)
    }

    func testLaunchListFetchedWithIndexNotIncreasedCount() {
        let mock = LaunchesRepositoriesMock()
        mock.errorMessage = "Failed"
        let viewModel = LaunchesViewModel(launchesRepository: mock)
        viewModel.fetchLaunchesIfIndexSatisfied(displayedIndex: 1)
        XCTAssertEqual(viewModel.currentLaunchCount, 0)
    }

    func testLaunchListNotFetchedWithWrongIndex() {
        let mock = LaunchesRepositoriesMock()
        mock.launchesPast = LaunchGenerator.generateMultipleLaunch()
        let viewModel = LaunchesViewModel(launchesRepository: mock)
        viewModel.fetchLaunches()
        viewModel.fetchLaunchesIfIndexSatisfied(displayedIndex: 0)
        XCTAssertEqual(viewModel.offset, 20)
    }

    func testLaunchListFetchedWithCorrectIndex() {
        let mock = LaunchesRepositoriesMock()
        mock.launchesPast = LaunchGenerator.generateMultipleLaunch()
        let viewModel = LaunchesViewModel(launchesRepository: mock)
        viewModel.fetchLaunches()
        viewModel.fetchLaunchesIfIndexSatisfied(displayedIndex: 3)
        XCTAssertEqual(viewModel.offset, 30)
    }
}
