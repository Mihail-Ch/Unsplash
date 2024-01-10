//
//  PresentationPhotoViewController.swift
//  PhotoSearch
//
//  Created by Михаил Чертов on 07.01.2024.
//

import UIKit

class PresentationPhotoViewController: UIViewController {

    var photo: String?
   
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        
        imageView.loadImage(by: photo ?? " ")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
    }
  
}
