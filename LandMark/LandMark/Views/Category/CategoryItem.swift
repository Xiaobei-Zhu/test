//
//  CategoryItem.swift
//  LandMark
//
//  Created by Xiaobei Zhu on 2021/9/7.
//

import SwiftUI

struct CategoryItem: View {
    var landMark:LandMark
    var body: some View {
        VStack(alignment: .leading) {
            landMark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landMark.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading, 15)

    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landMark: ModelData().landMark[0])
    }
}
