//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Insu Park on 2023/05/29.
//  Copyright © 2023 Apple. All rights reserved.
//

/**
 Section 4 - Create the List of Landmarks

 SwiftUI의 List 타입을 사용할 떄, 플랫폼에 맞는 뷰의 리스트를 보여줄 수 있어요. List 의 요소들은 지금까지 만들었던 스택의 자식 뷰들과 같이 정적일 수 있고 혹은 동적으로도 생성될 수 있어요. 물론 정적으로 생성된 뷰와 동적으로 생성된 뷰를 섞어서 사용할 수 있어요.
**/

import SwiftUI

//struct LandmarkList: View {
//    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
//    }
//}
//
//struct LandmarkList_Previews: PreviewProvider {
//    static var previews: some View {
//        LandmarkList()
//    }
//}

// Section 4 - End

/**
 Section 5 - Make the List Dynamic
 
 List 의 요소들을 개별적으로 특정짓는 것 대신, collection 으로부터 직접 row 를 생성할 수 있어요.
 
 data collection 과 해당 colleciton 내 각각의 요소들에 대한 뷰를 제공하는 closure 를 전달해서 하나의 collection 의 요소들을 보여주는 리스트를 생성할 수 있어요. List 는 collection 의 각 요소를 전달된 closure 를 사용해서 child view 로 변환해요.
 **/

/**
 Step 1
 - List 는 식별 가능한 데이터와 함꼐 작동해요. 두 가지 방식 중 하나를 선택해 식별 가능한 데이터를 만들 수 있어요. 하나는 유니크하게 각 요소를 식별할 수 있는 하나의 프로퍼티로 데이터와 함께 하나의 key path 를 전달하는 것과, 여러분의 데이터 타입을 identifiable 프로토콜을 준수하도록 만드는 방법이 있어요.
 **/

struct LandmarkList: View {
    var body: some View {
//        List(landmarks, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
        // Landmark 에 identifiable 프로토콜을 추가했기 때문에 id 파라미터를 삭제할 수 있다.
        // Section 6 - Navigation View 추가
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            
            .navigationTitle("Landmarks")
            // Section 6 End
        }
        
        // 이제 Landmarks collection 에 직접 접근하여 사용 할 수 있다.
        // Section 5 End
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
