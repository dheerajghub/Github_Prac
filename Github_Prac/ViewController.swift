//
//  ViewController.swift
//  Github_Prac
//
//  Created by Dheeraj Kumar Sharma on 08/02/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

struct repoDetails: Decodable{
    
    let id:Int!
    let name:String!
    let full_name:String!
    //NOTE:- As private is a predefine keyword , Escaping (`KEYWORD`) is necessary
    let `private`:Bool!
    let owner:OwnerDetails!
    let fork:Bool!
    
}

struct OwnerDetails: Decodable{
    let login:String!
    let id:Int!
    let avatar_url:String!
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGithubUser()
    }
    
    func fetchGithubUser(){
        
        let urlString = "https://api.github.com/users/dheerajghub/repos"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                
                do{
                    
                    let repoDetail = try JSONDecoder().decode([repoDetails].self, from: data)
                    print(repoDetail)
                    
                } catch let jsonErr{
                    print("Error JSON serializing:" , jsonErr)
                }
            }
            
        }
        task.resume()
        
    }
    
}

