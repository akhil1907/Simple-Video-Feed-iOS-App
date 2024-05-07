//
//  TalkShopApiService.swift
//  TalkShop
//
//  Created by Akhil Jain on 04/05/24.
//

import Foundation

class TalkShopApiService{
    
    func fetchPostData(completion: @escaping ([Post]?, Error?) -> Void) {
            guard let url = URL(string: "http://localhost:3000/posts") else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    completion(nil, error)
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode([Post].self, from: data)
                    completion(decodedData, nil)
                } catch {
                    completion(nil, error)
                }
            }.resume()
        }
    
    func fetchUserProfileData(completion: @escaping ([User]?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/profile") else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }

            do {
                let decodedData = try JSONDecoder().decode([User].self, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
}
