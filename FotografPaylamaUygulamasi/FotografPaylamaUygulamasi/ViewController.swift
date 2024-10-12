//
//  ViewController.swift
//  FotografPaylamaUygulamasi
//
//  Created by Samet on 8.10.2024.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
  
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sifreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func girisTiklandi(_ sender: Any) {
        
        if emailTextField.text != "" && sifreTextField.text != "" {
            // Giriş yapma işlemi
            Auth.auth().signIn(withEmail: emailTextField.text!, password: sifreTextField.text!) {(authdataresult, error) in
                if error != nil {
                    self.hataMesajiGoster(tittle: "HATA", message: error?.localizedDescription ?? "Lütfen tekrar deneyiniz." )
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            self.hataMesajiGoster(tittle: "Hata", message: "Kullanıcı adı ve şifre giriniz")
        }
        
    }
    
    @IBAction func kayitOlTiklandi(_ sender: Any) {
        
        if emailTextField.text != "" && sifreTextField.text != "" {
            //Kayıt olma işlemi
            Auth.auth().createUser(withEmail: emailTextField.text!, password: sifreTextField.text!) {
                (authdataresult, error) in
                if error != nil {
                    self.hataMesajiGoster(tittle: "Hata", message: error?.localizedDescription ?? "HATA.Lütfen tekrar deneyiniz")
                }
                else {
                    self.performSegue(withIdentifier:"toFeedVC" , sender: nil)
                }
                
            }
        }else{
            hataMesajiGoster(tittle: "Hata ", message: "Hata oluştu.Kullaıcı adı ve şifre boş bırakılamaz.")
        }
    }
    func hataMesajiGoster( tittle: String, message: String ) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction (okButton)
        present(alert, animated: true, completion: nil)
        
        
    }
}

