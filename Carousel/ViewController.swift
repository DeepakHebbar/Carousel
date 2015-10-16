//
//  ViewController.swift
//  Carousel
//
//  Created by Deepak Kumar on 14/10/2015.
//  Copyright © 2015 Deepak Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var dataCollectionView: UICollectionView!
    
    let stockImages = [UIImage(named: "back"),UIImage(named: "balcony"),UIImage(named: "birds")]

    var totalObjects: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataCollectionView.showsHorizontalScrollIndicator = false
        dataCollectionView.pagingEnabled = false
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.width), height: 320)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .Horizontal
        dataCollectionView.collectionViewLayout = layout
        
//        let layout = PMCenteredCollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: view.frame.width, height: 320)
//        layout.scrollDirection = .Horizontal
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 50
//        dataCollectionView.collectionViewLayout = layout
        
//        dataCollectionView = PMCenteredCircularCollectionView(frame: view.frame, collectionViewLayout: layout)
//        dataCollectionView.showsHorizontalScrollIndicator = false
//        dataCollectionView.pagingEnabled = false
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var data = stockImages
        
        let firstItem = stockImages.first
        let lastItem = stockImages.last
        
        data.insert(lastItem!, atIndex: 0)
        data.append(firstItem!)
        
        totalObjects = stockImages.count * 3
        
        return totalObjects!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCollectionViewCell
        
        cell.imageView.image = self.stockImages[indexPath.item % self.stockImages.count]
        cell.textLabel.text = ""//"Image \(indexPath.row)"
        
        return cell
    }
    
  /*  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let multiplier = ((dataCollectionView?.frame.size.width)!/8) * 8
        
        
        /*var offset = dataCollectionView.contentOffset
        let width = dataCollectionView.bounds.width
        
        offset.x = floor(offset.x / width + 0.5) * width
        dataCollectionView.setContentOffset(offset, animated: false)
        
        */
        
        let offset = dataCollectionView.contentOffset.x
        let width = dataCollectionView.bounds.width
        
        let idx = floor (offset/width + 0.5)
        let index = idx % CGFloat(totalObjects!)
        print(index)
        
       /* let bounds = dataCollectionView.bounds

        
        let l = multiplier * CGFloat(index) - 0.5 * multiplier + bounds.origin.x
        let h = multiplier * CGFloat(index) + 0.5 * multiplier + bounds.origin.x
        
        print(l)
        print(h)
        print(dataCollectionView.contentOffset.x)
        
        if (l > dataCollectionView.contentOffset.x || h < dataCollectionView.contentOffset.x) {
            dataCollectionView.setContentOffset(CGPoint(x: multiplier * CGFloat(index), y: 0), animated: false)
        }*/
        
        
        
        let contentOffsetWhenFullyScrolledRight = ((multiplier) * (CGFloat(totalObjects!) - 1))
        
        print(contentOffsetWhenFullyScrolledRight)
        print(dataCollectionView.contentOffset.x)
        
        if scrollView.contentOffset.x == contentOffsetWhenFullyScrolledRight {
            let indexPath = NSIndexPath(forRow: 1, inSection: 0)
            
            dataCollectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: false)
        }else if scrollView.contentOffset.x == 0 {
            let indexPath = NSIndexPath(forRow: totalObjects!-2, inSection: 0)
            
            dataCollectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: false)
        }
     
        
        
    }*/


}

