/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that clips an image to a circle and adds a stroke and shadow.
*/

/**
 Section 7 - Pass Data into Child Views
 
 LandmarkDetial 뷰는 여전히 랜드마크를 보여주기 위해 하드코딩된 디테일을 사용하고 있어요.
 LandmarkRow 와 같이 LandmarkDetail 타입과 이를 구성하는 뷰는 데이터 소스로  landmark 프로퍼티를 사용해야 해요.
 
 자식 뷰부터 시작해서 CircleImage, MapView, LandmarkDetail을 변환하여 각 row 를 하드 코딩하기 보다는 전달된 데이터로 표시하도록 해볼거에요.
 */

import SwiftUI

struct CircleImage: View {
    
    /*
     image 프로퍼티를 추가하고 image 저장 프로퍼티를 CircleImage 에 추가했어요.
     
     이것은 SwiftUI 를 사용하여 뷰를 만들때의 일반적인 패턴이죠. 커스텀 뷰는 종종 특정 뷰에 대해 하나의 시리즈의 modifier들을 감싸고 캡슐화하게 될거에요.
     */
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    
    /*
        Turtle Rock 의 이미지를 전달하기 위해 p.p 를 업데이트 합니다.
     
        preview 로직을 fixed 했음에도 불구하고 preview 는 업데이트에 실패할 수 있어요. 왜냐하면 build 가 실패했기 때문이죠.
        circle 이미지를 인스턴스화 하는 디테일 뷰는 마찬가지로 input parameter 가 필요해요.
     */
    
//    static var previews: some View {
//        CircleImage()
//    }
    
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
