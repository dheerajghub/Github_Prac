//
//  ViewController.swift
//  Github_Prac
//
//  Created by Dheeraj Kumar Sharma on 08/02/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

struct githubUser{
    
    var avatarUrl:String!
    var bio:String!
    var blog:String!
    var followers:Int!
    var following:Int!
    
    init(json:[String:Any]){
        avatarUrl = json["avatar_url"] as? String ?? ""
        bio = json["bio"] as? String ?? ""
        blog = json["blog"] as? String ?? ""
        followers = json["followers"] as? Int ?? -1
        following = json["following"] as? Int ?? -1
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGithubUser()
    }
    
    func fetchGithubUser(){
        
        let urlString = "https://api.github.com/users/dheerajghub"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                
                do{
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
                    
                    let user = githubUser(json: json)
                    print(user.avatarUrl ?? "")
                    
                } catch let jsonErr{
                    print("Error JSON serializing:" , jsonErr)
                }
            }
            
        }
        task.resume()
        
    }
    
}

