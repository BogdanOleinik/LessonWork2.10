//
//  ImageViewController.swift
//  HomeWorkLesson2.10
//
//  Created by Олейник Богдан on 29.01.2022.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Анимация для загрузки
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        // URL запрос
        fetchImage()
    }
    
    //
    private func fetchImage() {
        guard let url = URL.init(string: Link.imageURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data, let responce = responce else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            print(responce)
            
            guard let image = UIImage(data: data) else { return }
            
            // Поток
            DispatchQueue.main.async {
                self.imageView.image = image
                self.activityIndicator.stopAnimating()
            }
        }.resume()
    }
}
