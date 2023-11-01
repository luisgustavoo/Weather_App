//
//  ViewController.swift
//  WeatherApp
//
//  Created by Luis Gustavo Vieira Santos on 30/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var customView: UIView = {
        let view = UIView(frame: CGRect.zero)
        
        view.backgroundColor = UIColor.black;
        view.translatesAutoresizingMaskIntoConstraints = false;
        
        return view;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView();
    }
    
    private func setUpView(){
        view.backgroundColor = UIColor.red;
        
        setHierarchy();
        setConstraints();
        
    }
    
    private func setHierarchy(){
        view.addSubview(customView);
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100), customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50), customView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50), customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100) ]);
    }
    
    
}

