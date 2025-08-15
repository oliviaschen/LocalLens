//
//  LandmarksPage.swift
//  LocalLens
//
//  Created by Scholar on 8/12/25.
//

import SwiftUI
import CoreLocation
import MapKit

// MARK: - Landmark Model
struct Landmark: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let category: String
    let priceLevel: Int // 0 = free, 1 = $, 2 = $$, 3 = $$$
    var isFavorite: Bool = false
    var coordinate: CLLocationCoordinate2D? = nil //makes coordinate optional so only Golden Gate Bridge needs one
    var additionalImages: [String] = []
}

// MARK: - Landmarks Page View
struct LandmarksPage: View {
    @State private var selectedLandmark: Landmark? = nil
    @State private var showSheet = false
    @State private var selectedFilter: String = "All"
    @State private var landmarks: [Landmark] = [
        Landmark(name: "Golden Gate Bridge", imageName: "GGBridge", category: "Touristy", priceLevel: 0, coordinate: CLLocationCoordinate2D(latitude: 37.8199, longitude: -122.4783), additionalImages: ["GGBridge1", "GGBridge2", "GGBridge3"]),//add additional pics for gg bridge
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
                                .onTapGesture {
                                    if landmark.name == "Golden Gate Bridge" {
                                        selectedLandmark = landmark
                                        showSheet = true
                                    }
                                }
                        }
                    } // end of VStack
                    .padding(.bottom, 30)
                    
                    
                } // end of ScrollView
            } // end of outer VStack
        } // end of ZStack
        .sheet(isPresented: $showSheet) {
            if let landmark = selectedLandmark {
                LandmarkDetailSheet(landmark: landmark)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
    }
    
    struct MapAnnotationItem: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    struct LandmarkDetailSheet: View {
        let landmark: Landmark
        
        @State private var region: MapCameraPosition
        
        init(landmark: Landmark) {
            self.landmark = landmark
            let coordinate = landmark.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
            _region = State(initialValue: .region(MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )))
        }
        
        
        var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    // Main image
                    Image(landmark.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 250)
                        .cornerRadius(12)
                    
                    // Info
                    VStack(alignment: .leading, spacing: 6) {
                        Text(landmark.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Category: \(landmark.category)")
                            .foregroundColor(.secondary)
                        
                        Text(landmark.priceLevel == 0 ? "Free" : String(repeating: "$", count: landmark.priceLevel))
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    
                    // Map view
                    if let coordinate = landmark.coordinate {
                        Map(position: $region) {
                            Marker(landmark.name, coordinate: coordinate)
                        }
                        .frame(height: 200)
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                    
                    // Carousel
                    if !landmark.additionalImages.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(landmark.additionalImages, id: \.self) { img in
                                    Image(img)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 100)
                                        .clipped()
                                        .cornerRadius(8)
                                }
                            }//HStack end for bottom popup
                            .padding(.horizontal)
                        }//scroll view for carousel end
                    }
                    
                    // Description
                    Text("Discover the iconic \(landmark.name). Great photo ops, scenic views, and history! You can add more content here.")
                        .padding(.horizontal)
                    
                    // Yelp link
                    Link("View on Yelp", destination: URL(string: "https://www.yelp.com/search?find_desc=\(landmark.name.replacingOccurrences(of: " ", with: "+"))")!)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                }
                .padding(.vertical)
                .background(Color.yellow)
            }//scroll view end popup
        }//body end for popup
    }//struct end for popup
    
    #Preview {
        LandmarkDetailSheet(
            landmark: Landmark(
                name: "Golden Gate Bridge",
                imageName: "GGBridge",
                category: "Touristy",
                priceLevel: 0,
                coordinate: CLLocationCoordinate2D(latitude: 37.8199, longitude: -122.4783),
                additionalImages: ["GGBridge1", "GGBridge2", "GGBridge3"]
            )
        )
    }
    
    
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
                            .font(.title3)
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
}//struct end of landmark card
    
    #Preview {
        LandmarksPage()
        
    }

