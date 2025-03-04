//
//  HomeView.swift
//  CleanArchitecture
//
//  Created by Faizan Akbar on 03/03/2025.
//

import SwiftUI

struct HomeView: View {
        
    @StateObject var viewModel = ProductViewModel()
    
    var body: some View {
        return VStack {
            Text("Home")
                .font(.title)
                .foregroundColor(.black)
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.filteredProducts.indices, id: \.self) { index in
                        let product = viewModel.filteredProducts[index]
                        NavigationLink(destination: ProductDetail(product: product)) {
                            ItemCell(productItem: product)
                                .onAppear {
                                    if index == viewModel.filteredProducts.count - 1 {
                                        viewModel.fetchProducts()
                                    }
                                }
                        }
                        
                    }
                    if viewModel.isLoading {
                        ProgressView()
                    }
                }
            }
            .padding(8.0)
        }
        .background(Color.white)
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}

#Preview {
    HomeView()
}
