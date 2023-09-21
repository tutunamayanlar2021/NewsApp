//
//  Common.swift
//  NewsApp
//
//  Created by Kader Oral on 15.09.2023.
//


import UIKit


extension UIViewController {
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

extension UIViewController{
    func configureGif(gifName: String){
        let deleteGif = UIImage.gifImageWithName(gifName)
        let imageView = UIImageView(image: deleteGif)
        imageView.frame.size = CGSize(width: 200, height: 200)
        imageView.center = self.view.center
        
        self.view.addSubview(imageView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            imageView.removeFromSuperview()
            self.navigationController?.popToRootViewController(animated: true)
            
        }
    }
}
