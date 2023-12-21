//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore


class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    var messages = [Message]()
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMessages()
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    func loadMessages() {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener({ querySnapshot, error in
            self.messages = []
            if error != nil {
                print("Warning \(String(describing: error))")
            } else {
                guard let snapshotDoc = querySnapshot?.documents else { return }
                for doc in snapshotDoc {
                    let data = doc.data()
                    guard let sender = data[K.FStore.senderField] as? String, let message = data[K.FStore.bodyField] as? String else { return }
                    let newMessage = Message(person: sender, message: message)
                    self.messages.append(newMessage)
                    DispatchQueue.main.async {
                        let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                        self.tableView.reloadData()
                        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                    }
                }
            }
        })
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        guard let person = Auth.auth().currentUser?.email, 
                let message = messageTextfield.text else { return }
        db.collection(K.FStore.collectionName).addDocument(data: [
            K.FStore.senderField: person,
            K.FStore.bodyField: message,
            K.FStore.dateField: Date().timeIntervalSince1970
        ]) { error in
            if error != nil {
                print("Mistake save data \(String(describing: error))")
            } else {
                DispatchQueue.main.async {
                    self.messageTextfield.text = " "
                }
                print("Data is saved")
            }
        }
    }

    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel.text = message.message
        if message.person == Auth.auth().currentUser?.email {
            cell.avatarSecondPerson.isHidden = true
            cell.avatarPerson.isHidden = false
            cell.cellView.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            cell.avatarPerson.isHidden = true
            cell.avatarSecondPerson.isHidden = false
            cell.cellView.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        return cell
    }
}
