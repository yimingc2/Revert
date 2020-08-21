// Copyright © 2020 Itty Bitty Apps. All rights reserved.

import Foundation

final class DynamicColourViewController: RevertTableViewController {

  private let collection: [ColourSection] = RevertItems.coloursData

  @IBOutlet var segmentedControl: UISegmentedControl!

  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.setToolbarHidden(false, animated: true)
    setToolbarItems([UIBarButtonItem(customView: segmentedControl)], animated: false)

    super.viewWillAppear(animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)

    self.navigationController?.setToolbarHidden(true, animated: true)
  }

  @available(iOS 13, *)
  @IBAction func onSegmentValueChanged(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      overrideUserInterfaceStyle = .unspecified
    case 1:
      overrideUserInterfaceStyle = .light
    case 2:
      overrideUserInterfaceStyle = .dark
    default:
      break
    }
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    if #available(iOS 13, *), traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
      tableView.reloadData()
    }
  }

}

extension DynamicColourViewController {

  override func numberOfSections(in tableView: UITableView) -> Int {
      collection.count
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      collection[section].rows.count
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      collection[section].title
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewControllerCell") as? DynamicColourCell else {
      fatalError("Unknown cellIdentifier or cell")
    }

    cell.setupCell(with: collection[indexPath.section].rows[indexPath.row])

    return cell
  }
}
