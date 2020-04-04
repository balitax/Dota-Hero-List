////
////  MovieStorage.swift
////  BisaMovie
////
////  Created by Agus Cahyono on 22/02/20.
////  Copyright © 2020 Agus Cahyono. All rights reserved.
////
//
//import RealmSwift
//
//class MovieStorage: Object {
//    
//    @objc dynamic var keyId: Int = -1
//    @objc dynamic var posterPath: String?
//    @objc dynamic var backdropPath: String?
//    @objc dynamic var id: Int = 0
//    @objc dynamic var title: String?
//    @objc dynamic var overview: String?
//    @objc dynamic var releaseDate: String?
//    
//    override static func primaryKey() -> String? {
//        return "keyId"
//    }
//    
//    func incrementID() -> Int {
//        let realm = try! Realm()
//        return (realm.objects(MovieStorage.self).max(ofProperty: "keyId") as Int? ?? 0) + 1
//    }
//    
//}
