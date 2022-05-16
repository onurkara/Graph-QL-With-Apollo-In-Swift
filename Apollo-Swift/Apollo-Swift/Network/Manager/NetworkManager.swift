//
//  NetworkManager.swift
//  MidasAssignment
//
//  Created by Onur on 15.05.2022.
//

import Apollo
import Foundation

final class NetworkManager {

    private enum Constant {
        static let baseURL = "https://api.spacex.land/graphql/"
    }

    static let shared = NetworkManager()
    private lazy var apolloClient = ApolloClient(url: URL(string: Constant.baseURL)!)

    func fetch<T: GraphQLQuery>(query: T, responseCompletion: @escaping ((T.Data?, String?) -> Void)) {
        apolloClient.fetch(query: query) { result in
            switch result {
            case .success(let response):
                responseCompletion(response.data, nil)
            case .failure(let error):
                responseCompletion(nil, error.localizedDescription)
            }
        }
    }
}
