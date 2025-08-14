import SwiftUI
import SwiftData

struct ActivitiesPage: View {
    @State private var activities:[Activity] = [
        Activity(name: "Exploratorium", imageName: "Exploratorium", desc: "One of the top, most interactive science museums in the U.S.", costRange:2, district: "Embaracdero"),
        Activity(name: "Conservatory Of Flowers", imageName:"ConservatoryOfFlowers", desc: "A beautiful garden with a wide variety of plants from all over the world.", costRange:3, district: "Golden Gate Park"),
        Activity(name: "Japantown", imageName:"Japantown", desc: "A great shopping center, full of bustling shops and Japanese culture.", costRange:2, district: "Japantown")
    ]
    var body: some View {
        Text("Activities")
        // holds all views
        ScrollView { // Creates a vertically scrollable area by default
            VStack (spacing:30){ // Arranges content vertically
                ForEach($activities) { $activity in
                    //every view in this ZStack I think of as a new layer, like on ibispaintx
                    ZStack {
                        // Section background
                        Rectangle().fill(Color.asparagus)
                            .cornerRadius(10)
                        
                        //Image(s)
                        HStack {
                            Image(activity.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(5)
                            Image(activity.imageName2)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(5)
                            Image(activity.imageName3)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(5)
                        }
                        .padding(EdgeInsets(top:-100, leading:0, bottom:0, trailing:0))
                        //brings the image up and to the left
                        
                        //Title and Like Button
                        HStack {
                            //TITLE
                            Text(activity.name)
                                .font(.title2)
                                .fontWeight(.bold)
                            //makes the title go all the way to the left and like button go all the way to the right
                            Spacer()
                            
                            // BUTTON
                            //action: when the button is tapped..
                            Button(action: {
                                activity.isLiked.toggle() // 🆕 Heart toggle
                                print("Liked \(activity.name): \(activity.isLiked)") // Optional debug
                            }) {
                                Image(systemName: activity.isLiked ? "heart.fill" : "heart") // Conditional heart icon
                                    .foregroundColor(activity.isLiked ? .red : .black)         // Color change
                                    .font(.title2)
                            }
                        }//end Hstack
                        // makes the text go down
                        .padding(EdgeInsets(top:40, leading:-2, bottom:0, trailing:0))
                        // makes the text a little away from the edge.
                        .padding(.horizontal)
                        
                        //Cost and District
                        HStack {
                            Text(activity.district)
                                .font(.footnote)
                            Text(activity.costDisplay)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(EdgeInsets(top:100, leading:0, bottom:0, trailing:0))
                        
                        
                        //Description
                        HStack {
                            Text(activity.desc)
                                .font(.footnote)
                        }//end HStack
                        .padding(.horizontal)
                        .padding(EdgeInsets(top:170, leading:0, bottom:0, trailing:0))
                        
                        // ❤️ Like Button Overlay
//                        HStack {
//                            Spacer()
//                            VStack {
//                                //action: when the button is tapped..
//                                Button(action: {
//                                    activity.isLiked.toggle() // 🆕 Heart toggle
//                                    print("Liked \(activity.name): \(activity.isLiked)") // Optional debug
//                                }) {
//                                    Image(systemName: activity.isLiked ? "heart.fill" : "heart") // Conditional heart icon
//                                        .foregroundColor(activity.isLiked ? .red : .gray)         // Color change
//                                        .font(.title2)
//                                        .padding([.top], 45)
//                                }
//                            }
//                        }
//                        .padding()
                        
                    }//end ZStack
                    .padding(.horizontal)
                    .frame(width:400, height:250)//makes boxes
                }//end for each loop
            }//end Vstack
            .padding()
        }//end ScrollView
            .background(Color.greenYellow)
//        .background(Color.gray.opacity(0.1)) //to view boundaries

    }
}

//preview screen
#Preview {
    ActivitiesPage()
}
