# Completed Project: Working with UI Controls

Explore the completed project for the [Working with UI Controls](https://developer.apple.com/tutorials/swiftui/working-with-ui-controls) tutorial.

# framework Integration - UIKit과의 연결 (Interfacing with UIKit)

SwiftUI는 존재하는 모든 애플 플랫폼 상의 UI 프레임워크와 끊김없이 작동해요. 예를 들면 UIKit의 뷰들과 뷰 컨트롤러들을 SwiftUI 뷰에 둘 수 있고 그 반대도 그렇죠.

이번 튜토리얼에서는 홈 화면의 추천 랜드마크를 UIPageViewController 와 UIPageControl의 인스턴스를 래핑하도록 변환하는 방법을 보여줄거에요. UIPageViewController를 사용해 SwfitUI 뷰의 carousel을 표시하고 state 변수와 바인딩을 사용해 유저 인터페이스 전체에서 데이터 업데이트(data update)를 조정(Coordinate)할거에요.

SwiftUI works seamlessly with the existing UI frameworks on all Apple platforms. For example, you can place UIKit views and view controllers inside SwiftUI views, and vice versa.

This tutorial shows you how to convert the featured landmark from the home screen to wrap instances of UIPageViewController and UIPageControl. You’ll use UIPageViewController to display a carousel of SwiftUI views, and use state variables and bindings to coordinate data updates throughout the user interface.

## Section 1 - UIPageViewController를 표시하기 위한 뷰 생성하기(Create a View to Represent a UIPageViewController)

SwiftUI에서 UIKit 뷰와 뷰 컨트롤러를 나타내기 위해 UIViewRepresentable과 UIViewControllerRepresentable 프로토콜을 준수하는 타입을 생성합니다. 이 커스텀 타입은 그들이 나타내는 UIKit 유형을 만들고 구성하는 반면, SwiftUI는 라이프 사이클을 관리하고 필요시에 업데이트 합니다.

To represent UIKit views and view controllers in SwiftUI, you create types that conform to the UIViewRepresentable and UIViewControllerRepresentable protocols. Your custom types create and configure the UIKit types that they represent, while SwiftUI manages their life cycle and updates them when needed.

### Step 1

PageView 폴더를 Views 폴더 안에 생성하고 새로운 Swift file 'PageViewController.swift' 를 추가합니다. PageViewController 의 타입이 UIViewControllerRepresentable을 준수하도록 선언해주세요.

* PageViewController는 [Page] 인스턴스를 저장합니다. 이것은 뷰의 타입이 됩니다. 랜드마크 사이를 스크롤하기 위해 사용하는 페이지입니다.

Create a PageView group in your project’s Views folder, and add a new Swift file named PageViewController.swift; Declare the PageViewController type as conforming to UIViewControllerRepresentable.

The page view controller stores an array of Page instances, which must be a type of View. These are the pages you use to scroll between landmarks.


Before Next Step) 다음으로 UIViewControllerRepresentable 프로토콜에 두 개의 필수요소들을 추가해볼거에요.
Next, add the two requirements for the UIViewControllerRepresentable protocol.

### Step 2

원하는 구성으로 UIPageViewController를 생성하는 makeUIViewController(context:) 메서드를 추가합니다. 

* SwfitUI는 뷰를 표시할 준비가 되었을 떄 한 번 이 메서드를 호출합니다. 그 다음 뷰 컨트롤러의 라이프 사이클을 관리합니다.

Add a makeUIViewController(context:) method that creates a UIPageViewController with the desired configuration.

SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.

### Step 3

updateUIViewController(_:context:) 메서드를 추가합니다. 미 메서드는 화면에 표시하기 위한 뷰 컨트롤러를 제공하기 위해 setViewControllers(_:direction:animated:) 호출합니다.

* 지금은 모든 업데이트에서 page SwiftUI view를 호스팅하는 UIHostingController 를 생성합니다. 나중에 page 뷰 컨트롤러의 생애에서 오직 한번만 컨트롤러를 초기화함으로서 이것을 더욱 효율적으로 만들거에요.

Add an updateUIViewController(_:context:) method that to provide a view controller for display.

For now, you create the UIHostingController that hosts the page SwiftUI view on every update. Later, you’ll make this more efficient by initializing the controller only once for the life of the page view controller.

Before you continue) 페이지처럼 사용되는 feature card를 준비해주세요.

### Step 4

Resources 디렉토리에서 이미지들을 앱의 Asset Catalog 로 드래그 해주세요.

랜드마크의 주요 이미지가 있는 경우, 일반 이미지와 차원이 다릅니다.

Drag the images in the downloaded project files’ Resources directory into your app’s Asset catalog.

A landmark’s feature image, if it exists, has different dimensions than the regular image.

### Step 5

존재하는 경우에 주요 이미지를 반환하는 연산 프로피티를 Landmark 구조체에 추가할게요.

Add a computed property to the Landmark structure that returns the feature image, if it exists.

### Step 6

FeatureCard.swift 이름의 새로운 SwiftUI 뷰 파일을 추가합니다. 랜드마크의 주요 이미지를 표시할거에요. 

