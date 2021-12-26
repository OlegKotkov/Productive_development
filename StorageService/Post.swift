
import Foundation
import UIKit
import iOSIntPackage
public struct Post {
    
    
    public let author: String
    public let description: String
    public let image: String
    public var likes: Int
    public var views: Int
    
    public static let samplePosts: [Post] = [
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



