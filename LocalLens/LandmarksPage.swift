//
//  LandmarksPage.swift
//  LocalLens
//
//  Created by Scholar on 8/12/25.
//

import SwiftUI

struct Landmark: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let category: String
}

struct LandmarksPage: View {
    @State private var selectedFilter: String = "All"
    
    let landmarks: [Landmark] = [
        Landmark(name: "Golden Gate Bridge", imageName: "GGBridge", category: "Touristy"),
        Landmark(name: "Fisherman's Wharf", imageName: "FishermansWharf", category: "Waterfront"),
        Landmark(name: "Painted Ladies", imageName: "PaintedLadies", category: "Local"),
        Landmark(name: "Coit Tower", imageName: "CoitTower", category: "Touristy")
    ]
    
    var filteredLandmarks: [Landmark] {
        selectedFilter == "All" ? landmarks : landmarks.filter { $0.category == selectedFilter }
    }
    
    var body: some View {
        ZStack{
            Color("GreenYellow")
                .ignoresSafeArea()
            
            
            VStack(spacing: 0){ //VStack for fixed header and scroll content
                VStack {
                    Text("Landmarks")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.top, 75.0)
                    
                    HStack {
                        ForEach(["All", "Touristy", "Local", "Waterfront"], id: \.self) { filter in
                            Button(filter) {
                                selectedFilter = filter
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.asparagus)
                            .foregroundColor(.white)
                        }
                    }
                    .padding()
                    
                }//VStack end title + filters
                ScrollView(.vertical, showsIndicators: true){//Click and hold to scroll
                    VStack {//VStack for landmark images
                        
                            Divider()
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .padding(.horizontal, 20.0)
                                Color("Asparagus")
                                
                                VStack{
                                    Image("GGBridge")
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                    
                                        .cornerRadius(10)
                                        .frame(width: 250, height: 200)
                                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                                    
                                    Text("The Golden Gate Bridge")
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 15.0)
                                    
                                }//vstack end for landmark box
                            }//zstack end for landmark box
                            Divider()
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .padding(.horizontal, 20.0)
                                Color("Asparagus")
                                
                                VStack{
                                    Image("FishermansWharf")
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                    
                                        .cornerRadius(10)
                                        .frame(width: 250, height: 200)
                                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                                    
                                    Text("Fishermans Wharf")
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 15.0)
                                    
                                }//vstack end for landmark box
                            }//zstack end for landmark box
                            
                            Divider()
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .padding(.horizontal, 20.0)
                                Color("Asparagus")
                                
                                VStack{
                                    Image("PaintedLadies")
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                    
                                        .cornerRadius(10)
                                        .frame(width: 250, height: 200)
                                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                                    
                                    Text("The Painted Ladies")
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 15.0)
                                    
                                }//vstack end for landmark box
                            }//zstack end for landmark box
                            
                            Divider()
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .padding(.horizontal, 20.0)
                                Color("Asparagus")
                                
                                VStack{
                                    Image("CoitTower")
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                    
                                        .cornerRadius(10)
                                        .frame(width: 250, height: 200)
                                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                                    
                                    Text("Coit Tower")
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 15.0)
                                    
                                }//vstack end for landmark box
                            }//zstack end for landmark box
                            Divider()
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .padding(.horizontal, 20.0)
                                Color("Asparagus")
                                
                                VStack{
                                    Image("OraclePark")
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                    
                                        .cornerRadius(10)
                                        .frame(width: 250, height: 200)
                                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                                    
                                    Text("Oracle Park")
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 15.0)
                                    
                                }//vstack end for landmark box
                            }//zstack end for landmark box
                            Divider()
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .padding(.horizontal, 20.0)
                                Color("Asparagus")
                                
                                VStack{
                                    Image("TiledSteps")
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                    
                                        .cornerRadius(10)
                                        .frame(width: 250, height: 200)
                                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                                    
                                    Text("16th Avenue Tiled Steps")
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 15.0)
                                    
                                }//vstack end for landmark box
                            }//zstack end for landmark box
                            
                            Divider()
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .padding(.horizontal, 20.0)
                                Color("Asparagus")
                                
                                VStack{
                                    Image("SutroBaths")
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                    
                                        .cornerRadius(10)
                                        .frame(width: 250, height: 200)
                                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                                    
                                    Text("Sutro Baths / Land's End")
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 15.0)
                                    
                                }//vstack end for landmark box
                            }//zstack end for landmark box
                            
                            Divider()
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .padding(.horizontal, 20.0)
                                Color("Asparagus")
                                
                                VStack{
                                    Image("GGPark")
                                        .resizable(resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                    
                                        .cornerRadius(10)
                                        .frame(width: 250, height: 200)
                                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                                    
                                    Text("Golden Gate Park")
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 15.0)
                                    
                                }//vstack end for landmark box
                            }//zstack end for landmark box
                            
                            
                        }//Vstack end landmark images
                    }//Scroll end
                    .frame(maxHeight: .infinity)
                }
                .frame(height: nil)// End of VStack for header + scroll
            }//ZStack
        }//body end
    }//struct end
    
    #Preview {
        LandmarksPage()
    }

