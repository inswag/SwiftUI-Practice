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

## Section 2 - 텍스트 뷰 커스터마이징(Customize the Text View)

코드를 변경하거나 코드를 작성하는데 도와줄 수 있고 무엇이 사용 가능한지 발견할 수 있는 인스펙터를 사용해 뷰의 화면을 커스터마이징 할 수 있어요. 
You can customize a view’s display by changing your code, or by using the inspector to discover what’s available and to help you write code.

Landmarks 앱을 빌드 할 떄, 편집기들을 모두 조합하여 사용할 수 있어요. 편집기로는 source editor, canvas, inspectors 가 있어요. 코드는 여러분이 사용한 어떤 도구든 간에 관계없이 업데이트 됩니다.
As you build the Landmarks app, you can use any combination of editors: the source editor, the canvas, or the inspectors. Your code stays updated, regardless of which tool you use.

다음으로 인스펙터를 사용해 텍스트 뷰를 커스터마이징 해볼게요.
Next, you’ll customize the text view using the inspector.

### Step 1

프리뷰에서 인사 멘트 부분을 Command-click하면 popover 형식으로 구조화된 편집기를 불러올 수 있어요. 아니면 "Show SwiftUI Inspector"를 선택해주세요.
(Xcode 14.3 기준으로 프리뷰 인터페이스가 변경되었기 때문에, 편집기를 불러오거나 인스펙터를 보이게 하려면 프리뷰 하단의 '마우스 커서' 표시를 선택해주어야 위의 행동을 할 수 있어요)
In the preview, Command-click the greeting to bring up the structured editing popover, and choose “Show SwiftUI Inspector”.

팝업은 커스터마이징 할 수 있는 서로 다른 어트리뷰트들을 보여줍니다. 여러분이 살펴보고자 하는 뷰의 타입에 따라 달라질 수 있어요.
The popover shows different attributes that you can customize, depending on the type of view you inspect.

### Step 2

인스펙터를 사용해서 텍스트를 "Turtle Rock"으로 변경할게요. 앱에서 보여줄 첫 번쨰 랜드마크의 이름입니다.
Use the inspector to change the text to “Turtle Rock”, the name of the first landmark you’ll show in your app.

### Step 3

폰트 modifier를 "Title"로 변경해주세요.
Change the Font modifier to “Title”.

* 텍스트에 시스템 폰트를 적용하면 유저가 선호하는 폰트 사이즈와 세팅에 정확하게 대응할 수 있어요.
This applies the system font to the text so that it responds correctly to the user’s preferred font sizes and settings.

Before Next Step) SwiftUI 뷰를 커스터마이징하기 위해서 'modifier'라 불리는 메서드들을 호출합니다. Modifier는 화면 또는 다른 프로퍼티를 변경하기 위해 뷰를 래핑합니다. 각각의 modifier는 새로운 뷰를 반환합니다. 그래서 수직으로 스택화된 수 많은 modifier들을 체이닝하는 것이 일반적이에요.
To customize a SwiftUI view, you call methods called modifiers. Modifiers wrap a view to change its display or other properties. Each modifier returns a new view, so it’s common to chain multiple modifiers, stacked vertically.

### Step 4

손 코딩으로 padding() modifier를 foregroundColor(.green) 으로 수정해주세요. 이 변화는 텍스트의 색상을 그린으로 변경해요.
Edit the code by hand to change the padding() modifier to the foregroundColor(.green) modifier; this changes the text’s color to green.

Before Next Step)
여러분의 코드는 뷰에 대해서 항상 'Source of truth(코드에 적용한 그대로 나타남)' 입니다. 인스펙스틑 사용해 modifier를 변경하거나 제거할 때, Xcode는 매칭시키기 위해 코드를 즉각적으로 업데이트 해요.  
Your code is always the source of truth for the view. When you use the inspector to change or remove a modifier, Xcode updates your code immediately to match.

### Step 5

이번에는 Command-click 을 코드 에디터 내 텍스트 선언된 곳에 적용해 인스펙터를 열어볼게요. 그리고 나서 "Show SwiftUI Inspector" 를 팝업에서 선택해주세요. 팝업 메뉴의 Color 를 클릭하고 다시 텍스트 컬러를 블랙으로 변경하기 위해 'Inherited' 를 선택해주세요.
This time, open the inspector by Command-clicking on the Text declaration in the code editor, and then choose “Show SwiftUI Inspector” from the popover. Click the Color pop-up menu and choose Inherited to change the text color to black again.

### Step 6

변경사항을 반영하기 위해 Xcode가 foregroundColor(.green) modifier를 제거해서 코드를 자동으로 업데이트 한 것에 주목해보세요. 
Notice that Xcode updates your code automatically to reflect the change, removing the foregroundColor(.green) modifier.

## Section 3 - 스택을 사용해서 뷰를 조합하기(Combine Views Using Stacks)

이전 섹션에서 생성했던 title 뷰를 뒤로하고 랜드마크에 대한 세부 내용을 포함하기 위한 텍스트 뷰를 추가할게요. 공원의 이름과 어디에 속하는 주(state)인지와 같은 것들이죠.
Beyond the title view you created in the previous section, you’ll add text views to contain details about the landmark, such as the name of the park and state it’s in.

SwiftUI view를 생성할 떄, 컨텐츠와 레이아웃, 동작을 뷰의 body 프로퍼티 내에 설명할거에요. 그러나 body 프로퍼티는 오직 하나의 뷰만 리턴하죠. 뷰들을 수평적으로나 수직적으로나 혹은 뒤에서 앞으로나 함꼐 그룹핑 할 수 있는 스택 내에 여러 뷰들을 임베딩하고 조합할 수 있어요. 
When creating a SwiftUI view, you describe its content, layout, and behavior in the view’s body property; however, the body property only returns a single view. You can combine and embed multiple views in stacks, which group views together horizontally, vertically, or back-to-front.

이번 섹션에서 vertical stack 을 사용해서 title을 공원에 대한 세부 내용을 포함하고 있는 horizontal stack위에 위치시켜볼게요. 
In this section, you’ll use a vertical stack to place the title above a horizontal stack that contains details about the park.



### Creating and Combining Views 정리

* SwiftUI를 사용하면 App 프로토콜을 준수하는 구조체가 '앱이름App.swift' 이름으로 생성되는데 @main 으로 되어있는 걸 보니 여기가 앱의 엔트리 포인트가 된다. UIKit의 AppDelegate 느낌?
* 기본적으로 SwiftUI view 파일들은 두 개의 구조체를 선언. 첫 번째는 View 프로토콜을 준수하고 있고 뷰의 콘텐츠와 레이아웃을 설명. 두 번째 구조체는 그 뷰에 대한 프리뷰를 선언
* SwfitUI 에서는 modifier를 추가, 제거, 편집할 때 프리뷰에서도, 코드에서도 Command-Click 을 통해 인스펙터를 불러 쉽게 수정할 수 있다. 이떄 수정 시 자동으로 코드가 생성,수정,삭제 된다.
