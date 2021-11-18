//
//  LandMarkList.swift
//  LandMark
//
//  Created by Xiaobei Zhu on 2021/9/6.
//

import SwiftUI

struct LandMarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false

    var filteredLandMarks: [LandMark] {
        modelData.landMark.filter { landMark1 in
            (!showFavoritesOnly || landMark1.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filteredLandMarks) { landMark in
                    NavigationLink(destination: LandMarkDetail(landMark: landMark)) {
                        LandMarkRow (landMark: landMark)
                    }
                }
            }
            .navigationTitle("LandMarks")
        }
    }
}

struct LandMarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkList()
            .environmentObject(ModelData())
    }
}
