//
//  CategoryRow.swift
//  LandMark
//
//  Created by Xiaobei Zhu on 2021/9/7.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [LandMark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink(destination: LandMarkDetail(landMark: landmark)) {
                            CategoryItem(landMark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landMark = ModelData().landMark
    static var previews: some View {
        CategoryRow(
            categoryName: landMark[0].category.rawValue,
            items: Array(landMark.prefix(4))
        )
    }
}
