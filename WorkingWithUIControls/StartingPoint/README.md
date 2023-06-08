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


## Section 2 - 편집 모드 추가하기(Add an Edit Mode)

유저는 자신의 프로필 세부 정보를 보거나 편집하는 것 사이를 전환할 필요가 있어요. EditButton을 현재 ProfileHost에 추가하여 편집 모드를 추가해볼거에요 그리고 나서 각 값을 편집할 수 있는 컨트롤을 가진 뷰를 생성할거에요.

Users need to toggle between viewing or editing their profile details. You’ll add an edit mode by adding an EditButton to the existing ProfileHost, and then creating a view with controls for editing individual values.

### Step 1

ProfileHost 파일을 선택하고 프리뷰 코드에 environment object인 model data를 추가하세요.

* 이 뷰는 @EnvironmentObject 어트리뷰트를 가지는 프로퍼티를 사용하지 않지만, 이 뷰의 자식 뷰인 ProfileSummary 에서 사용해요. 그래서 modifier(.environmentObject(MOdelData()))가 없으면 프리뷰는 실패해요.

Select ProfileHost and add the model data as an environment object to the preview.

Even though this view doesn’t use a property with the @EnvironmentObject attribute, ProfileSummary, a child of this view, does. So without the modifier, the preview fails.

### Step 2

environment 의 \.editModel 키를 끄는 Environment 뷰 프로퍼티를 추가할게요.

* SwiftUI는 . @Environmnet 프로퍼티 랩퍼를 사용해 environment 내에 접근할 수 있는 값을 위한 저장공간을 제공해요. editMode 값에 접근해 편집 범위를 읽거나 씁니다.

Add an Environment view property that keys off of the environment’s \.editMode.

SwiftUI provides storage in the environment for values you can access using the @Environment property wrapper. Access the editMode value to read or write the edit scope.

### Step 3

Environment의 editMode 값을 온 오프 하는 편집 버튼을 생성할게요.
* EditButton은 이전 단게에서 엑세스한 것과 동일한 editMode environment value 를 제어해요.

Create an Edit button that toggles the environment’s editMode value on and off.
The EditButton controls the same editMode environment value that you accessed in the previous step.

### Step 4

ModelData 클래스로 돌아가 심지어 유저가 프로필 뷰를 사라지게 한 후에도 지속되는 유저 프로필 인스턴스를 포함하기 위해 이 클래스를 업데이트 해줄게요.

Update the ModelData class to include an instance of the user profile that persists even after the user dismisses the profile view.

### Step 5

Environment 로부터 유저 프로필 데이터를 읽어 ProfileHost 에 데이터의 통제를 전달할게요.

* 유저가 이름을 입력하는 동안과 같이 편집 내용을 확인하기 전에 global app state가 업데이트되지 않도록 editing view 는 자체 복사본에서 작동해요.

Read the user’s profile data from the environment to pass control of the data to the profile host.

To avoid updating the global app state before confirming any edits — such as while the user enters their name — the editing view operates on a copy of itself.

### Step 6

정적 프로필 혹은 편집 모드를 위한 뷰를 표시하는 conditional view 를 추가할게요.

* 라이브 미리보기를 실행하고 편집 버튼을 누르면 편집 모드로 전환되는 효과를 볼 수 있어요. 현재 편집 모드 보기는 정적 텍스트 필드에 불과해요.

Add a conditional view that displays either the static profile or the view for Edit mode.

You can see the effect of entering edit mode by running the live preview and tapping the edit button. For now, the Edit mode view is just a static text field.

### Section 2 학습

* State 복습

1. State는 하나의 값(a value)이거나 값의 집합(a set of values) 이면서 시간이 흘러가면서 바뀔 수 있다. 그리고 State는 뷰의 동작(Behavior), 내용(Content), 레이아웃(Layout) 에 영향을 준다.

2. State를 뷰에 추가하려면 @State attribute와 함께 하는 하나의 프로퍼티(property)를 사용하면 된다. 

