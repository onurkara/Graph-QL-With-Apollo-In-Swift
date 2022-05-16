//
//  LaunchesViewModel.swift
//  MidasAssignment
//
//  Created by Onur on 15.05.2022.
//

final class LaunchesViewModel {

    enum Change {

        case error(message: String)
        case fetchedLaunches(launches: [Launch])
    }

    private enum Constant {
        static let initialIndex = 20
        static let initialOffset = 10
    }

    private let launchesRepository: LaunchesRepositoryProtocol
    private(set) var offset: Int = Constant.initialOffset
    private(set) var currentLaunchCount = 0
    var currentLaunches: [Launch] = []
    var stateChangeHandler: ((Change) -> Void)?

    init(launchesRepository: LaunchesRepositoryProtocol) {
        self.launchesRepository = launchesRepository
    }

    func fetchLaunchesIfIndexSatisfied(displayedIndex: Int) {
        guard displayedIndex+1 >= currentLaunchCount else {
            return
        }

        fetchLaunches()
    }

    func fetchLaunches() {
        launchesRepository.fetchLaunches(limit: Constant.initialIndex,
                                         offset: offset) { [weak self] queryPastLaunches, message in
            guard let self = self else {
                return
            }

            guard let errorMessage = message else {
                self.addFetchedLaunchesToCurrentLaunches(pastLaunches: queryPastLaunches ?? [])
                self.stateChangeHandler?(.fetchedLaunches(launches: self.currentLaunches))
                self.increaseOffset()
                return
            }
            self.stateChangeHandler?(.error(message: errorMessage))
        }
    }
}

// MARK: - Helpers
private extension LaunchesViewModel {

    private func addFetchedLaunchesToCurrentLaunches(pastLaunches: [LaunchesQuery.Data.LaunchesPast]) {
        let fetchedLaunches = pastLaunches.compactMap { Launch(missionName: $0.missionName,
                                                               details: $0.details,
                                                               launchYear: $0.launchYear)}
        currentLaunchCount += fetchedLaunches.count
        currentLaunches.append(contentsOf: fetchedLaunches)
    }

    private func increaseOffset() {
        offset += Constant.initialOffset
    }
}
