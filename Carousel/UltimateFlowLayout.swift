//
//  UltimateFlowLayout.swift
//  Carousel
//
//  Created by Deepak Kumar on 18/10/2015.
//  Copyright © 2015 Deepak Kumar. All rights reserved.
//

import UIKit

class UltimateFlowLayout: UICollectionViewFlowLayout {
   
    var numberOfItems = 0
    var viewAttributes = [UICollectionViewLayoutAttributes]()
    private var layoutAttributes: NSMutableDictionary = [:]
    var previousOffset: CGFloat = 0
    var currentPage: NSInteger = 1
    //var multiplier: CGFloat = 0
    var lastItem: Int = 0
    
    var itemHeight: CGFloat = 0
    var itemWidth: CGFloat = 0
    var itemOffset: CGFloat = 0
    var xOffset: CGFloat = 0
    
    override func prepareLayout() {
        super.prepareLayout()
        
        itemHeight = (collectionView?.frame.width)! * (2/5)
        itemWidth = (collectionView?.frame.width)! * (32/45)
        itemOffset = (collectionView?.frame.width)! * (13/90)
        
        itemSize = CGSize(width: itemWidth, height: itemHeight)
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        
        
        numberOfItems = (collectionView?.numberOfItemsInSection(0))!
        
        xOffset = -(itemWidth - itemOffset)
        
        for var i = 0; i<numberOfItems; i++ {
            let cellIndexPath = NSIndexPath(forItem: i, inSection: 0)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: cellIndexPath)
            attributes.frame = CGRect(x: xOffset + (CGFloat(i) * itemWidth), y: 0, width: itemWidth, height: itemHeight)
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
        
        return layoutAttributesInRect
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return self.layoutAttributes[indexPath] as? UICollectionViewLayoutAttributes
    }
    
    override func targetContentOffsetForProposedContentOffset(var proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
       /* if ((previousOffset > self.collectionView?.contentOffset.x) && (velocity.x < 0)) {
            self.currentPage = max(currentPage - 1, 0)
        }else if ((previousOffset < self.collectionView?.contentOffset.x) && (velocity.x > 0)) {
            self.currentPage = min(currentPage + 1, numberOfItems - 1)
        }
        
        let updatedOffset = itemWidth * CGFloat(currentPage)
        previousOffset = updatedOffset
        
        return CGPoint(x: updatedOffset, y: proposedContentOffset.y)*/
        print("proposedContentOffset proposedContentOffset: \(proposedContentOffset)")
        
        var offSetAdjustment: CGFloat = CGFloat(MAXFLOAT)
        let horizontalCenter: CGFloat = proposedContentOffset.x + ((collectionView?.frame.width)! / 2)
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: (collectionView?.frame.width)!, height: (collectionView?.frame.height)!)
        
        let attributes = layoutAttributesForElementsInRect(targetRect)
        
        var currentAttributes =  UICollectionViewLayoutAttributes()
        
        for attr in  attributes! {
            
            if attr.representedElementCategory == UICollectionElementCategory.Cell {
                let itemHorizontalCenter = attr.center.x
                
                if (abs(itemHorizontalCenter - horizontalCenter) < abs(offSetAdjustment)) {
                    currentAttributes = attr
                    offSetAdjustment = itemHorizontalCenter - horizontalCenter
                }
            }
        }
        
        let nextOffset = proposedContentOffset.x + offSetAdjustment
        proposedContentOffset.x = nextOffset
        
        
        let deltaX = proposedContentOffset.x - self.collectionView!.contentOffset.x
        let velX = velocity.x
        
        if(deltaX == 0.0 || velX == 0 || (velX > 0.0 && deltaX > 0.0) || (velX < 0.0 && deltaX < 0.0)) {
            
        }else if(velocity.x > 0.0) {
            for attr in  attributes! {
                if attr.representedElementCategory == UICollectionElementCategory.Cell {
                    let itemHorizontalCenter = attr.center.x
                    if (itemHorizontalCenter > proposedContentOffset.x) {
                        proposedContentOffset.x = nextOffset + (currentAttributes.frame.width / 2) + (attr.frame.size.width / 2)
                        break
                    }
                }
            }
        }else if(velocity.x < 0.0) {
            for attr in  attributes! {
                if attr.representedElementCategory == UICollectionElementCategory.Cell {
                    let itemHorizontalCenter = attr.center.x
                    if (itemHorizontalCenter > proposedContentOffset.x) {
                        proposedContentOffset.x = nextOffset - (currentAttributes.frame.width / 2) + (attr.frame.size.width / 2)
                        break
                    }
                }
            }
        }
        
        proposedContentOffset.y = 0
        
        print("proposedContentOffset: \(proposedContentOffset)")
        
        let xOffset = (itemWidth * CGFloat(numberOfItems - 2)) - itemOffset
        
        if proposedContentOffset.x > xOffset {
          // proposedContentOffset.x = 0
        }
        
        return proposedContentOffset
    }
    
    override func collectionViewContentSize() -> CGSize {
        var size = super.collectionViewContentSize()
        size.width = CGFloat(numberOfItems) * itemWidth
        return size
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
