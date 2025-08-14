import Foundation

class Activity {
    // name of the activity
    var name:String
    //image name
    var imageName:String
    var imageName2:String
    var imageName3:String
    // description of the activity
    var desc:String
    // cost will be represented with # of dollar signs: Free -> $-$$$$, a range of 0-5
    var cost:Int
    var district:String
    
    init(name:String="Activity Name", imageName:String="", desc:String="desc. here", cost:Int=0, district:String="district here") {
        self.name = name
        self.imageName = imageName
        self.imageName2 = imageName + "2"
        self.imageName3 = imageName + "3"
        self.desc = desc
        self.cost = cost
        self.district = district
    }
}