Add a new SwiftUI view file, named FeatureCard.swift that displays the landmark’s feature image.

### Step 7

이미지 위에 랜드마크에 대한 텍스트 정보를 오버레이합니다.

Overlay text information about the landmark on the image.

Before Next Step) 다음으로 UIViewControllerRepresentable 뷰를 present 할 커스텀 뷰를 생성할거에요.
(Next, you’ll create a custom view to present your UIViewControllerRepresentable view.)

### Step 8

PageView.swift 이름의 새로운 SwfitUI View 파일을 생성하고 PageViewController를 자식 뷰로 선언하기 위한 PageView 타입을 업데이트할게요.

* 프리뷰는 Xcode가 Page에 대한 타입을 추론할 수 없어 실패합니다.

Create a new SwiftUI view file, named PageView.swift, and update the PageView type to declare PageViewController as a child view.

The preview fails because Xcode can’t infer a type for Page.

### Step 9

필요한 뷰 배열을 전달해 preview provider 를 업데이트 해주세요. 그렇다면 preview가 작동하기 시작합니다.

Update the preview provider to pass the required array of views, and the preview starts working.


## Section 2 - 뷰 컨트롤러의 데이터 소스 생성하기(Create the View Controller’s Data Source)

몇 단계을 거쳐오면서 많은 것을 했어요. PageViewController는 SwfitUI 뷰에서 컨텐츠를 보여주기 위한 UIPageViewController를 사용해요. 이제 페이지에서 페이지로 움직이기 위한 스와이핑 인터랙션을 가능하게 해볼게요.

In a few short steps, you’ve done a lot — the PageViewController uses a UIPageViewController to show content from a SwiftUI view. Now it’s time to enable swiping interactions to move from page to page.

Before Next Step) UIKit의 뷰 컨트롤러를 표시하는 SwiftUI 뷰는 SwiftUI가 관리하고 표현 가능한(representable) 뷰 컨텍스트의 일부로 제공하는 Coordinator 타입을 정의할 수 있어요. (A SwiftUI view that represents a UIKit view controller can define a Coordinator type that SwiftUI manages and provides as part of the representable view’s context.)

### Step 1

중첩된 Coordinator 클래스를 PageViewController 내에 선언할게요.

* SwiftUI는 UIViewControllerRepresentable 타입의 coordinator 를 관리하고 그것을 위에서 생성했던 메서드들을 호출할 때 컨텍스트의 일부로 제공합니다.

Declare a nested Coordinator class inside PageViewController.

SwiftUI manages your UIViewControllerRepresentable type’s coordinator, and provides it as part of the context when calling the methods you created above.

### Step 2

coordinator를 만들기 위해 PageViewController에 또 다른 메서드를 다음과 같이 추가할게요.

* SwiftUI는 이 makeCoordinator() 메서드를 makeUIViewController(context:) 전에 호출해요, 그렇기 때문에 우리는 뷰 컨트롤러를 구성할 때 coordinator 객체(object)에 접근할 수 있어요.

Add another method to PageViewController to make the coordinator.

SwiftUI calls this makeCoordinator() method before makeUIViewController(context:), so that you have access to the coordinator object when configuring your view controller.

* Tip) delegates, data sources, target-action을 통한 유저 이벤트에 응답하기와 같은 일반적인 Cocoa 패턴을 구현하기 위해 이 coordinator를 사용할 수 있어요.

Tip) You can use this coordinator to implement common Cocoa patterns, such as delegates, data sources, and responding to user events via target-action.

### Step 3

Pages 뷰 배열을 사용해 Coordinator 내 'controllers' 배열을 초기화 해주세요. 

* Coordinator는 이 controllers 를 저장하기에 좋은 장소에요. 왜냐하면 시스템은 이 컨트롤러들을 오직 한 번만 초기화하고 뷰 컨트롤러를 업데이트하기 전에 필요하기 전에 초기화하기 때문입니다.

Initialize an array of controllers in the coordinator using the pages array of views.

The coordinator is a good place to store these controllers, because the system initializes them only once, and before you need them to update the view controller.

### Step 4

UIPageViewControllerDataSource 를 Coordinator 타입이 채택하도록 추가하고 두 개의 요구되는 메서드들을 구현할게요.

* 이 두 메서드는 뷰 컨트롤러 사이의 관계를 확립해요. 그렇게 해서 뷰 컨트롤러 사이를 앞으로 뒤로 스와이프 할 수 있어요.

Add UIPageViewControllerDataSource conformance to the Coordinator type, and implement the two required methods.

These two methods establish the relationships between view controllers, so that you can swipe back and forth between them.

### Step 5

UIPageViewController의 데이터 소스로 coordinator를 추가할게요.

Add the coordinator as the data source of the UIPageViewController.

### Step 6

PageView로 돌아와 라이브 프리뷰를 켜고 스와이프 인터랙션을 테스트 해보세요.

Return to PageView, turn on live previews, and test out the swipe interactions.


## Section 1,2 특이점 정리

### Section 1
* struct PageViewController 
1. <Page: View>
2. UIViewControllerRepresentable
3. makeUIViewController(context:) 
4. updateUIViewController(_:context:)

