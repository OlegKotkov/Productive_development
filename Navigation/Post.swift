

import Foundation
struct Post {
    
    
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
    
    static let samplePosts: [Post] = [
        Post(
            author: "Я убью тебя, лодочник",
            description: "Honda - 250 hp",
            image: "IMG_20210712_153337",
            likes: 5,
            views: 8
        ),
        Post(
            author: "6Соток",
            description: "Играть - Копать!!! Уборка урожая, прожарка и угар",
            image: "IMG_20211021_014845",
            likes: 1,
            views: 5
        ),
        Post(
            author: "MoonShiners",
            description: "Приустал - прибухни",
            image: "moonshiners",
            likes: 6,
            views: 10
        ),
        Post(
            author: "Вася Ложкин",
            description: "Новости",
            image: "Вася Новости",
            likes: 7,
            views: 11
        )
    ]
    

    
}

