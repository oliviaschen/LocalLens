import Foundation

class Activity {
    // name of the activity
    var name:String
    //image name
    var imageName:String
    // description of the activity
    var desc:String
    // cost will be represented with # of dollar signs: Free -> $-$$$$, a range of 0-5
    var cost:Double
    var district:String
    
    init(name:String="Activity Name", imageName:String="", desc:String="desc. here", cost:Double=0, district:String="district here") {
        self.name = name
        self.imageName = imageName
        self.desc = desc
        self.cost = cost
        self.district = district
    }
}
