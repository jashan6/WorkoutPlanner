import Foundation

class ServerController{
    static func getData(field: String) {
        let server: String = "https://mcinerneyprograms.a2hosted.com/t4g/public/" + field + "?apikey=test"
        let url = URL(string: server)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request) {
          (data, response, error) in
          guard error == nil else {
            return
          }
          guard let json = data else {
            return
          }
          do {
            guard let items = try JSONSerialization.jsonObject(with: json, options: [])
              as? [[String: Any]] else {
              return
            }
            //Loop through the items and add each name to the workouts arra
            for item in items{
                mainInstance.workouts.append(item["name"] as! String)
            }
            
            
          } catch  {
            print("error trying to convert data to JSON")
            return
          }
        }
        task.resume()
        
    }

    static func getData(field:String, id: Int) {
        let server: String = "https://mcinerneyprograms.a2hosted.com/t4g/public/" + field + "/" + String(id) + "?apikey=test"
        let url = URL(string: server)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request) {
          (data, response, error) in
          guard error == nil else {
            return
          }
          guard let json = data else {
            print("Error: did not receive data")
            return
          }
          do {
            guard let item = try JSONSerialization.jsonObject(with: json, options: [])
              as? [String: Any] else {
              return
            }

            //Need to add what to do with the obtained item.
            
            
          } catch  {
            print("error trying to convert data to JSON")
            return
          }
        }
        task.resume()
    }
}
