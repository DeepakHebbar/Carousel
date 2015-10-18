//
//  UltimateCollectionView.swift
//  Carousel
//
//  Created by Deepak Kumar on 18/10/2015.
//  Copyright © 2015 Deepak Kumar. All rights reserved.
//

import UIKit

class UltimateCollectionView: UICollectionView {

    func recenterIfNecessary() {
        
        let itemHeight = self.frame.width * (2/5)
        let itemWidth = self.frame.width * (32/45)
        let itemOffset = self.frame.width * (13/90)
        let numItems = self.dataSource?.collectionView(self, numberOfItemsInSection: 0)
        
        print("itemHeight: \(itemHeight) itemWidth: \(itemWidth) itemOffset: \(itemOffset) numItems: \(numItems)")
        
        let xOffset = (itemWidth * CGFloat(numItems! - 2)) - itemOffset

        print("xOffset: \(xOffset)")
        print("contentOffset.x: \(contentOffset.x)")
        
        if (contentOffset.x < 0) {
            print("resetting to < zero")
            self.contentOffset = CGPoint(x: (itemOffset + (itemWidth * CGFloat(numItems! - 3))), y: 0)
        }
        
        if (contentOffset.x > xOffset) {
            print("resetting to zero")
            self.contentOffset = CGPointZero
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        recenterIfNecessary()
    }

}
