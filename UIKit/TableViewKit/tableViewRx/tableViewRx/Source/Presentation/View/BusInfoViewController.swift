//
//  BusInfoViewController.swift
//  tableViewRx
//
//  Created by Jisoo HAM on 1/24/24.
//

import UIKit
import RxSwift

final class BusInfoViewController: UIViewController {
    weak var coordinator: BusInfoCoordinator?
    private let disposeBag = DisposeBag()
    private let viewModel: BusInfoViewModel
    var item: BusCell
    
    let stationNm: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 15, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    
    let busNumber: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 15, weight: .regular)
        lb.textColor = .black
        return lb
    }()
    
    let presentButton: UIButton = {
        var config = UIButton.Configuration.plain()
        let image = UIImage(systemName: "chevron")
        let title = AttributedString.init("Button")
        config.image = image
        config.attributedTitle = title
        let bt = UIButton(configuration: config)
        return bt
    }()
    
    let totalStack: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .equalSpacing
        st.alignment = .center
        st.spacing = 40
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    init(coordinator: BusInfoCoordinator? = nil,
         viewModel: BusInfoViewModel,
         item: BusCell) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("BusInfoVC- \(type(of: self)) deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        print("info - \(coordinator?.parent)")
        print("얘는 info의 child - \(coordinator?.childs)")
        
        configureUI()
        
        self.stationNm.text = item.busStop
        self.busNumber.text = item.busNumber
        
        presentButton.rx.tap
            .subscribe(onNext:  { _ in
                self.coordinator?.nextPage()
            })
            .disposed(by: disposeBag)
        
//            .subscribe(onNext: { _ in
//                self.coordinator?.nextPage()
//            }).disposed(by: disposeBag)
            // bind와 subscribe의 차이 : 이벤트 발생 처리
        // subscribe -> onNext일때 이벤트를 넘겨줌
        // ⭐️ disposebag .. -> 뭔데 . . ;
        
        /*
         
         */
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        coordinator?.parent?.childDidFinish(coordinator)
        print("BusInfoVC - \(coordinator?.childs.count)")
    }
    
    func configureUI() {
        view.addSubview(totalStack)
        
        [stationNm, busNumber, presentButton]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                totalStack.addArrangedSubview($0)
            }
        
        NSLayoutConstraint.activate([
            totalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            totalStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            totalStack.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
