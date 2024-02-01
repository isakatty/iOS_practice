//
//  TableView.swift
//  tableViewRx
//
//  Created by Jisoo HAM on 1/21/24.
//

import UIKit

class TableViews: UIView {
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 60
        tv.register(ListCellView.self, forCellReuseIdentifier: "ListCellView")
        return tv
    }()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        setConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        
//        setConstraints()
//    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
