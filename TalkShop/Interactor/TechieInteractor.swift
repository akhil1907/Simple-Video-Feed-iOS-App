//
//  TechieInteractor.swift
//  TalkShop
//
//  Created by Akhil Jain on 06/05/24.
//

import Foundation


protocol TechieInteractorDelegate: AnyObject {
    func didRecieveInitialPostData(data: [Post])
    func didRecieveUserProfileData(data: [User])
}


class TechieInteractor: TechiePresenterInterface{
    
    weak var delegate: TechieInteractorDelegate?
    
    func fetchInitialPostData(){
        TalkShopApiService().fetchPostData{ data, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.delegate?.didRecieveInitialPostData(data: data)
                }
            }
        }
    }
    
    func fetchUserProfileData() {
        TalkShopApiService().fetchUserProfileData{ data, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.delegate?.didRecieveUserProfileData(data: data)
                }
            }
        }
    }
    
    
}
