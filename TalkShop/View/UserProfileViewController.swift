//
//  UserProfileViewController.swift
//  TalkShop
//
//  Created by Akhil Jain on 06/05/24.
//

import Foundation
import SDWebImage
import UIKit

class UserProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var posts: [Post]?
    var profileImageView = UIImageView()
    var userNameLabel = UILabel()
    var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        return layout
    }()
    
    var userPostsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        view.backgroundColor = .gray
        super.viewDidLoad()
        userPostsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        userPostsCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PostCollectionViewCell")
        userPostsCollectionView.delegate = self
        userPostsCollectionView.dataSource = self
        setUpViews()
       
    }
    
    private func setUpViews(){
        
        view.addSubview(profileImageView)
        view.addSubview(userNameLabel)
        view.addSubview(userPostsCollectionView)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24.0),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100)
        
        ])
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            userNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16.0),
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 50.0),
            userNameLabel.widthAnchor.constraint(equalToConstant: 200.0)
        
        ])
        
        userPostsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            userPostsCollectionView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 16.0),
            userPostsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            userPostsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            userPostsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        userNameLabel.textAlignment = .center
        
    }
    
    public func configure(data: User){
        
        if let url = URL(string: data.profileImageUrl){
            profileImageView.sd_setImage(with: url)
        }
        userNameLabel.text = data.username
        self.posts = data.posts
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.userPostsCollectionView.reloadData()
        }
        
    }
    
    //MARK: Collection View Delegate & Datasource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as? PostCollectionViewCell{
            if let data = posts?[indexPath.item]{
                cell.configure(data: data)
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main
            .bounds.width, height: 500.0)
    }
    
    
    
}
