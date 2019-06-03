//
//  ImageLoadingViewController.swift
//  TestSourceTreeProject
//
//  Created by Tetiana Hranchenko on 6/2/19.
//  Copyright © 2019 Canux Corporation. All rights reserved.
//

import UIKit

class ImageLoadingViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var images:[ImageModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var imageUrls = [
        "https://picsum.photos/id/243/1200/768",
        "https://picsum.photos/id/239/1200/768",
        "https://picsum.photos/id/253/1200/768",
        "https://picsum.photos/id/215/1200/768",
        "https://picsum.photos/id/258/1200/768",
        "https://picsum.photos/id/238/1200/768",
        "https://picsum.photos/id/231/1200/768",
        "https://picsum.photos/id/230/1200/768"
    ]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewDidLoad")
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for imagePath in imageUrls {
            // С главной очереди отправили задачу на глобальную, когда скачаешь картинку (все картинки скачиваются паралельно), передай ее обратно на главную очередь и добавь в массив
            
            DispatchQueue.global(qos: .userInitiated).async {
                let imageModel = ImageModel(imagePath: imagePath)
                
                DispatchQueue.main.async {
                    self.images.append(imageModel)
                    if self.images.count >= self.imageUrls.count {
                        self.activityView.stopAnimating()
                    }
                }
                
//  self.images.append(imageModel) - если добавлять в массив в .global, задачи могут выполниться одновременно и будут одновременно записываться в массив, тогда одна задача может перезатереть другую и крешниться приложение
                
// изменяемые dictionary, set и array - не безопасные для работы на разных очередях
                
// Thread safety - потокобезопасность в документации класса
// serial - обеспечивает потокобезопасность
            }
        }
        
//         for imagePath in imageUrls {
//
//            let mySerialQueue = DispatchQueue(label: "Чтобы сохранить последовательность картинок, создаем свою очередь") // serial queue
//            mySerialQueue.async {
//                let imageModel = ImageModel(imagePath: imagePath)
//                DispatchQueue.main.async {
//                    self.images.append(imageModel)
//                }
//            }
//        }
    
    }
}

extension ImageLoadingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageLoadingViewControllerID", for: indexPath) as! ImageTableViewCell
        
        cell.myImageView(images[indexPath.row])
       // or
//        cell.imageLoadingView.image = images[indexPath.row].image
//        cell.imageLoadingLabel.text = images[indexPath.row].imagePath
        
//        let imgFromAssets = UIImage(named: "image_1")
//        cell.imageLoadingView.image = imgFromAssets
        
        return cell
    }
}

extension ImageLoadingViewController: UISearchBarDelegate {
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {}
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            let imageModel = ImageModel(imagePath: text)
            images.append(imageModel)
        }
    }
}
