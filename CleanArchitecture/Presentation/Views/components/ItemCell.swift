//
//  ItemCell.swift
//  CleanArchitecture
//
//  Created by Faizan Akbar on 03/03/2025.
//

import SwiftUI
import Kingfisher

struct ItemCell: View {
    
    var productItem: ProductItemEntity
    
    var body: some View {
        return VStack(alignment: .leading) {
            KFImage(URL(string: productItem.thumbnail))
                .placeholder {
                    ProgressView() // Show loader while loading
                                           .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .onFailure { error in
                    print("Image failed to load: \(error.localizedDescription)")
                }
                .resizable()
                .aspectRatio(contentMode: .fit) // or .fill if you want to fill space
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(maxWidth: .infinity, maxHeight: 200)
            
            
            Text(productItem.title)
                .font(.title)
                .foregroundColor(.black)
                .bold()
            
            Text(productItem.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .bold()
            
            
            HStack {
                Text("Price: \(String(format: "%.2f", productItem.price))")
                    .font(.headline)
                
                Spacer()
                
                Text("Discount: \(String(format: "%.1f", productItem.discountPercentage))%")
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    ItemCell(productItem: ProductItemEntity(id: 1, title: "title", description: "some des dsaml dsak dka dnksnd kasnd k andknakjdasnd a ndsa nkdsna kdnadn lskn ksla njksda nkdsa ndsk andks adjk sa dnskja dsajk ndsjka nds anad ks", price: 11.0, discountPercentage: 22.0, rating: 22, stock: 3, tags: ["cheap", "work"], brand: "ss", sku: "dd", weight: 3, warrantyInformation: "v", shippingInformation: "fds", minimumOrderQuantity: 3, images: ["dsa", "as"], thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"))
}
