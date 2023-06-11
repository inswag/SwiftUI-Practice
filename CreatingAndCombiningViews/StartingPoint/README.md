Explore the completed project for the [Creating and Combining Views](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views) tutorial.

## SwiftUI Essentials
# Creating and Combining Views

### Introduction

이 튜토리얼은 사랑하는 장소를 발견하고 공유하기 위한 앱인 Landmarks를 만들어보는 것으로 여러분을 이끌어 줄거에요. 랜드마크의 세부 내용을 보여주는 뷰를 만들어보는 것으로 시작해볼게요.

뷰들의 레이아웃을 짜기 위해, Landmarks 앱은 스택들을 사용해서 이미지와 텍스트 뷰 컴포넌트들을 결합하고 층을 이루게 할거에요. 지도를 뷰에 추가하기 위해서 표준 MapKit 컴포넌트를 포함할거에요. 세련된 뷰 디자인을 위해 Xcode는 실시간 피드백을 제공해요. 그래서 여러분은 어떻게 이러한 변화들이 코드로 변환되는지 볼 수 있게 됩니다. 

This tutorial guides you through building Landmarks — an app for discovering and sharing the places you love. You’ll start by building the view that shows a landmark’s details.

To lay out the views, Landmarks uses stacks to combine and layer the image and text view components. To add a map to the view, you’ll include a standard MapKit component. As you refine the view’s design, Xcode provides real-time feedback so you can see how those changes translate into code.


### Section 1 - 새 프로젝트 생성과 Canvas 살펴보기 (Create a New Project and Explore the Canvas)

SwiftUI를 사용하는 새로운 Xcode 프로젝트를 생성해주세요. canvas, previews, SwiftUI 템플릿 코드를 살펴볼게요.

Xcode 내 Canvas로 부터 뷰들을 미리 보고 상호작용하기 위해, 그리고 튜토리얼 전체에서 묘사된 모든 최신 기능들을 사용하기 위해서는 최소 macOS Monterey 이상의 맥이 필요해요.

Create a new Xcode project that uses SwiftUI. Explore the canvas, previews, and the SwiftUI template code.

To preview and interact with views from the canvas in Xcode, and to use all the latest features described throughout the tutorials, ensure your Mac is running macOS Monterey or later.

### Step 1

Xcode 열고 시작 화면에서 "새로운 프로젝트 생성"을 클릭하거나 File > New > Project 를 선택하세요. 
Open Xcode and either click “Create a new Xcode project” in Xcode’s startup window, or choose File > New > Project.

### Step 2

플랫폼 'iOS' 를 선택하고 'App' 템플릿을 선택한다음 다음을 눌러주세요.
In the template selector, select iOS as the platform, select the App template, and then click Next.

### Step 3

Landmarks로 이름 설정을 하고 인터페이스는 SwfitUI와 언어는 Swift를 선택하고 다음을 클릭하세요. 맥에 새 프로젝트를 저장하기 위한 위치를 선택하세요.
Enter “Landmarks” as the product name, select “SwiftUI” for the interface and “Swift” for the language, and click Next. Choose a location to save the Landmarks project on your Mac.

### Step 4

좌측 프로젝트 네비게이터에서 'LandmarksApp.swift'를 선택하세요.
In the Project navigator, select LandmarksApp.swift.

* SwfitUI의 앱 라이프 사이클을 사용하는 App은 App 프로토콜을 준수하는 구조체를 가지고 있어요. 이 구조체의 body 프로퍼티는 하나 이상의 씬을 반환하고 표시할 컨텐츠를 제공해요. @main 어트리뷰트는 앱의 엔트리 포인트를 식별해요.
An app that uses the SwiftUI app life cycle has a structure that conforms to the App protocol. The structure’s body property returns one or more scenes, which in turn provide content for display. The @main attribute identifies the app’s entry point.

### Step 5

좌측의 프로젝트 네비게이터에서 ContentView.swift 파일을 선택하세요.
In the Project navigator, select ContentView.swift.

* 기본적으로 SwiftUI view 파일들은 두 개의 구조체를 선언합니다. 첫 번째는 View 프로토콜을 준수하고 있고 뷰의 콘텐츠와 레이아웃을 설명합니다. 두 번째 구조체는 그 뷰에 대한 프리뷰를 선언하고 있어요.
By default, SwiftUI view files declare two structures. The first structure conforms to the View protocol and describes the view’s content and layout. The second structure declares a preview for that view.

### Step 6

Canvas에서 Resume을 클릭해 프리뷰를 표시할게요. (Xcode 14.3 버전 기준, Canvas의 인터페이스가 변경되어 Resume 버튼이 없어졌어요. Paused 상태인 경우 동그란 새로고침 버튼을 눌러 프리뷰를 시작해주세요)
In the canvas, click Resume to display the preview.

팁) Canvas가 보이지 않는다면 Editor > Canvas 순서로 선택하면 볼 수 있어요.
Tip) If the canvas isn’t visible, select Editor > Canvas to show it.

### Step 7

Body 프로퍼티 내부에 "Hello, World"를 "Hello SwiftUI!" 로 변경해주세요. (Xcode 14.3 기준) 기본 UI표시가 작은 지구 모양의 이미지와 Hello, world!가 함께 표시되는 것으로 변경되었어요. 튜토리얼 이미지와 맞지 않은 경우가 있으니 참고해주세요.
Inside the body property, change “Hello, World!” to a greeting for yourself.

뷰의 body 프로퍼티 내 코드를 변경했기 때문에 프리뷰는 변경 내용을 반영하기 위해 업데이트 됩니다.
As you change the code in a view’s body property, the preview updates to reflect your changes.

### Creating and Combining Views 정리

* SwiftUI를 사용하면 App 프로토콜을 준수하는 구조체가 '앱이름App.swift' 이름으로 생성되는데 @main 으로 되어있는 걸 보니 여기가 앱의 엔트리 포인트가 된다. UIKit의 AppDelegate 느낌?
