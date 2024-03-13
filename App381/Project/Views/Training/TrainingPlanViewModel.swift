//
//  TrainingPlanViewModel.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI
import CoreData

final class TrainingPlanViewModel: ObservableObject {

    @Published var days: [String] = ["8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26"]
    @Published var currentDay = ""
    
    @AppStorage("myGroups") var myGroups: [String] = []
    @Published var curGroup = ""
    
    @AppStorage("totalSessions") var totalSessions: Int = 0
    @AppStorage("sessionsDuration") var sessionsDuration: Int = 0

    @Published var trGroup: String = ""
    @Published var trDate: String = ""
    @Published var trPart: String = ""
    @Published var trDuration: String = ""
    @Published var trExercise: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var trainings: [TrainingModel] = []
    @Published var selectedTraining: TrainingModel?

    func addTraining() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TrainingModel", into: context) as! TrainingModel

        loan.trGroup = trGroup
        loan.trDate = trDate
        loan.trPart = trPart
        loan.trDuration = trDuration
        loan.trExercise = trExercise

        CoreDataStack.shared.saveContext()
    }
    
    func fetchTrainings() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TrainingModel>(entityName: "TrainingModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.trainings = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.trainings = []
        }
    }
}

