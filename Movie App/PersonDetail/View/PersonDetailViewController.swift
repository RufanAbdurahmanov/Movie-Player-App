//
//  PersonDetailViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 13.06.22.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellID = "\(PersonTableViewCell.self)"
    
    var viewModel = PersonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setTwoGradient(colorOne: UIColor.lightBlueColor, colorTwo: UIColor.darkBlueColor)

        tableView.backgroundColor = UIColor.clear
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        viewModel.getPerson {
            self.tableView.reloadData()
        }
    }
    
}

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PersonTableViewCell
        if viewModel.person != nil {
            cell.configure(data: viewModel.person)
        }
        cell.callback = {
            self.showWebView("https://\(self.viewModel.person.homepage ?? "")")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
