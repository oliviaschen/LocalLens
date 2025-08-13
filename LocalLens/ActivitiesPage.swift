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
                // SECT 1
                VStack {
                    HStack {
                        Text("Conservatory of Flowers")
                        // padding centers the title to the top left of the section. Note that I decrease padding from the top rather than add padding to the bottom because of the spacing between sections (my preference)
                            .padding(EdgeInsets(top:-80, leading:-140, bottom:0, trailing:0))
                    }
                }//end SECT 1
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
