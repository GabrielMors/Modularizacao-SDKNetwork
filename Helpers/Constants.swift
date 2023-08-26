//
//  Constant.swift
//  Modularizacao-SDKNetwork
//
//  Created by Gabriel Mors  on 26/08/23.
//

import Foundation

struct Constants {
    static let urlBase = "http://meusgastos.codandocommoa.com.br/Api"
}

public enum HTTPRequestMethod: String {
    case get = "GET"
    case post = "POST"
}
