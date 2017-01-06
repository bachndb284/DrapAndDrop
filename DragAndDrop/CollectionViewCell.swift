//
//  CollectionViewCell.swift
//  DragAndDrop
//
//  Created by Nguyen Bach on 1/6/17.
//  Copyright © 2017 Nguyen Bach. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
       func image(image: UIImage)  {
        self.imageView.image = image
    }
    var snapshot :UIView{
        let snapshot: UIView = self.snapshotView(afterScreenUpdates: true)!
        let layer: CALayer = snapshot.layer
        layer.masksToBounds = false
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -4.0, height: 0.0)
        return snapshot
    }
    
    var isMoving :Bool = false{
        didSet{
            imageView.alpha = isMoving ? 0.0:1.0
            self.backgroundColor = isMoving ? UIColor.clear: UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        }
    }
    
    
}
