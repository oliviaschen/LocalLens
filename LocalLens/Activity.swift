import Foundation
import SwiftData


struct Activity: Identifiable {
    // name of the activity
    let id = UUID()
    var name:String
    //image name
    var imageName:String
    var imageName2:String
    var imageName3:String
    // description of the activity
    var desc:String
    // cost will be represented with # of dollar signs: Free -> $-$$$$, a range of 0-5
    var costDisplay:String
    var district:String
    // to control the heart/like feature
    var isLiked:Bool
    
    init(name:String="Activity Name", imageName:String="", desc:String="desc. here", costRange:Int=0, district:String="district here") {
        self.name = name
        self.imageName = imageName
        self.imageName2 = imageName + "2"
        self.imageName3 = imageName + "3"
        self.desc = desc
        costDisplay = String(repeating: "$", count: costRange)
        self.district = district
        //false/unliked heart on default
        self.isLiked = false
    }
}
