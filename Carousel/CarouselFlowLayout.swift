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
        return super.layoutAttributesForItemAtIndexPath(indexPath)
    }

}
