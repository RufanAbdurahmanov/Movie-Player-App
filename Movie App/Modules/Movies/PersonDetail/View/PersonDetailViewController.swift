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
        
        //view.backgroundColor = UIColor.darkBlueColor
        view.backgroundColor = .black
        
        tableView.backgroundColor = UIColor.clear
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        
        viewModel.getPerson {
            self.viewModel.getPersonFilmography {
                self.tableView.reloadData()
                self.title = self.viewModel.person.name
            }
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
            cell.configure(data: viewModel.person, movies: viewModel.personMovies)
        }
        
        cell.callback = {
            self.showWebView("https://\(self.viewModel.person.homepage ?? "")")
        }
        
        cell.callBackAllMovies = {
            let seeAllMoviesVC = self.storyboard?.instantiateViewController(withIdentifier: "\(SeeAllMoviesViewController.self)") as! SeeAllMoviesViewController
            seeAllMoviesVC.viewModel = SeeAllMoviesViewModel(movieType: "\(self.viewModel.person.name)'s movies", movies: self.viewModel.personMovies)
            self.navigationController?.show(seeAllMoviesVC, sender: nil)
        }
        cell.callBackForMovie = { id in
            let detailsID = "\(MovieDetailsViewController.self)"
            let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: detailsID) as! MovieDetailsViewController
            
            detailsVC.viewModel = MovieDetailsViewModel(id: self.viewModel.personMovies[id].cellId ?? 0, name: self.viewModel.personMovies[id].cellTitle ?? "")
            self.navigationController?.show(detailsVC, sender: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
