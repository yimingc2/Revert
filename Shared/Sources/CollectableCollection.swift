//
//  Copyright © 2015 Itty Bitty Apps. All rights reserved.

import Foundation

struct CollectableCollection<CollectableCollectionObject: Collectable>: Collection {
  typealias CollectionObject = CollectableGroup<CollectableCollectionObject>

  let items: [CollectableGroup<CollectableCollectionObject>]

  init(items: RevertItems, flatten: Bool = false) {
    let items = items.data
      .map(CollectableGroup<CollectableCollectionObject>.init)
      .filter { $0.countOfItems > 0 }

    if flatten == true {
      self.items = [CollectableGroup<CollectableCollectionObject>(items: items.flatMap{ $0.items })]
    } else {
      self.items = items
    }
  }

  init(groups: [CollectableGroup<CollectableCollectionObject>]) {
    self.items = groups
  }

  subscript(indexPath: NSIndexPath) -> CollectableCollectionObject {
    return self[indexPath.section][indexPath.row]
  }

  typealias FilterClosure = ((CollectableCollectionObject) -> Bool)
  func filteredCollectableCollection(itemFilter: FilterClosure) -> CollectableCollection {
    let groups: [CollectableGroup<CollectableCollectionObject>] = self.items
      .map({
        let items = $0.items.filter(itemFilter)
        return CollectableGroup<CollectableCollectionObject>(title: $0.title, items: items)
      })
      // After filtering items in each group, we need to filter out empty `CollectableGroup`s.
      .filter{ $0.items.count > 0 }

    // Returns a new `CollectableCollection` with only matching items and groups containing them.
    return CollectableCollection(groups: groups)
  }

  typealias GroupFilterClosure = ((CollectableGroup<CollectableCollectionObject>) -> Bool)
  func groupFilteredCollectableCollection(groupFilter: GroupFilterClosure) -> CollectableCollection {
    return CollectableCollection(groups: self.items.filter(groupFilter))
  }
}
