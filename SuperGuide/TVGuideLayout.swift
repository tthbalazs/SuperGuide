//
//  TVGuideLayout.swift
//  SuperGuide
//
//  Created by Tóth Balázs on 2017. 04. 04..
//  Copyright © 2017. Tóth Balázs. All rights reserved.
//

import Foundation
import UIKit

final class TVGuideLayout: UICollectionViewFlowLayout {
    
    let width = 200
    let height = 60
    
    var contentSize = CGSize.zero
    var cellAttributesCache: [IndexPath: UICollectionViewLayoutAttributes] = [:]
    
    var maxWidth = 0
    
    override var collectionViewContentSize: CGSize {
        guard
            let collectionView = collectionView else {
                return .zero
        }
        
        return CGSize(width: maxWidth * width, height: collectionView.numberOfSections * height)
    }
    
    override func prepare() {
        guard
            let collectionView = collectionView,
            collectionView.numberOfSections > 0 else {
                return
        }
        
        for section in 0..<collectionView.numberOfSections {
            guard
                collectionView.numberOfItems(inSection: section) > 0 else {
                    continue
            }
            
            for item in 0..<collectionView.numberOfItems(inSection: section) {
                
                if item > maxWidth {
                    maxWidth = item
                }
                
                let indexPath = IndexPath(item: item, section: section)
                let x = item * width
                let y = section * height
                
                let cellAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                cellAttributes.frame = CGRect(x: x, y: y, width: width, height: height)
                cellAttributes.zIndex = 1
                
                cellAttributesCache[indexPath] = cellAttributes
            }
        }
        
        super.prepare()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cellAttributesCache.filter({ (key: IndexPath, value: UICollectionViewLayoutAttributes) -> Bool in
            return value.frame.intersects(rect)
        }).map { $0.value }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cellAttributesCache[indexPath]
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
