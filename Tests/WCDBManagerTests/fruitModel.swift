//
//  fruitModel.swift
//  WCDBManager
//
//  Created by jMac on 2025/11/13.
//
import UIKit
import WCDBSwift

final class fruitModel: TableCodable {
    var name: String?
    var price: Double?
    var quality: Double?
    var id: Int
    var total: Double?

    init(name: String? = nil, price: Double? = nil, quality: Double? = nil, id: Int, total: Double? = nil) {
        self.name = name
        self.price = price
        self.quality = quality
        self.id = id
        self.total = total
    }

    convenience init() {
        self.init(name: nil, price: nil, quality: nil, id: 1)
    }

    enum CodingKeys: String, CodingTableKey {
        typealias Root = fruitModel

        case name
        case price
        case quality
        case id
        case total
        static let objectRelationalMapping = TableBinding(CodingKeys.self) {
            BindColumnConstraint(id, isPrimary: true, isAutoIncrement: true, enableAutoIncrementForExistingTable: true, isUnique: true)
            BindColumnConstraint(name, isNotNull: false, isUnique: false)
            BindColumnConstraint(price, isNotNull: false, isUnique: false)
            BindColumnConstraint(quality, isNotNull: false, isUnique: false)
            BindColumnConstraint(total, isNotNull: false, isUnique: false)
        }
    }

    var isAutoIncrement: Bool = true // 用于定义是否使用自增的方式插入
    var lastInsertedRowID: Int64 = 0 // 用于获取自增插入后的主键值
}
