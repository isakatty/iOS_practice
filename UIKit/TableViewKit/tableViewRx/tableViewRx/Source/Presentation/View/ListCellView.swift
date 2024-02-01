//
//  ListCellView.swift
//  tableViewRx
//
//  Created by Jisoo HAM on 1/21/24.
//

import UIKit

class ListCellView: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "ListCellView")
        
        setupFirstStackView()
        setupSndStackView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let starLabel: UILabel = {
        let lb = UILabel()
        lb.text = "⭐️"
        lb.font = .systemFont(ofSize: 15)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var busStopLb: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 20, weight: .semibold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var busNbLb: UILabel = {
        let lb = UILabel()
        lb.textColor = .systemBlue
        lb.font = .systemFont(ofSize: 17, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var busLocationLb: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 17, weight: .regular)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let alarmLb: UILabel = {
        let lb = UILabel()
        lb.text = "⏰"
        lb.font = .systemFont(ofSize: 15)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let firstStack: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fill
        st.alignment = .leading
        st.spacing = 5
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    let secondStack: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.distribution = .fillProportionally
        st.alignment = .leading
        st.spacing = 10
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    func setupFirstStackView() {
        self.contentView.addSubview(firstStack)
        firstStack.addArrangedSubview(busStopLb)
        firstStack.addArrangedSubview(busNbLb)
    }
    
    func setupSndStackView() {
        self.contentView.addSubview(secondStack)
        secondStack.addArrangedSubview(starLabel)
        secondStack.addArrangedSubview(firstStack)
        secondStack.addArrangedSubview(busLocationLb)
        secondStack.addArrangedSubview(alarmLb)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            secondStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            secondStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            secondStack.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            secondStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    

}
