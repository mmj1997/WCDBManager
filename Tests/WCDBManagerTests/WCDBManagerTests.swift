import Foundation
import Testing
@testable import WCDBManager

@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                     .userDomainMask,
                                                     true).last! + "/Test/Test.db"
    print(dbPath)
    let dbm = WCDBManager.share
    dbm.createDataBase()
    dbm.createTable(table: "fruitModel", of: fruitModel.self)
    let fruit = fruitModel()
    fruit.name = "apple"
    fruit.price = 3.5
    fruit.quality = 2.99
    fruit.total = 3.5 * 2.99

    dbm.insert(objects: [fruit], intoTable: "fruitModel")
    let a: [fruitModel]? = dbm.getObjects(on: fruitModel.Properties.all, fromTable: "fruitModel")
    a?.forEach { m in
        print(m.name)
        print(m.quality)
    }
}

@Test func exampleA() {
    print("abc")
}
