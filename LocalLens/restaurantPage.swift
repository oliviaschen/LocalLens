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
            VStack(alignment: .leading, spacing: 20.0) {
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
                RoundedRectangle(cornerRadius: 20).foregroundColor(.asparugusGreen)
                    .frame(width:375, height:185)
                    .padding()
        
                RoundedRectangle(cornerRadius: 20).foregroundColor(.asparugusGreen)
                    .frame(width:375, height:185)
                    .padding()
                
                RoundedRectangle(cornerRadius: 20).foregroundColor(.asparugusGreen)
                    .frame(width:375, height:185)
                    .padding()
            }//end VStack
        }//end ZStack
    }//end body
}//end struck

#Preview {
    restaurantPage()
}
