//
//  LaunchesViewController.swift
//
//  Created by Onur on 15.05.2022.
//

import UIKit

final class LaunchesViewController: UIViewController {

    private enum Constant {
        static let launchesSection = 0
    }

    @IBOutlet private weak var launchesTableView: UITableView!

    private var snapshot = NSDiffableDataSourceSnapshot<Int, Launch>()
    private var dataSource: UITableViewDiffableDataSource<Int, Launch>?
    var viewModel: LaunchesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        viewModel.stateChangeHandler = { [weak self] change in
            self?.apply(change: change)
        }
        viewModel.fetchLaunches()
    }

    private func apply(change: LaunchesViewModel.Change) {
        switch change {
        case .error(let message):
            showDefaultDoneAlert(message: message)
        case .fetchedLaunches(let launches):
            snapshot.appendItems(launches, toSection: Constant.launchesSection)
            dataSource?.apply(snapshot)
        }
    }
}

// MARK: - UI Configuration
private extension LaunchesViewController {

    private func setupTableView() {
        launchesTableView.delegate = self
        launchesTableView.registerCell(type: LaunchesTableViewCell.self)
        dataSource = UITableViewDiffableDataSource<Int, Launch>(tableView: launchesTableView) { [weak self] tableView, indexPath, _ in
            guard let self = self else { return UITableViewCell() }
            let launch = self.viewModel.currentLaunches[indexPath.row]
            let cell: LaunchesTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(name: launch.missionName, launchYear: launch.launchYear)
            return cell
        }

        snapshot.appendSections([Constant.launchesSection])
        dataSource?.apply(snapshot)
    }
}

// MARK: - UITableViewDelegate
extension LaunchesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.fetchLaunchesIfIndexSatisfied(displayedIndex: indexPath.row)
    }
}
