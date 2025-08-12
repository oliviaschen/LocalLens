//
//  LandmarksPage.swift
//  LocalLens
//
//  Created by Scholar on 8/12/25.
//

import SwiftUI

struct LandmarksPage: View {
    var body: some View {
        ZStack{
            Color("GreenYellow")
                .ignoresSafeArea()
                .padding(.top, 50.0)
                
            VStack{
                Text("Landmarks")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10.0)
                
                HStack{
                    Button("Touristy") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.asparagus)
                    .padding()

                    Button("Local") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.asparagus)
                    .padding()

                    Button("Waterfront") {
                            
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.asparagus)
                    .padding()
                }//HStack end
            
                HStack{
                    Image("GGBridge")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 200, height: 100)
                        .clipped()
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                    Image("FishermansWharf")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 200, height: 100)
                        .clipped()
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                      
                }//Hstack end
                .padding()

                HStack{
                    Image("PaintedLadies")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 200, height: 100)
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 4)
                    Image("CoitTower")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 200, height: 100)
                        .shadow(color: .black.opacity(0.7), radius: 10, x: 5, y: 4)
                        
                }//hstack end
            }//VStack end
        }//ZStack
    }//body end
}//struct end,

#Preview {
    LandmarksPage()
}
