//
//  SearchViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 04.07.22.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textField: UITextField!
    
    let viewModel = SearchViewModel()
    let cellID = "\(CollectionViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.09000000358, green: 0.1099999994, blue: 0.1330000013, alpha: 1)
        textField.delegate = self
        textField.becomeFirstResponder()
        
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        collectionView.keyboardDismissMode = .onDrag
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        viewModel.movies.removeAll()
        collectionView.reloadData()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           if let text = textField.text,
              let textRange = Range(range, in: text) {
               let updatedText = text.replacingCharacters(in: textRange, with: string)
               if updatedText.count >= 2 {
                   viewModel.getSearch(query: updatedText) {
                       self.collectionView.reloadData()
                   }
               }
               if updatedText.count < 2 {
                   viewModel.movies.removeAll()
                   collectionView.reloadData()
               }
               
//               if updatedText.isEmpty {
//                   viewModel.movies.removeAll()
//                   collectionView.reloadData()
//               } else {
//                   viewModel.getSearch(query: updatedText) {
//                       self.collectionView.reloadData()
//                   }
//               }
           }
           return true
       }
}
    extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return viewModel.movies.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionViewCell
            cell.configure(data: viewModel.movies[indexPath.item])
            return cell
        }
        
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let detailsID = "\(MovieDetailsViewController.self)"
            let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: detailsID) as! MovieDetailsViewController
        
            detailsVC.viewModel = MovieDetailsViewModel(id: viewModel.movies[indexPath.item].cellId ?? 0, name: viewModel.movies[indexPath.item].cellTitle ?? "")
            self.navigationController?.show(detailsVC, sender: nil)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width / 2 - 10, height: 240)
        }
    }
