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
}

// MARK: - Landmarks Page View
struct LandmarksPage: View {
    @State private var selectedFilter: String = "All"
    
    let landmarks: [Landmark] = [
        Landmark(name: "Golden Gate Bridge", imageName: "GGBridge", category: "Touristy"),
        Landmark(name: "Fisherman's Wharf", imageName: "FishermansWharf", category: "Waterfront"),
        Landmark(name: "Painted Ladies", imageName: "PaintedLadies", category: "Local"),
        Landmark(name: "Coit Tower", imageName: "CoitTower", category: "Touristy"),
        Landmark(name: "Oracle Park", imageName: "OraclePark", category: "Waterfront"),
        Landmark(name: "16th Avenue Tiled Steps", imageName: "TiledSteps", category: "Local"),
        Landmark(name: "Sutro Baths / Land's End", imageName: "SutroBaths", category: "Waterfront"),
        Landmark(name: "Golden Gate Park", imageName: "GGPark", category: "Local")
    ]
    
    var filteredLandmarks: [Landmark] {
        selectedFilter == "All" ? landmarks : landmarks.filter { $0.category == selectedFilter }
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
                        ForEach(filteredLandmarks) { landmark in
                            LandmarkCard(landmark: landmark)
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
    let landmark: Landmark

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("Asparagus"))
                .padding(.horizontal, 20)

            VStack {
                Image(landmark.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .frame(width: 250, height: 200)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)

                Text(landmark.name)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.bottom, 15)
            } // end of inner VStack
        } // end of ZStack
    } // end of body
} // end of LandmarkCard

#Preview {
    LandmarksPage()
}
