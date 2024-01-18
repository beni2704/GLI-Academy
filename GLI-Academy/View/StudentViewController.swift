//
//  StudentViewController.swift
//  GLI-Academy
//
//  Created by beni garcia on 17/01/24.
//

import Foundation
import UIKit

class StudentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var studentVM = StudentViewModel()
    var titleLabel = UILabel()
    var tableViewStudent = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentVM.setStudentData()
        setTitle()
        setTable()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentVM.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewStudent.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentTableViewCell
        
        let student = studentVM.students[indexPath.row]
        cell.nameLabel.text = student.name
        cell.profileImageView.image = student.profilePicture
        cell.addressLabel.text = student.address
        
        return cell
    }
    
    func setTitle() {
        titleLabel.text = "Student List"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        ])
    }
    
    func setTable(){
        tableViewStudent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableViewStudent)
        
        tableViewStudent.register(StudentTableViewCell.self, forCellReuseIdentifier: "StudentCell")
        tableViewStudent.delegate = self
        tableViewStudent.dataSource = self
        
        NSLayoutConstraint.activate([
            tableViewStudent.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableViewStudent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewStudent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewStudent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
