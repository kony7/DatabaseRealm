//
//  Momo.swift
//  DatabaseRealm
//
//  Created by SeinaKonishi on 2022/03/05.
//

import Foundation
import RealmSwift

class Memo: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var content:String = ""
}
