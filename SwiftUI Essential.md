# SwiftUI Essential

## 정리

### - @State 

1. State를 뷰에 추가하려면 @State 어트리뷰트를 앞에 붙여주는 프로퍼티(property)를 사용하면 된다. (Ex. @State prviate var propertyName: T)

2. SwiftUI는 값에 따라 뷰를 업데이트 한다. (automatically updates views that depend on the value.)

3. state 변수 앞에 $를 붙인다는 것은, 바인딩을 전달하는 것과 같다. 지도에 대한 좌표값이 state 로 선언되고 있고, body 에서 지도에 이 $state 형태로 값이 전달되도록 구현이 되어있다면, 유저가 지도를 사용할 때, 지도는 UI 내 현재 보여지는 지도의 일부와 일치시키기 위해 값을 업데이트 한다.

4. State는 하나의 값(a value)이거나 값의 집합(a set of values) 이면서 시간이 흘러가면서 바뀔 수 있다. 그리고 State는 뷰의 동작(Behavior), 내용(Content), 레이아웃(Layout) 에 영향을 준다.
 
5. State Property를 사용하여 View와 View의 Subviews에 특정 정보(information that's specific)을 보유하기 때문에, 항상 state property를 'private' 으로 생성한다.

### - List

1. List는 식별가능한(identifiable) 데이터와 함께 작동한다. 두 가지 방식 중 하나를 선택해서 만들 수 있다.

1-1. 각 요소를 유니크하게 식별할 수 있는 하나의 프로퍼티를 두어 키 경로로 데이터를 전달하는 방식(이 경우에는 리스트의 파라미터로 \.id 를 전달한다)
1-2. 사용하는 데이터 타입이 'Identifiable' 프로토콜을 준수하도록 하는 방식(예제 코드들을 살펴보면 이 방식을 많이 사용하는 것 같다. 이 방식을 사용할 경우 \.id 사용하던 것을 사용하지 않을 수 있음. 애플 예제에서는 Landmark 모델에 Identifiable 을 준수하도록 했다)

2. List 처럼 collection으로 부터 뷰를 동적으로 나타내기 위한 방법으로는 ForEach가 있다.

### - Group

1. Group과 Stack은 뷰와 다른 컨텐츠를 구성하기 위해 사용하지만 List 처럼 collection 으로부터 직접적으로는 사용할 수 없다.

### - Navigation View & Navigation Link
 
1. 리스트를 사용할 경우 NavigationView로 감싸게 되면 UIKit 에서 사용하던 UINavigationController 처럼 화면을 관리할 수 있게 된다.
 
2. 물론 저거로만 감싸면 안되고, NavigationLink 를 내부에 선언해주어 목적지를 설정해줘야 한다.
 
3. NavigationLink는 선언 시 목적 뷰와 열의 컨텐츠를 제공한다.

### - Device Setting

1. 뷰를 미리보기 위해 디바이스를 설정하는 방식은 3가지가 있다.

1-1. 활성화된 scheme 내 선택된 시뮬레이터를 변경한다. 활성화된 scheme 에 선택된 현재 디바이스는 기본 프리뷰 디바이스이다.
1-2. 하나 이상의 디바이스를 previewDevice(_:) 메서드를 사용해서 정한다.
1-3. 개발 기기를 연결하고 디바이스 프리뷰 버튼을 클릭한다. 

Tip) Xcode's preference 에 들어가서 삽질하는 것을 피하자!

### - Observable Object

1. 리스트에 내가 좋아하는 요소에 대한 즐겨찾기를 선택하는 기능이 있고 그 값을 저장 및 해제하여 앱에서 보여준다고 하자. 어떻게 할 것인가? 모델에 직접 State를 추가하여 어떻게든 뷰를 새로 그린다는 것은 SwiftUI의 구조상 바람직하지 않을 것이다. 바로 여기에 대한 대답이 Observable Object 이다.

