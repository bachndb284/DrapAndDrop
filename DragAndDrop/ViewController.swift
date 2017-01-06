//
//  ViewController.swift
//  DragAndDrop
//
//  Created by Nguyen Bach on 1/6/17.
//  Copyright © 2017 Nguyen Bach. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    var longPressRecognizer :UILongPressGestureRecognizer?
    var currentDrapAndDropIndexPath: NSIndexPath?
    var currentDragAndDropSnapShot : UIView?
    
    let image1 = UIImage(named: "image1")
    let image2 = UIImage(named: "image2")
    let image3 = UIImage(named: "image3")
    let image4 = UIImage(named: "image4")
    let image5 = UIImage(named: "image5")
    let image6 = UIImage(named: "image1")
    let image7 = UIImage(named: "image2")
    let image8 = UIImage(named: "image3")
    let image9 = UIImage(named: "image4")
    let image10 = UIImage(named: "image5")
    let image11 = UIImage(named: "image1")
    let image12 = UIImage(named: "image2")
    let image13 = UIImage(named: "image3")
    let image14 = UIImage(named: "image4")
    let image15 = UIImage(named: "image5")
    let image16 = UIImage(named: "image1")
    let image17 = UIImage(named: "image2")
    let image18 = UIImage(named: "image3")
    let image19 = UIImage(named: "image4")
    let image20 = UIImage(named: "image5")
    let image21 = UIImage(named: "image1")
    let image22 = UIImage(named: "image2")
    let image23 = UIImage(named: "image3")
    let image24 = UIImage(named: "image4")
    var images = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [image1!,image2!,image3!,image4!,image5!, image6!,image7!,image8!,image9!,image10!,image11!,image12!,image13!,image14!,image15!,image16!,image17!,image18!,image19!,image20!,image21!,image22!,image23!,image24!]
        collectionView.dataSource = self
        collectionView.delegate = self
        longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureRecognizerAction))
        longPressRecognizer!.isEnabled = true
        collectionView.addGestureRecognizer(longPressRecognizer!)
        
        
        
        
        
    }
    
    func longPressGestureRecognizerAction(sender: UILongPressGestureRecognizer){
        let currentLocation = sender.location(in: self.collectionView!)
        let indexPathForLocation : NSIndexPath? = self.collectionView!.indexPathForItem(at: currentLocation) as NSIndexPath?
        switch sender.state {
        case .began:
            if indexPathForLocation != nil{
                self.currentDrapAndDropIndexPath = indexPathForLocation
                let cells: CollectionViewCell? = self.collectionView.cellForItem(at: indexPathForLocation! as IndexPath) as? CollectionViewCell
                self.currentDragAndDropSnapShot = cells?.snapshot
                self.updateDragAndDropSnapshotView(alpha: 0.0, center: cells!.center, transform: CGAffineTransform.identity)
                self.collectionView.addSubview(currentDragAndDropSnapShot!)
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                  self.updateDragAndDropSnapshotView(alpha: 0.95, center: cells!.center, transform: CGAffineTransform(scaleX: 1.05, y: 1.05))
                   cells!.isMoving = true
                })
            }
        case .changed:
            currentDragAndDropSnapShot?.center = currentLocation
            if indexPathForLocation != nil{
                
                self.collectionView!.moveItem(at: self.currentDrapAndDropIndexPath! as IndexPath, to: indexPathForLocation! as IndexPath)
                self.currentDrapAndDropIndexPath = indexPathForLocation
            }
        default:
            
            if indexPathForLocation !=  nil{
         let cells: CollectionViewCell? = self.collectionView!.cellForItem(at: indexPathForLocation! as IndexPath) as? CollectionViewCell
            UIView.animate(withDuration: 0.25, animations: {() -> Void in
                self.updateDragAndDropSnapshotView(alpha: 0, center: cells!.center, transform: CGAffineTransform.identity)
                cells!.isMoving  = false
            }, completion: {(finished: Bool) -> Void in
                self.currentDragAndDropSnapShot?.removeFromSuperview()
                self.currentDragAndDropSnapShot = nil
            })
            } else{return}
        }
    }
    
    func updateDragAndDropSnapshotView(alpha: CGFloat, center: CGPoint, transform: CGAffineTransform)  {
        if currentDragAndDropSnapShot != nil{
            currentDragAndDropSnapShot?.alpha = alpha
            currentDragAndDropSnapShot?.center = center
            currentDragAndDropSnapShot?.transform = transform
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    var cells: CollectionViewCell!
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cells = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cells.imageView.image = images[indexPath.row]
        cells.backgroundColor = UIColor.red
        return cells
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

