//
//  UploadViewController.swift
//  FotografPaylamaUygulamasi
//
//  Created by Samet on 8.10.2024.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var yorumTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true
        let gesturecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        imageView.addGestureRecognizer(gesturecognizer)
        
    }
    
    @objc func gorselSec(){
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func UploadTiklandi(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5 ) {
            
            let uuid = UUID().uuidString
            
            
            let imageReferance = mediaFolder.child("\(uuid).jpeg")
            
            imageReferance.putData(data, metadata: nil) { (storeMetadata, error) in
                if error != nil {
                    self.hataMesajiGoster(title: "Hata", message: error?.localizedDescription ?? "Hata aldınız . Tekrar deneyiniz" )
                }else{
                    imageReferance.downloadURL { (url , error) in
                        if error == nil {
                            let urlString = url?.absoluteString
                            print(urlString!)
                            
                            if let imageUrl = urlString {
                                
                                let firestoreDatabase = Firestore.firestore()
                                
                                let firestorePost = ["gorselurl" : imageUrl , "yorum" : self.yorumTextField.text! ,"email" : Auth.auth().currentUser?.email as Any , "tarih" : FieldValue.serverTimestamp()]
                                
                                firestoreDatabase.collection("Post").addDocument(data: firestorePost) {
                                    (error) in
                                    if error != nil{
                                        self.hataMesajiGoster(title: "Hata", message: error?.localizedDescription ?? "Hata aldınız . Tekrar deneyiniz")
                                    }else{
                                        self.imageView.image = UIImage(named:"gorselSec" )
                                        self.yorumTextField.text = ""
                                        self.tabBarController?.selectedIndex = 0
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }
        }
    }
    func hataMesajiGoster(title : String , message : String){
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
        
    

