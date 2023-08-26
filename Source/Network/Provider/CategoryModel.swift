//
//  CategoryModel.swift
//  Modularizacao-SDKNetwork
//
//  Created by Gabriel Mors  on 26/08/23.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
    let name, description: String?
    let entryType, id: Int?
    let isInativo: Bool?
    let dataCriacao, dataAlteracao, uid, uidfirebase: String?
    let isChanged: Bool?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case description = "Description"
        case entryType = "EntryType"
        case id = "Id"
        case isInativo = "IsInativo"
        case dataCriacao = "DataCriacao"
        case dataAlteracao = "DataAlteracao"
        case uid = "Uid"
        case uidfirebase = "Uidfirebase"
        case isChanged = "IsChanged"
    }
}
