//
//  ViewController.swift
//  Github_Prac
//
//  Created by Dheeraj Kumar Sharma on 08/02/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

struct githubUser: Decodable{
    
    //NOTE:- contants name should match with the json keys otherwise decoding will not work
    
    let avatar_url:String!
    let bio:String!
    let blog:String!
    let followers:Int!
    let following:Int!
    
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
                    
                    let user = try JSONDecoder().decode(githubUser.self, from: data)
                    print(user.avatar_url ?? "")
                    
                } catch let jsonErr{
                    print("Error JSON serializing:" , jsonErr)
                }
            }
            
        }
        task.resume()
        
    }
    
}

