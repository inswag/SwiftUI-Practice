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

/*
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
 */

/*
 Section 8 - Generate Previews Dynamically
 
 다음으로 LandmarkList_Previews preview provider 에 코드를 추가할건데 다른 디바이스 사이즈에 리스트 뷰의 프리뷰를 렌더하기 위함이죠. 기본적으로 프리뷰는 active scheme 내에서 디바이스의 사이즈를 렌더링해요.
 프리뷰의 디바이스를 previewDevice(_:) modifier method 를 호출하여 변경할 수 있어요.
 */

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
        /*
            Xcode’s scheme menu 에 있는 모든 디바이스의 이름을 사용할 수 있어요.
            즉, iOS Simulator 에 기기가 추가되어 있어야 합니다.
         
            < ForEach >
            ForEach 는 Collection 타입에서 리스트와 같은 방식으로 작동하는데요, 이것은 child view(in stacks, lists, groups 등) 를 사용할 수 있는 어느 곳이든 ForEach 를 쓸 수 있다는 것을 의미해요. 여러분의 데이터의 요소들이 단순 values types 일 때(여기서 사용한 string 과 같이), 여러분은 \.self 를 key path 로서 identifier 로 사용할 수 있어요.
         
            < .previewDisplayName(deviceName) >
            디바이스 이름을 프리뷰에 레이블로 추가하세요. 여러 프리뷰를 추가할 때 디바이스 명으로 출력이 되기 때문에 매우 보기가 편해져요.
         */
        
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

