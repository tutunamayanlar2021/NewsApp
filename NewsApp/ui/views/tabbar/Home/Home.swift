//
//  Home.swift
//  NewsApp
//
//  Created by Kader Oral on 12.09.2023.
//

import UIKit

class Home: UIViewController {
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    @IBOutlet weak var newsSearchBar: UISearchBar!

    private  var homeViewModel = HomeViewModel()
   
     func reloadNewsCollectionView() {
        homeViewModel.getNews() {
                self.newsCollectionView.reloadData()
            
        }
         
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        setupVC()

        reloadNewsCollectionView()
    }
    
    private func setupVC() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cellWidth = (newsCollectionView.frame.size.width - 20)
        flowLayout.itemSize = CGSize(width: cellWidth, height: 200)
        newsCollectionView.collectionViewLayout = flowLayout
        newsSearchBar.delegate = self
        

    }
    
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Filter", message: nil, preferredStyle: .actionSheet)
        
        for category in Category.allCases {
            alertController.addAction(UIAlertAction(title: category.categoryType, style: .default, handler: { _ in
                let selectedCategoryType = category
                self.homeViewModel.selectedCategorytType = selectedCategoryType
                
                self.reloadNewsCollectionView()
            }))
        }
        
        alertController.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
   

}

//Mark UISearchBarDelegate
extension Home: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
            homeViewModel.articles = homeViewModel.filterArticlesBySearchText(searchText)
    

        self.newsCollectionView.reloadData()

        
        
    }
    
    
}

extension Home: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.numberOfArticles
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCell
        
        cell.titleLabel.text = homeViewModel.articles[indexPath.row].title
        cell.descriptionLabel.text = homeViewModel.articles[indexPath.row].description
            if let imageURL = homeViewModel.imageURLForArticle(at: indexPath.row) {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageURL) {
                        DispatchQueue.main.async {
                            cell.newsImageView.image = UIImage(data: imageData)
                        }
                    }
                
            }
            
        }
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = homeViewModel.articles[indexPath.row]
        let urlString = article.url
 
            self.performSegue(withIdentifier: "goToWeb", sender: urlString)
        

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWeb" {
            if let webViewController = segue.destination as? Web,
                let urlString = sender as? String {
                let vm = WebViewModel(url: urlString)
                webViewController.web = vm
            }
        }
    }

}

extension Home: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 400)
    }
}
