//
//  TvShowDetailsViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 04.07.22.
//

import UIKit

class TvShowDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellID = "\(ShowDetailTableViewCell.self)"
    
    let viewModel = TvShowDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDatas()

    }
    
    func getDatas() {
        viewModel.getTvShowTrailers {
            self.viewModel.getTvShowDetails {
                self.viewModel.getTvShowSeasons {
                    self.viewModel.getTvShowCasts {
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }

}

extension TvShowDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ShowDetailTableViewCell
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

