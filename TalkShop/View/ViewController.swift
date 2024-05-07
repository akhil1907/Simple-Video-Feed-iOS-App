//
//  ViewController.swift
//  TalkShop
//
//  Created by Akhil Jain on 04/05/24.
//

import UIKit

protocol TechieViewInterface{
    func fetchInitialPostData()
    func fetchUserProfileData()
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, TechiePresenterDelegate {
    
    var posts: [Post]?
    var userData: User?
    var presenter = TechiePresenter()
    var interactor = TechieInteractor()
    @IBOutlet weak var postsCollectionView: UICollectionView!
    private var refreshControl = UIRefreshControl()
    private var visibleIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PostCollectionViewCell")
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
        presenter.delegate = self
        interactor.delegate = presenter
        presenter.configureDependencies(interactor: interactor)
        
        postsCollectionView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        // Do any additional setup after loading the view.
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as? PostCollectionViewCell {
            if let data = posts?[indexPath.item] {
                cell.configure(data: data)
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewContoller = PostDetailVideoViewController()
        if let postData = posts?[indexPath.item]{
            if let cell = collectionView.cellForItem(at: indexPath) as? PostCollectionViewCell {
                cell.stopPlayingVideo()
            }
            detailViewContoller.configureVideoData(data: postData)
            present(detailViewContoller, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 500)
    }
    
    @IBAction func navigateToProfileBtnTapped(_ sender: Any) {
        
        presenter.fetchUserProfileData()
        
    }
    
    // MARK: Pull-to-refresh Action
        
        @objc private func refreshData() {
            presenter.fetchInitialPostData()
        }
        
        
    //MARK: TechiePresenterDelegateMethods
    
    func didRecieveInitialPostData(data: [Post]) {
        self.posts = data
        postsCollectionView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func didRecieveUserProfileData(data: [User]) {
        self.userData = data[0]
        let profileViewContoller = UserProfileViewController()
        if let data = userData {
            self.present(profileViewContoller, animated: true)
            profileViewContoller.configure(data: data)
        }
        debugPrint("Recieved User Profile Data")
    }
    
    //MARK: ScrollViewDelegateMethod
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let indexPath = postsCollectionView.indexPathsForVisibleItems.first else {
            return
        }
        
        if visibleIndexPath != indexPath {
            // Stop video playback on the previously visible cell
            if let previousVisibleCell = postsCollectionView.cellForItem(at: visibleIndexPath ?? indexPath) as? PostCollectionViewCell {
                previousVisibleCell.stopPlayingVideo()
            }
            
            // Start video playback on the currently visible cell
            if let visibleCell = postsCollectionView.cellForItem(at: indexPath) as? PostCollectionViewCell {
                visibleCell.startPlayingVideo()
                visibleIndexPath = indexPath
            }
        }
    }
    

}

