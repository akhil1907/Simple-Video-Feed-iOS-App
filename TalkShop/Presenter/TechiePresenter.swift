//
//  TalkShopPresenter.swift
//  TalkShop
//
//  Created by Akhil Jain on 06/05/24.
//

import Foundation

protocol TechiePresenterInterface{
    func fetchInitialPostData()
    func fetchUserProfileData()
}

protocol TechiePresenterDelegate: AnyObject {
    func didRecieveInitialPostData(data: [Post])
    func didRecieveUserProfileData(data: [User])
}

class TechiePresenter: TechieViewInterface, TechieInteractorDelegate{
   
    
    var interactor: TechiePresenterInterface?
    weak var delegate: TechiePresenterDelegate?
    
    public func configureDependencies(interactor: TechiePresenterInterface){
        self.interactor = interactor
        fetchInitialPostData()
    }
    
    func fetchInitialPostData() {
        interactor?.fetchInitialPostData()
    }
    
    func fetchUserProfileData() {
        interactor?.fetchUserProfileData()
    }
    
    
    
    //MARK: TechieInteractorDelegate Methods
    
    func didRecieveInitialPostData(data: [Post]) {
        delegate?.didRecieveInitialPostData(data: data)
    }
    
    func didRecieveUserProfileData(data: [User]) {
        delegate?.didRecieveUserProfileData(data: data)
    }
}
