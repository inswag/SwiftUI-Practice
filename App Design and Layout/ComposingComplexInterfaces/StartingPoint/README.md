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


## Section 3 - 카테고리 열 생성하기(Create a Category Row)

Landmarks 는 수평으로 스크롤하는 하나의 열에 하나의 카테고리를 표시합니다. 새로은 뷰 타입을 추가하고 열을 나타내보세요, 새로운 뷰 안에 카테고리에 대한 모든 랜드마크를 표시합니다.

앞에서 만들었던 Landmark 뷰의 일부를 재사용해볼게요.

Landmarks displays each category in a row that scrolls horizontally. Add a new view type to represent the row, then display all the landmarks for that category in the new view.

Reuse parts of the Landmark view you created in Creating and Combining Views to create familiar previews of a landmark.

### Step 1

열의 콘텐츠를 가지는 역할을 하는 새로운 커스텀 뷰 CategoryRow를 정의할게요.
Define a new custom view CategoryRow for holding the contents of a row.

### Step 2

카테고리 내 아이템의 리스트와 카테고리 명을 가지는 프로퍼티를 추가할게요.
Add properties for the category name and the list of items in that category.

### Step 3

카테고리의 이름을 표시해요.
Display the name of the category.

### Step 4

HStack안에 카테고리의 아이템을 두고 VStack안에 카테고리 이름음과 함께 그룹핑할게요.
Put the category’s items in an HStack, and group that with the category name in a VStack.

### Step 5

긴 frame(width:height:)을 지정하고 padding을 추가하고 Scroll View에서 HStack을 래핑하여 콘텐츠에 약간의 공간을 제공합니다.

* 더 큰 데이터 샘플링으로 보기 미리 보기를 업데이트하면 스크롤 동작이 올바른지 더 쉽게 확인할 수 있습니다.

Give the content some space by specifying a tall frame(width:height:), adding padding, and wrapping the HStack in a scroll view.

Updating the view preview with a larger sampling of data makes it easier to ensure that the scrolling behavior is correct.

### Step 6

CategoryItem.swift 라 불리는 하나의 랜드마크를 표시하는 새로운 커스텀 뷰를 생성할게요. 
Create a new custom view called CategoryItem that displays one landmark.

### Step 7

CategoryRow.swift 에서 랜드마크 이름이었던 기존의 Text 를 새로운 CategoryItem 뷰로 수정해주세요.
In CategoryRow.swift, replace the Text that holds the landmark name with the new CategoryItem view.

### Section 3 학습

* 특이사항 없음

## Section 4 - Category View 완성하기

열들과 주요 이미지를 카테고리 홈 페이지에 추가해볼게요.
Add the rows and the featured image to the category home page.

### Step 1

카테고리 정보를 전달해 CategoryHome 의 바디 부분을 업데이트 할게요.
Update the body of CategoryHome to pass category information to instances of the row type.

Before Next Step) 다음으로, 주요 랜드마크를 뷰의 상단에 추가할게요. 이걸 하기 위해서는 landmark data 로부터 더 많은 정보가 필요해요. (Next, you’ll add a featured landmark to the top of the view. You’ll need more information from the landmark data to do this.)

### Step 2

Landmark.swift 파일에서 isFeatured 프로퍼티를 새롭게 추가할게요.
In Landmark.swift, add a new isFeatured property.

지금까지 추가해온 다른 랜드마크 프로퍼티들과 마찬가지로, 이 불리언 타입은 이미 데이터에 존재해요. 그냥 새로운 프로퍼티를 선언할 필요가 있는거죠.
* Like for other landmark properties you’ve added, this Boolean already exists in the data — you just need to declare a new property.

### Step 3

ModelData.swift 에서 새로운 연산 프로퍼티 'features' 배열을 추가해주세요 . 이 배열은 오직 isFeatured 가 true 로 설정되었을 때만 포함하게 됩니다.
In ModelData.swift, add a new computed features array, which contains only the landmarks that have isFeatured set to true.

### Step 4

CategoryHome.swift 에서 첫번째 주요 랜드마크의 이미지를 리스트의 상단에 추가할게요.

* 이후 튜토리얼에서 이 뷰를 대화형 캐러셀(interactive carousel)로 전환할거에요. 지금은 크기가 조정되고 잘린 미리보기 이미지와 함께 주요 랜드마크 중 하나를 표시할게요.

In CategoryHome.swift, add the image of the first featured landmark to the top of the list.

You’ll turn this view into an interactive carousel in a later tutorial. For now, it displays one of the featured landmarks with a scaled and cropped preview image.

### Step 5

콘텐츠가 디스플레이 가장 자리까지 확장 될 수 있도록 두 종류의 랜드마크 프리뷰에서 Edge insets을 0으로 설정할게요. 

