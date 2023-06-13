# Completed Project: Creating and Combining Views

Explore the completed project for the [Creating and Combining Views](https://developer.apple.com/tutorials/swiftui/creating-and-combining-views) tutorial.


# SwiftUI Essentials - 리스트와 네비게이션 만들기(Building Lists and Navigation)

기초적인 랜드마크 디테일 뷰를 설정함과 더불어 유저들에게 모든 랜드마크 리스트를 보여줄 그리고 각 위치에 대한 세부 내용을 보여줄 방법을 제공할 필요가 있어요. 
With the basic landmark detail view set up, you need to provide a way for users to see the full list of landmarks, and to view the details about each location.

모든 랜드마크에 대한 정보를 보여줄 뷰를 생성하고, 랜드마크에 대한 세부적인 뷰를 볼 수 있도록 유저가 탭할 수 있는 스크롤링 리스트를 동적으로 만들어볼게요. UI를 조정하기 위해 Xcode의 캔버스를 사용해 서로 다른 디바이스 크기에서 여러 프리뷰를 렌더랑할거에요.
You’ll create views that can show information about any landmark, and dynamically generate a scrolling list that a user can tap to see a detail view for a landmark. To fine-tune the UI, you’ll use Xcode’s canvas to render multiple previews at different device sizes.


## Section 1 - Landmark 모델 생성하기(Create a Landmark Model)

첫 튜토리얼에서는 모든 커스텀 뷰로 정보를 하드코딩을 했어요. 여기서는 뷰로 저장된 데이터를 전달하기 위한 모델을 생성해볼거에요.
In the first tutorial, you hard-coded information into all of your custom views. Here, you’ll create a model to store data that you can pass into your views.

이전 튜토리얼에서 완성한 프로젝트와 이번 튜토리얼의 프로젝트 파일로부터 이용가능한 리소스를 사용해 시작해볼게요.
Use the completed project from the previous tutorial and the resources available from this tutorial’s project files to get started.

### Step 1

다운로드한 파일의 리소스 폴더에서 프로젝트로 landmarkData.json 파일을 드래그 해주세요. 복사 할때 "Copy Items if needed" 와 타겟에 체크하는 것 잊지 마세요!
Drag landmarkData.json in the downloaded files’ Resources folder into your project’s navigation pane; in the dialog that appears, select “Copy items if needed” and the Landmarks target, and then click Finish.

* 이 샘플 데이터를 이 튜토리얼의 나머지를 통틀어 사용하게 될 거에요.
You’ll use this sample data throughout the remainder of this tutorial, and for all that follow.

### Step 2

"File > New > File" 을 선택해 새로운 스위프트 파일(SwiftUI view 아니에요) 을 생성할게요. 이름은 Landmark.swift 입니다
Choose File > New > File to create a new Swift file in your project, and name it Landmark.swift.

### Step 3

Landmark 이름의 구조체를 몇 개의 프로퍼티와 함께 정의할거에요. json 데이터 파일에 있는 key들의 이름들의 읾부와 매칭되는 몇 개의 프로퍼티를 가지고 있어요.
Define a Landmark structure with a few properties matching names of some of the keys in the landmarkData.json data file.

* Codable 을 준수하도록 하면 구조체와 데이터 파일 사이에서 데이터를 더 쉽게 옮기는 것이 가능해요. 파일로부터 데이터를 읽기 위해 이번 섹션 후에 Codable 프로토콜의 Decodable 컴포넌트를 사용할 거에요. 
Adding Codable conformance makes it easier to move data between the structure and a data file. You’ll rely on the Decodable component of the Codable protocol later in this section to read data from file.


다음 몇 단계가 지나면 각 랜드마크와 연관된 이미지를 모델링 하게 될거에요.
In the next few steps you’ll model the image associated with each landmark.

### Step 4

JPG 파일을 프로젝트 파일의 리소스 폴더에서 프로젝트의 에셋 카탈로그로 드래그 해주세요. Xcode는 각 이미지에 대한 새로운 이미지 셋을 만들어요.
Drag the JPG files from the project files’ Resources folder into your project’s asset catalog. Xcode creates a new image set for each image.

* 새 이미지들은 이전 튜토리얼에서 추가했던 Turtle Rock의 이미지와 이어집니다.
The new images join the one for Turtle Rock that you added in the previous tutorial.

### Step 5

imageName 프로퍼티를 추가해 데이타로부터 이미지의 이름을 읽을 수 있다록 하고 image 연산 프로퍼티는 에셋 카탈로그에서 이미지를 로드합니다.
Add an imageName property to read the name of the image from the data, and a computed image property that loads an image from the asset catalog.

* 프로퍼티를 private 으로 만들어주세요. Landmarks 구조체를 사용하는 사람들은 오직 이미지 자체에만 관심이 있기 떄문이애요.
You make the property private because users of the Landmarks structure care only about the image itself.

다음은 랜드마크의 위치에 대한 정보를 관리하도록 해볼게요.
Next, you’ll manage information about the landmark’s location.

### Step 6

JSON 데이터 구조 내 저장소를 반영하는 중첩된 Coordinates 타입을 사용하는 coordinates 프로퍼티를 구조체에 추가해주세요.
Add a coordinates property to the structure using a nested Coordinates type that reflects the storage in the JSON data structure.

이 프로퍼티를 private 으로 선언하세요. 다음 단계에서 public 연산 프로퍼티만들 생성하는데 사용하기 떄문입니다.
You mark this property as private because you’ll use it only to create a public computed property in the next step.

### Step 7

MapKit 프레임워크와 상호작용하는데 유용한 locationCoordinate 프로퍼티를 계산합니다. 
Compute a locationCoordinate property that’s useful for interacting with the MapKit framework.

마지막으로 파일로부터 랜드마크와 함께 초기화되는 배열을 생성할게요.
Finally, you’ll create an array initialized with landmarks from a file.

### Step 8

ModelData 라는 이름으로 프로젝트에 새로운 스위프트 파일을 생성해주세요.
Create a new Swift file in your project and name it ModelData.swift.

### Step 9

앱의 메인 번들에서 주어진 이름으로 JSON 데이터를 가져오는 load(_:) 메서드를 생성하세요.  
Create a load(_:) method that fetches JSON data with a given name from the app’s main bundle.

* load 메서드는 Codable 프로토콜의 한 구성 요소인 Decodable 프로토콜에 대한 리턴 타입의 적합성에 의존합니다.
The load method relies on the return type’s conformance to the Decodable protocol, which is one component of the Codable protocol.

### Step 10

landmarkData.json 으로부터 초기화하는 landmarks 배열을 생성합니다.
Create an array of landmarks that you initialize from landmarkData.json.

다음으로 가기 전에 더욱 커질 프로젝트를 관리하기 더 쉽게 만들도록 관련된 파일을 함께 그룹화 합니다.
Before moving on, group related files together to make it easier to manage your growing project.

### Step 11

Views 그룹에 ContentView CircleImage, MapView 를 두고 landmarkData.json 은 Resources 그룹에, Landmark, ModelData 는 Model 그룹으로 묶어주세요.
Put ContentView.swift, CircleImage.swift, and MapView.swift into a Views group, landmarkData.json in a Resources group, and Landmark.swift and ModelData.swift into a Model group.

팁) 그룹화 할 파일을 선택한다음 File > New > Group 을 사용하면 더 쉽게 선택한 파일들을 그룹화할 수 있어요.  
Tip)You can create groups of existing items by selecting the items to add to the group, and then choosing File > New > Group from Selection in the Xcode menu.

