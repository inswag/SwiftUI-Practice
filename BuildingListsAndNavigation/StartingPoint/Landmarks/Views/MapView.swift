/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that presents a map.
*/

import SwiftUI
import MapKit

/*
    이 파일 내에서 coordinate 프로퍼티를 MapView에 추가하고 고정된 좌표를 전달해 p.p를 업데이트 하세요.
    
    이 변화는 또한 빌들에 영향을 끼칠 수 있어요 왜냐하면 Detail view 는 map view 를 가지고 있는데 얘도 새로운 파라미터를 필요로 하기 때문이죠. 곧 Detail View 를 고쳐볼게요.
 */

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    /*
        Step 5
        현재 좌표에 기반한 지역의 계산(calculation 을 트리거하는 Map에 onAppear 라는 뷰 modifier 를 추가할게요.
     */
    
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    // Step 4 - 좌표 값에 기반에 지역을 업데이트할 수 있도록 메서드를 추가할게요.
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion.init(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
