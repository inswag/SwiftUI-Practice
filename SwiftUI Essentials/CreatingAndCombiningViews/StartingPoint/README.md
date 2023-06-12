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

Before Next Step) 
뷰를 컨테이너 뷰로 임베딩하거나 인스펙터를 열거나 다르 유용한 변경사항들을 돕기 위해 Xcode의 구조화된 편집 서포트를 사용할 수 있어요.
You can use Xcode’s structured editing support to embed a view in a container view, open an inspector, or help with other useful changes.

### Step 1

텍스트 뷰의 이니셜라이저를 구조화된 팝업 편집기를 보여주기 위해 Command-Click 하고 "Embed in VStack" 을 선택해주세요.
Command-click the text view’s initializer to show the structured editing popover, and then choose “Embed in VStack”.

Before Next Step)
다음으로, 텍스트 뷰를 스택에 추가하기 위해 라이브러리로부터 텍스트 뷰를 드래깅해주세요.
Next, you’ll add a text view to the stack by dragging a Text view from the library.

### Step 2

Xcode의 오른쪽 상단의 + 버튼을 클릭해서 라이브러리를 연 다음, Text 뷰를 "Turtle Rock" 텍스트 뷰 바로 아래로 드래깅 해주세요.
Open the library by clicking the plus button (+) at the top-right of the Xcode window, and then drag a Text view to the place in your code immediately below the “Turtle Rock” text view.

### Step 3

Placeholder 텍스트를 "Joshua Tree National Park" 로 변경해주세요.
Replace the Text view’s placeholder text with “Joshua Tree National Park”.

Before next) 원하는 레이아웃과 매칭시키기 위해 위치를 커스터마이징 하겠습니다.
Customize the location to match the desired layout.

### Step 4

위치의 폰트를 'subheadline' 으로 설정하세요.
Set the location’s font to subheadline.

### Step 5

Leading edge로 뷰를 정렬하기 위해 VStack 이니셜라이저를 편집하세요. (.leading 을 적용할 경우 글자가 모두 왼쪽을 기준으로 정렬이 되었음을 확인할 수 있어요)
Edit the VStack initializer to align the views by their leading edges.

* 기본적으로 스택은 자신의 컨텐츠를 자신의 축에 따라 중심화하고 문맥에 맞는 공간을 제공합니다.
By default, stacks center their contents along their axis and provide context-appropriate spacing.

다음은 공원이 속한 주를 표시하는 텍스트 뷰를 위치의 오른쪽에 추가해볼게요.
Next, you’ll add another text view to the right of the location, this for the park’s state.

### Step 6

캔버스에서 Joshua 텍스트 부분을 Command-click  해서 "Embed in HStack" 을 선택하세요.
In the canvas, Command-click “Joshua Tree National Park”, and choose “Embed in HStack”.

### Step 7

위치 다음에 새로운 텍스트 뷰를 추가할게요. Placeholder 텍스트를 공원이 속한 주로 변경하고 폰트를 "subheadline" 으로 설정합니다.
Add a new text view after the location, change the placeholder text to the park’s state, and then set its font to subheadline.

### Step 8

기기의 꽉 찬 너비를 사용을 위한 레이아웃에 이르기 위해, 공원과 주를 Spacer 를 추가해서 분리할게요. 이 Spacer 친구는 두 텍스트 뷰를 홀딩하고 있는 HStack 에 적용해요.
To direct the layout to use the full width of the device, separate the park and the state by adding a Spacer to the horizontal stack holding the two text views.

* Spacer는 오직 자신의 컨텐츠에 의해 정의되는 고유 사이즈를 가지는 대신, 포함하고 있는 뷰가 자신의 부모 뷰의 모든 공간을 사용하도록 확장하는 역할을 한다. 
A spacer expands to make its containing view use all of the space of its parent view, instead of having its size defined only by its contents.

### Step 9

마지막으로 padding() modifier 메서드를 사용해 랜드마크의 이름과 세부 내용에 약간의 더 만흔 공간을 주도록 합니다.
Finally, use the padding() modifier method to give the landmark’s name and details a little more space.

### Section 3 학습

* VStack, HStack 을 추가하고 사용 하는 방법 학습
* Spacer(), padding() 의 역할 학습

## Section 4 - 커스텀 이미지 뷰 생성하기(Create a Custom Image View)

이름과 위치 뷰를 모두 세팅했고 다음 단계는 랜드마크 이미지를 추가할거에요.
With the name and location views all set, the next step is to add an image for the landmark.