3. State Property를 사용하여 View와 View의 Subviews에 특정 정보(information that's specific)을 보유하기 때문에, 이러한 경우에는 항상 state property를 'private' 으로 생성한다.

* Observable Object 복습

1. Observable object는 SwiftUI의 환경(SwfitUI's Environment)에서 저장소(Storage)로부터 바인딩 될 수 있는(can be bound to) 데이터에 대한 사용자 정의 객체(a custom object)이다. SwfitUI는 뷰에 영향을 줄 수 있는 observable object들에 대한 모든 변화(any changes)를 감시하고(watches), 변화가 생긴 후의 뷰의 정확한 상태를 표시한다.

2. Observable Object를 사용하려면 Combine 프레임워크를 import 해주어야 한다.

3. SwiftUI는 생성한 observable object를 구독(Subscribe)하고 데이터에 변화가 있을 때마다 리프레쉬가 필요한 모든 뷰를 업데이트 한다.

* Published 복습

Observable Object는 데이터에 대한 모든 변화를 퍼블리싱할 필요가 있는데, 그렇게 해야 Subscriber들이 그 변화를 픽업할 수 있기 때문이다. 따라서 ObservableObject 를 채택한 클래스 내 변수에 @Published 어트리뷰트(attribute)를 추가한다.

* EnvironmentObject Attribute

* @StateObject

@StateObject attribute을 사용해 앱의 생애 주기 동안 오직 한번만 지정된 프로퍼티에 대한 모델 객체를 초기화(initialize) 합니다. 앱 인스턴스(App Instance, @main 엔트리 포인트)에서 이 어트리뷰트를 사용할 때와 View에서 이 어트리뷰트를 사용할 때도 마찬가지이다.

* @Binding Attribute

Binding Attribute를 사용하기 때문에, 뷰 내에서 만들어진 변경 내용들은 데이터 소스로 다시 전파된다.

## Section 3 - 프로필 에디터 정의하기(Define the Profile Editor)

유저 프로필 에디터는 주로 서로 다른 컨트롤들로 구성돼요. 이 컨트롤들은 프로필 내 각각의 세부 사항들을 변화시킵니다. 프로필 내 일부 항목들(ex. 여러 뱃지들)은 유저의 편집이 불가능해요. 그래서 이 항목들은 에디터 모드에서는 보일 필요가 없어요.

프로필 요약과의 일관성을 위해, 프로필 세부 사항들을 편집 모드에서도 같은 순서로 추가해보죠. 

The user profile editor consists primarily of different controls that change individual details in the profile. Some items in the profile, like the badges, aren’t user-editable, so they don’t appear in the editor.

For consistency with the profile summary, you’ll add the profile details in the same order in the editor.

### Step 1

ProfileEditor라는 이름의 새로운 뷰를 생성하고 유저 프로필의 초안 사본에 대한 바인딩을 포함할게요.

뷰의 첫 컨트롤은 텍스트 필드에요 얘는 문자열 바인딩을 컨트롤하고 업데이트 해요. 이 경우에는, 유저가 선택한 디스플레이 상에 표시되는 이름이에요. 텍스트 필드를 생성할 때 문자열과 바인딩과 레이블을 제공해 주세요.

Create a new view named ProfileEditor and include a binding to the draft copy of the user’s profile.

The first control in the view is a TextField, which controls and updates a string binding — in this case, the user’s chosen display name. You provide a label and a binding to a string when creating a text field.

### Step 2

ProfileHost 에 조건적인 컨텐츠(conditional content)를 업데이트해 프로필 에디터를 포함하고 프로필 바인딩에 따라 전달할게요.

* 이제 편집 프로필 뷰를 Edit 를 탭할 때 표시합니다.

Update the conditional content in ProfileHost to include the profile editor and pass along the profile binding.

Now the edit profile view displays when you tap Edit.

### Step 3

랜드마크와 관련된 이벤트에 대한 알림을 수신하기 위한 유저의 preference 와 상응하는 토글을 추가해주세요.

* 토글은 on 또는 off중 둘 중 하나인 컨트롤이에요. 그래서 토글은 yes 또는 no 에 대한 preference 와 같은 Boolean 값에 아주 어울리는 친구죠.

Add a toggle that corresponds with the user’s preference for receiving notifications about landmark-related events.

Toggles are controls that are either on or off, so they’re a good fit for Boolean values like a yes or no preference.

### Step 4

VStack 안에 레이블 피커 컨트롤을 위치시킬게요. 랜드마크 사진들이 선택 가능한 선호 계절을 가지게 만들어줄 수 있죠.

Place a Picker control and its label in a VStack to make the landmark photos have a selectable preferred season.

### Step 5

마지막으로 DatePicker 를 계절 셀렉터 아래에 추가할게요. Landmark visitation goal date 를 수정가능하게 만들어 주는 친구에요.

Finally, add a DatePicker below the season selector to make the landmark visitation goal date modifiable.

### Section 3 학습

* Toggle, Picker, DatePicker 사용법 학습
* 바인딩 개념의 이해


## Section 4 - 편집 전파를 딜레이하기 (Delay Edit Propagation)

편집 모드를 유저가 종료한 후까지 편집 내용이 적용되지 않도록 편집하는 동안 프로필의 초안 사본을 사용하고, 유저가 편집을 확인한 경우에만 편집 초안을 진짜 사본에 할당해요.

To make it so edits don’t take effect until after the user exits edit mode, you use the draft copy of their profile during editing, then assign the draft copy to the real copy only when the user confirms an edit.

### Step 1

취소 버튼을 ProfileHost 뷰에 추가할게요.

EditButton이 제공하는 Done 버튼과는 달리, 취소 버튼은 클로저 내 진짜 프로필 데이터에 편집 내용을 적용하지 않아요.

Add a cancel button to ProfileHost.

Unlike the Done button that EditButton provides, the Cancel button doesn’t apply the edits to the real profile data in its closure.

### Step 2

opAppear(perform:) 과 onDisappear(perform:) modifier 를 적용해 편집기를 올바른 프로필 데이터로 채우고 유저가 Done 버튼을 누를 때 영구 프로필을 업데이트 할게요.

* 다른 방법으로, 이전 값을 편집 모드가 활성화되었을 떄 나타나게 합니다.

Apply the onAppear(perform:) and onDisappear(perform:) modifiers to populate the editor with the correct profile data and update the persistent profile when the user taps the Done button.

Otherwise, the old values appear the next time edit mode activates.


### Check Your Understanding 

Q 1 of 3

편집 상태에 변경이 발생했을 때 뷰를 어떻게 없데이트 할까요? 예를 들면 유저가 자신의 프로필을 편집한 후에 Done 버튼을 눌렀어요.

A 1 of 3

Number 2.
이 코드는 environment 내에 저장된 편집 모드를 체크해요. Environment내에 편집 모드를 저장하는 것은 유저가 편집 모드에 들어가거나 종료할 떄 여러 뷰를 업데이트하는 것을 단순하게 만들어 줘요.

Q 2 of 3

accessibility(label:) modifier를 사용해 accessibility label 을 언제 추가할까요?

A 2 of 3

Number 1 (X) - 앱의 유저 인터페이스에서 뷰가 의미있는 부분일 때에만 오직 accessibility label 을 추가해야 해요. 항상 VoiceOver를 on 상태로 테스트하세요.

Number 2 (O) - VoiceOver가 on 상태로 항상 앱을 테스트 해주세요. 그리고 앱의 뷰가 필요한 곳에 accessibility label들을 추가해주세요.

Q 3 of 3

Modal 과 non-modal view presentation 사이의 차이는 무엇인가요?

A 3 of 3

Number 2 - 뷰를 non-modally로 present 할 때, 목적 뷰는 source view를 cover하고 현재의 네비게이션 스택을 대체한다.
(오답 해설) - 뷰를 non-modally로 present 할 때, SwiftUI는 목적 뷰를 네비게이션 스택에 추가해요.

Number 3 - 뷰를 modally로 present 할 때, 목적 뷰는 source view를 커버하고 현재의 navigation stack을 대체한다.
(정답) - 뷰를 modally로 present 합니다. 앱의 일반적인 플로우에서 벗어나고자 원할 때

### Section 5 학습

* accessibility(label:)에 대한 사용 시점에 대한 학습
* 뷰를 non-modally 혹은 modally 하게 present 하는 경우 destination View 가 위치하는 지점에 대한 학습


