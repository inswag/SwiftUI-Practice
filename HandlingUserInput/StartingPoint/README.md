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






























