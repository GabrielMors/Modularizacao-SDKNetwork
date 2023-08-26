//
//  CategoryProvider.swift
//  Modularizacao-SDKNetwork
//
//  Created by Gabriel Mors  on 26/08/23.
//

import Foundation

class CategoryProvider {
    
    init() {
        
    }
    
    public func getListProvider(uIdFirebase: String, completionHandler: @escaping (Result<CategoryModel, Error>) -> Void) {
        
        let urlString = "\(Constants.urlBase)/Category/GetListaCategory?uIdFirebase=\(uIdFirebase)"
        debugPrint(urlString)
        
        guard let url = URL(string: urlString) else { return }
        
        var UrlRequest = URLRequest(url: url)
        UrlRequest.httpMethod = HTTPRequestMethod.get.rawValue
        
        let task = URLSession.shared.dataTask(with: UrlRequest) { data, response, error in
            do {
                if let error {
                    completionHandler(.failure(error))
                }
                
                if let data {
                    let dataString = String(data: data, encoding: .utf8) ?? String(data: data, encoding: .isoLatin1)
                    debugPrint(dataString as Any)
                    
                    if let jsonData = dataString?.data(using: .utf8) ?? String(data: data, encoding: .isoLatin1){
                        if jsonData.isEmpty {
                            completionHandler(.success([CategoryModel]()))
                        } else {
                            let result = try JSONDecoder().decode([CategoryModel].self, from: jsonData)
                            completionHandler(.success(result))
                        }
                    }
                    
                }
            } catch let error as NSError{
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
}
