# Completed Project: Building Lists and Navigation

Explore the completed project for the [Building Lists and Navigation](https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation) tutorial.

# Start - Handling User Input

Landmarks 앱에서, 유저는 자신이 좋아하는 장소로 관심을 끌 수 있고 자신이 좋아하는 것을 보여주기 위해 리스트를 필터링 할 수 있어요. 이 기능을 생성하기 위해, 리스트에 스위치를 추가해 볼 거고 따라서 유저는 자신의 픽에 집중 할 수 있겠죠, 그리고 별 모양의 버튼을 추가해 유저가 자신의 픽으로서 랜드마크에 관심을 끌 수 있도록 버튼을 누를 수 있게 할거에요.

In the Landmarks app, a user can flag their favorite places, and filter the list to show just their favorites. To create this feature, you’ll start by adding a switch to the list so users can focus on just their favorites, and then you’ll add a star-shaped button that a user taps to flag a landmark as a favorite.


## Section 1 - 유저가 좋아하는 Landmark에 마킹하기 (Mark the User's favorite Landmarks)


사용자가 즐겨찾기를 한 눈에 볼 수 있도록 리스트를 개선하는 것부터 시작합니다. Landmark 구조에 프로퍼티를 추가해 랜드마크의 초기 상태를 즐겨찾기로 읽은 다음 즐겨찾는 랜드마크를 표시하는 각 LandmarkRow 에 별을 추가할게요.

Begin by enhancing the list to show users their favorites at a glance. Add a property to the Landmark structure to read the initial state of a landmark as a favorite, and then add a star to each LandmarkRow that shows a favorite landmark.

### Step 1

이전 프로젝트에 이어서 시작할게요. Landmark.swift 파일을 열어주세요.

### Step 2

isFavorite 프로퍼티를 Landmark 구조체에 추가해주세요.

landmarkData.json 파일은 각각의 랜드마크에 대한 이름을 가진 키를 가지고 있어요. Landmark 는 Codable을 준수하고 있기 때문에, 키와 같은 이름을 가진 새로운 프로퍼티를 생성함으로서 key 와 연관된 값을 읽을 수 있는 거에요. 
(The landmarkData.json file has a key with this name for each landmark. Because Landmark conforms to Codable, you can read the value associated with the key by creating a new property with the same name as the key.)

### Step 3

LandmarkRow.swift 파일을 열어주세요.


### Step 4

Spacer() 다음에 if 조건문 내에 별 이미지를 추가하해주세요. 현재의 랜드마크가 favorite 상태인지 아닌지 테스트하기 위함이죠.

SwiftUI 코드 블록에서, if 조건문을 뷰를 포함하기 위해 조건적으로 사용하는게 가능해요.


### Step 5

시스템 이미지들은 vertor 기반이어서, forgroundColor(_:) modifier 로 색상을 변경할 수 있어요.

별은 landmark 의 isFavorite 프로퍼티가 true 일 때마다 나타나요. 이번 튜토리얼에서 후에 프로퍼티를 어떻게 수정하는지 알게 될거에요.


## Section 2 - 리스트 뷰를 필터링하기


모든 landmark 혹은 유저가 픽한 landmark 만 보여 줄 수 있도록 list view 를 커스터마이징 할 수 있어요. 이렇게 하려면 LandmarkList 타입에 약간의 상태(State)를 추가해야 해요.

'State' 는 하나의 값(a value) 이거나 값의 집합(a set of values)으로, 시간이 지남에 따라 변경될 수 있고 뷰의 동작(behavoir), 콘텐츠(content), 레이아웃(layout)에 영향을 줄 수 있어요.

@State 어트리뷰트(attribute) 를 가지는 프로퍼티를 사용해 뷰에 상태(state) 를 추가해보세요.

### Step 1

LandmarkList.swift 파일로 돌아가 preview 를 단일로 변경해주세요.

### Step 2


@State를 showFavoritesOnly 라는 프로퍼티에 추가해주세요. 초기 값은 false 로 설정해요.

뷰와 뷰의 서브뷰에 알맞은 정보를 홀딩하기 위해 state 프로퍼티를 사용하기 때문에, 항상 state 를 private 으로 생성합니다.
(Because you use state properties to hold information that’s specific to a view and its subviews, you always create state as private.)

### Step 3

Canvas 를 리프레쉬 해주세요.

프로퍼티를 추가하거나 수정하는 것 과 같이 뷰의 구조에 변화를 줄 때, 수동적으로 Canvas 를 리프레쉬 해주어야 해요.

### Step 4

FavoritesOnly 프로퍼티와 각각의 landmark.isFavorite 값을 체크하여 Landmark 리스트의 필터링 된 버전을 계산해요. 

### Step 5

List 내에서 landmark 리스트의 필터링 된 버전을 사용해요.

### Step 6

showFavoritesOnly 의 초기값을 true 로 변경해 어떻게 리스트가 반응하는지 보세요.



