import SwiftUI

struct Homepage: View {
    var body: some View {
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
        }
        // puts the icon in the top-left above everything
        .overlay(alignment: .topLeading) {
            Image(systemName: "line.3.horizontal")   // or Image("menuIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(.black)              // ensure it’s not white on white
                .padding(.top, 14)                    // keep clear of the notch
                .padding(.leading, 16)
                .zIndex(1)
        }
    }
}

#Preview {
    Homepage()
}
