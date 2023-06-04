# Completed Project: Drawing Paths and Shapes

Explore the completed project for the [Drawing Paths and Shapes](https://developer.apple.com/tutorials/swiftui/drawing-paths-and-shapes) tutorial.

# Drawing and Animation

# Animating Views and Transitions

SwiftUI를 사용할 때 뷰의 변경사항 또는 뷰의 상태이든 효과가 발생하는 어디든 각각 애니메이션을 줄 수 있어요.
SwiftUI는 이러한 결한되고 오버랩핑되고 중단될 수 있는 애니메이션들의 모든 복잡성을 다룬 수 있어요.

When using SwiftUI, you can individually animate changes to views, or to a view’s state, no matter where the effects are. SwiftUI handles all the complexity of these combined, overlapping, and interruptible animations for you.

이번 튜토리얼에서는 Landmarks 앱을 사용하는 동안 유저가 걸은 도보 여행을 트래킹하기 위한 그래프를 포함하는 뷰에 애니메이션을 주도록 해볼게요. animation(_:) modifier 를 사용하여 얼마나 쉽게 뷰에 애니메이션을 줄 수 있는지 확인해보도록 해요.

In this tutorial, you’ll animate a view that contains a graph for tracking the hikes a user takes while using the Landmarks app. Using the animation(_:) modifier, you’ll see just how easy it is to animate a view.

## Section 1 - 앱에 Hiking Data 추가하기(Add Hiking Data to the App)

애니메이션을 추가하기 전에 애니메이션을 줄 무언가가 필요해요. 이번 섹션에서 model hiking data 를 불러와 그래프 내 정적으로 데이터를 표시하기 위해 미리 준비된 뷰를 추가해볼게요.

Before you can add animation, you’ll need something to animate. In this section, you’ll import and model hiking data, and then add some prebuilt views for displaying that data statically in a graph.

### Step 1

hikeData.json 파일을 프로젝트의 Resources 폴더로 옮겨주세요. 'Copy items if needed" 를 꼭 선택해주세요.

### Step 2

Hike.swift 라는 이름으로 파일을 생성해주세요. Model 폴더에 넣어주세요.

* Landmark 구조체 처럼 Hike 구조체도 Codable 을 준수하며 data file과 상응하는 키를 매칭하는 프로퍼티를 가져요.

### Step 3

Model 객체에 hikes 를 배열타입으로 로드해주세요.

* 초기 로딩 후에는 전혀 hike data를 수정하지 않기 떄문에, @Published 어트리뷰트를 표시할 필요가 없어요.

### Step 4

Hikes 폴더를 Resources 폴더로부터 프로젝트의 Views 폴더로 드래그 해주세요. 'Copy items if needed" 와 "Create groups" 를 선택하는 것을 잊지 마세요.

### 새로운 뷰들에 익숙해져야 해요. 뷰들은 모델에서 로드된 hike 데이터를 표시하기 위해 함께 작동합니다.

### Step 5

HikeView.swift 에서 Preview 를 켜고 작동을 확인해보세요.

* 각 단계의 결과를 실험할 수 있도록 이 튜토리얼 전체에서 라이브 프리뷰를 사용해주세요.

## Section 2 - 각 뷰에 애니메이션 추가하기(Add Animations to Individual Views)

Animation(_:) modifier 를 동일시되는 뷰상에서 사용할 떄, SwiftUI는 뷰의 애니메이팅 할 수 있는 프로퍼티에 대한 모든 변화에 애니메이션을 부여합니다. 뷰의 컬러, 오퍼시티, 로테이션, 사이즈 등의 애니메이션화 되는 다른 프로퍼티들이 있어요. 뷰가 equatable 하지 않을 땐 animation(_:value:) modifier 를 사용해 특정 뷰가 변경될 때 애니메이션을 시작할 수 있어요.

Equatable 이라는 표현이 조금 다가오지 않는데, 실습을 통해 이 의미에 대해 알아보죠.

When you use the animation(_:) modifier on an equatable view, SwiftUI animates any changes to animatable properties of the view. A view’s color, opacity, rotation, size, and other properties are all animatable. When the view isn’t equatable, you can use the animation(_:value:) modifier to start animations when the specified value changes.

### Step 1 

HikeView.swift 에서 버튼의 방향에 대한 애니메이션을 켜줄게요. Animation modifier 를 추가할게요. showDetail 값의 변경을 따라갑니다.

### Step 2

또 다른 애니메이션 변화를 추가할게요. 그래프가 보일 떄 버튼을 더 커지게 만들어줘요.

* animation modifier 는 모든 애니메이션 변경 사항에 적용 됩니다. Modifier 가 감싸고 있는 뷰 내에서요.

### Step 3

애니메이션의 타입을 easeInOut 에서 spring()으로 변경해주세요.

* SwiftUI는 사전에 정의되거나 Spring 이나 fluid 애니메이션 처럼 커스텁하기 쉬운 기본적인 애니메이션을 포함하고 있어요. 이 애니메이션의 스피드를 조정하거나 애니메이션이 시작하기 전 딜레이를 설정하거나 애니메이션의 반복을 결정하는 것도 가능하죠.

### Step 4

회전(Rotation) 애니메이션을 scaleEffect modifier 코드 바로 위에 다른 애니메이션 modifier를 추가해서 애니메이션을 끄도록 해보세요.

* Experiment : 
SwiftUI를 사용해 보세요. 다양한 애니메이션 효과를 결합하여 무엇이 가능한지 확인하는 것은 좋은 경험이 될 거에요.

### Step 5

다음 섹션으로 넘어가기 전에 두 개의 애니메이션 modifier 를 제거해주세요. 

### Section 2 학습 결과

* animation(_:) modifier 를 사용하면 쉽게 애니메이션 효과를 줄 수 있다. 
* SwiftUI의 애니메이션은 기본적인 애니메이션 효과를 지원하고 커스텀이 가능하다. UIKit에서 구현하는 것보다 비교적 쉽다.
* effect modifier 를 추가 한 후, animation 에 nil 을 주면 상위의 effect 는 작동하지 않는다.


## Section 3 - 상태 변화 효과에 애니메이션을 부여하기(Animate the Effects of State Changes)

각각의 뷰에 애니메이션을 적용하는 법을 배웠으니 이번에는 상태의 값(state's value) 을 변경 한 곳에서 애니메이션을 추가해보죠.

유저가 버튼을 탭하고 showDetail state 프로퍼티를 토글할 때마다 발생하는 모든 변경사항 들에 애니메이션을 적용해볼게요

Now that you’ve learned how to apply animations to individual views, it’s time to add animations in places where you change your state’s value.

Here, you’ll apply animations to all of the changes that occur when a user taps a button and toggles the showDetail state property.

### Step 1

withAnimation 함수를 호출해 closure 구문 내에 showDetail.toggle() 추가해주세요.

* showDetail 프로퍼티에 의해 영향을 받는 양 뷰들은(disclosure 버튼 과 HikeDetail 뷰) 이제 애니메이션 전환을 가지게 되었어요.

### 어떻게 SwiftUI의 애니메이션이 중단될 수 있는지 보기 위해 애니메이션을 늦춰주세요.

### Step 2

4초 길이의 긴 기초 애니메이션을  withAnimation 함수에 전달할게요.

* 동일한 종류의 애니메이션을 animation(_:value:) modifier에 전달한 withAnimation 함수에 전달 할 수 있어요.

### Step 3

애니메이션 중간에 그래프 보기를 열고 닫는 실험을 해보세요.

### Step 4

다음 섹션으로 진행하기 전에 withAnimation 함수의 input parameter 를 제거해 디폴트 애니메이션을 사용할 수 있게 복원해주세요.

### Section 3 학습 결과

* withAnimation의 parameter 에 효과를 추가하는 방법을 학습. State 의 value 가 변경 될 떄 애니메이션을 줄 수 있다.
* 애니메이션 테스트 시 duration 값을 통해 천천히 변화하는 과정을 학습


## Section 4 - 뷰 트랜지션 커스터마이징하기(Customize View Transitions)

기본으로 뷰 트랜지션은 화면 상에 나타났다 사라지는 fade in/out 으로 작동합니다. 이 트랜지션을 transition(_:) modifier 를 사용해 커스터마이징 해보세요.

### Step 1

Transition(_:) modifier 를 조건에 따라 보이는 HikeView 에 추가해주세요.

* 이제 그래프가 sliding in/out 에 따라 시야에서 나타났다 사라져요.

### Step 2

AnyTransition의 정적 프로퍼티로서 추가된 트랜지션으로 추출하고 뷰의 트랜지션 modifier 내에 새로운 프로퍼티로 접근하도록 합니다.

* 이렇게 커스텀 트랜지션을 확장해서 코드를 꺠끗하게 유지할 수 있어요.

### Step 3

move(edge:) 트랜지션을 사용하는 스위칭을 해볼게요. 그래프가 같은 측면에서에서 slide in/out 됩니다.
(기존은 왼쪽에서 오른쪽으로 이동, 지금은 오른쪽에서 나타나 오른쪽으로 사라진다)

### Step 4

이번에는 asymmetric(insertion:removal:) modifier를 사용해 다른 트랜지션을 줘볼게요. 뷰가 나타나고 사라질 때 말이죠.

### Section 4 학습
* AnyTransition 타입의 extension을 사용해 코드의 가독성을 높이는 방식으로 코드를 짜면 좋을 것 같다.
* 또한 이 AnyTransion 의 .asymmetric modifier 를 사용하면 뷰의 삽입/제거 시 애니메이션을 다양하게 줄 수 있다.
* Body 에 모두 선언된다면 상당히 Body 가 무거워지고 보기 좋지 않긴 하겠다.









