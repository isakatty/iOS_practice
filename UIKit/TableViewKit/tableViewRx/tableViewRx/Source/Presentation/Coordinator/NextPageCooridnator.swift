//
//  NextPageCooridnator.swift
//  tableViewRx
//
//  Created by Jisoo HAM on 1/25/24.
//

import UIKit

final class NextPageCooridnator: Coordinator {
    weak var parent: Coordinator?
    var childs: [Coordinator]
    var navigationController: UINavigationController
    
    init(parent: Coordinator? = nil,
         childs: [Coordinator] = [],
         navigationController: UINavigationController) {
        self.parent = parent
        self.childs = childs
        self.navigationController = navigationController
    }
    
    func start() {
        let nothingVC = NothingViewController(coordinator: self)
        
        navigationController.pushViewController(nothingVC, animated: true)
    }
    
    
}
