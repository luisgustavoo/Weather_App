//
//  ViewController.swift
//  WeatherApp
//
//  Created by Luis Gustavo Vieira Santos on 30/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.image = UIImage(named: "background");
        imageView.contentMode = .scaleAspectFill;
        
        
        return imageView;
    }();
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = .white;
        view.layer.cornerRadius = 20;
        
        
        return view;
    }()
    
    
    private lazy var statsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityStackView, windStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.backgroundColor = UIColor(named: AssetsConstants.softGray)
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        return stackView
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = .systemFont(ofSize: 20);
        label.textColor = UIColor(named: AssetsConstants.primaryColor)
        label.text = "Belo Horizonte"
        label.textAlignment = .center
        
        return label;
    }();
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = .systemFont(ofSize: 70, weight: .bold);
        label.textColor = UIColor(named: AssetsConstants.primaryColor)
        label.text = "25ºC"
        label.textAlignment = .left
        
        return label;
    }();
    
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.image = UIImage(named: AssetsConstants.sunIcon);
        imageView.contentMode = .scaleAspectFill;
        
        
        return imageView;
    }();
    
    private lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = .systemFont(ofSize: 20, weight: .semibold);
        label.textColor = UIColor(named: AssetsConstants.contrastColor)
        label.text = "Humidade"
        return label;
    }();
    
    private lazy var humidityValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = .systemFont(ofSize: 20, weight: .semibold);
        label.textColor = UIColor(named: AssetsConstants.contrastColor)
        label.text = "1000mm"
        return label;
    }();
    
    private lazy var humidityStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [humidityLabel, humidityValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
//        stack.distribution = .fillEqually
        return stack;
    }()
    
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = .systemFont(ofSize: 20, weight: .semibold);
        label.textColor = UIColor(named: AssetsConstants.contrastColor)
        label.text = "Vento"
        return label;
    }();
    
    private lazy var windValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = .systemFont(ofSize: 20, weight: .semibold);
        label.textColor = UIColor(named: AssetsConstants.contrastColor)
        label.text = "10km/h"
        return label;
    }();
    
    private lazy var windStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
//        stack.distribution = .fillEqually
        return stack;
    }()
    

    
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
        view.addSubview(backgroundView);
        view.addSubview(headerView);
        view.addSubview(statsStackView)
        headerView.addSubview(cityLabel);
        headerView.addSubview(temperatureLabel);
        headerView.addSubview(weatherIcon);
//        humidityStackView.addArrangedSubview(humidityLabel)
//        humidityStackView.addArrangedSubview(humidityValueLabel)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor ),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor ),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor )
        ]);
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            headerView.heightAnchor.constraint(equalToConstant: 169)
        ]);
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
            cityLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26),
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 21)
        ])
        
        NSLayoutConstraint.activate([
            weatherIcon.heightAnchor.constraint(equalToConstant: 86),
            weatherIcon.widthAnchor.constraint(equalToConstant: 86),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -26),
            weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 15),
        ])
        
        
        NSLayoutConstraint.activate([
            statsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statsStackView.widthAnchor.constraint(equalToConstant: 250),
//            statsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
//            statsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
          
            
        ])
    }
    
    
}