파일에 더 코드를 추가하는 대신, mask, border, drop show를 이미지에 적용하는 커스텀 뷰를 만들어볼게요.
Instead of adding more code in this file, you’ll create a custom view that applies a mask, border, and drop shadow to the image.

Before Next) 프로젝트 에셋 카탈로그에 이미지를 추가할게요.
Start by adding an image to the project’s asset catalog.

### Step 1

프로젝트 파일의 Resources 폴더에 'turtlerock@2x.jpg' 파일을 찾아 asset catalog editor에 드래그 해주세요. Xcode는 이미지에 대한 새로운 이미지 셋을 생성합니다.
Find turtlerock@2x.jpg in the project files’ Resources folder; drag it into the asset catalog’s editor. Xcode creates a new image set for the image.

Before Next) 다음은 새로운 SwiftUI view 를 커스텀 이미지 뷰를 위해 만들어볼게요.
Next, you’ll create a new SwiftUI view for your custom image view.

### Step 2

"File > New > File" 을 선택해 template selector 를 다시 엽니다. User Inferface 섹션에서 "SwiftUI View" 를 선택하고 Next 를 클릭해주세요.  이름은 CircleImage 로 주고 Create 를 클릭합니다.
Choose File > New > File to open the template selector again. In the User Interface section, select “SwiftUI View” and click Next. Name the file CircleImage.swift and click Create.

Before Next) 이미지를 삽입하고 원하는 디자인에 매칭시키기 위해 이미지를 수정항 준비가 되었어요.
You’re ready to insert the image and modify its display to match the desired design.

### Step 3

텍스트 뷰를 Image(_:) 이니셜라이저를 사용하여 Turtle Rock 이미지로 대체합니다. 이미지를 표시하기 위한 이름을 전달해주세요.
Replace the text view with the image of Turtle Rock by using the Image(_:) initializer, passing it the name of the image to display.

### Step 4

이미지에 원형의 clipping shape 를 적용하기 위해 "clipShape(Circle())" 을 호출할게요.
Add a call to clipShape(Circle()) to apply the circular clipping shape to the image.

* Circle 타입은 하나의 모양(shape) 인데 mask를 사용할 수 있거나 원형에 stroke 나 fill 을 지정하여 뷰로 사용할 수 있어요.
The Circle type is a shape that you can use as a mask, or as a view by giving the circle a stroke or fill.

### Step 5

회색 스트로크를 가진 또 다른 원을 생성하고 이미지에 외곽선을 주기 위한 오버레이로 이 원을 추가할게요.
Create another circle with a gray stroke, and then add it as an overlay to give the image a border.

### Step 6

7 포인트의 radius 를 가진 shadow 를 추가할게요.
Next, add a shadow with a 7 point radius.

### Step 7

외곽선 색을 하얀색으로 바꿔주세요.
Switch the border color to white.

* 이것으로 이미지 뷰가 완성되었어요.
This completes the image view.

### Section 4 학습
* 이미지에 clipping, overlay, shadow 를 적용해 커스텀 이미지 뷰를 만드는 방법을 학습

## Section 5 - 다른 프레임워크로부터 SwiftUI View 사용하기(Use SwiftUI Views From Other Frameworks)

다음은 주어진 좌표를 중심으로 보여주는 지도를 생성해볼게요. Map view를 MapKit으로 부터 사용해 지도를 렌더링 해볼게요.
Next you’ll create a map that centers on a given coordinate. You can use the Map view from MapKit to render the map.

Before Next) 시작하기 위해 지도를 관리할 새로운 커스텀 뷰를 만들게요.
To get started, you’ll create a new custom view to manage your map.

### Step 1

"File > New > File" 을 선택하고 iOS 플랫폼을 선택, "SwiftUI View" 템플릿을 선택, Next를 클릭하세요. MapView.swift 이름으로 Create 를 클릭하세요.
Choose File > New > File, select iOS as the platform, select the “SwiftUI View” template, and click Next. Name the new file MapView.swift and click Create.

### Step 2

import MapKit 을 상단에 추가하세요.
Add an import statement for MapKit.

같은 파일 안에 정해진 다른 프레임워크와 SwiftUI를 임포트 할 때, 프레임워크에 의해 제공되는 SwiftUI의 특정 기능에 접근할 권한을 얻게 돼요. 
When you import SwiftUI and certain other frameworks in the same file, you gain access to SwiftUI-specific functionality provided by that framework.

