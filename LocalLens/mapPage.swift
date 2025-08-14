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
 .init(title: "Neighbor Bakehouse", subtitle: "Known for creative, flaky pastries and great coffee—perfect for a quick, delicious stop in the city.", price: "$$", category: .food,
   coordinate: .init(latitude: 37.74965, longitude: -122.38819)),
 .init(title: "Stella Pastry", subtitle: "Famous for its classic Italian desserts, especially cannoli, tiramisu, and sfogliatelle—perfect for a sweet treat in North Beach.",  price: "$$", category: .food,
   coordinate: .init(latitude: 37.7596, longitude: -122.4269)),
 .init(title: "Golden Gate Bridge", subtitle: "An iconic landmark offering stunning views of San Francisco Bay—perfect for walking, biking, or snapping photos.", price: "Free, parking is $5-10/hr", category: .landmark,
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
 .init(title: "Ghirardelli Chocolate Experience", subtitle: "Features rich sundaes, decadent chocolates, and signature hot fudge—perfect for indulging in a San Francisco classic.", price: "$$", category: .activity,
   coordinate: .init(latitude: 37.76429, longitude: -122.43061)),
 .init(title: "The Baked Bear", subtitle: "Known for its custom ice cream sandwiches made with fresh-baked cookies, brownies, or donuts—perfect for a fun, indulgent treat.", price: "$10-20", category: .food,
   coordinate: .init(latitude: 37.79812, longitude: -122.40731)),
 .init(title: "Boba Guys Union Square", subtitle: "Serves high-quality milk teas, fruit teas, and matcha drinks with chewy boba—perfect for a refreshing pick-me-up.", price: "$$", category: .food,
   coordinate: .init(latitude: 37.78998, longitude: -122.40723)),
 .init(title: "Japan Center Malls", subtitle: "Offers shops, restaurants, and cultural spots—perfect for exploring Japanese food, gifts, and traditions in one place.", price: "$$", category: .activity,
   coordinate: .init(latitude: 37.78528, longitude: -122.42944)),
 .init(title: "San Francisco Centre", subtitle: "Features a mix of popular retailers, designer brands, and dining—perfect for shopping and grabbing a bite downtown.", price: "$$", category: .activity,
   coordinate: .init(latitude: 37.78428, longitude: -122.40712)),
 .init(title: "Anchorage Square Mall", subtitle: "Offers casual dining, souvenir shops, and attractions near Fisherman’s Wharf—perfect for a relaxed stop while exploring the area.", price: "$$", category: .activity,
   coordinate: .init(latitude: 37.80750, longitude: -122.41782)),
 .init(title: "Embarcadero Center", subtitle: "Features shops, dining, and seasonal events—perfect for a scenic stroll and waterfront views.", price: "$$", category: .activity,
   coordinate: .init(latitude: 37.79848, longitude: -122.39848)),
 .init(title: "Stonestown Galleria", subtitle: "Offers a variety of shops, restaurants, and entertainment—perfect for a full day of shopping and dining.", price: "$$", category: .activity,
   coordinate: .init(latitude: 37.72803, longitude: -122.47709)),
 .init(title: "Fisherman's Wharf", subtitle: "A lively waterfront area with seafood spots, souvenir shops, and attractions—perfect for sightseeing and fresh clam chowder.", price: "$$", category: .landmark,
   coordinate: .init(latitude: 37.80844, longitude: -122.41575)),
 .init(title: "PIER 39", subtitle: "A bustling waterfront spot with shops, dining, sea lion viewing, and family-friendly attractions—perfect for a lively day out.", price: "$$", category: .landmark,
   coordinate: .init(latitude: 37.80867, longitude: -122.40982)),
 .init(title: "The Painted Ladies", subtitle: "Iconic Victorian houses with a stunning city backdrop—perfect for photos and a relaxing visit to Alamo Square.", price: "Free", category: .landmark,
   coordinate: .init(latitude: 37.77625, longitude: -122.43276)),
 .init(title: "Coit Tower", subtitle: "Panoramic city views and historic murals—perfect for sightseeing in San Francisco.", price: "$10", category: .landmark,
   coordinate: .init(latitude: 37.80239, longitude: -122.40582)),
 .init(title: "Exploratorium", subtitle: "An interactive science and art museum—perfect for hands-on learning and discovery.", price: "$30", category: .activity,
   coordinate: .init(latitude: 37.80167, longitude: -122.39735)),
 .init(title: "Legion of Honor", subtitle: "Features European art, ancient artifacts, and stunning architecture—perfect for art and history lovers.", price: "$15", category: .activity,
   coordinate: .init(latitude: 37.78452, longitude: -122.50076)),
 .init(title: "Yerba Buena Gardens", subtitle: "Offers peaceful green space, public art, and city views—perfect for relaxing or enjoying outdoor events.", price: "Free", category: .activity,
   coordinate: .init(latitude: 37.78499, longitude: -122.40235)),
 .init(title: "California Academy of Sciences", subtitle: "Features an aquarium, planetarium, rainforest dome, and natural history exhibits—perfect for all-ages exploration.", price: "$40", category: .activity,
   coordinate: .init(latitude: 37.76986, longitude: -122.46609)),
 .init(title: "Brenda's French Soul Food", subtitle: "Serves hearty Creole and Southern dishes like beignets, gumbo, and shrimp & grits—perfect for a flavorful comfort meal.", price: "$$", category: .food,
   coordinate: .init(latitude: 37.78291, longitude: -122.41890)),
 .init(title: "Golden boy Pizza", subtitle: "Famous for its thick, square Sicilian-style slices—perfect for a quick, satisfying bite. TAKE-OUT ONLY.", price: "$1-10", category: .food,
   coordinate: .init(latitude: 37.79973, longitude: -122.40809)),
 .init(title: "Sana'a cafe", subtitle: "Offers authentic Yemeni-style coffee infused with spices like cinnamon and cardamom, alongside freshly baked pastries and Middle Eastern treats—an inviting spot for flavorful sips and cozy bites.", price: "$10-20", category: .food,
   coordinate: .init(latitude: 37.78654, longitude: -122.39924)),
 .init(title: "Jane The Bakery", subtitle: "Known for its artisan breads, pastries, and sandwiches—perfect for a fresh, satisfying bite.", price: "$10-20", category: .food,
   coordinate: .init(latitude: 37.78379, longitude: -122.43429)),
 .init(title: "Arsicault Bakery", subtitle: "Famous for its buttery, flaky croissants and other French pastries—perfect for a decadent treat.", price: "$10-20", category: .food,
   coordinate: .init(latitude: 37.78083, longitude: -122.41335)),
 .init(title: "16th Avenue Tiled Steps", subtitle: "A vibrant mosaic staircase offering stunning art and panoramic city views—perfect for a scenic climb.", price: "Free", category: .landmark,
   coordinate: .init(latitude: 37.75624, longitude: -122.47323)),
 .init(title: "Lands End Lookout", subtitle: "Offers stunning coastal views, trails, and historic ruins—perfect for hiking and photography.", price: "Free", category: .landmark,
   coordinate: .init(latitude: 37.77927, longitude: -122.51159)),
 .init(title: "Sutro Baths", subtitle: "Historic ruins by the ocean, offering scenic views and walking trails—perfect for exploring and photography.", price: "Free", category: .landmark,
   coordinate: .init(latitude: 37.78044, longitude: -122.51365)),
 .init(title: "Golden Gate Park", subtitle: "A sprawling urban park with gardens, museums, and trails—perfect for outdoor activities and sightseeing.", price: "Free", category: .activity,
   coordinate: .init(latitude: 37.76892, longitude: -122.48298)),
 .init(title: "Fort Point", subtitle: "A historic Civil War–era fort beneath the Golden Gate Bridge—perfect for history buffs and stunning bridge views.", price: "Free", category: .landmark,
   coordinate: .init(latitude: 37.81061, longitude: -122.47709)),
 .init(title: "Crissy Field East Beach", subtitle: "Offers sandy shores, picnic spots, and Golden Gate Bridge views—perfect for relaxing or water sports.", price: "Free", category: .activity,
   coordinate: .init(latitude: 37.81061, longitude: -122.47709)),
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

#Preview {
 MapPage()

}
private let demoPins: [PlacePin] = [

