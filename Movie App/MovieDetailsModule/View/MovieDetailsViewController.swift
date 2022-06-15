//
//  MovieDetailsViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 08.06.22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let cellID = "\(DetailsTableViewCell.self)"
    
    var viewModel = MovieDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setTwoGradient(colorOne: UIColor.lightBlueColor, colorTwo: UIColor.darkBlueColor)
        
        getDatas()
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        tableView.backgroundColor = .clear
        
    }
    
    func getDatas() {
            self.viewModel.getMovieDetails{
                    self.viewModel.getCasts {
                        self.tableView.reloadData()
                    }
            }
    }
}
extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DetailsTableViewCell
        if viewModel.movieDetails != nil {
            cell.configure(id: "\(viewModel.id ?? 0)", details: viewModel.movieDetails!, casts: viewModel.movieCasts)
        }
        cell.callback = { [self] in
            let personsDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "\(PersonsDetailViewController.self)") as! PersonsDetailViewController
            personsDetailVC.viewModel = PersonsDetailViewModel(casts: viewModel.movieCasts)
            self.navigationController?.show(personsDetailVC, sender: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