### Section 1 학습

* 

## Section 2 - Row View 생성하기(Create the Row View)

이번 튜토리얼에서 만들어볼 첫 번쨰 뷰는 각 랜드마크에 대한 디테일한 내용을 표시하기 위한 열(row) 입니다. 이 row view는 보여줄 landmark 프로퍼티 안에 정보를 저장해요. 나중에 랜드마크 리스트에 여러 열들을 결합할 거에요.
The first view you’ll build in this tutorial is a row for displaying details about each landmark. This row view stores information in a property for the landmark it displays, so that one view can display any landmark. Later, you’ll combine multiple rows into a list of landmarks.

### Step 1

새 SwiftUI view 를 Views 그룹에 LandmarkRow 이름으로 만들어주세요.
Create a new SwiftUI view in the Views group named LandmarkRow.swift.

### Step 2

만약 프리뷰가 보이지 않는다면 Editor > Canvas 를 선택하여 canvas를 보여주세요. 그리고 Resume(14. 3 Xcode 버전 기준 새로고침 화살표 표시)을 클릭해주세요.
If the preview isn’t visible already, show the canvas by choosing Editor > Canvas, and then click Resume.

### Step 3

LandmarkRow의 저장 프로퍼티 landmark 를 추가해주세요.
Add landmark as a stored property of LandmarkRow.

* landmark 프로퍼티를 추가할 때, 프리뷰는 작동을 멈춥니다. 왜냐하면 LandmarkRow 타입은 초기화 동안 landmark 인스턴스가 필요하기 떄문이에요(landmark 는 타입만 선언해 둔 상태인데, 구조체는 초기화 시 내부 프로퍼티가 초기화되어야 합니다).
When you add the landmark property, the preview stops working, because the LandmarkRow type needs a landmark instance during initialization.

