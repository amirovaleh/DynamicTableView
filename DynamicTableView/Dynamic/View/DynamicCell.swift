//
//  DynamicCell.swift
//  DynamicTableView
//
//  Created by Valeh Amirov on 27.12.23.
//

import UIKit

final class DynamicCell: UITableViewCell {
    
    var data: String? {
        didSet {
            guard let data else { return }
                dataLabel.text = data
        }
    }
    
    private let containerView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .systemTeal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dataLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraint() {
        
        contentView.addSubview(containerView)
        contentView.addSubview(dataLabel)

                NSLayoutConstraint.activate([
            
                    dataLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                    dataLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                    dataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
                    
                    dataLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 310),
                    
                    containerView.leadingAnchor.constraint(equalTo: dataLabel.leadingAnchor, constant: -12),
                    containerView.trailingAnchor.constraint(equalTo: dataLabel.trailingAnchor, constant: 12),
                    containerView.topAnchor.constraint(equalTo: dataLabel.topAnchor, constant: -6),
                    containerView.bottomAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 6)
     
        ])
    }
}