## Section 3 - State 를 토글하기 위한 컨트롤 추가하기(Add a Control to Toggle the State)

유저가 리스트의 필터를 컨트롤 하기 위해서는 showFavoriteOnly 의 값을 대체(alter) 할 수 있는 컨트롤을 추가해야 해요. 이걸 바인딩한 값을 토글 컨트롤에 전달하는 식으로 해볼게요.

'Binding' 은 mutable state 에 대한 참조(reference)로 작동해요. 유저가 토글을 off에서 on 으로 그리고 다시 off 로 탭할 때 컨트롤은 binding으로 뷰의 스테이트를 적절히 업데이트하기 위해 사용해요.

To give the user control over the list’s filter, you need to add a control that can alter the value of showFavoritesOnly. You do this by passing a binding to a toggle control.

A binding acts as a reference to a mutable state. When a user taps the toggle from off to on, and off again, the control uses the binding to update the view’s state accordingly.


### Step 1

중첩된 ForEach 그룹을 각 열 내 랜드마크로 변형하기 위해 생성합니다.

리스트 내 정적, 동적 뷰들을 결합하기 위해 혹은 두 개 이상의 다른 그룹의 동적 뷰들을 결합하기 위해서 data collection 을 List 에 전달하는 것 대신 ForEach 타입을 사용해요.


### Step 2

Toggle 뷰를 List 뷰의 첫번째 자식 뷰로 추가해요, FavoritesOnly 를 나타내기 위해 바인딩으로 전달해요.
Prefix $ 를 state 변수 혹은 state 변수의 프로퍼티 중 하나에 대한 바인딩에 접근하기 위해 사용해요.

Add a Toggle view as the first child of the List view, passing a binding to showFavoritesOnly.
You use the $ prefix to access a binding to a state variable, or one of its properties.

### Step 3

위로 돌아와서, showFavoritesOnly 를 false 로 디폴트 값을 리턴합니다.

### Step 4

Preview 로 변경된 모습을 확인해보세요.


## Section 4 - 저장소 에서 Observable Object 사용하기 (Use an Observable Object for Storage)

유저가 어떤 특정 랜드마크를 픽했는지에 대한 컨트롤을 준비하기 위해, 먼저 landmark data 를 observable object에 저장할 거에요.

Observable object 는 여러분의 데이터에 대한 커스텀 객체인데  SwiftUI 환경의 저장소에서 뷰에 바인딩 될 수 있어요. SwiftUI는 뷰에 영향을 줄 수 있는 observable object 에 대한 모든 변화를 관찰하고 변화 후의 뷰에 현재 상태를 표시해요.


To prepare for the user to control which particular landmarks are favorites, you’ll first store the landmark data in an observable object.

An observable object is a custom object for your data that can be bound to a view from storage in SwiftUI’s environment. SwiftUI watches for any changes to observable objects that could affect a view, and displays the correct version of the view after a change.

### Step 1

ModelData.swift 파일을 선택하세요.

### Step 2

Combine 프레임워크로부터 ObservableObject 프로토콜을 준수하는 새로운 모델 타입을 선언하세요. 

SwiftUI는 observable object를 구독하고 데이터가 변경될 때 리프레시를 필요로 하는 모든 뷰를 업데이트해요.

### Step 3

Landmarks 배열을 모델로 옮겨주세요.

Observable object 는 데이터에 대한 모든 변경사항들을 publish 할 필요가 있고 변경사항들을 구독하는 것들은 변화를 pick up 할 수 있어요.

Observable Object는 Subscriber가 변경 사항을 선택할 수 있도록(can pick up) 데이터 변경 사항을 게시해야(publish) 합니다.

### Step 4

@Published 어트리뷰트를 Landmarks 배열에 추가합니다.

## Section 5 - 뷰에 Model Object 를 채택하기(Adopt the Model Object in Your Views)

이제 ModelData object 를 생성했으니, 앱에 데이터 저장소로서 객체를 뷰에 채택하도록 업데이트 해야 해요.

### Step 1

LandmarkList.swift 파일에서 @Environment Object 프로퍼티 선언을 뷰에 추가하고 environmentObject(_:) modifier 를 preview 에 추가하세요.

modelData 프로퍼티는 environmentObject(_:) modifier가 부모에 적용되는 한 자동으로 값을 가져와요. 

### Step 2

랜드마크를 필터링 할 때의 데이터로서 modelData.landmarks 를 사용하세요.

### Step 3

LandmarkDetail 뷰가 environment 내 ModelData 객체와 함께 작동할 수 있게 업데이트 합니다.

### Step 4

LandmarkRow 프리뷰를 ModelData object 와 함께 작동할 수 있게 업데이트 합니다.

### Step 5

ContentView 의 프리뷰도 객체가 모든 하위 뷰에 이용가능할 수 있게(available) 만들어주는 environment 에 model object 를 추가하도록 업데이트 합니다.

