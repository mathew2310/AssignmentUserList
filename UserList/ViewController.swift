//
//  ViewController.swift
//  UserList
//
//  Created by admin on 03/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users: [User] = []
    //var decodedResponce = [UserResponce] ()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //tableView.dataSource = self
        getUsers()
    }

    func getUsers(){
        
        
        let urlstr = "https://reqres.in/api/users"
        let url = URL(string: urlstr)
         
        guard url != nil else  {
            return
        }
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) {
            data, responce, error in
            
            let decoded = JSONDecoder()
            do{
                //let decodedResponce = try
                //JSONDecoder().decode(UserResponce.self, from: data!)
                let decodedResponce = try decoded.decode(UserResponce.self, from: data!)
                self.users = decodedResponce.data
               print("data")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{
                print(error.localizedDescription)
            }
            
        }
        datatask.resume()
    }
    
   

}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
        tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! userTableViewCell
        let user = users[indexPath.row]
        //cell.userId.text = String(users [indexPath.row].id)
        //cell.userEmail.text = users[indexPath.row].email
        cell.userFirstName.text = users [indexPath.row].first_name
        cell.userLastName.text = users[indexPath.row].last_name
        cell.userImage.downLoadImage(avatar: user.avatar)
        
        
        return cell
    }
    
}
