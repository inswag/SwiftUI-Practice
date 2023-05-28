//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Insu Park on 2023/05/28.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    // landmarkData.json 의 파일을 미리보기 하기 위해 읽어서 name 이 뜰 수 있었다. 기존이었으면 컴파일 후에 런타임에서 확인할 수 있었는데.. 장점인 것 같다.
    var landmark: Landmark
    
    var body: some View {
        HStack {
            // image.resizable() : Space 에 맞게 SwiftUI 가 이미지를 resizing
            // frame(width: , height:) : 강제로 크기를 맞춰줌
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            /**
             Spacer 구조체
            :  만약 Stack 내에 포함되어 있지 않다면 양 축(axis) 에 따라, 혹은 Stack Layout 의 주요 축(axiw)에 따라 expand 하는 flexible 한 공간을 제공한다.
             **/
            
            Spacer()
            
            // 여기까지 Section 2
        }
    }
    
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarks[0])
    }
}
