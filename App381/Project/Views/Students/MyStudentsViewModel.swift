//
//  MyStudentsViewModel.swift
//  App381
//
//  Created by IGOR on 09/03/2024.
//

import SwiftUI
import CoreData

final class MyStudentsViewModel: ObservableObject {

    @Published var sportTypes: [String] = ["basketball", "football", "swim", "flexibility"]
    @Published var currentType = ""
    
    @AppStorage("myGroups") var myGroups: [String] = []

    @Published var gName: String = ""
    @Published var gAge: String = ""
    @Published var gType: String = ""
    @Published var gStudent: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var groups: [GroupModel] = []
    @Published var selectedGroup: GroupModel?

    func addGroup() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GroupModel", into: context) as! GroupModel

        loan.gName = gName
        loan.gAge = gAge
        loan.gType = gType
        loan.gStudent = gStudent

        CoreDataStack.shared.saveContext()
    }
    
    func fetchGroupss() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GroupModel>(entityName: "GroupModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.groups = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.groups = []
        }
    }
}

