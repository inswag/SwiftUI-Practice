//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Insu Park on 2023/05/29.
//  Copyright © 2023 Apple. All rights reserved.
//

/**
 Section 6 - Set Up Navigation Between List and Detail
 
 리스트가 적절히 렌더링되었지만, 아직 랜드마크의 디테일 페이지를 볼 수 있도록 각 랜드마크를 탭할 수 없다.
 
 Navigation View 에 List 를 임베딩하고 목적지 view 에 트랜지션을 설정 하기 위한 NavigationLink 에 각각의 row 를 중첩하여 List 에 Navigation capability 를 추가합니다.
 
 The list renders properly, but you can’t tap an individual landmark to see that landmark’s detail page yet.

 You add navigation capabilities to a list by embedding it in a NavigationView, and then nesting each row in a NavigationLink to set up a transtition to a destination view.
 
 들어가기 전에
 
 이전 튜토리얼에서 생성한 content 를 사용하는 detail view 를 준비하고 list 뷰를 보여주는 것 대신 main content view 를 업데이트 합니다.
 
 Prepare a detail view using the content you created in the previous tutorial and update the main content view to display the list view instead.
 */

import SwiftUI

struct LandmarkDetail: View {
    
    var landmark: Landmark
    
    var body: some View {
        // ContentView.swift 에 있던 내용을 복사
        
        // Vstack 제거, spacer 제거 -> ScrollView로 교체
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)

                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        
        // Step 10
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}

