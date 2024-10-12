//
//  FeedViewController.swift
//  FotografPaylamaUygulamasi
//
//  Created by Samet on 8.10.2024.
//

import UIKit
import FirebaseFirestore
import SDWebImage

class FeedViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var PostDizisi = [Post]()
    
    /*
    var emailDizisi = [String]()
    var yorumDizisi = [String]()
    var gorselDizisi = [String]()
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        firebaseVerileriAl()
        
    }
    func firebaseVerileriAl(){
        let firestoreDatabase = Firestore.firestore()
         
        firestoreDatabase.collection("Post").order(by: "Tarih : ", descending: true)
            .addSnapshotListener{ (snapShot , error ) in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                if snapShot?.isEmpty != true && snapShot != nil {
                    
                 //   self.emailDizisi.removeAll(keepingCapacity: false)
                   // self.gorselDizisi.removeAll(keepingCapacity: false)
                     // self.yorumDizisi.removeAll(keepingCapacity: false)
                    
                    self.PostDizisi.removeAll(keepingCapacity: false)
                    
                    for document in snapShot!.documents {
                     //   let documentID = document.documentID
                    
                        if let gorselUrl = document.get("gorselurl") as? String {
                            if let yorum = document.get("yorum") as? String {
                                if let email = document.get("email") as? String {
                                   
                                    let post = Post(email: email, yorum: yorum, gorsel: gorselUrl)
                                    self.PostDizisi.append(post)
                                }
                            }
                           
                        }
                       
                        
                    }
                    self.tableView.reloadData()
                }
            }

        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return PostDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        
        
        cell.emailLabel.text = PostDizisi[indexPath.row].email
        cell.yorumLabel.text = PostDizisi[indexPath.row].yorum
        
        cell.PostImageView.sd_setImage(with: URL(string: self.PostDizisi[indexPath.row].gorselurl))
        
        
        return cell
    }
    

    

}
