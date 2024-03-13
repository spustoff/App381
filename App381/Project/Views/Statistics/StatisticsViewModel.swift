//
//  StatisticsViewModel.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI
import CoreData

final class StatisticsViewModel: ObservableObject {
    
    @AppStorage("totalSessions") var totalSessions: Int = 0
    @AppStorage("sessionsDuration") var sessionsDuration: Int = 0

    @AppStorage("myGroups") var myGroups: [String] = []
    @Published var curGroup = ""

    @Published var goalSName: String = ""
    @Published var goalAchievement: String = ""
    @Published var goalDescription: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var goals: [GoalModel] = []
    @Published var selectedGoal: GoalModel?

    func addGoal() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GoalModel", into: context) as! GoalModel

        loan.goalSName = goalSName
        loan.goalAchievement = goalAchievement
        loan.goalDescription = goalDescription

        CoreDataStack.shared.saveContext()
    }
    
    func fetchGoals() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GoalModel>(entityName: "GoalModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.goals = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.goals = []
        }
    }
}