### Step 3

지도에 대한 지역 정보를 가지고 있는 Private state 변수를 생성하세요.
Create a private state variable that holds the region information for the map.

* @State 어트리뷰트를 사용해 둘 이상의 뷰로부터 수정할 수 있는 앱의 데이터에 대한 신뢰할 수 있는 소스(source of truth)를 설정해요. SwiftUI는 기본 스토리지를 관리하고 값에 따라 자동적으로 뷰를 업데이트해요.
You use the @State attribute to establish a source of truth for data in your app that you can modify from more than one view. SwiftUI manages the underlying storage and automatically updates views that depend on the value.

### Step 4

기본 텍스트 뷰를 지역에 대한 바인딩을 가지는 맵 뷰로 대체합니다. 
Replace the default Text view with a Map view that takes a binding to the region.

* state 변수 앞에 $를 붙임으로서, 바인딩을 전달합니다. 바인딩은 근원적인(underlying) 값에 대한 참조(reference)와 같은 개념이에요. 예를 들면, 유저가 지도와 성호작용할 때 맵은 현재 유저 인터페이스에서 나타나는 지도의 부분과 매칭시키기 위해 지역 값을 업데이트해요.  
By prefixing a state variable with $, you pass a binding, which is like a reference to the underlying value. When the user interacts with the map, the map updates the region value to match the part of the map that’s currently visible in the user interface.

Before Next)
프리뷰가 정적 모드일 때, 프리뷰는 오직 네이티브 SwiftUI Views를 꽉 차게 렌더링합니다. Map View에 대해선, 렌더되는 것을 보기 위해 라이브 프리뷰로 스위칭할 필요가 있어요.

When previews are in static mode, they only fully render native SwiftUI views. For the Map view, you’ll need to switch to a live preview to see it render.

### Step 5

[의역] 라이브 프리뷰를 라이브 모드로 전한하면 Turtle Rock 중심에 지도가 보일거에요. 주변을 둘러보세요~
Click Live Preview to switch the preview to live mode. You might need to click Try Again or Resume above your preview.

In a moment, you’ll see a map centered on Turtle Rock. You can manipulate the map in live preview to zoom out a bit and see the surrounding area.

### Section 5 학습
* State 의 개념
* Binding 의 개념

## Section 6 - Detail View 구성하기(Compose the Detail View)

이제 필요한 모든 컴포넌트들을 모아볼게요. 이름과 장소, 원형 이미지, 위치를 표시할 지도가 있네요.
You now have all of the components you need — the name and place, a circular image, and a map for the location.

지금까지 사용한 도구들로 만들어온 커스텀 뷰들을 합해 랜드마크 디테일 뷰를 위한 마지막 디자인을 만들어볼게요.
With the tools you’ve used so far, combine your custom views to create the final design for the landmark detail view.

### Step 1

프로젝트 네비게이터에서 ContentView.swift 파일을 선택하세요.
In the Project navigator, select the ContentView.swift file.

### Step 2

또 다른 VStack 안에 3개의 텍스트 뷰를 홀딩하는 VStack을 임베딩해주세요.
Embed the VStack that holds the three text views in another VStack.

### Step 3

커스탬 MapView를 스택의 상단에 추가해주세요. frame(width:height:)로 MapView의 사이즈를 설정합니다.
Add your custom MapView to the top of the stack. Set the size of the MapView with frame(width:height:).

* Height 파라미터만 특정했을 때는 뷰는 자동적으로 컨텐츠의 너비에 맞춰 사이징합니다. 이 경우에는 MapView는 이용가능한 공간을 채우기 위해 확장됩니다.
When you specify only the height parameter, the view automatically sizes to the width of its content. In this case, MapView expands to fill the available space.

### Step 4

라이브 프리뷰를 클릭해 구성된 뷰에 렌더링 된 지도를 확인해보세요.
Click Live Preview to see the rendered map in the composed view.

라이브 프리뷰를 보는 동안에도 뷰 편집을 계속할 수 있어요.
You can continue editing the view while showing a Live Preview.

### Step 5

Stack에 CircleImage 뷰를 추가해요.
Add the CircleImage view to the stack.

### Step 6

맵 뷰의 상단에 이미지 뷰를 레이어 처리하기 위해 이미지에 오프셋 -130 포인트를 수직으로 부여하고 -130 포인트의 패딩을 뷰의 아래에 부여합니다. 
To layer the image view on top of the map view, give the image an offset of -130 points vertically, and padding of -130 points from the bottom of the view.

