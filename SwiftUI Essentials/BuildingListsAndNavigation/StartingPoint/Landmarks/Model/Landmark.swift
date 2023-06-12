//
//  Landmark.swift
//  Landmarks
//
//  Created by Insu Park on 2023/05/28.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

/**
Section 5 - Identifiable
 List 코드를 Landmark 타입에 identificable 을 준수하도록 추가함으로서 단순화한다.
 
 Landmark 의 데이터는 이미 identifiable 프로토콜에 의해 요구되는 id 프로퍼티를 가지고 있다. 여기서는 데이터를 읽을 때 디코딩 하기 위해서 필요하다.
 */

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    /**
        이미지 클래스 사용 차이
        UIKit -> UIImage 클래스 UImage.init(name: "")
        SwiftUI -> Image 구조체 Image("")
     **/
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2DMake(coordinates.latitude,
                                   coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
