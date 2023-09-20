//
//  UserRepository.swift
//  NewsApp
//
//  Created by Kader Oral on 16.09.2023.
//

import Foundation
import Alamofire

class UserRepository{
    
    func save(user_name:String,user_bookmarkedNews:News){
       let url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php"
        let params:Parameters = ["kisi_ad":user_name,"kisi_tel":user_bookmarkedNews]
        AF.request(url,method: .post,parameters: params).response{
            response in
            if let data = response.data{
                do{
                    let crudCevap = try JSONDecoder().decode(NewsResponse.self, from: data)
                    print("-------Kişi Kaydet ---------")
                    print("Mesaj : \(crudCevap.status)")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
}
