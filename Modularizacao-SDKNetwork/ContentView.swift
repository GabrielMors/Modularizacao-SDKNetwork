//
//  ContentView.swift
//  Modularizacao-SDKNetwork
//
//  Created by Gabriel Mors  on 26/08/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var viewModel = CategoryViewModel()
    
    init() {
        getList()
    }
    
    private func getList() {
        
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                HStack {
                    ProgressView()
                    Text(" Aguarde carregando...")
                        .font(.title2)
                        .foregroundColor(Color.gray.opacity(0.6))
                        .padding(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            } else {
                Text("Lista de categorias")
                    .font(.title)
                List {
                    ForEach(viewModel.dataSource) { source in
                        Text(source.name ?? String())
                        
                        Text(source.description ?? String())
                    }
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
