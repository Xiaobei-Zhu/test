//
//  LandMarkDetail.swift
//  LandMark
//
//  Created by Xiaobei Zhu on 2021/9/6.
//

import SwiftUI

struct LandMarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landMark: LandMark
    var landmarkIndex: Int {
        modelData.landMark.firstIndex(where: { $0.id == landMark.id })!
    }

    var body: some View {
        VStack {
            MapView(coordinate: landMark.locationCoordinates)
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)

             CircleImage(image: landMark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack{
                    Text(landMark.name)
                        .font(.title)
                        .foregroundColor(.black)
                    FavoriteButton(isSet: $modelData.landMark[landmarkIndex].isFavorite)
                }
        
                HStack {
                    Text(landMark.park)
                        .font(.subheadline)

                    Spacer()

                    Text(landMark.state)
                        .font(.subheadline)

                }
    
                Divider()

                Text("About \(landMark.name)")
                    .font(.title2)
                Text(landMark.description)
            }
            .padding()
        }
        .navigationTitle(landMark.name)
       .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandMarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LandMarkDetail(landMark: modelData.landMark[0])
            .environmentObject(modelData)
    }
}
