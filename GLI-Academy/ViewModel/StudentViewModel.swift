//
//  StudentViewModel.swift
//  GLI-Academy
//
//  Created by beni garcia on 17/01/24.
//

import Foundation
import UIKit

class StudentViewModel {
    var students: [Student] = []
    
    func setStudentData() {
        guard let imageProfile = UIImage(named: "profile") else {
            return
        }
        students = [
            Student(name: "Beni1", profilePicture: imageProfile, address: "Tangerang1"),
            Student(name: "Beni2", profilePicture: imageProfile, address: "Tangerang2"),
            Student(name: "Beni3", profilePicture: imageProfile, address: "Tangerang3"),
            Student(name: "Beni4", profilePicture: imageProfile, address: "Tangerang4"),
            Student(name: "Beni5", profilePicture: imageProfile, address: "Tangerang5"),
            Student(name: "Beni6", profilePicture: imageProfile, address: "Tangerang6"),
            Student(name: "Beni7", profilePicture: imageProfile, address: "Tangerang7"),
            Student(name: "Beni8", profilePicture: imageProfile, address: "Tangerang8"),
            Student(name: "Beni9", profilePicture: imageProfile, address: "Tangerang9"),
            Student(name: "Beni10", profilePicture: imageProfile, address: "Tangerang10"),
        ]
    }
}
