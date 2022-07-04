//
//  IAPViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 17.06.22.
//

import UIKit

struct Model {
    let title: String!
    let handle: (()->())
}

class IAPViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setupHeader()
        
        models.append(Model(title: "500 Diamonds", handle: {
            IAPManager.shared.purchase(product: .diamond_500) { [weak self] count in
                let currentCount = self?.myDiamondsCount ?? 0
                let newCount = currentCount + count
                UserDefaults.standard.set(newCount, forKey: "diamont_count")
                self?.setupHeader()
            }
        }))
        models.append(Model(title: "1000 Diamonds", handle: {
            IAPManager.shared.purchase(product: .diamond_1000) { [weak self] count in
                let currentCount = self?.myDiamondsCount ?? 0
                let newCount = currentCount + count
                UserDefaults.standard.set(newCount, forKey: "diamont_count")
                self?.setupHeader()
            }
        }))
        models.append(Model(title: "2500 Diamonds", handle: {
            IAPManager.shared.purchase(product: .diamond_2500) { [weak self] count in
                let currentCount = self?.myDiamondsCount ?? 0
                let newCount = currentCount + count
                UserDefaults.standard.set(newCount, forKey: "diamont_count")
                self?.setupHeader()
            }
        }))
        models.append(Model(title: "5000 Diamonds", handle: {
            IAPManager.shared.purchase(product: .diamond_5000) { [weak self] count in
                let currentCount = self?.myDiamondsCount ?? 0
                let newCount = currentCount + count
                UserDefaults.standard.set(newCount, forKey: "diamont_count")
                self?.setupHeader()
            }
        }))
    }


}

extension IAPViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.text = models[indexPath.row].title
        cell.textLabel?.textColor = .black
        cell.imageView?.image = UIImage(systemName: "suit.diamond.fill")
        cell.imageView?.tintColor = .systemBlue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.row]
        model.handle()
    }
    var myDiamondsCount: Int {
        UserDefaults.standard.integer(forKey: "diamont_count")
    }
    
    func setupHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        let imageView = UIImageView(image: UIImage(systemName: "suit.diamond.fill"))
        imageView.frame = CGRect(x: (view.frame.size.width-100)/2, y: 10, width: 100, height: 100)
        imageView.tintColor = .systemBlue
        header.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 10, y: 120, width: view.frame.size.width-20, height: 100))
        header.addSubview(label)
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "\(myDiamondsCount) Diamonds"
        
        tableView.tableHeaderView = header
        
        
        
    }
    
}
