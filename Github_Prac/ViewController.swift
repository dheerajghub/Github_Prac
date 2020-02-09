//
//  ViewController.swift
//  Github_Prac
//
//  Created by Dheeraj Kumar Sharma on 08/02/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

struct UserDetail: Decodable{
    
    //NOTE:- contants name should match with the json keys otherwise decoding will not work
    let id:String!
    let userName:String!
    let login:String!
    let language:String!
    let followers:Int!
    
}

struct Users: Decodable{
    let users:[UserDetail]
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGithubUser()
    }
    
    func fetchGithubUser(){
        
        let urlString = "https://api.github.com/legacy/user/search/dheeraj"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                
                do{
                    
                    let user = try JSONDecoder().decode(Users.self, from: data)
                    print(user)
                    
                } catch let jsonErr{
                    print("Error JSON serializing:" , jsonErr)
                }
            }
            
        }
        task.resume()
        
    }
    
}

