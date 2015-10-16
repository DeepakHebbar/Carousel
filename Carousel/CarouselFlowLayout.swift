//
//  CarouselFlowLayout.swift
//  Carousel
//
//  Created by Deepak Kumar on 15/10/2015.
//  Copyright © 2015 Deepak Kumar. All rights reserved.
//

import UIKit

class CarouselFlowLayout: UICollectionViewFlowLayout {
    
    
    override func prepareLayout() {
        super.prepareLayout()
        
        scrollDirection = .Horizontal
        let multiplier = (collectionView?.frame.size.width)!/8
        itemSize = CGSize(width: multiplier * 8, height: 320)
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        attributes.size = itemSize
        let x = (itemSize.width/2) + (CGFloat(indexPath.row) * itemSize.width)
        attributes.center = CGPoint(x: x, y: attributes.center.y)
        
        return attributes
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSize(width: CGFloat(3) * itemSize.width, height: 320)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let minRow = (rect.origin.x > 0) ? (rect.origin.x / itemSize.width) : 0
        let maxRow = (rect.size.width / itemSize.width) + minRow
        
        print(maxRow)
        
        var layoutAttributesInRect = [UICollectionViewLayoutAttributes]()
        for var j = minRow; j < maxRow; j++ {
            let indexPath = NSIndexPath(forItem: Int(j), inSection: 0)
            layoutAttributesInRect.append(self.layoutAttributesForItemAtIndexPath(indexPath)!)
        }
        
       /* for var i = 0; i < collectionView?.numberOfItemsInSection(0); i++ {
            for var j = minRow; j < maxRow; j++ {
                let indexPath = NSIndexPath(forItem: Int(j), inSection: 0)
                layoutAttributesInRect.append(self.layoutAttributesForItemAtIndexPath(indexPath)!)
            }
        }*/
        
        return layoutAttributesInRect
        
    }

}
