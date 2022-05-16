//
//  LaunchesRepository.swift
//
//  Created by Onur on 15.05.2022.
//

protocol LaunchesRepositoryProtocol {

    func fetchLaunches(limit: Int, offset: Int, completion: @escaping ([LaunchesQuery.Data.LaunchesPast]?, String?) -> Void)
}

final class LaunchesRepository: LaunchesRepositoryProtocol {

    func fetchLaunches(limit: Int, offset: Int, completion: @escaping ([LaunchesQuery.Data.LaunchesPast]?, String?) -> Void) {
        NetworkManager.shared.fetch(query: LaunchesQuery(limit: limit,
                                                         offset: offset)) { response, message in
            let pastLaunches = response?.launchesPast?.compactMap { $0 }
            completion(pastLaunches, message)
        }
    }
}
