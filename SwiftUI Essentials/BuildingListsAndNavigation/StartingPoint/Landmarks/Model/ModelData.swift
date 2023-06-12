//
//  ModelData.swift
//  Landmarks
//
//  Created by Insu Park on 2023/05/28.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

// 번들에 있는 파일 이름을 읽어 디코딩 후 반환하는 함수
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Not find \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Not parse \(filename)")
    }
    
    
}
