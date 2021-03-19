//
//  Cevaplar.swift
//  SwiQui
//
//  Created by derin on 4.01.2021.
//

import Foundation

class Cevaplar {
    var cevap_id:Int?
    var dogru_cevap:String?
    var secenek1:String?
    var secenek2:String?
    var secenek3:String?
   
    
    init(){
        
    }
    init(cevap_id:Int,dogru_cevap:String,secenek1:String,secenek2:String,secenek3:String){
        self.cevap_id = cevap_id
        self.dogru_cevap = dogru_cevap
        self.secenek1 = secenek1
        self.secenek2 = secenek2
        self.secenek3 = secenek3
    }
    
    
    
    
}
