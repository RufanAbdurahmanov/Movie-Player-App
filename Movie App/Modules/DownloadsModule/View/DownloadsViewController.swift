//
//  DownloadsViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 17.06.22.
//

import UIKit
import AVKit
import AVFoundation

class DownloadsViewController: UIViewController {
    
    let refreshControl = UIRefreshControl()
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    let cellID = "\(DownloadsCollectionViewCell.self)"
    
    var player = AVPlayer()
    var playerController = AVPlayerViewController()
    
    let viewModel = DownloadsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Downloads"
        //view.setTwoGradient(colorOne: UIColor.lightBlueColor, colorTwo: UIColor.darkBlueColor)
        view.backgroundColor = UIColor.darkBlueColor

        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        getDownloads()
        addRefreshControll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDownloads()
    }
    
    fileprivate func getDownloads() {
        viewModel.fetchTrailersFromCoreData {
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    func addRefreshControll() {
        refreshControl.tintColor = .gray
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        collectionView.addSubview(refreshControl)
    }
    
    @objc func refreshData() {
        collectionView.reloadData()
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { [weak self] _ in
            self?.getDownloads()
        }
    }
    
    
}

extension DownloadsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.downloadedTrailers.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! DownloadsCollectionViewCell
        cell.configure(item: viewModel.downloadedTrailers[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showVideo(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 100)
    }
    
    func showVideo(indexPath: IndexPath) {
        let url = viewModel.downloadedTrailers[indexPath.item].trailerPath
        player = AVPlayer(url: URL(string: url!)!)
        playerController.player = player
        self.present(playerController, animated: true) {
            self.playerController.player?.play()
        }
    }
    
}
