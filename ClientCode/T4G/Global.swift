import Foundation
class Main {
    var name:String //The name of the class
    var calorie:Double = 0.0 //The calorie goal
    var calorieIntake:Double = 0.0 //The calories the user has consumed
    var desiredPlan:Int = 0 //Which plan the user has taken
    var message:String = ""
    var workouts:[String] = [] //The names of workouts taken from the database
    let lock = NSLock() //The lock to make sure the read/write is thread safe
  init(name:String) {
    self.name = name
    ServerController.getData(field: "workouts") //Gets the workouts from the server
  }
    func addWorkout(workoutName: String){
        lock.lock()
        workouts.append(workoutName)
        lock.unlock()
    }
    
}
var mainInstance = Main(name:"My Global Class")
