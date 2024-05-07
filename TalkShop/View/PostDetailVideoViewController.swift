//
//  PostDetailVideoViewController.swift
//  TalkShop
//
//  Created by Akhil Jain on 05/05/24.
//

import Foundation
import UIKit
import AVKit

class PostDetailVideoViewController: UIViewController{
    
    var player: AVPlayer!
    var avpController = AVPlayerViewController()
    var userNameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews(){
        view.backgroundColor = .cyan
        view.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24.0),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16.0),
            userNameLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        userNameLabel.textAlignment = .center
        userNameLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
    }
    
    public func configureVideoData(data: Post){
        if let url = URL(string: data.video_url) {
            player = AVPlayer(url: url)
            avpController.player = player
            player.play()
            avpController.videoGravity = .resizeAspectFill
            addChild(avpController)
            avpController.view.frame = CGRect(x: 24, y: 100, width: UIScreen.main.bounds.width - (2*24.0), height: 700.0)
            view.addSubview(avpController.view)
            view.layer.masksToBounds = true
            userNameLabel.text = data.username
        }
    }
    
}
