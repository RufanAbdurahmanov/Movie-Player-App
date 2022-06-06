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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .lightBlueColor.withAlphaComponent(0.5)
        seeAllImageView.image = UIImage(systemName: "greaterthan")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
    
    func configureCell(viewModel: CellsViewModel) {
        titleLabel.text = viewModel.title
        self.viewModel = viewModel
        collectionView.reloadData()
    }

    
    @IBAction private func seeAllButton(_ sender: Any) {
        print("see all tapped")
    }
}

extension HomeCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionViewCell
        cell.configure(data: viewModel.itemAtCell(index: indexPath.item))
        print(viewModel.numberOfItems())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
    }    
}

