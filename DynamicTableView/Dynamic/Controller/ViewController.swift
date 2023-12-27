//
//  ViewController.swift
//  DynamicTableView
//
//  Created by Valeh Amirov on 27.12.23.
//

import UIKit

final class ViewController: UIViewController {
    
    private let myData: [String] = [ "Bu kiçik bir celldir",
                             "Bu ondan nisbətən böyükdür. Yəni iki sətr olmasını planlayıram📊",
                             "Bu isə ən böyükdür. Üç və daha artıq olması arzuolunandır. Lakin baxaq görək necə olacaq. Təəssüf ki, olmadı, birazda artırmalı oldum👨🏽‍💻"]
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.register(DynamicCell.self, forCellReuseIdentifier: DynamicCell.description())
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        title = "Dinamik Cell"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DynamicCell.description(), for: indexPath) as? DynamicCell {
            cell.data = myData[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    
}
