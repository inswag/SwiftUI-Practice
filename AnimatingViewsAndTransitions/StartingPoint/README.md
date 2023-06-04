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

