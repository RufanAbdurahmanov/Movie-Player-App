//
//  TrendingsCollectionViewCell.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 31.05.22.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var collectionView: UICollectionView!
    
    @IBOutlet weak var seeAllImageView: UIImageView!
    
    let cellID = "\(CollectionViewCell.self)"
    var viewModel = CellsViewModel()
    
    var cellTapCallback: ((Int)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
    
    func configureCell(viewModel: CellsViewModel) {
        titleLabel.text = viewModel.title
        self.viewModel = viewModel
        collectionView.reloadData()
    }

    var callBackForSeeAllMovies: (()->())?
    
    @IBAction private func seeAllButton(_ sender: Any) {
        callBackForSeeAllMovies!()
    }
}

extension HomeCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionViewCell
        cell.configure(data: viewModel.itemAtCell(index: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: collectionView.frame.height)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellTapCallback?(indexPath.item)
    }
}

