//
//  PersonDetailViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 13.06.22.
//

import UIKit

class PersonsDetailViewController: UIViewController {
    @IBOutlet weak private var collectionView: UICollectionView!
    
    var viewModel = PersonsDetailViewModel()
    let cellID = "\(MovieCastCollectionViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.setTwoGradient(colorOne: UIColor.lightBlueColor, colorTwo: UIColor.darkBlueColor)
        view.backgroundColor = UIColor.darkBlueColor
        // Do any additional setup after loading the view.
        
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
    
}

extension PersonsDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MovieCastCollectionViewCell
        cell.configure(cast: viewModel.itemAtCell(index: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 240)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let personVC = self.storyboard?.instantiateViewController(withIdentifier: "\(PersonViewController.self)") as! PersonViewController
        personVC.viewModel = PersonViewModel(id: viewModel.itemAtCell(index: indexPath.item).id ?? 0)
        navigationController?.show(personVC, sender: nil)
    }
    
}
