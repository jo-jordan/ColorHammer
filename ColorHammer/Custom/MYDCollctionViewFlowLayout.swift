//
//  MYDCollctionViewFlowLayout.swift
//  ColorHammer
//
//  Created by lzjlxebr on 2020/8/31.
//  https://medium.com/@garywade/equally-spacing-uicollectionview-cells-6d74401f8f56
//

import UIKit

class DSSCollectionViewFlowLayout: UICollectionViewFlowLayout {
    // MARK: - Public Variables
    var placeEqualSpaceForAllCells:Bool = true
    
    // MARK: - Override Methods
    override func prepare() {
        super.prepare()
        if self.placeEqualSpaceForAllCells {
            var contentByItems: ldiv_t
            let contentSize: CGSize = self.collectionViewContentSize
            let itemSize = self.itemSize
            if UICollectionView.ScrollDirection.vertical == self.scrollDirection {
                contentByItems = ldiv(Int(contentSize.width), Int(itemSize.width))
            } else {
                contentByItems = ldiv(Int(contentSize.height), Int(itemSize.height))
            }
            let layoutSpacingValue: CGFloat =
                CGFloat(NSInteger(CGFloat(contentByItems.rem) / CGFloat(contentByItems.quot + 1)))
            
            let originalMinimumLineSpacing = self.minimumLineSpacing
            let originalMinimumInteritemSpacing = self.minimumInteritemSpacing
            let originalSectionInset = self.sectionInset
            if  (layoutSpacingValue != originalMinimumLineSpacing) ||
                    (layoutSpacingValue != originalMinimumInteritemSpacing) ||
                    (layoutSpacingValue != originalSectionInset.left) ||
                    (layoutSpacingValue != originalSectionInset.top) ||
                    (layoutSpacingValue != originalSectionInset.right) ||
                    (layoutSpacingValue != originalSectionInset.bottom) {
                let insetForItem = UIEdgeInsets(top: layoutSpacingValue, left: layoutSpacingValue, bottom: layoutSpacingValue, right: layoutSpacingValue)
                self.minimumLineSpacing = layoutSpacingValue
                self.minimumInteritemSpacing = layoutSpacingValue
                self.sectionInset = insetForItem
            }
        }
    }
}
