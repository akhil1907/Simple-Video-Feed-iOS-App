//
//  PostCollectionViewCell.swift
//  TalkShop
//
//  Created by Akhil Jain on 04/05/24.
//

import UIKit
import AVKit
import SDWebImage

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playerLayer?.removeFromSuperlayer() // Remove the player layer and player when cell is reused
        player = nil
        playerLayer = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = bounds
    }
    
    public func configure(data: Post) {
        if let url = URL(string: data.thumbnail_url) {
            DispatchQueue.main.async {
                self.thumbnailImageView.sd_setImage(with: url)
            }
        }
        usernameLabel.text = data.username
        likesLabel.text = String(data.like_count)
        
        if let videoURL = URL(string: data.video_url) {
            let player = AVPlayer(url: videoURL)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = thumbnailImageView.bounds
            playerLayer.videoGravity = .resizeAspectFill
            thumbnailImageView.layer.addSublayer(playerLayer)
            
            self.player = player
            self.playerLayer = playerLayer
        }
    }
    
    public func startPlayingVideo(){
        self.player?.play()
    }
    
    
    public func stopPlayingVideo(){
        self.player?.pause()
    }
}
