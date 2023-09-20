//
//  Home.swift
//  NewsApp
//
//  Created by Kader Oral on 12.09.2023.
//

import UIKit
import Alamofire

class Home: UIViewController {
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    private var homeViewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        homeViewModel.getNews(category: "business") {
            DispatchQueue.main.async {
                self.newsCollectionView.reloadData()
            }
        }
        setupVC()
        
    }
    private func setupVC(){
        
        let flowlayout = UICollectionViewFlowLayout()
        let layoutwidth = newsCollectionView.frame.size.width
        flowlayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let cellwidth = (layoutwidth - 20)
        flowlayout.itemSize = CGSize(width:cellwidth , height: 200)
        //flowlayout.minimumLineSpacing = 10
       //flowlayout.minimumInteritemSpacing = 10
        newsCollectionView.collectionViewLayout = flowlayout
        
    }
    
}

extension Home: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.numberOfArticles
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCell
        if let article = homeViewModel.article(at: indexPath.item) {
            cell.titleLabel.text = article.title
            cell.descriptionLabel.text = article.description
            print(article.description as Any)
            if let imageURL = homeViewModel.imageURLForArticle(at: indexPath.row) {
                        DispatchQueue.global().async {
                            if let imageData = try? Data(contentsOf: imageURL) {
                                DispatchQueue.main.async {
                                    // Set the image in the UIImageView
                                   cell.newsImageView.image = UIImage(data: imageData)
                                }
                            }
                        }
                    }
            
        }
        return cell
        
        
    }
}
extension Home: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 400)
    }
}
