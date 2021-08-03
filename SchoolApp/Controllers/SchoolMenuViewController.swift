import UIKit

class SchoolMenuViewController: UIViewController{
    
    @IBOutlet weak var ppButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let defaults = UserDefaults.standard
    var menuItemList = [MenuItems]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SchoolMenuCollectionViewCell.nib(), forCellWithReuseIdentifier: SchoolMenuCollectionViewCell.identifier)
        self.menuItemList = Service.loadMenuItems()
        conf()
    }
    
    func conf() {
        ppButton.layer.cornerRadius = ppButton.frame.height/2
        ppButton.layer.masksToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        getWallpaperInUserDefaults()
        
    }
    
    @IBAction func ppClick(_ sender: Any) {
        navigationController?.isNavigationBarHidden = false
        performSegue(withIdentifier: "ProfileSegue", sender: nil)
    }
    
    @IBAction func attendanceClick(_ sender: Any) {
        navigationController?.isNavigationBarHidden = false
        performSegue(withIdentifier: "AttendanceSegue", sender: nil)
    }
    
    @IBAction func feesDueClick(_ sender: Any) {
    }
    
    func getWallpaperInUserDefaults() {
        if defaults.value(forKey: "key") != nil {
            let imageData = UserDefaults.standard.value(forKey: "key") as! Data
            let imageFromData = UIImage(data: imageData)!
            ppButton.setImage(imageFromData, for: .normal)
        }
    }
    
}

extension SchoolMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SchoolMenuCollectionViewCell", for: indexPath) as! SchoolMenuCollectionViewCell
        cell.menuItemLabel.text = menuItemList[indexPath.row].label
        cell.menuItemImage.image = menuItemList[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.isNavigationBarHidden = false
        performSegue(withIdentifier: menuItemList[indexPath.row].segue, sender: nil)
    }
    
}
