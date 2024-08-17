//
//  BuildsViewModel.swift
//  App759
//
//  Created by IGOR on 11/08/2024.
//

import SwiftUI
import CoreData

final class BuildsViewModel: ObservableObject {
    
    @AppStorage("AccNames") var AccNames: [String] = []
    
    @AppStorage("Builds") var Builds: Int = 0
    @AppStorage("moneyAc") var moneyAc: Int = 0

    @Published var isAdd: Bool = false
    @Published var isAddAcc: Bool = false
    @Published var isAddAddedAcc: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var types: [String] = ["Actual", "Outdated"]
    @Published var currentType = "Actual"
    
    @Published var AccNameForAdd = ""
    
    @Published var accTypes: [String] = ["Motherboard", "Video card", "Body", "Processor", "Cooling system", "RAM", "Power supply", "Hard drive/HDD", "Other"]
    @Published var currentAccType = ""
    
    @Published var photos: [String] = ["c1", "c2"]
    @Published var currentPhoto = ""
    
    @Published var AccPhotos: [String] = ["ca1", "ca2", "ca3", "ca4"]
    @Published var currentAccPhoto = ""

    @Published var buPhoto = ""
    @Published var buType = ""
    @Published var buName: String = ""
    @Published var buDescr = ""
    @Published var buDate = ""
    @Published var buCost = ""
    @Published var buAcc = ""
    
    @Published var builds: [BuildModel] = []
    @Published var selectedBuild: BuildModel?

    func addBuild() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "BuildModel", into: context) as! BuildModel

        loan.buPhoto = buPhoto
        loan.buType = buType
        loan.buName = buName
        loan.buDescr = buDescr
        loan.buDate = buDate
        loan.buCost = buCost
        loan.buAcc = buAcc

        CoreDataStack.shared.saveContext()
    }

    func fetchBuilds() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<BuildModel>(entityName: "BuildModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.builds = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.builds = []
        }
    }
    
    @Published var accPhoto = ""
    @Published var accType: String = ""
    @Published var accName = ""
    @Published var accQuan: String = ""
    @Published var accCost = ""
    
    @Published var accessories: [AccessModel] = []
    @Published var selectedAccessory: AccessModel?

    func addAccessory() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "AccessModel", into: context) as! AccessModel

        loan.accPhoto = accPhoto
        loan.accType = accType
        loan.accName = accName
        loan.accQuan = accQuan
        loan.accCost = accCost

        CoreDataStack.shared.saveContext()
    }

    func fetchAccessories() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AccessModel>(entityName: "AccessModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.accessories = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.accessories = []
        }
    }
    
    @Published var acName: String = ""
    @Published var acPhoto: String = ""
    @Published var acBuild: String = ""
    
    @Published var AddeAccessories: [AddedAccModel] = []
    @Published var selectedAddedAccessory: AddedAccModel?

    func addAddedAccessory() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "AddedAccModel", into: context) as! AddedAccModel

        loan.acName = acName
        loan.acPhoto = acPhoto
        loan.acBuild = acBuild

        CoreDataStack.shared.saveContext()
    }

    func fetchAddedAccessories() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AddedAccModel>(entityName: "AddedAccModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.AddeAccessories = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.AddeAccessories = []
        }
    }
}
