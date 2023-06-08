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