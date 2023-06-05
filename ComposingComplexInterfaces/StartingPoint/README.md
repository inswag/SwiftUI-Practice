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