//
// restaurantPage.swift
// LocalLens
//
// Created by Scholar on 8/12/25.
//
import SwiftUI
struct HeartButton: View {
  @State private var isFilled = false
  var body: some View {
    Image(systemName: isFilled ? "heart.fill" : "heart")
      .resizable()
      .foregroundColor(.caribbeanCurrent)
      .frame(width: 27, height: 25)
      .background(Color("asparagusGreen"))
      .onTapGesture {
        withAnimation(.spring()) {
          isFilled.toggle()
        }
      }
  }
}
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
              .frame(width:35, height:35)
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
          ZStack{
            RoundedRectangle(cornerRadius: 20).foregroundColor(.asparagus)
              .frame(width:375, height:185)
              .padding()
              VStack{
              HStack(alignment: .top, spacing: 10.0){
                Spacer()
                HeartButton()
                  .position(x:250, y: 35)
                Image(.chatGPTImageAug132025124759PM)
                  .resizable()
                  .foregroundColor(Color("caribbeanCurrent"))
                  .frame(width: 17, height:25)
                  .padding(25)
              }//end HStack
              Spacer(minLength: 20.0)
            }//end VStack
            VStack {
              Spacer()
              HStack {
                Spacer()
                Image(.goldenBoyPizza)
                  .renderingMode(.original)
                  .resizable()
                  .frame(width: 150, height:150)
                  .aspectRatio(contentMode: .fill)
                  .cornerRadius(15)
                  .padding()
                Text("Golden Boy Pizza: Pizza Restaurant - 542 Green St, San Francisco     (TAKE OUT ONLY)")
                  .font(.headline)
                  .fontWeight(.heavy)
                  .foregroundColor(Color("GreenYellow"))
                  .padding()
                Spacer()
              }//end HStack
              Spacer()
            }//end VStack
          }//end ZStack
          ZStack{
            RoundedRectangle(cornerRadius: 20).foregroundColor(.asparagusGreen)
              .frame(width:375, height:185)
              .padding()
            VStack{
              HStack(alignment: .top, spacing: 10.0){
                Spacer()
                HeartButton()
                  .position(x:250, y: 35)
                Image(.chatGPTImageAug132025122733PM)
                  .resizable()
                  .foregroundColor(Color("caribbeanCurrent"))
                  .frame(width: 35, height:25)
                  .padding(25)
              }//end HStack
              Spacer(minLength: 20.0)
            }//end VStack
            VStack {
              Spacer()
              HStack {
                Spacer()
                Image(.brendasFrenchSoulFood)
                  .renderingMode(.original)
                  .resizable()
                  .frame(width: 150, height:150)
                  .aspectRatio(contentMode: .fill)
                  .cornerRadius(15)
                  .padding()
                Text("Brenda's French Soul Food: French, Creole, and Southern cuisine - 652 Polk St, San Francisco")
                  .font(.headline)
                  .fontWeight(.heavy)
                  .foregroundColor(Color("GreenYellow"))
                  .padding(20)
                Spacer()
              }//end HStack
              Spacer()
            }//end VStack
          }//end ZStack
          Text("Cafes & Drinks")
            .fontWeight(.semibold)
            .padding()
            .font(.title)
            .foregroundColor(Color("caribbeanCurrent"))
          ZStack{
            RoundedRectangle(cornerRadius: 20).foregroundColor(.asparagus)
              .frame(width:375, height:185)
              .padding()
          VStack{
            HStack(alignment: .top, spacing: 10.0){
              Spacer()
              HeartButton()
                .position(x:250, y: 35)
              Image(.chatGPTImageAug132025122733PM)
                .resizable()
                .frame(width: 35, height:25)
                .padding(25)
            }//end HStack
            Spacer(minLength: 20.0)
          }//end VStack
            VStack {
             Spacer()
              HStack {
                Spacer()
                Image(.goldenIsland)
                  .renderingMode(.original)
                  .resizable()
                  .frame(width: 150, height:150)
                  .aspectRatio(contentMode: .fill)
                  .cornerRadius(15)
                  .padding()
                Text("Golden Island Cafe: Chinese dessert and drink cafe - 1300 Noriega St, San Francisco")
                  .font(.headline)
                  .fontWeight(.heavy)
                  .foregroundColor(Color("GreenYellow"))
                  .padding()
                Spacer()
              }//end HStack
              Spacer()
            }//end VStack
          }//end ZStack
          ZStack{
            RoundedRectangle(cornerRadius: 20).foregroundColor(.asparagusGreen)
              .frame(width:375, height:185)
              .padding()
            VStack{
              HStack(alignment: .top, spacing: 10.0){
                Spacer()
                HeartButton()
                  .position(x:250, y: 35)
                Image(.chatGPTImageAug132025124759PM)
                  .resizable()
                  .foregroundColor(Color("caribbeanCurrent"))
                  .frame(width: 20, height:25)
                  .padding(25)
              }//end HStack
              Spacer(minLength: 20.0)
            }//end VStack
            VStack {
             Spacer()
              HStack {
                Spacer()
                Image(.sanaCafe)
                  .renderingMode(.original)
                  .resizable()
                  .frame(width: 150, height:150)
                  .aspectRatio(contentMode: .fill)
                  .cornerRadius(15)
                  .padding()
                Text("Sana'a Cafe: Yemeni styled cafe with pastries - 199 New Montgomery St, San Francisco")
                  .font(.headline)
                  .fontWeight(.heavy)
                  .foregroundColor(Color("GreenYellow"))
                  .padding()
                Spacer()
              }//end HStack
              Spacer()
            }//end VStack
          }//end ZStack
          Text("Seafood")
            .fontWeight(.semibold)
            .padding()
            .font(.title)
            .foregroundColor(Color("caribbeanCurrent"))
          ZStack{
            RoundedRectangle(cornerRadius: 20).foregroundColor(.asparugusGreen)
              .frame(width:375, height:185)
              .padding()
            VStack{
              HStack(alignment: .top, spacing: 10.0){
                Spacer()
                HeartButton()
                  .position(x:250, y: 35)
                Image(.chatGPTImageAug132025125221PM)
                  .resizable()
                  .frame(width: 40, height:30)
                  .padding(25)
              }//end HStack
              Spacer(minLength: 20.0)
            }//end VStack
            VStack {
              Spacer()
              HStack {
                Spacer()
                Image(.crabHousePier39)
                  .renderingMode(.original)
                  .resizable()
                  .frame(width: 150, height:150)
                  .aspectRatio(contentMode: .fill)
                  .cornerRadius(15)
                  .padding()
                Text("Crab House: Sea food - 2 Beach St, Pier 39, San Francisco")
                  .font(.headline)
                  .fontWeight(.heavy)
                  .foregroundColor(Color("GreenYellow"))
                  .padding()
                Spacer()
              }//end HStack
              Spacer()
            }//end VStack
          }//end ZStack
          ZStack{
            RoundedRectangle(cornerRadius: 20).foregroundColor(.asparugusGreen)
              .frame(width:375, height:185)
              .padding()
            VStack{
              HStack(alignment: .top, spacing: 10.0){
                Spacer()
                HeartButton()
                  .position(x:250, y: 35)
                Image(.chatGPTImageAug132025122733PM)
                  .resizable()
                  .foregroundColor(Color("caribbeanCurrent"))
                  .frame(width: 35, height:25)
                  .padding(25)
              }//end HStack
              Spacer(minLength: 20.0)
            }//end VStack
            VStack {
             Spacer()
              HStack {
                Spacer()
                Image(.pacificCatch)
                  .renderingMode(.original)
                  .resizable()
                  .frame(width: 150, height:150)
                  .aspectRatio(contentMode: .fill)
                  .cornerRadius(15)
                  .padding()
                Text("Pacific Catch: Seafood inspired by Pacific Rim - 1200 9th Ave, San Francisco")
                  .font(.headline)
                  .fontWeight(.heavy)
                  .foregroundColor(Color("GreenYellow"))
                  .padding()
                Spacer()
              }//end HStack
              Spacer()
            }//end VStack
          }//end ZStack
          Text("Bakeries")
            .fontWeight(.semibold)
            .padding()
            .font(.title)
            .foregroundColor(Color("caribbeanCurrent"))
          ZStack{
            RoundedRectangle(cornerRadius: 20).foregroundColor(.asparugusGreen)
              .frame(width:375, height:185)
              .padding()
            VStack{
              HStack(alignment: .top, spacing: 10.0){
                Spacer()
                HeartButton()
                  .position(x:250, y: 35)
                Image(.chatGPTImageAug132025122733PM)
                  .resizable()
                  .frame(width: 35, height:25)
                  .padding(25)
              }//end HStack
              Spacer(minLength: 20.0)
            }//end VStack
            VStack {
              Spacer()
              HStack {
                Spacer()
                Image(.bPatiserrieSF)
                  .renderingMode(.original)
                  .resizable()
                  .frame(width: 150, height:150)
                  .aspectRatio(contentMode: .fill)
                  .cornerRadius(15)
                  .padding()
                Text("b. Patisserie: French and Viennese style pastry kitchen - 2821 California St, San Francisco")
                  .font(.headline)
                  .fontWeight(.heavy)
                  .foregroundColor(Color("GreenYellow"))
                  .padding()
                Spacer()
              }//end HStack
              Spacer()
            }//end VStack
          }//end ZStack

            ZStack{
            RoundedRectangle(cornerRadius: 20).foregroundColor(.asparugusGreen)
              .frame(width:375, height:185)
              .padding()
            VStack{
              HStack(alignment: .top, spacing: 10.0){
                Spacer()
                HeartButton()
                  .position(x:250, y: 35)
                Image(.chatGPTImageAug132025122733PM)
                  .resizable()
                  .foregroundColor(Color("caribbeanCurrent"))
                  .frame(width: 35, height:25)
                  .padding(25)
              }//end HStack
              Spacer(minLength: 20.0)
            }//end VStack
            VStack {
             Spacer()
              HStack {
                Spacer()
                Image(.noeValleyBakery)
                  .renderingMode(.original)
                  .resizable()
                  .frame(width: 150, height:150)
                  .aspectRatio(contentMode: .fill)
                  .cornerRadius(15)
                  .padding()
                Text("Noe Valley Bakery: Sweets, breakfast items, and cookie dough for home baking -8 W Portal Ave, San Francisco ")
                  .font(.headline)
                  .fontWeight(.heavy)
                  .foregroundColor(Color("GreenYellow"))
                  .padding()
                Spacer()
              }//end HStack
              Spacer()
            }//end VStack
          }//end ZStack
        }//end VStack
      }//end ScrollView
      }//end Zstack
  }//end body
}//end struck
#Preview {
  restaurantPage()
}


