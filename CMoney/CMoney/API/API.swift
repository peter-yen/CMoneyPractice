import UIKit

class API {
    
    static let shared: API = API()
    
    func getJsonData(success: @escaping ([Data]) -> Void,
                     failure: @escaping (Error) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                failure(err)
                return
            }
            if let data = data {
                guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]] else { return }
                
                var newData: [Data] = []
                for dict in json {
                    let data = Data(dictionary: dict)
                    newData.append(data)
                }
                success(newData)
            }
        }.resume()
    }
    
    
    func downLoadImageURL(url: String,
                          success: @escaping (UIImage) -> Void,
                          failure: @escaping (Error) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                failure(err)
                return
            }
            if let data = data,
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    success(image)
                }
            }
        }.resume()
    }
    
}
