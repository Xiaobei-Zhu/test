//
//  LandMarkRow.swift
//  LandMark
//
//  Created by Xiaobei Zhu on 2021/9/6.
//

import SwiftUI

struct LandMarkRow: View {
    var landMark: LandMark
    var body: some View {
        HStack {
            landMark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landMark.name)

            Spacer()

            if landMark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandMarkRow_Previews: PreviewProvider {
    static var landMark = ModelData().landMark
    static var previews: some View {
        Group {
            LandMarkRow(landMark: landMark[0])
            LandMarkRow(landMark: landMark[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
