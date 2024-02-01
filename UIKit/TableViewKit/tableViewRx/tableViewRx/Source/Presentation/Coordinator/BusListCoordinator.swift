//
//  BusListCoordinator.swift
//  tableViewRx
//
//  Created by Jisoo HAM on 1/24/24.
//

import UIKit

final class BusListCoordinator: Coordinator {
    weak var parent: Coordinator?
    var childs: [Coordinator]
    var navigationController: UINavigationController
    var viewModel: MainViewModel
    
    init(parent: Coordinator? = nil,
         childs: [Coordinator] = [Coordinator](),
         navigationController: UINavigationController,
         viewModel: MainViewModel) {
        self.parent = parent
        self.childs = childs
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func start() {
        let mainVC = BusListViewController(coordinator: self,
                                           vm: viewModel)
        mainVC.coordinator = self
        navigationController.pushViewController(mainVC, animated: true)
    }
    
}

extension BusListCoordinator {
    func showBusInfo(_ item: BusCell) {
        let busInfoCoordinator = BusInfoCoordinator(
            parent: self,
            navigationController: navigationController,
            viewModel: BusInfoViewModel(), item: item
        )
        
        childs.append(busInfoCoordinator)
        busInfoCoordinator.start()
    }
}