* struct PageView
1. <Page: View>
2. Body 내 PageViewController


### Section 2
* struct PageViewController
1. class Coordinator: NSObject 를 내부에서 선언
3. makeCoordinator() -> Coordinator 메서드

* class Coordinator: NSObject
1. 변수로 parent: PageViewController 와 controllers: [UIViewController] = [] 를 변수로 가짐
2. Parents와 Controllers는 Init 시 값을 전달받음
3. UIPageViewControllerDataSource

- UIPageViewControllerDataSource : @Required method 구현
1. pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
2. pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?

* struct PageViewController
1. makeUIViewController(context: Context) -> UIPageViewController 메서드 내에서 pageViewController 인스턴스 생성 시 pageViewController의 dataSource 로 context.coordinator 주입



## Section 3 - SwiftUI 뷰의 State 내에서 Page를 트래킹하기(Track the Page in a SwiftUI View’s State)

커스텀 UIPageControl을 추가하려고 준비하기 위해, PageView 내부로부터 현재의 페이지를 트래킹하기위한 방법이 필요해요.

이를 하기 위해 PageView내 @State 프로퍼티를 선언하고 이 프로퍼티에 대한 바인딩을 PageViewController 뷰로 전달할게요. PageViewController는 보이는 페이지와 일치하도록 바인딩을 업데이트해요.

To prepare for adding a custom UIPageControl, you need a way to track the current page from within PageView.

To do this, you’ll declare a @State property in PageView, and pass a binding to this property down to the PageViewController view. The PageViewController updates the binding to match the visible page.

### Step 1

PageViewController의 프로퍼티로 currentPage라는 바인딩을 추가하는 것으로 시작할게요.

* @Binding 프로퍼티를 선언하는 것 이외에도, 또한 setViewControllers(_:direction:animated:)의 호출을 업데이트하여 currentPage 바인딩 값을 전달합니다.

Start by adding a currentPage binding as a property of PageViewController.

In addition to declaring the @Binding property, you also update the call to setViewControllers(_:direction:animated:), passing the value of the currentPage binding.

### Step 2

PageView에 @State 변수 currentPage 를 선언하세요 그리고 자식 PageViewController를 생성할 때 프로퍼티에 바인딩을 전달하세요.

* 중요) $ 문법을 사용하는 것을 기억하세요 state로서 저장된 값에 대한 바인딩을 생성하기 위해서는 꼭!!

Declare the @State variable in PageView, and pass a binding to the property when creating the child PageViewController.

Important) Remember to use the $ syntax to create a binding to a value that is stored as state.

### Step 3

currentPage의 초기 값을 변경해 PageViewController에 대한 바인딩을 통해 값의 흐름을 테스트해보세요.

실험) PageView에 Page ViewController 에서 두번째 뷰로 점프하게 만들어주는 버튼을 추가해보세요.

Test that the value flows through the binding to the PageViewController by changing its initial value.

Experiment) Add a button to PageView that makes the page view controller jump to the second view.

### Step 4

currentPage 프로퍼티와 함께 텍스트 뷰를 추가해주세요. 그렇게 된다면 @State 프로퍼티의 값을 계속해서 지켜볼 수 있어요.

페이지에서 페이지로 스와이프 할 때 값이 변하지 않는 것을 관찰해보세요.

Add a text view with the currentPage property, so that you can keep an eye on the @State property’s value.

Observe that when you swipe from page to page, the value doesn’t change.

### Step 5

PageViewController.swift에서 Coordinator가 UIPageViewControllerDelegate를 준수하도록 하고 그리고 pageViewController(_:didFinishAnimating:previousViewControllers:transitionCompleted completed: Bool) 메서드를 추가해주세요.

SwiftUI가 이 메서드를 페이지 스위칭 애니메이션이 완료될 때마다 호출하기 떄문에, 현재 뷰 컨트롤러의 인텍스를 찾고 바인딩을 업데이트 할 수 있어요.

In PageViewController.swift, conform the coordinator to UIPageViewControllerDelegate, and add the pageViewController(_:didFinishAnimating:previousViewControllers:transitionCompleted completed: Bool) method.

Because SwiftUI calls this method whenever a page switching animation completes, you can find the index of the current view controller and update the binding.

### Step 6

데이터 소스 이외에도, Coordinator를 UIPageViewController에 delegate로 할당해주세요.

바인딩이 양방향으로 연결된 경우 텍스트 뷰는 업데이트되어 각 스와이프 후 정확한 페이지 번호가 표시돼요.

Assign the coordinator as the delegate for the UIPageViewController, in addition to the data source.

With the binding connected in both directions, the text view updates to show the correct page number after each swipe.


### Section 3 정리

* 뷰 컨트롤러의 트랜지션에 대한 핸들링을 하기 위해서는 UIPageViewControllerDelegate를 채택하고 pageViewController(_:didFinishAnimating:previousViewControllers:transitionCompleted completed: Bool) 메서드의 내부를 구현한다.
* 바인딩 값을 넘길 시 $ 기호를 사용해야 함에 주의하자.














































