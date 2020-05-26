
import UIKit

class CategoriesBGCVCell: UICollectionViewCell {
    
    @IBOutlet weak var bgRoundView: UIView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    
    var defaultColor: UIColor?
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                configureSelectedCell()
            } else {
                configureDeselectedCell()
            }
        }
    }
    
    class var identifier: String {
        return "categiruesVFCVCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(text: String, color: UIColor) {
        categoryNameLbl.text = text
        categoryNameLbl.textColor = .white
        bgRoundView.backgroundColor = color
        bgRoundView.layer.cornerRadius = 15
        defaultColor = color
    }
    
    func configureSelectedCell() {
        bgRoundView.backgroundColor = .systemBlue
    }
    
    func configureDeselectedCell() {
        bgRoundView.backgroundColor = defaultColor
    }

}
