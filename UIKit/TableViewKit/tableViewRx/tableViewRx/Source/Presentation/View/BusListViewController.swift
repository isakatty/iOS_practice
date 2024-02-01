//
//  BusListViewController.swift
//  tableViewRx
//
//  Created by Jisoo HAM on 1/21/24.
//

import UIKit
import RxSwift
import RxCocoa

class BusListViewController: UIViewController {
    
    weak var coordinator: BusListCoordinator?
    let disposeBag = DisposeBag()
    var vm: MainViewModel
    
    var customView: TableViews = TableViews()
    
    init(coordinator: BusListCoordinator? = nil,
         vm: MainViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("BusListVC- \(type(of: self)) deinit")
        print("\(String(describing: coordinator?.childs.count))")
    }
}

extension BusListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setConstraints()
        
        hmm()
        
        print("\(String(describing: coordinator?.childs.count))")
        
        customView.tableView.rx.modelSelected(BusCell.self)
            .subscribe(onNext: { [weak self] bus in
                guard let self = self else { return }
//                print("셀 선택됨 \(bus)")
                self.coordinator?.showBusInfo(bus)
//                print("tableView에서 메모리 올라오는 순간 ? \(coordinator?.childs)")
            })
            .disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("⚠️ \(String(describing: coordinator?.parent))")
    }
    
}

extension BusListViewController {
    func setConstraints() {
        view.addSubview(customView.tableView)
        
        customView.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customView.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customView.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customView.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customView.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        self.customView.tableView.reloadData()
    }
}

extension BusListViewController {
    private func hmm() {
        vm.busObservables
            .bind(to: customView.tableView.rx.items(cellIdentifier: "ListCellView", cellType: ListCellView.self)) { (row, element, cell) in
                cell.busStopLb.text = element.busStop
                cell.busNbLb.text = element.busNumber
                cell.busLocationLb.text = element.busLocation
                
            }.disposed(by: disposeBag)
    }
}
