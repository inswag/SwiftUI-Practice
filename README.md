# SwiftUI-Practice
inswag's SwiftUI Tutorial Practice Repository

## SwiftUI를 공부하면서 느낀 중요 개념 정리

### State 

1. State는 하나의 값(a value)이거나 값의 집합(a set of values) 이면서 시간이 흘러가면서 바뀔 수 있다. 그리고 State는 뷰의 동작(Behavior), 내용(Content), 레이아웃(Layout) 에 영향을 준다.

2. State를 뷰에 추가하려면 @State attribute와 함께 하는 하나의 프로퍼티(property)를 사용하면 된다. 

3. State Property를 사용하여 View와 View의 Subviews에 특정 정보(information that's specific)을 보유하기 때문에, 이러한 경우에는 항상 state property를 'private' 으로 생성한다.

### Observable Object

1. Observable object는 SwiftUI의 환경(SwfitUI's Environment)에서 저장소(Storage)로부터 바인딩 될 수 있는(can be bound to) 데이터에 대한 사용자 정의 객체(a custom object)이다. SwfitUI는 뷰에 영향을 줄 수 있는 observable object들에 대한 모든 변화(any changes)를 감시하고(watches), 변화가 생긴 후의 뷰의 정확한 상태를 표시한다.

2. Observable Object를 사용하려면 Combine 프레임워크를 import 해주어야 한다.

3. SwiftUI는 생성한 observable object를 구독(Subscribe)하고 데이터에 변화가 있을 때마다 리프레쉬가 필요한 모든 뷰를 업데이트 한다.

### Published 복습

1. Observable Object는 데이터에 대한 모든 변화를 퍼블리싱할 필요가 있는데, 그렇게 해야 Subscriber들이 그 변화를 픽업할 수 있기 때문이다. 따라서 ObservableObject 를 채택한 클래스 내 변수에 @Published 어트리뷰트(attribute)를 추가한다.

### EnvironmentObject Attribute

### @StateObject Attribute

1. @StateObject attribute을 사용해 앱의 생애 주기 동안 오직 한번만 지정된 프로퍼티에 대한 모델 객체를 초기화(initialize) 합니다. 앱 인스턴스(App Instance, @main 엔트리 포인트)에서 이 어트리뷰트를 사용할 때와 View에서 이 어트리뷰트를 사용할 때도 마찬가지이다.

### @Binding Attribute

Binding Attribute를 사용하기 때문에, 뷰 내에서 만들어진 변경 내용들은 데이터 소스로 다시 전파된다.

