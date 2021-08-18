import UIKit
import Kingfisher

class SchoolGalleryViewController: UIViewController {
    
    var galleryImages = [GalleryImage]()
    
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleryCollectionView.register(SchoolGalleryCollectionViewCell.nib(), forCellWithReuseIdentifier: SchoolGalleryCollectionViewCell.identifier)
        getGalleryImages()
        
    }
    
    func getGalleryImages() {
        DispatchQueue.main.async {
            Service.getGalleryImages { [self] result in
                galleryImages.append(contentsOf: result)
                galleryCollectionView.reloadData()
            }
        }
    }
    
}

extension SchoolGalleryViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        galleryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "SchoolGalleryCollectionViewCell", for: indexPath) as! SchoolGalleryCollectionViewCell
        cell.imageView.kf.setImage(with: URL(string: galleryImages[indexPath.item].download_url))
        return cell
    }
}
