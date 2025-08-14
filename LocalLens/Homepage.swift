import SwiftUI
enum Destination: String, Hashable, Identifiable {
  case landmarks, restaurants, map
  var id: Self { self }
}
struct Homepage: View {
    @State private var showMenu = false
    @State private var goTo: Destination? = nil

    var body: some View {
        NavigationStack {
            VStack {
                // (You can replace these blank Texts with Spacer() if you want spacing)
                Text(""); Text(""); Text(""); Text("")
                Text(""); Text(""); Text(""); Text("")

                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)

                Text("**Welcome to LocalLens!**")
                    .font(.system(size: 45, weight: .bold))
                    .padding()

                Text("Discover the best places to eat, explore, and enjoy—right where you are!")
                    .italic()
                    .font(.system(size: 22))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.leading, 20)

                Spacer()
            }
            .background(Color("GreenYellow"))
            .ignoresSafeArea()

            // ⬇️⬇️ THESE THREE MODIFIERS MOVED **INSIDE** THE NavigationStack
            .overlay(alignment: .topLeading) {
                Button { showMenu = true } label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.black)
                        .padding(12)
                }
                .padding(.top, 6)
                .padding(.leading, 6)
            }
            .confirmationDialog("Go to…", isPresented: $showMenu, titleVisibility: .visible) {
                Button("Map")         { goTo = .map }
                Button("Landmarks")   { goTo = .landmarks }
                Button("Restaurants") { goTo = .restaurants }
                Button("Activities") { goTo = .activities}
                Button("Cancel", role: .cancel) {}
            }
            .navigationDestination(item: $goTo) { dest in
                switch dest {
                case .landmarks:   LandmarksPage()
                case .restaurants: restaurantPage()   // keep your existing view name
                case .map:         MapPage()
                case .activities:        ActivitiesPage()
                }
            }
            // ⬆️⬆️ keep them attached to VStack (inside the stack)
=======
  @State private var showMenu = false
  @State private var goTo: Destination? = nil
  var body: some View {
    NavigationStack {
      VStack {
        // (You can replace these blank Texts with Spacer() if you want spacing)
        Text(""); Text(""); Text(""); Text("")
        Text(""); Text(""); Text(""); Text("")
        Image("Logo")
          .resizable()
          .scaledToFit()
          .frame(width: 250, height: 250)
        Text("**Welcome to LocalLens!**")
          .font(.system(size: 45, weight: .bold))
          .foregroundColor(Color("caribbeanCurrent"))
          .padding()
        Text("Discover the best places to eat, explore, and enjoy—right where you are!")
          .italic()
          .font(.system(size: 22))
          .frame(maxWidth: .infinity, alignment: .center)
          .foregroundColor(Color("caribbeanCurrent"))
          .padding(.leading, 20)
        Spacer()
      }
      .background(Color("GreenYellow"))
      .ignoresSafeArea()
      // :arrow_down::arrow_down: THESE THREE MODIFIERS MOVED **INSIDE** THE NavigationStack
      .overlay(alignment: .topLeading) {
        Button { showMenu = true } label: {
          Image(systemName: "line.3.horizontal")
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .foregroundStyle(.black)
            .padding(12)
        }
        .padding(.top, 6)
        .padding(.leading, 6)
      }
      .confirmationDialog("Go to…", isPresented: $showMenu, titleVisibility: .visible) {
        Button("Map")     { goTo = .map }
        Button("Landmarks")  { goTo = .landmarks }
        Button("Restaurants") { goTo = .restaurants }
        Button("Cancel", role: .cancel) {}
      }
      .navigationDestination(item: $goTo) { dest in
        switch dest {
        case .landmarks:  LandmarksPage()
        case .restaurants: restaurantPage()  // keep your existing view name
        case .map:     MapPage()
        }
      }
      // :arrow_up::arrow_up: keep them attached to VStack (inside the stack)
    }
  }
}


struct Homepage: View {
}

#Preview {
  NavigationStack { Homepage() } // preview inside a stack is safer
}
