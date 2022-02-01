//
//  CourseCell.swift
//  HomeWorkLesson2.10
//
//  Created by Олейник Богдан on 30.01.2022.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    
    func configure(with course: Course) {
        courseNameLabel.text = course.name
        numberOfLessons.text = "Number of lessons: \(course.number_of_lessons ?? 0)"
        numberOfTests.text = "Number of tests: \(course.number_of_test ?? 0)"
        
        // Смена потока, изначально происходит переход на страницу, а потом загрузка изображений чтобы переход не затормаживался 
        DispatchQueue.global().async {
            guard let url = URL(string: course.imageUrl ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            // Смена потока
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
            }
        }
    }
}
