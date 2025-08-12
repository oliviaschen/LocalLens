import SwiftUI

struct ActivitiesPage: View {
    var body: some View {
        // holds all views
        ZStack {
            // background color
            Color.asparagus
                .ignoresSafeArea()
            VStack {
                // activity title
                Text("Activities")
                Spacer()
            }
            //note: cornerRadius must go before padding so that padding applies to the view AND the corners
            
            VStack(spacing:200){
                HStack {
                    Text("Conservatory of Flowers")
                }
                .background(Rectangle().fill(Color.greenYellow).cornerRadius(30).padding().frame(width:400, height:230))
            
                HStack {
                    Text("Exploratorium")
                }
                .background(Rectangle().fill(Color.greenYellow).cornerRadius(30).padding().frame(width:400, height:230))
                
                HStack {
                    VStack {
                        Text("Japanese Tea Garden")
                    }
                }
                .background(Rectangle().fill(Color.greenYellow).cornerRadius(30).padding().frame(width:400, height:230))
                
            }

            
        }//end ZStack
        // main content stack (other views go here)
    }//end body
}//end struct

#Preview {
    ActivitiesPage()
}
