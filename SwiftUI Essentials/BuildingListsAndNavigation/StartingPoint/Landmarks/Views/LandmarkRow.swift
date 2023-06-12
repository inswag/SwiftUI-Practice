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
        /**
         .previewLayout(<#T##value: PreviewLayout##PreviewLayout#>)
          - 리스트 내 하나의 열에 가까운 사이즈를 설정하는 역할 (set a size that approximates a row in a list.)
         
        Group 구조체
         - Views, scenes, commands 와 같은 하나의 content type 의 여러 인스턴스를 하나의 유닛으로 모으는 타입을 말한다. (Xcode Summary)
         - Group 은 하나의 컨테이너 이고 View content 를 그룹핑하기 위해 사용된다. Xcode 는 그룹의 자식 뷰들을 캔버스 내에 분리된 프리뷰로 렌더링한다.
         - Canvas 내에 Landmark Row 가 하나에서 두 개로 변경된 것을 알 수 있다.
         **/
        
        // Simplify Code - Before
        
//        Group {
//            LandmarkRow(landmark: landmarks[0])
//                .previewLayout(.fixed(width: 300, height: 70))
//            LandmarkRow(landmark: landmarks[1])
//                .previewLayout(.fixed(width: 300, height: 70))
//        }
        
        // Simplify Code - After
        
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
        
        // Simplify Code Point - A view’s children inherit the view’s contextual settings, such as preview configurations.
        
        
    
        
    }
}