프리뷰를 고치기 위해 preview provider 를 수정해볼게요.
To fix the preview, you’ll need to modify the preview provider.

### Step 4

LandmarkRow_Previews의 static 프로퍼티 previews에 landmark 파라피터를 LandmarkRow 이니셜라이저에 랜드마크 배열의 첫번쨰 요소와 함꼐 추가해주세요.  
In the previews static property of LandmarkRow_Previews, add the landmark parameter to the LandmarkRow initializer, specifying the first element of the landmarks array.

* 프리뷰는 텍스트 Hello, world! 를 표시합니다. 
The preview displays the text, “Hello, World!”.

이걸 수정하면, row의 레이아웃을 만들 수 있어요.
With that fixed, you can build the layout for the row.

### Step 5

HStack에 현재 텍스트 뷰를 임베딩합니다.
Embed the existing text view in an HStack.

### Step 6

텍스트 뷰를 'landmark' 프로퍼티의 'name' 을 사용하도록 수정해주세요.
Modify the text view to use the landmark property’s name.

### Step 7

텍스트 뷰 전에 이미지를 추가해서 열을 완성시켜주세요. 그리고 텍스트 뷰 후에 Spacer() 를 추가합니다.
Complete the row by adding an image before the text view, and a spacer after it.

### Section 2 학습

* 

## Section 3 - Row 프리뷰 커스터마이징(Customize the Row Preview)

Xcode의 Canvas는 PreviewProvider 프로토콜을 준수하는 현재 에디터 내 모든 타입을 자동적으로 인식하고 표시합니다. Preview Provider는 크기를 구성하기 위한 옵션과 기기와 함께 하나 이상의 뷰를 반환해요. 
Xcode’s canvas automatically recognizes and displays any type in the current editor that conforms to the PreviewProvider protocol. A preview provider returns one or more views, with options to configure the size and device.

아주 유용한 프리뷰를 정확하게 렌더링하기 위해 프리뷰 프로바이더로 부터 반환된 컨텐츠를 커스터마이징 할 수 있어요.
You can customize the returned content from a preview provider to render exactly the previews that are most helpful to you.

### Step 1

LandmarkRow_Previews에서 landmark 파라미터에 landmarks 배열의 두 번쨰 요소를 업데이트합니다. 
In LandmarkRow_Previews, update the landmark parameter to be the second element in the landmarks array.

* 프리뷰는 즉시 첫 번째 대신 두 번쨰 샘플 랜드마크를 보여주기위해 변경됩니다.
The preview immediately changes to show the second sample landmark instead of the first.

### Step 2

previewLayout(_:) modifier를 사용해 리스트의 열에 가까운 사이즈를 설정해주세요.
Use the previewLayout(_:) modifier to set a size that approximates a row in a list.

* Preview Provider로부터 여러 프리뷰를 반환하기 위한 Group 을 사용 할 수 있어요.
You can use a Group to return multiple previews from a preview provider.

### Step 3

Group 내에 반환된 열을 래핑하고 다시 첫 번째 열을 추가해주세요. 
Wrap the returned row in a Group, and add the first row back again.

* Group 은 뷰 컨텐츠를 그룹핑하는 하나의 컨테이너입니다. Xcode는 그룹의 자식 뷰들을 Canvas 내 분리된 프리뷰로 렌더링합니다. 
Group is a container for grouping view content. Xcode renders the group’s child views as separate previews in the canvas.

### Step 4

코드 단순화를 위해, previewLayout(_:) call을 그룹의 바깥으로 옮겨주세요.
To simplify the code, move the previewLayout(_:) call to the outside of the group’s child declarations.

뷰의 자식은 preview configuration과 같은 뷰의 문맥적 설정을 상속합니다. 
A view’s children inherit the view’s contextual settings, such as preview configurations.

* preview provider 내에서 작성된 코드는 Canvas 내에서 Xcode가 표시하는 것에 대해서만 변화시킵니다.
The code you write in a preview provider only changes what Xcode displays in the canvas.

### Section 3 학습

* Group 은 뷰 컨텐츠를 그룹핑하는 하나의 컨테이너이다. Xcode는 그룹의 자식 뷰들을 Canvas 내 분리된 프리뷰로 렌더링합니다.

## Section 4 - 랜드마크 리스트 생성하기

