//
//  restaurantPage.swift
//  LocalLens
//
//  Created by Scholar on 8/12/25.
//

import SwiftUI

struct restaurantPage: View {
    var body: some View {
        ZStack{
            Color(.greenYellow)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 0.0) {
                    HStack{
                        
                        Image(.threeLinesMenuSymbol)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width:40, height:40)
                            .aspectRatio(contentMode: .fill)
                            .padding(30)
                        
                        HStack{
                            
                            Text("Restaurants")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("caribbeanCurrent"))
                                .padding()
                        }//end HStack
                        
                    }//end HStack
                    Text("Popular")
                        .fontWeight(.semibold)
                        .padding()
                        .font(.title)
                        .foregroundColor(Color("caribbeanCurrent"))
                    RoundedRectangle(cornerRadius: 20).foregroundColor(.asparugusGreen)
                        .frame(width:375, height:185)
                        .padding()
                    
                    Text("Cafes & Drinks")
                        .fontWeight(.semibold)
                        .padding()
                        .font(.title)
                        .foregroundColor(Color("caribbeanCurrent"))
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 20).foregroundColor(.asparugusGreen)
                            .frame(width:375, height:185)
                            .padding()
                        VStack {
                            HStack {
                                Image(.goldenIsland)
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 100, height:100)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(15)
                                    .padding()

                                Spacer()
                            }//end Hstack
                            Spacer()
                        }//end VStack

                    }//end ZStack
                    
                    
                    Text("Inexpensive")
                        .fontWeight(.semibold)
                        .padding()
                        .font(.title)
                        .foregroundColor(Color("caribbeanCurrent"))
                    RoundedRectangle(cornerRadius: 20).foregroundColor(.asparugusGreen)
                        .frame(width:375, height:185)
                        .padding()
                    
                    Text("Bakeries")
                        .fontWeight(.semibold)
                        .padding()
                        .font(.title)
                        .foregroundColor(Color("caribbeanCurrent"))
                    RoundedRectangle(cornerRadius: 20).foregroundColor(.asparugusGreen)
                        .frame(width:375, height:185)
                        .padding()
                }//end VStack
            }//end ScrollView
            }//end Zstack
            
    }//end body
}//end struck

#Preview {
    restaurantPage()
}
