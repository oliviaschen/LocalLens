import SwiftUI
enum Destination: String, Hashable, Identifiable {

}
struct Homepage: View {

#Preview {
  NavigationStack { Homepage() } // preview inside a stack is safer
}