Preview 는 만약 모든 하위 뷰가 environment 내 model object 를 필요로 한다면 실패하지만, 프리뷰잉하고 이쓴ㄴ 뷰는 environmentObject(_:) modifier 를 가지지 않아도 됩니다.

-----------------

다음은, 디바이스 혹은 시뮬레이터에서 앱을 작동할 때, environment 내에 model object를 두기 위해, 앱 인스턴스를 업데이트 할거에요. 

### Step 6

LandmarksApp 을 model instance 를 생성하고 environmentObject(_:) modifier 를 사용해 ContentView 에 인스턴스를 공급할 수 있게 업데이트 할거에요. (Update the LandmarksApp to create a model instance and supply it to ContentView using the environmentObject(_:) modifier.)

@StateObject 어트리뷰트를 앱의 생애동안 오직 한번 해당 프로퍼티에 대해 model object 를 초기화하기(initialize) 위해 사용해요. 
여기에 보여지는 것 처럼 App Instance 내 어트리뷰트를 사용할 때 뷰 내에서 어트리뷰트를 사용할 때와 마찬가지로 언제나 맞는 이야기에요.
(Use the @StateObject attribute to initialize a model object for a given property only once during the life time of the app. This is true when you use the attribute in an app instance, as shown here, as well as when you use it in a view.)

### Step 7

LandmarkList.swift 파일로 돌아와서 live preview 를 켜 모든 것이 적절히 작동하는지 확인해보세요.


## Section 6 - 각각의 Landmark에 Favorite 버튼 생성하기(Create a Favorite Button for Each Landmark)

Landmarks 앱은 이제 랜드마크의 필터링된 뷰와 필터링 되지 않은 뷰를 스위칭할 수 있어요. 하지만 favorite landmarks 의 리스트는 여전히 하드코딩 되어 있어요. 유저가 favorite을 추가하거나 제거할 수 있게 하도록 favorite 버튼을 을 landmark detail 뷰에 추가할 필요가 있어요.

### Step 1

FavoriteButton.swift 이름의 새로운 뷰를 생성해요.

### Step 2

isSet 이라는 바인딩을 추가해요, 얘는 버튼의 현재 상태를 나타내고 프리뷰에 상수 값을 제공해요.

바인딩을 사용하고 있기 때문에 이 뷰 내에서 만들어지는 변화들은 데이터 소스로 다시 전파됩니다(propagate).

### Step 3

isSet 의 상태를 토글하고 상태에 따라 버튼의 외형이 변화하는 액션을 가진 버튼을 생성해요.

버튼의 레이블에 제공하는 문자열 타이틀은 UI에서는 나타나지 않아요 iconOnly 의 레이블 스타일을 사용한다면요. 하지만 VoiceOver는 접근성을 향상시키기 위해 레이블 스타일을 사용해요.

* 프로젝트가 진행될수록 폴더 계층을 나눠주는 것은 꼬ㅒ 좋은 아이디어에요. 진행하기 전에 정리하고 넘어가보죠.

### Step 4

일반적인 목적에 따라 Helpers 폴더의 CircleImage, MapView, FavoriteButton.swift 파일을 모으고 랜드마크 뷰들은 Landmarks 그룹에 모아주세요.

* 다음으로 FavoriteButton 을 detail view 에 추가할거에요. 주어진 landmark 의 isFavorite 프로퍼티에 버튼의 isSet 프로퍼티에 바인딩합니다. (Next, you’ll add the FavoriteButton to the detail view, binding the button’s isSet property to the isFavorite property of a given landmark.)

### Step 5

LandmarkDetail.swift 파일로 이동해 model data 와 함께 인덱스를 비교함으로서 input landmark 의 인덱스를 계산해주세요.

이것을 지원하기 위해서 environment's model data 에 접근할 필요가 있어요.

### Step 6

HStack 에 새로운 FavoriteButton 과 함께 임베드된 landmark의 이름은 달러 표시($)를 가진 isFavorite 프로퍼티에 대한 바인딩을 제공해요.

landmarkIndex 를 modelData 객체와 함께 버튼이 model object 에 저장된 랜드마크의 isFavorite 프로퍼티에 대한 업데이트를 보증할 수 있게 사용해주세요. (Use landmarkIndex with the modelData object to ensure that the button updates the isFavorite property of the landmark stored in your model object.)

### Step 7

LandmarkList.swift 로 돌아와 라이브 프리뷰를 확인하세요.

리스트에서 디테일로 이동하거나, 버튼을 탭하거나와 같이 이러한 변화들은 지속됩니다 여러분이 리스트로 돌아왔을 때 말이죠. 왜냐하면 양 뷰는 environment 내에서 같은 모델 객체를 접근하고 있기 떄문에, 두 개의 뷰는 동시성(consistency) 를 유지해요.






















