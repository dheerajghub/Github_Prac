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
        
        fetchGithubData { (res) in
            
            switch res {
                case .success(let repoDetail):
                    print(repoDetail)
                case .failure(let err):
                    print("Error fetching repodetails" , err)
            }
        }
    }
    
    fileprivate func fetchGithubData(completion: @escaping (Result<[repoDetails] , Error>) ->()){
        
        let urlString = "https://api.github.com/users/dheerajghub/repos"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){ (data, resp, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            guard let data = data else { return }

            do{
                let repoDetail = try JSONDecoder().decode([repoDetails].self, from: data)
                completion(.success(repoDetail))
            } catch let jsonErr{
                completion(.failure(err!))
            }
            
        }.resume()
        
    }
    
}

