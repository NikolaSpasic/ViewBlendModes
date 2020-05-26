
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    var blendModes = ["Normal", "Multiply", "Screen", "Overlay", "Darken", "Soft Light", "Color", "Difference", "Hard Light", "Exclusion"]
    var selectedView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName:"CategoriesBGCVCell", bundle: nil), forCellWithReuseIdentifier: CategoriesBGCVCell.identifier)

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let bottomTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        let topTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        topView.addGestureRecognizer(topTapGestureRecognizer)
        bottomView.addGestureRecognizer(bottomTapGestureRecognizer)
        
        bottomView.layer.cornerRadius = 15
        bottomView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        topView.layer.cornerRadius = 15
        topView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        blendModes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesBGCVCell.identifier, for: indexPath) as! CategoriesBGCVCell
        cell.configure(text: blendModes[indexPath.item], color: .darkGray)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch blendModes[indexPath.item] {
        case "Normal":
            selectedView?.layer.compositingFilter = nil
        case "Multiply":
            selectedView?.layer.compositingFilter = "multiplyBlendMode"
        case "Screen":
            selectedView?.layer.compositingFilter = "screenBlendMode"
        case "Overlay":
            selectedView?.layer.compositingFilter = "overlayBlendMode"
        case "Darken":
            selectedView?.layer.compositingFilter = "darkenBlendMode"
        case "Soft Light":
            selectedView?.layer.compositingFilter = "softLightBlendMode"
        case "Color":
            selectedView?.layer.compositingFilter = "colorBlendMode"
        case "Difference":
            selectedView?.layer.compositingFilter = "differenceBlendMode"
        case "Hard Light":
            selectedView?.layer.compositingFilter = "hardLightBlendMode"
        case "Exclusion":
            selectedView?.layer.compositingFilter = "exclusionBlendMode"
        default:
            print("default")
        }
    }
    
    @objc func viewTapped(sender: UITapGestureRecognizer) {
        selectedView = sender.view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 30)
    }
}

