//
//  PanModalViewController.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 24.06.22.
//

import UIKit
import PanModal
class PanModalViewController: UIViewController {
    
    @IBOutlet private weak var downloadingLabel: UILabel!
    @IBOutlet private weak var progressBar: UIProgressView!
    @IBOutlet private weak var grayView: UIView!
    
    var progress: Float = 0.0 {
        didSet {
            progressBar.progress = progress
            if progress == 1 {
                self.dismiss(animated: true)
            }
        }
    }
    var cancelCallBack: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
    }
    

    public func updateProgress(value: Float) {
        progressBar.progress = value
    }
   
    @IBAction func cancelButton(_ sender: Any) {
        cancelCallBack?()
        dismiss(animated: true)
    }
}

extension PanModalViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(165)
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(self.view.frame.height-165)
    }
    
    var anchorModalToLongForm: Bool {
        return false
    }
    
}
