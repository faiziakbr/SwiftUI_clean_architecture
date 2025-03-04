//
//  ProductDetail.swift
//  CleanArchitecture
//
//  Created by Faizan Akbar on 04/03/2025.
//

import SwiftUI

struct ProductDetail: View {
    let product: ProductItemEntity
    @Environment(\.presentationMode) var presentationMode
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .imageScale(.large)
                    Text("Back")
                        .foregroundColor(.black)
                }
                .padding()
                Spacer()
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    TabView(selection: $currentIndex) {
                        ForEach(Array(product.images.enumerated()), id: \..0) { index, imageUrl in
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image.resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ZStack {
                                    Color.black
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                }
                            }
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(maxWidth: .infinity, idealHeight: 200)
                    
                    Text(product.title)
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                    
                    Text(product.description)
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("Price: \(String(format: "%.2f", product.price))")
                            .font(.headline)
                        
                        Spacer()
                        
                        Text("Discount: \(String(format: "%.1f", product.discountPercentage))%")
                            .font(.subheadline)
                            .foregroundColor(.red)
                    }
                    
                    Text("Rating: \(String(format: "%.1f", product.rating))/5")
                        .font(.subheadline)
                        .foregroundColor(.yellow)
                    
                    if let brand = product.brand {
                        Text("Brand: \(brand)")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    
                    Text("Stock: \(product.stock)")
                        .font(.subheadline)
                        .foregroundColor(product.stock > 0 ? .green : .red)
                    
                    Text("SKU: \(product.sku)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Text("Weight: \(product.weight)g")
                        .font(.footnote)
                    
                    Text("Minimum Order Quantity: \(product.minimumOrderQuantity)")
                        .font(.footnote)
                        .foregroundColor(.purple)
                    
                    Text("Shipping Information: \(product.shippingInformation)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Text("Warranty: \(product.warrantyInformation)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    // Tags
                    if !product.tags.isEmpty {
                        Text("Tags: ")
                            .font(.footnote)
                            .bold()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(product.tags, id: \..self) { tag in
                                    Text(tag)
                                        .font(.caption)
                                        .padding(8)
                                        .background(Color.blue.opacity(0.2))
                                        .cornerRadius(5)
                                }
                            }
                        }
                    }
                }
                
                .padding()
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationTitle(product.title)
        .toolbar(.hidden)
    }
}
