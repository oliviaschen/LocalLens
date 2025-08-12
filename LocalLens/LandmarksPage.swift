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
                    .padding(.bottom, 550.0)
                
                HStack{
                    Button("Touristy") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.asparagus)

                    Button("Local Spots") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.asparagus)

                    Button("Waterfront") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.asparagus)
                    
                }//HStack end
                
            }//VStack end
        }//ZStack end
    }//body end
}//struct end,

#Preview {
    LandmarksPage()
}
