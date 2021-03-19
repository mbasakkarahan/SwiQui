//
//  Sorular.swift
//  SwiQui
//
//  Created by derin on 4.01.2021.
//

import Foundation

class Sorular:Equatable,Hashable{
    var soru_id:Int?
    var seviye:Int?
    var soru:String?
    var cevap:Cevaplar?
    
    init(){
        
    }
    
    init(soru_id:Int,seviye:Int,soru:String,cevap:Cevaplar){
        self.soru = soru
        self.soru_id = soru_id
        self.seviye = seviye
        self.cevap = cevap
        }
    var hashValue: Int {
        get {
            return (cevap?.cevap_id!.hashValue)!
            
        }
    }
    static func == (lhs:Sorular,rhs:Sorular) ->Bool{
        return lhs.cevap?.cevap_id == rhs.cevap!.cevap_id
        
    }
    
}