이 조정은 이미지가 위쪽으로 움직임으로서 텍스트를 위한 공간을 만들어줍니다.
These adjustments make room for the text by moving the image upwards.

### Step 7

Spacer 를 VStack 바깥 아래에 추가해 스크린의 상단으로 컨텐츠를 밀어냅니다.
Add a spacer at the bottom of the outer VStack to push the content to the top of the screen.

### Step 8

스크린의 상단 가장자리로 확장하려는 지도 컨텐츠를 허용하기 위해, ignoresSafeArea(edges: .top) modifier를 맵뷰에 추가할게요.
To allow the map content to extend to the top edge of the screen, add the ignoresSafeArea(edges: .top) modifier to the map view.

### Step 9

Divider 와 랜드마크에 대한 약간의 추가적인 설명 텍스트를 추가합니다.
Add a divider and some additional descriptive text for the landmark.

### Step 10

마지막으로 'subheadline' 폰트 modifier 를 각각의 텍스트 뷰로부터 텍스트들을 포함하는 HStack 으로 옮겨주세요 그리고 subheadline 텍스트에 세컨더리 컬러를 적용합니다. 
Finally, move the subheadline font modifier from each Text view to the HStack containing them, and apply the secondary color to the subheadline text.

스택과 같은 레이아웃 뷰에 modifier를 적용할 때, SwiftUI는 그룹 내 포함된 모든 요소에 modifier를 적용합니다.
When you apply a modifier to a layout view like a stack, SwiftUI applies the modifier to all the elements contained in the group.

### Section 6 학습

* View 크기를 지정할 때 Height 값만 부여한 경우 가로 길이는 가능한 공간에 가득 차도록 조정된다.

### Check Your Understanding

Q 1 of 4
커스텀 SwiftUI view를 생성할 때, 뷰의 레이아웃을 어디에 선언해야 하나요?

N1) 뷰의 이니셜라이저
N2) body 프로퍼티
N3) layoutSubviews() 메서드

A 1 of 4
N2) 설명 - 커스텀 뷰는 body property를 구현하며, 이 프로퍼티는 View protocol이 필요조건이다.

Q 2 of 4
어떤 레이아웃이 다음의 뷰 코드를 렌더링하나요?

A 2 of 4
N3

Q 3 of 4
보기 중 어떤 것이 커스텀 뷰의 body 프로퍼티로부터 3개의 뷰를 반환하는 정확한 방법인가요?

A 3 of 4
N1

Q 4 of 4
뷰를 구성하기 위한 modifier 메서드를 사용하는 정확한 방법은 무엇인가요?

A 4 of 4
N3

## Creating and Combining Views 정리

* SwiftUI를 사용하면 App 프로토콜을 준수하는 구조체가 '앱이름App.swift' 이름으로 생성되는데 @main 으로 되어있는 걸 보니 여기가 앱의 엔트리 포인트가 된다. UIKit의 AppDelegate 느낌?

* 기본적으로 SwiftUI view 파일들은 두 개의 구조체를 선언. 첫 번째는 View 프로토콜을 준수하고 있고 뷰의 콘텐츠와 레이아웃을 설명. 두 번째 구조체는 그 뷰에 대한 프리뷰를 선언

* SwfitUI 에서는 modifier를 추가, 제거, 편집할 때 프리뷰에서도, 코드에서도 Command-Click 을 통해 인스펙터를 불러 쉽게 수정할 수 있다. 이떄 수정 시 자동으로 코드가 생성,수정,삭제 된다.

* 스택은 기본적으로 자신의 컨텐츠를 자신의 축(V,H,Z)에 따라 중심화하고 문맥에 맞는 공간을 제공한다.

* Spacer() 메서드는 오직 자신의 컨텐츠에 의해서만 정의되는 고유 사이즈를 가지는 것이 아닌, 포함하고 있는 뷰가 자신의 부모 뷰의 모든 공간을 사용하도록 확장하는 역할을 한다.

* @State 어트리뷰트를 사용하면 둘 이상의 뷰로부터 수정할 수 있는 앱의 데이터에 대한 신뢰할 수 있는 소스(source of truth)를 설정한다. SwiftUI는 기본 스토리지를 관리하고 값에 따라 자동적으로 뷰를 업데이트해요.
