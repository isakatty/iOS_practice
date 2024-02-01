//
//  BusInfoCoordinator.swift
//  tableViewRx
//
//  Created by Jisoo HAM on 1/24/24.
//

import UIKit

final class BusInfoCoordinator: Coordinator {
    weak var parent: Coordinator?
    var childs: [Coordinator]
    var navigationController: UINavigationController
    var viewModel: BusInfoViewModel
    var item: BusCell
    
    
    init(parent: Coordinator? = nil,
         childs: [Coordinator] = [Coordinator](),
         navigationController: UINavigationController,
         viewModel: BusInfoViewModel,
         item: BusCell) {
        self.parent = parent
        self.childs = childs
        self.navigationController = navigationController
        self.viewModel = viewModel
        self.item = item
    }
    
    func start() {
        let busInfoVC = BusInfoViewController(coordinator: self,
                                              viewModel: viewModel,
                                              item: item)
        print("인포 Coordinator \(item)")
        navigationController.pushViewController(busInfoVC, animated: true)
    }
    
}

extension BusInfoCoordinator {
    func nextPage() {
        let nextPgCoordinator = NextPageCooridnator(
            parent: self,
            navigationController: navigationController
        )
        
        childs.append(nextPgCoordinator)
        nextPgCoordinator.start()
    }
}
