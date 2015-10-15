//
//  CarouselLayout.swift
//  Carousel
//
//  Created by Deepak Kumar on 14/10/2015.
//  Copyright © 2015 Deepak Kumar. All rights reserved.
//

import UIKit

class CarouselLayout: UICollectionViewFlowLayout {
    
    var numberOfItems = 0
    var viewAttributes = [UICollectionViewLayoutAttributes]()
    private var layoutAttributes: NSMutableDictionary = [:]
    var previousOffset: CGFloat?
    var currentPage: NSInteger = 0
    var multiplier: CGFloat = 0
    var lastItem: Int = 0

    override func prepareLayout() {
        super.prepareLayout()
        
        numberOfItems = (collectionView?.numberOfItemsInSection(0))!
        
        multiplier = (collectionView?.frame.size.width)!/8
        
        for var i = 0; i<numberOfItems; i++ {
            let cellIndexPath = NSIndexPath(forItem: i, inSection: 0)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: cellIndexPath)
            attributes.frame = CGRect(x: multiplier + (CGFloat(i) * (multiplier * 6)), y: 0, width: (multiplier * 6), height: 320)
            attributes.indexPath = cellIndexPath
            
            layoutAttributes[cellIndexPath] = attributes
        }
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributesInRect = [UICollectionViewLayoutAttributes]()
        
        self.layoutAttributes.enumerateKeysAndObjectsUsingBlock { (indexPath, attributes, stop) -> Void in
            if(CGRectIntersectsRect(rect, attributes.frame)){
                layoutAttributesInRect.append(attributes as! UICollectionViewLayoutAttributes)
            }
        }
        
        if currentPage == 0 {
            lastItem = numberOfItems - 1
            
            let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: NSIndexPath(forItem: lastItem, inSection: 0))
            attributes.frame = CGRect(x: -((multiplier * 6) - multiplier), y: 0, width: (multiplier * 6), height: 320)
            layoutAttributesInRect.append(attributes)
        }
        
        if currentPage == numberOfItems-1{
            let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: NSIndexPath(forItem: 0, inSection: 0))
            attributes.frame = CGRect(x: ((multiplier * 6) + multiplier), y: 0, width: (multiplier * 6), height: 320)
            layoutAttributesInRect.append(attributes)
        }
        
        print("currentPage: \(currentPage)")
        
        return layoutAttributesInRect
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return self.layoutAttributes[indexPath] as? UICollectionViewLayoutAttributes
    }
    
  /*  override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        if ((previousOffset > self.collectionView?.contentOffset.x) && (velocity.x < 0)) {
            self.currentPage = max(currentPage - 1, 0)
        }else if ((previousOffset < self.collectionView?.contentOffset.x) && (velocity.x > 0)) {
            self.currentPage = min(currentPage + 1, numberOfItems - 1)
        }
        
        let updatedOffset = (multiplier * 6) * CGFloat(currentPage)
        previousOffset = updatedOffset

        return CGPoint(x: updatedOffset, y: proposedContentOffset.y)
    }*/
    
    override func collectionViewContentSize() -> CGSize {
        return CGSize(width: 99999, height: 320)
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        let oldBounds = self.collectionView?.bounds
        if (!CGSizeEqualToSize(oldBounds!.size, newBounds.size)){
            self.prepareLayout()
            return true
        }
        return false
    }
}
