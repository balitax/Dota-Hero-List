//
//  Databaseable.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

protocol Databaseable: class {
    static var shared: Database { get }
    
    var database: Realm? { get }
    
    func get<T: Object>(type: T.Type) -> Results<T>?
    func get<T: Object, K>(type: T.Type, key: K) -> T?
    func rxget<T: Object>(type: T.Type, predicate: String?) -> Single<Results<T>>
    func rxget<T: Object, K>(type: T.Type, key: K) -> Single<T>
    
    func save(object: Object, update: Bool)
    func save<S: Sequence>(objects: S) where S.Iterator.Element: Object
    func rxsave<T: Object>(object: T) -> Single<T>
    func rxsave<S: Sequence>(objects: S) -> Single<S> where S.Iterator.Element: Object
    
    func delete(object: Object)
    func delete<S>(objects: S) where S : Sequence, S.Element : Object
    func rxdelete<T: Object>(object: T) -> Single<T>
    func rxdelete<S>(objects: S) -> Single<S> where S : Sequence, S.Element : Object
    func deleteAll()
}

enum DatabaseError: Error {
    case emptyObject
}

extension DatabaseError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emptyObject:
            return NSLocalizedString("Failed to find object reference!", comment: "Object Reference Error")
        }
    }
}

open class Database: Databaseable {
    static var shared: Database = Database()
    let currentSchema: UInt64 = 1
    var database: Realm?
    
    private init() {
        database = try! Realm()
    }
    
    func migrationDatabase(migration: Migration, oldShema: UInt64) {
        if oldShema < 1 {
            migrateFrom0To1(with: migration)
        }
    }
    
    func migrateFrom0To1(with migration: Migration) {
        // Add an isInactive property on StorageContact and StorageMessagedContact
        
    }
    
    func deleteAll() {
        guard let database = database else {
            debugPrint("instance not available")
            return
        }
        
        do {
            try database.write {
                database.deleteAll()
            }
        } catch(let e) {
            debugPrint(e.localizedDescription)
        }
    }

    func get<T>(type: T.Type) -> Results<T>? where T : Object {
        guard let database = database else {
            debugPrint("instance not available")
            return nil
        }
        
        return database.objects(type)
    }
    
    func get<T, K>(type: T.Type, key: K) -> T? where T : Object {
        guard let database = database else {
            debugPrint("instance not available")
            return nil
        }
        
        return database.object(ofType: type, forPrimaryKey: key)
    }
    
    func rxget<T>(type: T.Type, predicate: String? = "") -> Single<Results<T>> where T : Object {
        return Single<Results<T>>.create(subscribe: { [unowned self] (emitter) -> Disposable in
            guard let database = self.database else {
                debugPrint("instance not available")
                emitter(.error(DatabaseError.emptyObject))
                return Disposables.create()
            }
            let results = database.objects(type).filter(predicate ?? "")
            emitter(.success(results))
            return Disposables.create()
        })
    }
    
    func rxget<T, K>(type: T.Type, key: K) -> Single<T> where T : Object {
        return Single<T>.create(subscribe: { [unowned self] (emitter) -> Disposable in
            guard let database = self.database else {
                debugPrint("instance not available")
                emitter(.error(DatabaseError.emptyObject))
                return Disposables.create()
            }
            
            if let object = database.object(ofType: type, forPrimaryKey: key) {
                emitter(.success(object))
            } else {
                emitter(.error(DatabaseError.emptyObject))
            }
            return Disposables.create()
        })
    }
    
    func save(object: Object, update: Bool = false) {
        guard let database = database else {
            debugPrint("instance not available")
            return
        }
        
        do {
            try database.write {
                debugPrint(object.description)
                if update {
                    database.add(object, update: .modified)
                } else {
                    database.add(object, update: .all)
                }
            }
        } catch(let e) {
            debugPrint(e.localizedDescription)
        }
    }
    
    func save<S>(objects: S) where S : Sequence, S.Element : Object {
        guard let database = database else {
            debugPrint("instance not available")
            return
        }
        
        do {
            try database.write {
                debugPrint(Array(objects).description)
                database.add(objects, update: .all)
            }
        } catch(let e) {
            debugPrint(e.localizedDescription)
        }
    }
    
    func rxsave<T>(object: T) -> Single<T> where T : Object {
        return Single<T>.create(subscribe: { [unowned self] (emitter) -> Disposable in
            guard let database = self.database else {
                debugPrint("instance not available")
                emitter(.error(DatabaseError.emptyObject))
                return Disposables.create()
            }
            
            do {
                try database.write {
                    debugPrint(object.description)
                    database.add(object, update: .all)
                    emitter(.success(object))
                }
            } catch(let e) {
                debugPrint(e.localizedDescription)
                emitter(.error(e))
            }
            return Disposables.create()
        })
    }
    
    func rxsave<S: Sequence>(objects: S) -> Single<S> where S.Iterator.Element: Object {
        return Single<S>.create(subscribe: { (emitter) -> Disposable in
            guard let database = self.database else {
                debugPrint("instance not available")
                emitter(.error(DatabaseError.emptyObject))
                return Disposables.create()
            }
            
            do {
                try database.write {
                    debugPrint(Array(objects).description)
                    database.add(objects, update: .all)
                    emitter(.success(objects))
                }
            } catch(let e) {
                debugPrint(e.localizedDescription)
                emitter(.error(e))
            }
            return Disposables.create()
        })
    }
    
    func delete(object: Object) {
        guard let database = database else {
            debugPrint("instance not available")
            return
        }
        
        do {
            try database.write {
                debugPrint(object.description)
                database.delete(object)
            }
        } catch(let e) {
            debugPrint(e.localizedDescription)
        }
    }
    
    func delete<S>(objects: S) where S : Sequence, S.Element : Object {
        guard let database = database else {
            debugPrint("instance not available")
            return
        }
        
        do {
            try database.write {
                debugPrint(Array(objects).description)
                database.delete(objects)
            }
        } catch(let e) {
            debugPrint(e.localizedDescription)
        }
    }
    
    func rxdelete<T>(object: T) -> Single<T> where T : Object {
        return Single<T>.create(subscribe: { [unowned self] (emitter) -> Disposable in
            guard let database = self.database else {
                debugPrint("instance not available")
                emitter(.error(DatabaseError.emptyObject))
                return Disposables.create()
            }
            
            do {
                try database.write {
                    debugPrint(object.description)
                    database.delete(object)
                    emitter(.success(object))
                }
            } catch(let e) {
                debugPrint(e.localizedDescription)
                emitter(.error(e))
            }
            return Disposables.create()
        })
    }
    
    func rxdelete<S>(objects: S) -> Single<S> where S : Sequence, S.Element : Object {
        return Single<S>.create(subscribe: { [unowned self] (emitter) -> Disposable in
            guard let database = self.database else {
                debugPrint("instance not available")
                emitter(.error(DatabaseError.emptyObject))
                return Disposables.create()
            }
            
            do {
                try database.write {
                    debugPrint(Array(objects).description)
                    database.delete(objects)
                    emitter(.success(objects))
                }
            } catch(let e) {
                debugPrint(e.localizedDescription)
                emitter(.error(e))
            }
            return Disposables.create()
        })
    }
}

