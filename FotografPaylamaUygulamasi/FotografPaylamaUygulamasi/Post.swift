//
//  Post.swift
//  FotografPaylamaUygulamasi
//
//  Created by Samet on 11.10.2024.
//

import Foundation

class Post {
   
   var  email : String = ""
   var  yorum : String = ""
   var  gorselurl : String = ""
    
   init(email: String, yorum: String, gorsel: String) {
        self.email = email
        self.yorum = yorum
       self.gorselurl = gorsel
       
    }
    
}
