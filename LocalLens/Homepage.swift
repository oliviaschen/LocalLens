import SwiftUI

enum Destination: String, Hashable, Identifiable {
    case activities, landmarks, restaurants
    var id: Self { self }
}

struct Homepage: View {
    @State private var showMenu = false
    @State private var goTo: Destination? = nil

    var body: some View {
        NavigationStack{
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                Text("**Welcome to LocalLens!**")
                    .font(.system(size: 45, weight: .bold))
                    .padding()
                
                Text("Discover the best places to eat, explore, and enjoy—right where you are.")
                    .italic()
                    .font(.system(size: 22))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading, 20)
                
                Spacer()
            }//vstack end
            // make the hamburger tappable (Button), not just an Image
            .overlay(alignment: .topLeading) {
                Button {
                    showMenu = true
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.black)
                        .padding(12) // bigger tap target
                }
                .padding(.top, 6)
                .padding(.leading, 6)
            }
            .confirmationDialog("Go to…", isPresented: $showMenu, titleVisibility: .visible) {
                Button("Activities")  { goTo = .activities }
                Button("Landmarks")   { goTo = .landmarks }
                Button("Restaurants") { goTo = .restaurants }
                Button("Cancel", role: .cancel) {}
            }
            .navigationDestination(item: $goTo) { dest in
                switch dest {
                case .activities:   ActivitiesPage()
                case .landmarks:    LandmarksPage()
                case .restaurants:  restaurantPage()
                }
            }
        }//navstack end
    }//body end
}//struct end

#Preview {
    Homepage()
}
