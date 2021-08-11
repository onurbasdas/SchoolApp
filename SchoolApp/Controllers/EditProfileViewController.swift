import UIKit

class EditProfileViewController: UIViewController {
    
    
    @IBOutlet weak var pp: UIImageView!
    @IBOutlet weak var tckimlikInput: UITextField!
    @IBOutlet weak var academicyearInput: UITextField!
    @IBOutlet weak var admissionclassInput: UITextField!
    @IBOutlet weak var oldadmissionnoInput: UITextField!
    @IBOutlet weak var dateOfAdmissionInput: UITextField!
    @IBOutlet weak var parentMailIDInput: UITextField!
    @IBOutlet weak var motherNameInput: UITextField!
    @IBOutlet weak var fatherNameInput: UITextField!
    @IBOutlet weak var permanantAddressInput: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        getWallpaperInUserDefaults()
        conf()
    }
    
    func conf() {
        tckimlikInput.addBottomBorder()
        academicyearInput.addBottomBorder()
        admissionclassInput.addBottomBorder()
        oldadmissionnoInput.addBottomBorder()
        dateOfAdmissionInput.addBottomBorder()
        parentMailIDInput.addBottomBorder()
        motherNameInput.addBottomBorder()
        fatherNameInput.addBottomBorder()
        permanantAddressInput.addBottomBorder()
    }
    
    @IBAction func changePP(_ sender: Any) {
        let alert = UIAlertController(title: "Fotoğraf Seç", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Galeri", style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction.init(title: "Vazgeç", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension EditProfileViewController:  UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let pickedimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.pp.image = pickedimage
            saveWallpaperInUserDefaults(image: pickedimage)
        }
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Hata", message: "Galeriye erişim izniniz mevcut değil.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func saveWallpaperInUserDefaults(image: UIImage!) {
        let imageData = image!.jpegData(compressionQuality: 1.0)
        defaults.set(imageData, forKey: "key")
        defaults.synchronize()
    }
    
    func getWallpaperInUserDefaults() {
        if defaults.value(forKey: "key") != nil {
            let imageData = UserDefaults.standard.value(forKey: "key") as! Data
            let imageFromData = UIImage(data: imageData)!
            pp.image = imageFromData
        }
    }
    
}