Set the edge insets to zero on both kinds of landmark previews so the content can extend to the edges of the display.

### Section 4 학습

* 이미지 modifier 들에 대한 이해

## Section 5 - 섹션 사이에 네비게이션 추가하기(Add Navigation Between sections)

다르게 카테고리화된 모든 랜드마크가 뷰에 표시되므로, 유저는 앱의 각 섹션에 도달할 수 있는 방법이 필요해요. Navigation과 Presentation API를 사용해 CategoryHome, DetailView, Favorites list를 tab view에서 탐색할 수 있도록 할게요.

With all of the differently categorized landmarks visible in the view, the user needs a way to reach each section in the app. Use the navigation and presentation APIs to make the category home, the detail view, and favorites list navigable from a tab view.

### Step 1

CategoryRow.swift 에서 현재 CategoryItem을 NavigationLink로 래핑할게요.

* category item 은 그 자체로 버튼에 대한 레이블이며 그 목적지는 카드에 의해 표시된 랜드마크에 대한 landmark detail view 가 됩니다. 

In CategoryRow.swift, wrap the existing CategoryItem with a NavigationLink.

The category item itself is the label for the button, and its destination is the landmark detail view for the landmark represented by the card.

Before next step) 프리뷰를 고정하면 CategoryRow 에서 다음 단계의 효과를 볼 수 있어요. (Pin the preview so you can see the effect of the next step on the CategoryRow.)

### Step 2

renderingMode(_:) 와 foregroundColor(_:) modifier를 적용해서 Category item들의 navigation appearance를 변경할게요.

* Navigation Link의 Label로 전달하는 텍스트는 환경의 강조 색상을 사용하여 렌더링되며 이미지는 템플릿 이미지로 렌더링될 수 있어요. 설계에 가장 적합하도록 동작을 수정할 수 있어요.

Change the navigation appearance of the category items by applying the renderingMode(_:) and foregroundColor(_:) modifiers.

Text that you pass as the label for a navigation link renders using the environment’s accent color, and images may render as template images. You can modify either behavior to best suit your design.

Before Next Step) 다음으로 앱의 메인 content view를 수정해 사용자가 방금 만든 Category View와 기존 랜드마크 목록 중에서 선택할 수 있는 탭 뷰를 표시할게요.

Next you’ll modify the app’s main content view to show a tab view that lets the user choose between the category view you just created, and the existing list of landmarks.

### Step 3

Preview 고정을 해제하고, ContentView로 이동해 tab을 표시하기 위한 열거형을 추가할게요.
Unpin the preview, switch to the ContentView and add an enumeration of the tabs to display.

### Step 4

State 변수를 탭 선택을 위해 추가할게요 그리고 기본 값을 .featured 로 주도록 할게요.
Add a state variable for the tab selection, and give it a default value.

### Step 5

Tab View 를 생성해 LandmarkList 와 CategoryHome 을 다음과 같이 래핑할게요.

* 각 뷰의 tag(_:) modifier는 selection 프로퍼티가 가질 수 있는 가능한 값들 중 하나와 매칭돼요 그래서 TabView는 유저가 UI에서 선택을 했을 때 어떤 뷰가 표시 될 지 조정할 수 있어요.

Create a tab view that wraps the LandmarkList, as well as the new CategoryHome.

The tag(_:) modifier on each of the views matches one of the possible values that the selection property can take so the TabView can coordinate which view to display when the user makes a selection in the user interface.

### Step 6

각 tab에 label 을 줄게요.
Give each tab a label.

### Step 7

라이브 프리뷰를 시작해 새로운 네비게이션을 시도해보세요.
Start the live preview and try out the new navigation.

### Section 5 학습

* UITabViewController 대신 ContentView 에서 간단히 TabView 를 생성하고 modifier 를 이용해 쉽게 구현이 가능했다.
* 각 탭은 역시 enum 으로 관리해야 제맛..

## Check Your Understanding 

Q 1 of 3

Landmarks 앱의 root view 는 어떤 view 인가요?

A 1 of 3

ContentView 
* app body에 정의된 WindowGroup scene은 app 의 root view 로서 ContentView 를 선언하고 있어요.

Q 2 of 3
ContentView 는 어떻게 app의 나머지로부터 코드를 사용하나요?

A 2 of 3
Number 3 -> ContentView는 navigation hierarchy 안에서 모든 landmark view들과 연결되어 있다.
Landmarks 앱은 navigation view들을 포함해 모든 뷰들의 합이다.

Q 3 of 3
NavigationLink 내 뷰를 전환하기 위한 올바른 코드는 무엇인가요?

A 3 of 3
Number 2 -> Navigation Link { destination }, { label } 
* 목적지와 레이블 둘 다 view builder closure 에 나타납니다.

 
