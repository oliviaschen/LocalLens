import SwiftUI

struct ActivitiesPage: View {
    var body: some View {
        ZStack(alignment: .top) {
            // background color
            Color.asparagus
                .ignoresSafeArea()
            // activity title
            Text("Activities")
            
            
            //first activity section
            VStack {
                Text("Conservatory of Flowers")
            }//end VStack
            .background(Rectangle().frame(width: 350.0, height: 150.0).foregroundColor(Color.greenYellow).cornerRadius(30))
            //?: idk why this is needed? If taken out, everythign gets displaced
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }//end ZStack
        // main content stack (other views go here)
    }//end body
}//end struct

#Preview {
    ActivitiesPage()
}
