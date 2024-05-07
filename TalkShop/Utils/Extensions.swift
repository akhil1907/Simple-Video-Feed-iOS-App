//
//  Extensions.swift
//  TalkShop
//
//  Created by Akhil Jain on 07/05/24.
//

import Foundation
import UIKit


extension UICollectionView {
    func indexOfMajorCell() -> Int? {
        let center = convert(center, from: superview)
        let centerPoint = CGPoint(x: center.x + contentOffset.x, y: center.y + contentOffset.y)
        guard let indexPath = indexPathForItem(at: centerPoint) else { return nil }
        return indexPath.item
    }
}
