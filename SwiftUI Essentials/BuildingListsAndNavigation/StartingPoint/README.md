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

## Building Lists and Navigation 주요 내용 정리


