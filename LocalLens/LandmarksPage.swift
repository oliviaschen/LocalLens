//
//  LandmarksPage.swift
//  LocalLens
//
//  Created by Scholar on 8/12/25.
//

import SwiftUI

// MARK: - Landmark Model
struct Landmark: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let category: String
    let priceLevel: Int // 0 = free, 1 = $, 2 = $$, 3 = $$$
    var isFavorite: Bool = false
}

// MARK: - Landmarks Page View
struct LandmarksPage: View {
    @State private var selectedFilter: String = "All"
    @State private var landmarks: [Landmark] = [
        Landmark(name: "Golden Gate Bridge", imageName: "GGBridge", category: "Touristy", priceLevel: 0),
        Landmark(name: "Fisherman's Wharf", imageName: "FishermansWharf", category: "Waterfront", priceLevel: 2),
        Landmark(name: "Painted Ladies", imageName: "PaintedLadies", category: "Local", priceLevel: 1),
        Landmark(name: "Coit Tower", imageName: "CoitTower", category: "Touristy", priceLevel: 1),
        Landmark(name: "Oracle Park", imageName: "OraclePark", category: "Waterfront", priceLevel: 3),
        Landmark(name: "16th Avenue Tiled Steps", imageName: "TiledSteps", category: "Local", priceLevel: 0),
        Landmark(name: "Sutro Baths / Land's End", imageName: "SutroBaths", category: "Waterfront", priceLevel: 0),
        Landmark(name: "Golden Gate Park", imageName: "GGPark", category: "Local", priceLevel: 0)
    ]

    var filteredLandmarks: [Binding<Landmark>] {
        let allBindings = landmarks.indices.map { index in
            $landmarks[index]
        }

        if selectedFilter == "All" {
            return allBindings
        } else {
            return allBindings.filter { $0.wrappedValue.category == selectedFilter }
        }
    }


    
    var body: some View {
        ZStack {
            Color("GreenYellow")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                VStack {
                    Text("Landmarks")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.top, 75.0)
                        .foregroundColor(.white)
                    
                    HStack {
                        ForEach(["All", "Touristy", "Local", "Waterfront"], id: \.self) { filter in
                            Button(filter) {
                                selectedFilter = filter
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.asparagus)
                            .foregroundColor(.white)
                        }
                    } // end of HStack
                    .padding()
                } // end of header VStack

                // Scrollable content
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 15) {
                        ForEach(filteredLandmarks) { $landmark in
                            LandmarkCard(landmark: $landmark)
                        }
                    } // end of VStack
                    .padding(.bottom, 30)
                } // end of ScrollView
            } // end of outer VStack
        } // end of ZStack
    } // end of body
} // end of struct LandmarksPage

// MARK: - LandmarkCard View
struct LandmarkCard: View {
    @Binding var landmark: Landmark

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("Asparagus"))
                .padding(.horizontal, 20)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)

            VStack(spacing: 10) {
                Image(landmark.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .frame(width: 250, height: 200)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)

                HStack {
                    Text(landmark.name)
                        .font(.headline)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.leading, 30.0)
                    
                    Spacer()
                    
                    Button(action: {
                        landmark.isFavorite.toggle()
                    }) {
                        Image(systemName: landmark.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(landmark.isFavorite ? .red : .white)
                            .padding(.trailing, 25.0)
                    }
                }//end of inner HStack
                .padding(.horizontal, 20)

                                Text(landmark.priceLevel == 0 ? "Free" : String(repeating: "$", count: landmark.priceLevel))
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                    .padding(.bottom, 20.0)
                } // end of inner VStack
        } // end of ZStack
    } // end of body
} // end of LandmarkCard

#Preview {
    LandmarksPage()
}
