//
//  Copyright (c) 2015 Itty Bitty Apps. All rights reserved.
//

import UIKit

final class ControlsDataSource: NSObject, UICollectionViewDataSource {
  private let collection: CollectableCollection<Item>
  private let cellConfigurator: ControlCellConfigurator
  
  required init(collection: CollectableCollection<Item>, cellConfigurator: ControlCellConfigurator) {
    self.collection = collection
    self.cellConfigurator = cellConfigurator

    super.init()
  }
  
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return self.collection.countOfItems
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.collection[section].countOfItems
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let item = self.collection[indexPath]
    guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(item.cellIdentifier, forIndexPath: indexPath) as? CollectionViewCell else {
      fatalError("Expecting to dequeue a CollectionViewCell from the UICollectionView")
    }
    
    self.cellConfigurator.configureCell(cell)
    return cell
  }
}