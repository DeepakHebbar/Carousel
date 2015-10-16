
//
//  CarouselCollectionView.swift
//  Carousel
//
//  Created by Deepak Kumar on 15/10/2015.
//  Copyright © 2015 Deepak Kumar. All rights reserved.
//

import UIKit

class CarouselCollectionView: UICollectionView {
    
    func recenterIfNecessary() {
       
        let currentOffset = self.contentOffset
        print("currentOffset: \(currentOffset)")
        
        
        
        let contentWidth = contentSize.width
        print("contentWidth: \(contentWidth)")
        
        
        let centerOffsetX = (contentWidth)/3
        print("centerOffsetX: \(centerOffsetX)")
        
        
        
        let distanceFromCenter = fabs(currentOffset.x - centerOffsetX)
        print("distanceFromCenter: \(distanceFromCenter)")
        
        
        
        if (distanceFromCenter > ((contentWidth / 3) * 2)) {
            self.contentOffset = CGPoint(x: centerOffsetX, y: currentOffset.y)            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        recenterIfNecessary()
    }

}
