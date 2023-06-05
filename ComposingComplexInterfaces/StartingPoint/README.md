# Completed Project: Animating Views and Transitions

Explore the completed project for the [Animating Views and Transitions](https://developer.apple.com/tutorials/swiftui/animating-views-and-transitions) tutorial.


# App Design and Layout
## 복합 인터페이스 구성하기(Composing Complex Interfaces)

Landmarks 의 Category view는 수평으로 스크롤링하는 랜드마크의 수직 스크롤 리스트를 보여줍니다.
이 카테고리 뷰를 만들고 이미 존재하는 뷰들에 이 카테고리 뷰를 연결하기 때문에, 어떻게 구성된 뷰들이 서로 다른 디바이스의 사이즈와 방향에 적용될 수 있는지 살펴보게 될 거에요.

The category view for Landmarks shows a vertically scrolling list of horizontally scrolling landmarks. As you build this view and connect it to your existing views, you’ll explore how composed views can adapt to different device sizes and orientations.

## Section 1 - Category View 추가하기(Add a Category View)

Category 별로 landmark 를 정렬하는 뷰를 생성하고 뷰의 상단에 주요 landmark를 하이라이팅을 해 Landmark를 브라우징 하는 다른 방법을 제공할 수 있어요.

You can provide a different way to browse the landmarks by creating a view that sorts landmarks by category, while highlighting a featured landmark at the top of the view.


### Step 1

Views 폴더에 Categories 그룹을 생성하고 CategoryHome 이름의 커스텀 뷰를 생성한 그룹에 만들어주세요.

Create a Categories group in your project’s Views group, and create a custom view called CategoryHome to the new group.

### Step 2

NavigationView를 다른 카테고리들을 호스팅 하기 위해 추가해주세요.

Add a NavigationView to host the different categories.

* Navigation views를 NavigationLink 인스턴스와 관련 modifier들과 사용하여 앱에서 계층적 탐색 구조(hierarchical navigation structures)를 구축해요.

You use navigation views along with NavigationLink instances and related modifiers to build hierarchical navigation structures in your app.

### Step 3

Navigation bar 의 이름을 'Featured' 로 설정합니다.

* 뷰는 하나 이상의 주요 랜드마크를 보여줍니다.

Set the title of the navigation bar to Featured.

The view showcases one or more featured landmarks at the top.

### Section 1 학습

* 특이사항 없음



## Section 2 - 카테고리 리스트 생성하기(Create a Category List)

Category view는 쉽게 브라우징 하기 위해 수직 기둥으로 배열된 각각의 열에 모든 카테고리를 표시합니다. 수직 수평 Stack 을 결합해 이걸 해볼거고 리스트에 스크롤링 기능까지 추가해볼게요.

The category view displays all categories in separate rows arranged in a vertical column for easier browsing. You do this by combining vertical and horizontal stacks, and adding scrolling to the list.



* landmarkData.json 파일로부터 카테고리 데이터를 읽어들이는 것으로 시작할게요.(Start by reading category data from the landmarkData.json file.)

### Step 1

Landmark.swift 에서 landmark 구조체에 Category 열거형과 하나의 카테고리 프로퍼티를 추가할게요.

LandmarkData.json 파일은 이미 각 랜드마크에 대한 카테고리 값을 포함하고 있어요. 3개 중의 하나의 카테고리는 꼭 가지고 있어요.
데이터 파일의 이름과 일치시켜 구조의 Codable 적합성에 의존하여 데이터를 로드할 수 있어요.

In Landmark.swift, add a Category enumeration and a category property to the Landmark structure.

The landmarkData.json file already includes a category value for each landmark with one of three string values. By matching the names in the data file, you can rely on the structure’s Codable conformance to load the data.

### Step 2

ModelData.swift 파일에서 연산 프로퍼티이며 key 로서 카테고리 이름을 가지고 있으며 각 키가 연관된 랜드마크 배열을 가진 categories 딕셔너리를 추가할게요.

In ModelData.swift, add a computed categories dictionary, with category names as keys, and an array of associated landmarks for each key.

### Step 3

CategoryHome.swift 파일에서 environment 객체인 modelData 를 생성해 주세요.
* 바로 categories 에서 접근할 필요가 있어요. 후에 다른 landmark data 도 마찬가지구요.

In CategoryHome.swift, create a modelData environment object.
You’ll need access to the categories right now, as well as to other landmark data later.

### Step 4

List 를 사용해서 Landmarks 안에 카테고리를 표시할게요.
* Landmark.Category case 이름은 list의 각각의 아이템을 식별하고, 열거형이기 때문에 다른 카테고리 간데 고유성이 있어야 해요.

Display the categories in Landmarks using a List.

The Landmark.Category case name identifies each item in the list, which must be unique among other categories because it’s an enumeration.

### Sections 2 학습

* VStack과 HStack을 이용하여 다양한 레이아웃을 구성할 수 있다. (스크롤 추가도 가능하다)
* Codable을 준수하는 경우 역시나 이름을 일치시키는 것이 중요하다.
* environment object 를 선언해 modelData 에 쉽게 접근이 가능하다.
