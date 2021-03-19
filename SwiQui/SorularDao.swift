//
//  SorularDao.swift
//  SwiQui
//
//  Created by derin on 4.01.2021.
//

import Foundation

class SorularDao{
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("quizdb.db")
        
        db = FMDatabase(path: veritabaniURL.path)
    }


    func rastgele8SoruGetir(seviye:Int) -> [Sorular]{
    var liste = [Sorular]()
    
    db?.open()
    do {
        let rs = try db!.executeQuery("SELECT * FROM sorular,cevaplar WHERE cevaplar.cevap_id = sorular.cevap_id AND seviye = ? ORDER BY RANDOM() LIMIT 8", values: [seviye])
        while rs.next(){
            let cevaplar = Cevaplar(cevap_id: Int(rs.string(forColumn: "cevap_id")!)!,
                                    dogru_cevap: rs.string(forColumn: "dogru_cevap")!,
                                    secenek1: rs.string(forColumn: "secenek1")!,
                                    secenek2: rs.string(forColumn: "secenek2")!,
                                    secenek3: rs.string(forColumn: "secenek3")!)
            print(cevaplar.dogru_cevap!)
            

            let soru = Sorular(soru_id: Int(rs.string(forColumn: "soru_id")!)!,
                               seviye: Int(rs.string(forColumn: "seviye")!)!,
                               soru: rs.string(forColumn: "soru")!,
                               cevap: cevaplar)
            print(soru.soru!)
            
            liste.append(soru)
            
        }
    } catch {
        print(error.localizedDescription)
    }
    
    db?.close()
    print(liste)
    return liste
    
}
}
