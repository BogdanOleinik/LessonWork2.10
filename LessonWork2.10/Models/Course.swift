//
//  Course.swift
//  HomeWorkLesson2.10
//
//  Created by Олейник Богдан on 29.01.2022.
//

struct Course: Decodable {
    let name: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_test: Int?
}

struct WebsiteDescription: Decodable {
    let course: [Course]?
    let websiteDescription: String?
    let websiteName: String?
}



