
import UIKit

class VenueDetailCollectionViewDataSource : NSObject, UICollectionViewDataSource {
    
    var venue: VenueViewModel? {
        didSet {
            configureCellsForVenue()
        }
    }
    private var cells: [DetailCellType] = []
    
    func registerCells(collectionView: UICollectionView) {
        DetailCellType.all.forEach { $0.registerCells(forCollectionView: collectionView) }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let _ = venue else {
            return 0
        }
        
        return cells.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cellType = cells[indexPath.item]
        let cell = cellType.cell(forCollectionView: collectionView, indexPath: indexPath)
        
        cell.configure(withVenue: venue!)
        
        return cell as! UICollectionViewCell
    }
    
    func cellTypeAtIndexPath(indexPath: NSIndexPath) -> DetailCellType {
        return cells[indexPath.item]
    }
    
    private func configureCellsForVenue() {
        guard let _ = venue else {
            return
        }
        
        cells = [.Gallery, .Actions]
    }
}