# Completed Project: Composing Complex Interfaces

Explore the completed project for the [Composing Complex Interfaces](https://developer.apple.com/tutorials/swiftui/composing-complex-interfaces) tutorial.

# App Design and Layout
## UI Control로 작업하기 (Working with UI Controls)

Landmarks 앱에서 사용자들은 자신의 성격을 표현하기 위한 프로필을 생성할 수 있어요. 자신의 프로필을 변경할 수 있도록 edit mode 를 추가하고 Preferences 화면을 디자인 해 볼게요.

data entry에 대한 다양한 common user inferface control들로 작업하고 Landmarks 모델 타입을 유저가 변경 사항을 저장할 때마다 업데이트 하도록 해볼게요.

In the Landmarks app, users can create a profile to express their personality. To give users the ability to change their profile, you’ll add an edit mode and design the preferences screen.

You’ll work with a variety of common user interface controls for data entry, and update the Landmarks model types whenever the user saves their changes.

## Section 1 - 유저 프로필 표시하기(Display a User Profile)

Landmarks 앱은 일부 configuration details와 preferences 를 로컬에 저장해요. 유저가 세부 정보를 편집하기 전에, 어떠한 편집 컨트롤을 가지지 않은 summary view에 세부 정보가 표시되도록 할게요.

The Landmarks app locally stores some configuration details and preferences. Before the user edits their details, they’re displayed in a summary view that doesn’t have any editing controls.

### TIP) 각 단계의 설명이 잘 이해되지 않는다면 코드를 작성 후 다시 보는 것이 큰 도움이 돼요.

### Step 1

유저 프로필을 Model 폴더에 새로운 Swift file 'Profile.swift' 에 정의하는 것으로 시작해볼게요. 
Start by defining a user profile in a new Swift file named Profile.swift that you add to your project’s Model group.

### Step 2

다음은 Profiles 이라는 폴더를 Views 폴더 아래에 생성하고 ProfileHost 라는 이름의 View 를 추가해볼게요. 저장된 프로필의 유저의 이름을 표시하는 텍스트 뷰의 역할을 해요.

* ProfileHost View는 프로필 정보의 정적 요약 보기와 편집 모드를 모두 호스팅해요.

Next, create a new group named Profiles under the Views group, and then add a view named ProfileHost to that group with a text view that displays the username of a stored profile.

The ProfileHost view will host both a static, summary view of profile information and an edit mode.

### Step 3

Profiles 폴더에 ProfileSummary 라는 이름의 View를 생성할게요. 이 뷰는 Profile 인스턴스를 가지고 있고 약간의 유저 기본 정보를 표시해요.

* Profile Summary 뷰는 profile 을 바인딩하는 대신 Profile 값을 가지는데 부모 뷰인 ProfileHost 뷰가 이 뷰에 대한 상태를 관리하기 때문이에요.

Create another view in the Profiles group named ProfileSummary that takes a Profile instance and displays some basic user information.

The profile summary takes a Profile value rather than a binding to the profile because the parent view, ProfileHost, manages the state for this view.

### Step 4

ProfileHost 뷰를 새로운 Summary 뷰를 표시하기 위해 업데이트 할게요.
Update ProfileHost to display the new summary view.

### Step 5

HikeBadge 라는 이름의 새로운 뷰를 Hikes 폴더에 생성할게요. 하이킹에 대한 설명 텍스트와 함께 Drawing Paths 및 Shapes 에서 Badge를 구성하기 위함이에요. 

배지는 단지 그래픽일 뿐이므로 HikeBadge의 텍스트와 accessibilityLabel(_:) modifier는 배지의 의미를 다른 유저들에게 더 명확하게 만들어줘요.

Note) badge의 드로잉 로직은 배지가 렌더링되는 프레임의 사이즈에 따라 결과를 만들어내요. 원하는 모양을 얻으려면 300X300 프레임으로 렌더링 해주세요. 최종 그래픽의 원하는 크기를 얻으려면, 렌더링된 결과의 크기를 조정하고 비교적 더 작은 프레임에 배치해주세요. 

Create a new view named HikeBadge in the Hikes folder that composes the Badge from Drawing Paths and Shapes along with some descriptive text about the hike.

The badge is just a graphic, so the text in HikeBadge along with the accessibilityLabel(_:) modifier make the meaning of the badge clearer to other users.

Note) The badge’s drawing logic produces a result that depends on the size of the frame in which it renders. To ensure the desired appearance, render in a frame of 300 x 300 points. To get the desired size for the final graphic, then scale the rendered result and place it in a comparably smaller frame.

### Step 6

ProfileSummary 를 업데이트하기 위해 다양한 색조와 배지 획득의 이유가 있는 몇 가지의 배지들을 추가할게요. 
Update ProfileSummary to add several badges with varying hues and reasons for earning the badge.

### Step 7

Animating Views and Transitions 에서 했던 HikeView 를 포함해 Profile Summary 뷰를 완성해주세요.

* hike 데이터를 사용하기 위해서는 environment object인 model data를 추가해주어야 해요.

Finish off the profile summary by including a HikeView from Animating Views and Transitions.

To use the hike data, you also need to add a model data environment object.

### Step 8

CategoryHome.swift에서 유저 프로필 버튼을 navigation bar 에 toolbar modifier 를 사용해 추가하고 유저가 탭했을 때 ProfileHost 뷰를 나타내 주세요.
In CategoryHome.swift, add a user profile button to the navigation bar using the toolbar modifier, and present the ProfileHost view when the user taps it.

### Step 9

listStyle modifier를 추가해 컨텐츠에 가장 알맞은 list style 을 픽할 수 있게 할게요.
Add the listStyle modifier to pick a list style that better suits the content.

### Step 10

라이브 프리뷰를 확인해주세요 그리고 프로필 버튼을 탭해서 Profile Summary 뷰를 테스트 해보세요.
Switch to the live preview and try tapping the profile button to examine the profile summary.

### Section 1 학습

* NavigationView 에 .toolBar modifier 를 통해 쉽게 버튼 추가가 가능하다.
* .sheet modifier 를 활용해 UIKit 의 기본 present 스타일을 활용한 다음 뷰 보기가 가능했다.
* 뷰 단위로 결합하는데 있어 SwiftUI 의 강점이 느껴졌다.
