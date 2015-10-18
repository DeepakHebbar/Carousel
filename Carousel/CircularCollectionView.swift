//
//  CircularCollectionView.swift
//  Carousel
//
//  Created by Deepak Kumar on 16/10/2015.
//  Copyright © 2015 Deepak Kumar. All rights reserved.
//

import UIKit

class CircularCollectionView: UICollectionView {

    func recenterIfNecessary() {
        
        let itemHeight = self.frame.width * (2/5)
        let itemWidth = self.frame.width * (32/45)
        let itemOffset = self.frame.width * (13/90)
        let numItems = self.dataSource?.collectionView(self, numberOfItemsInSection: 0)
        
        print("itemHeight: \(itemHeight) itemWidth: \(itemWidth) itemOffset: \(itemOffset) numItems: \(numItems)")
        
        
        
        let currentOffset = self.contentOffset
        print("currentOffset: \(currentOffset)")
        
        
        
        let contentWidth = contentSize.width
        print("contentWidth: \(contentWidth)")
        
        
        let centerOffsetX = (contentWidth)/3
        print("centerOffsetX: \(centerOffsetX)")
        
        
        
        let distanceFromCenter = fabs(currentOffset.x - centerOffsetX)
        print("distanceFromCenter: \(distanceFromCenter)")
        
        
        
//        if (contentOffset.x > ((contentWidth / 3) * 2)) {
//            self.contentOffset = CGPoint(x: centerOffsetX, y: currentOffset.y)
//        }
        
        if (contentOffset.x < 0) {
            self.contentOffset = CGPoint(x: (itemOffset + (itemWidth * CGFloat(numItems! - 2))), y: 0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        recenterIfNecessary()
    }
}
