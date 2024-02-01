//
//  NothingViewController.swift
//  tableViewRx
//
//  Created by Jisoo HAM on 1/25/24.
//

import UIKit
import RxSwift

class NothingViewController: UIViewController {
    weak var coordinator: NextPageCooridnator?
    private let disposeBag = DisposeBag()

    let textLabel: UILabel = {
        let lb = UILabel()
        lb.text = "이렇게 넘어왔을때"
        lb.font = .systemFont(ofSize: 28, weight: .bold)
        return lb
    }()
    
    init(coordinator: NextPageCooridnator? = nil) {
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("NothingVC- \(type(of: self)) deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        
        configUI()
        print("NothingVC - \(coordinator?.childs.count)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        coordinator?.parent?.childDidFinish(coordinator)
        print("NothingVC - \(coordinator?.childs.count)")
    }
    
    func configUI() {
        view.addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }

}
