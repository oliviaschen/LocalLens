import SwiftUI
import MapKit

// ---- Inline models so this compiles by itself ----
enum PlaceCategory: String, CaseIterable, Hashable {
    case food, activity, landmark
    var color: Color { switch self { case .food: .red; case .activity: .blue; case .landmark: .green } }
}

struct PlacePin: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let price: String
    let category: PlaceCategory
    let coordinate: CLLocationCoordinate2D
}

private let demoPins: [PlacePin] = [
    .init(title: "Neighbor Bakehouse", subtitle: "Known for creative, flaky pastries and great coffee—perfect for a quick, delicious stop in the city.", price: "$$",   category: .food,
          coordinate: .init(latitude: 37.74965, longitude: -122.38819)),
    .init(title: "Stella Pastry",  subtitle: "Famous for its classic Italian desserts, especially cannoli, tiramisu, and sfogliatelle—perfect for a sweet treat in North Beach.",     price: "$$", category: .food,
          coordinate: .init(latitude: 37.7596, longitude: -122.4269)),
    .init(title: "Golden Gate Bridge", subtitle: "An iconic landmark offering stunning views of San Francisco Bay—perfect for walking, biking, or snapping photos.",    price: "Free, parking is $5-10/hr", category: .landmark,
          coordinate: .init(latitude: 37.8199, longitude: -122.4783)),
    .init(title: "Blue Bottle Coffee", subtitle: "Serves top-notch espresso, pour-overs, and New Orleans–style iced coffee—perfect for sipping while exploring the neighborhood.", price: "$$", category: .food,
              coordinate: .init(latitude: 37.79131, longitude: -122.40097)),
        .init(title: "Tartine Bakery", subtitle: "Beloved for its fresh bread, decadent pastries, and seasonal tarts—perfect for an indulgent San Francisco treat.", price: "$10-20", category: .food,
              coordinate: .init(latitude: 37.76144, longitude: -122.42408)),
        .init(title: "b. patisserie", subtitle: "Known for its buttery kouign-amann, delicate pastries, and artisan breads—perfect for a refined sweet or savory bite.", price: "$$", category: .food,
              coordinate: .init(latitude: 37.78789, longitude: -122.44085)),
    .init(title: "Cinderella Bakery & Cafe", subtitle: "Serves classic Russian pastries, hearty pies, and savory dishes—perfect for a cozy, flavorful stop.", price: "$10-20", category: .food,
          coordinate: .init(latitude: 37.77737, longitude: -122.46368)),
    .init(title: "Pakwan Restaurant", subtitle: "Known for its flavorful Pakistani and Indian dishes, from biryani to fresh naan—perfect for a hearty, casual meal.", price: "$10-20", category: .food,
          coordinate: .init(latitude: 37.78568, longitude: -122.41318)),
    .init(title: "House of Prime Rib", subtitle: "Serves classic, juicy prime rib with traditional sides—perfect for a hearty, old-school San Francisco dining experience.", price: "$50-100", category: .food,
          coordinate: .init(latitude: 37.79343, longitude: -122.42274)),
    .init(title: "La Taqueria", subtitle: "Famous for its Mission-style burritos and flavorful tacos—perfect for a satisfying, no-frills Mexican meal.", price: "$10-20", category: .food,
          coordinate: .init(latitude: 37.75088, longitude: -122.41818)),
    .init(title: "The Italian Homemade Company", subtitle: "Offers fresh, house-made pasta and hearty Italian dishes—perfect for a cozy, authentic meal.", price: "$10-20", category: .food,
          coordinate: .init(latitude: 37.80161, longitude: -122.41173)),
    .init(title: "Crab House at Pier 39", subtitle: "Known for its sizzling garlic crab and fresh seafood—perfect for a flavorful waterfront meal.", price: "$50-100", category: .food,
          coordinate: .init(latitude: 37.80946, longitude: -122.41042)),
    .init(title: "Mitchell's Ice Cream", subtitle: "Beloved for its rich, handmade ice cream in classic and tropical flavors—perfect for a sweet, nostalgic treat.", price: "$", category: .food,
          coordinate: .init(latitude: 37.74422, longitude: -122.42279)),
    .init(title: "Ghirardelli Chocolate Experience", subtitle: "Features rich sundaes, decadent chocolates, and signature hot fudge—perfect for indulging in a San Francisco classic.", price: "$$", category: .food,
          coordinate: .init(latitude: 37.76429, longitude: -122.43061)),
]

// ---- Map view (no live location yet) ----
struct MapPage: View {
    @State private var camera: MapCameraPosition =
        .region(.init(center: .init(latitude: 37.7749, longitude: -122.4194),
                      span: .init(latitudeDelta: 0.08, longitudeDelta: 0.08)))
    @State private var selected: PlacePin? = nil

    var body: some View {
        Map(position: $camera) {
            ForEach(demoPins) { pin in
                Annotation(pin.title, coordinate: pin.coordinate) {
                    Button { selected = pin } label: {
                        ZStack {
                            Circle().fill(pin.category.color).frame(width: 28, height: 28)
                            Image(systemName: "mappin.circle.fill").foregroundStyle(.white)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .mapStyle(.standard(elevation: .flat))
        .mapControls {
            MapCompass()
            MapScaleView()
        }
        .ignoresSafeArea()
        .sheet(item: $selected) { pin in
            VStack(spacing: 16) {
                Map(initialPosition: .region(.init(center: pin.coordinate,
                                                   span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)))) {
                    Marker(pin.title, coordinate: pin.coordinate).tint(pin.category.color)
                }
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 12))

                HStack {
                    Text(pin.title).font(.title2).bold()
                    Spacer()
                    Text(pin.price)
                        .font(.headline)
                        .padding(.horizontal, 10).padding(.vertical, 6)
                        .background(Capsule().fill(.thinMaterial))
                }
                Text(pin.subtitle).foregroundStyle(.secondary)
                Button("Close", role: .cancel) {}.buttonStyle(.bordered)
                Spacer()
            }
            .padding()
            .presentationDetents([.medium, .large])
        }
    }
}

#Preview { MapPage() }


#Preview {
    MapPage()
}
