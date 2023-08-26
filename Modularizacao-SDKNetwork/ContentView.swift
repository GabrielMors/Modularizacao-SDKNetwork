//
//  ContentView.swift
//  Modularizacao-SDKNetwork
//
//  Created by Gabriel Mors  on 26/08/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    let provider = CategoryProvider()
    @State var dataSource = [CategoryModel]()
    
    init() {
        getList()
    }
    
    private func getList() {
        provider.getListProvider(uIdFirebase: "CodandoComMoa") { result in
            switch result {
                
            case .success(let categoriesModel):
                self.dataSource = [categoriesModel]
                print(dataSource)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Lista de categorias")
                .font(.title)
            List {
                ForEach(dataSource) { source in
                    Text(source.name ?? String())
                    
                    Text(source.description ?? String())
                }
            }
            
        }
        .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