SwiftUI의 'List' 타입을 사용할 때, 플랫폼에 특정된 뷰 리스트를 표시할 수 있어요. 리스트의 요소들은 지금까지 만들어온 Stack 의 자식 뷰들과 같이 정적(static)이거나 동적으로 생성됩니다. 정적과 동적 생성 뷰들을 믹스할 수도 있어요. 
When you use SwiftUI’s List type, you can display a platform-specific list of views. The elements of the list can be static, like the child views of the stacks you’ve created so far, or dynamically generated. You can even mix static and dynamically generated views.

### Step 1

Views 그룹 내에 새로운 SwiftUI view 를 LandmarkList.swift 이름으로 생성합니다.
Create a new SwiftUI view in the Views group named LandmarkList.swift.

### Step 2

기본 텍스트 뷰를 List로 대체하고, 리스트의 자식으로 1,2번쨰 랜드마크와 함께 LandmarkRow 인스턴스를 제공합니다.
Replace the default Text view with a List, and provide LandmarkRow instances with the first two landmarks as the list’s children.

* 프리뷰는 iOS에 적절한 리스트 스타일로 렌더링 된 두 개의 랜드마크를 보여줍니다.
The preview shows the two landmarks rendered in a list style that’s appropriate for iOS.

### Section 4 학습

*

## Section 5 - 동적 리스트 만들기(Make the List Dynamic)

리스트의 요소들을 개별적으로 특정하는 대신, 컬렉션으로부터 바로 열을 생성할 수 있어요.
Instead of specifying a list’s elements individually, you can generate rows directly from a collection.

데이터 컬렉션이나 컬렉션 내 각 요소에 대한 뷰를 제공하는 클로저를 전달함으로서 컬렉션의 요소들을 표시하는 리스트를 생성할 수 있어요. 리스트는 컬렉션의 각 요소들을 자식 뷰로 전달받은 클로저를 사용해 변환합니다.
You can create a list that displays the elements of a collection by passing your collection of data and a closure that provides a view for each element in the collection. The list transforms each element in the collection into a child view by using the supplied closure.

### Step 1

두 개의 정적 랜드마크 열을 제거하고 대신 List 이니셜라이저에 모델 데이터의 랜드마크 배열을 전달합니다.
Remove the two static landmark rows, and instead pass the model data’s landmarks array to the List initializer.

* 리스트는 'identifiable' 데이터와 함꼐 작동합니다. 두 가지 방식 중 하나로 식별할 수 있는 데이터를 만들 수 있는데요. 하나는 데이터와 함께 각 요소를 고유하게 식별하는 프로퍼티에 대한 key path를 전달하거나 , 데이터 타입이 Identifiable 프로토콜을 준수하도록 만드는 것입니다. 
Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.

### Step 2

클로저로부터 LandmarkRow를 반환함으로서 동적으로 생성된 리스트를 완성하세요.
Complete the dynamically-generated list by returning a LandmarkRow from the closure.

* 이렇게 하면 랜드마크 배열의 각 요소에 대해 하나의 LandmarkRow가 생성됩니다.
This creates one LandmarkRow for each element in the landmarks array.

다음으로 List 코드를 Landmark 타입으로 Identifiable을 준수하도록 추가함으로서 단순화시켜볼게요.
Next, you’ll simplify the List code by adding Identifiable conformance to the Landmark type.

### Step 3

Landmark.swift 로 돌아가 Identifiable 프로토콜을 준수하도록 선언합니다.
Switch to Landmark.swift and declare conformance to the Identifiable protocol.

Landmark 데이터는 이미지 id 프로퍼티를 가지고 있어요 이 id는 Identifiable 프로토콜에 필요하죠. 이렇게 되면 데이터를 읽을 떄 이것을 디코딩하기 위한 하나의 프로퍼티를 추가할 필요만 있을 뿐이에요.
The Landmark data already has the id property required by Identifiable protocol; you only need to add a property to decode it when reading the data.

### Step 4

LandmarkList로 돌아가서 id 파라미터를 제거해주세요.
Switch back to LandmarkList.swift and remove the id parameter.

* 이제부터 Landmark 요소 컬렉션을 바로 사용할 수 있어요.
From now on, you’ll be able to use collections of Landmark elements directly.

### Section 5 학습
* List 학습

## Building Lists and Navigation 주요 내용 정리

* List 를 사용하면 정적, 동적으로 뷰를 구성할 수 있다.
* List 사용시에 identifiable data가 함께 사용되어야 하는데, 그래서 List는 id 파라미터를 제공한다.
* id 파라미터를 제공하는 방법도 있지만, 애초에 사용하는 Model의 타입에 Identifiable 프로토콜을 준수하도록 추가하는 방법이 조금 더 깔끔한 방법이 된다. (물론 Model에서도 id 역할을 하는 id 프로퍼티가 필요하다)  

