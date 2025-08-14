import SwiftUI

enum Destination: String, Hashable, Identifiable {
    case landmarks, restaurants, map
    var id: Self { self }
}

struct Homepage: View {
    @State private var showMenu = false
    @State private var goTo: Destination? = nil
    
    var body: some View {
        
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250)
        
        Text("Discover the best places to eat, explore, and enjoy—right where you are.")
            .italic()
            .font(.system(size: 22))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.leading, 20)
    }
}
        
    #Preview {
            NavigationStack { Homepage() } // preview inside a stack is safer
        }

