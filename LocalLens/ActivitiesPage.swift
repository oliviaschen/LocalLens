import SwiftUI
import SwiftData

struct ActivitiesPage: View {
    @State private var Activities:[Activity] = [
        Activity(name: "Exploratorium", imageName: "Exploratorium", desc: "One of the top, most interactive science museums in the U.S.", cost:2, district: "Embaracdero"),
        Activity(name: "Conservatory Of Flowers", imageName:"ConservatoryOfFlowers", desc: "A beautiful garden with a wide variety of plants from all over the world.", cost:2, district: "Golden Gate Park"),
        Activity(name: "Japantown", imageName:"Japantown", desc: "A great shopping center, full of bustling shops and Japanese culture.", cost:2, district: "Japantown")
    ]
    var body: some View {
        Text("Activities")
        // holds all views
        ScrollView { // Creates a vertically scrollable area by default
            VStack (spacing:30){ // Arranges content vertically
                ForEach(0..<Activities.count) { index in
                    //every view in this ZStack I think of as a new layer, like on ibispaintx
                    ZStack {
                        // Section background
                        Rectangle().fill(Color.greenYellow)
                            .cornerRadius(30)
                        
                        //Image(s)
                        HStack {
                            Image(Activities[index].imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(10)
                        }
                        .padding(EdgeInsets(top:-100, leading:0, bottom:0, trailing:0))
                        //brings the image up and to the left
                        
                        //Title
                        HStack {
                            Text(Activities[index].name)
                                .font(.title2)
                                .fontWeight(.bold)
                            //makes the title go all the way to the left
                            Spacer()
                        }//end Hstack
                        // makes the text go down
                        .padding(EdgeInsets(top:40, leading:-2, bottom:0, trailing:0))
                        // makes the text a little away from the edge.
                        .padding(.horizontal)
                        
                        //Cost and District
                        HStack {
                            Text(Activities[index].district)
                                .font(.footnote)
                            Text("$$")
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(EdgeInsets(top:100, leading:0, bottom:0, trailing:0))
                        
                        
                        //Description
                        HStack {
                            Text(Activities[index].desc)
                                .font(.footnote)
                        }//end HStack
                        .padding(.horizontal)
                        .padding(EdgeInsets(top:170, leading:0, bottom:0, trailing:0))
                    }//end ZStack
                    .padding(.horizontal)
                    .frame(width:400, height:250)//makes boxes
                }//end for each loop
            }//end Vstack
            .padding()
        }//end ScrollView
            .background(Color.asparagus)
//        .background(Color.gray.opacity(0.1)) //to view boundaries

    }
}

//preview screen
#Preview {
    ActivitiesPage()
}
