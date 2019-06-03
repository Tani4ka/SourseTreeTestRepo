//
//  ImageTableViewCell.swift
//  TestSourceTreeProject
//
//  Created by Tetiana Hranchenko on 6/2/19.
//  Copyright © 2019 Canux Corporation. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageLoadingView: UIImageView!
    @IBOutlet weak var imageLoadingLabel: UILabel!
//    @IBOutlet weak var imageLoadingHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    
    func myImageView(_ imageModel: ImageModel) {
        imageLoadingView.image = imageModel.image
        imageLoadingLabel.text = imageModel.imagePath
//        imageLoadingHeightConstraint.constant = 200
     
//        if let myImage = imageModel.image {
//            let myImageWidth = myImage.size.width
//            let myImageHeight = myImage.size.height
//            let myViewWidth = self.frame.size.width
//
//            let ratio = myImageHeight/myImageWidth
//            let scaledHeight = myViewWidth * ratio
//
//            imageLoadingHeightConstraint.constant = scaledHeight
//        }
    }
    
    var imagePath: String? {
        didSet {
            activityView.startAnimating()
            imageLoadingView.image = nil
            if let path = imagePath {
                DispatchQueue.global(qos: .userInitiated).async {
                    let imageModel = ImageModel(imagePath: path)
                    if path == self.imagePath {
                        DispatchQueue.main.async {
                            self.imageLoadingView.image = imageModel.image
                            self.activityView.stopAnimating()
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // если мы находимя в главной очереди
        /*if Thread.isMainThread {
            self.imageLoadingView.image = imageModel.image
        } else {
            DispatchQueue.main.async {
                self.imageLoadingView.image = imageModel.image
            }
        }*/
    }
    
}
