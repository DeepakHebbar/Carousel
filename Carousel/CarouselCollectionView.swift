
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
        let currentOffset = contentOffset
        print("currentOffset:  \(currentOffset)")
        
        let contentWidth = contentSize.width
        print("contentWidth:  \(contentWidth)")
        print("self.bounds.width:  \(self.bounds.width)")
        
        let centerOffsetX = (contentWidth - self.bounds.width/2)
        print("centerOffsetX:  \(centerOffsetX)")
        
        let distanceFromCenter = fabs(currentOffset.x - centerOffsetX)
        print("distanceFromCenter:  \(distanceFromCenter)")
        
        if (distanceFromCenter > (contentWidth/4)) {
            self.contentOffset = CGPoint(x: centerOffsetX, y: currentOffset.y)
            
            for cell in self.visibleCells() {
                var center = cell.center
                center.x+=(centerOffsetX - currentOffset.x)
                cell.center = center
            }
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        recenterIfNecessary()
    }

}
