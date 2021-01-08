import Foundation

class Data {
    var id: Int
    var title: String
    var thumbnailURL: String
    
    init(id: Int, title: String, thumbnailURL: String) {
        
        self.id = id
        self.title = title
        self.thumbnailURL = thumbnailURL
    }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as! Int
        self.title = dictionary["title"] as! String
        self.thumbnailURL = dictionary["thumbnailUrl"] as! String
    }
    
}
