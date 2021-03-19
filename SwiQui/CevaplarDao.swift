//
//  CevaplarDao.swift
//  SwiQui
//
//  Created by derin on 4.01.2021.
//

import Foundation

class CevaplarDao{
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("quizdb.db")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
}
