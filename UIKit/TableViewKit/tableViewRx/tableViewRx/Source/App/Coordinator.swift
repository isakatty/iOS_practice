//
//  Coordinator.swift
//  tableViewRx
//
//  Created by Jisoo HAM on 1/21/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var parent: Coordinator? { get set }
    var childs: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func childDidFinish(_ child: Coordinator?)
}

extension Coordinator {
    func childDidFinish(_ child: Coordinator?) {
        childs = childs.filter { $0 !== child }
    }
}

final class MainCoordinator: Coordinator {
    weak var parent: Coordinator?
    var childs: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }
    
    func start() {
        let listCoordinator = BusListCoordinator(parent: self,
                                                 navigationController: navigationController,
                                                 viewModel: MainViewModel())
        childs.append(listCoordinator)
        childs.first?.start()
    }
    
}
