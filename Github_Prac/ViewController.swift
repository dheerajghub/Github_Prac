//
//  ViewController.swift
//  Github_Prac
//
//  Created by Dheeraj Kumar Sharma on 08/02/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGithubUser()
    }
    
    func fetchGithubUser(){
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.github.com"
        urlComponents.path = "/users/dheerajghub"
        guard let url = urlComponents.url else {
            preconditionFailure("Failed to construct URL")
        }
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
        }
        task.resume()
        
    }
    
}

