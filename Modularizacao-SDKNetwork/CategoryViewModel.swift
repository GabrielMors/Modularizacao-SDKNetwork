//
//  CategoryViewModel.swift
//  Modularizacao-SDKNetwork
//
//  Created by Gabriel Mors  on 26/08/23.
//

import Foundation

class CategoryViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var dataSource = [CategoryModel]()
    
    init() {
        
        func getCategories() {
            isLoading = true
            
            let provider = CategoryProvider()
            
            provider.getListProvider(uIdFirebase: "CodandoComMoa") { result in
                switch result {
                    
                case .success(let categoriesModel):
                    self.dataSource = [categoriesModel]
                    self.isLoading = false
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    self.isLoading = false
                }
            }
        }
    }
}