2. Observable Object는 SwiftUI의 환경(SwfitUI's Environment)에서 저장소(Storage)로부터 뷰에 바인딩 될 수 있는(can be bound to) 데이터에 대한 사용자 정의 객체(a custom object)이다. SwfitUI는 뷰에 영향을 줄 수 있는 observable object들에 대한 모든 변화(any changes)를 감시하고(watches), 변화가 생긴 후의 뷰의 정확한 상태를 표시한다.

3. 애플 예제에서 landmark 모델은 미리 만들어진 json 파일로부터 번들에서 로드하여 사용하는 구조로 되어 있었다.

4. 이 모델을 Observable Object 로 사용하기 위해 이를 준수하는 클래스 ModelData 를 만들어주었다.

5. Observable Object를 사용하기 위해서는 Combine 프레임워크를 import 해주어야 함을 잊지 말자.

6. Observable Object 는 데이터에서 변경되는 부분을 모두 퍼블리싱 하여 데이터의 변경을 알릴 필요가 있는데, 이떄 퍼블리싱 시키고 싶은 변수에 @Published 어트리뷰트를 추가해준다.

7. 예제에서는 LandmarkList 뷰에 Model Data 타입의 modelData 변수를 선언하는데, 이때 이 변수 앞에 @EnvironmentObject 어트리뷰트를 함께 사용한다. 이제 이 변수는 EnvironmentObject(_:) 수정자가 부모에 적용되는 한 자동으로 해당 값을 가져오게 된다.

8. 이제 이 modelData를 내가 원하는 기능을 구현하고자 하는 곳에서 사용하면 된다.

9. 물론 프리뷰에서도 이 변화를 보려면 previews 변수에도 알맞게 적용하면 된다.

10. model 객체를 환경에 추가하기 위해 ContentView의 프리뷰의 코드도 업데이트 해주어야 한다. 이것은 객채가 모든 서브 뷰에서 이용가능하도록 만들어준다.

11. 만약 어떤 서브 뷰가 환경 내 모델 객체를 필요로 한다면 프리뷰는 실패한다. 하지만 프리뷰잉 하는 뷰는 더이상 environmentObject(_:) 수정자를 가지지 않아도 된다.

### @Published Attribute

1. Observable Object는 데이터에 대한 모든 변화를 퍼블리싱할 필요가 있는데, 그렇게 해야 Subscriber들이 그 변화를 픽업할 수 있기 때문이다. 따라서 ObservableObject 를 채택한 클래스 내 변수에 @Published 어트리뷰트(attribute)를 추가한다.

### @StateObject Attribute with Observable Object

1. @StateObject 어트리뷰트를 사용해 앱의 생애 주기 동안 오직 한번만 지정된 프로퍼티에 대한 모델 객체를 초기화(initialize) 합니다. 앱 인스턴스(App Instance, @main 엔트리 포인트)에서 이 어트리뷰트를 사용할 때와 View에서 이 어트리뷰트를 사용할 때도 마찬가지이다.

### @Binding 어트리뷰트

1. Binding Attribute를 사용하기 때문에, 뷰 내에서 만들어진 변경 내용들은 데이터 소스로 다시 전파된다.

### @State ? @Binding ?

1. 값이 변경되었을 때 State나 Binding이나 뭔가 전파된다는 건 알겠는데, 그럼 둘 중 하나만 사용하면 안되나? 둘의 차이는 무엇일까? 하는 의문이 들 수 있다.

2. 리스트와 즐겨찾기를 온 오프하기 위한 토글 버튼이 있다고 하자, 그렇다면 이 리스트와 토글 버튼을 모두 가지고 있는 뷰가 있을 것이고 이 뷰에는 On/Off 상태를 가지는 State 프로퍼티가 있을 것이다.

3. 하나의 뷰에서는 굳이 @Binding 을 쓸 필요가 없겠지만, 토글 버튼을 재사용 뷰로 따로 만든다고 생각해보자. 

4. 만약 재사용 뷰로 따로 뺀 토글 버튼 뷰에도 토글 여부를 가리기 위한 변수가 필요할 것이고 이를 @State로 선언했다고 치자. 그리고 상위 뷰에 기존 리스트와 새로 뺀 토글 뷰를 붙여주었다.

5. 이 상황에서 상위 뷰에서 토글에 대한 값이 변경되었다면? 뷰를 당연히 새로 그릴 것이다. 이 상황에서 토글 뷰에 값이 들어간다면? 

6. @State 어트리뷰트가 붙었을 변수의 값이 변경되었을 때, 뷰를 새로 그린다는 것은 앞에서 배웠던 내용이다. 여기서 눈치가 빠른 사람은 이미 알아챘겠지만 상위뷰가 그려지고 또 토글 뷰는 또 뷰가 새로 그려질 것이다.

7. 그렇기 때문에 @State 변수의 값을 참조하는 하위 뷰의 값에는 @Binding 변수를 선언해서 부모 뷰에서 전달받은 값을 넣어주는 역할을 가지게 하는 것이다.

8. 물론 이 값은 바인딩되어있기 때문에 이 하위 토글 뷰에서 변경되는 값은 상위 뷰의 @State 프로퍼티로 흘러가게 된다.

### @EnvironmentObject ? environmentObject(_:) modifier ?

1. 뷰 계층 내에서 하향식으로 데이터가 전달되도록 하려면?

1-1. @EnvironmentObject : 뷰 계층 구조에서 아래에 있는 뷰에서 이 어트리뷰트를 사용하여 더 높은 뷰에서 데이터를 받습니다.
1-2. environmentObject(_:) Modifier : 하향식으로 데이터가 전달된다. 뷰 계층 구조의 더 아래에 있는 뷰가 환경을 통해 전달된 데이터 개체를 읽을 수 있도록 이 수정자를 적용합니다.



