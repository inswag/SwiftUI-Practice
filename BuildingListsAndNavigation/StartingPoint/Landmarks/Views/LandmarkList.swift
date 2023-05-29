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

struct LandmarkList: View {
    var body: some View {
        List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}

// Section 4 - End
