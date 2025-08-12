import Foundation

class Activity {
    // name of the activity
    var name:String
    // description of the activity
    var desc:String
    
    init(name:String="Activity Name", desc:String="desc. here") {
        self.name = name
        self.desc = desc
    }
}
