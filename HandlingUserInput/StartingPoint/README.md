# Completed Project: Building Lists and Navigation

Explore the completed project for the [Building Lists and Navigation](https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation) tutorial.

# Start - Handling User Input

Landmarks 앱에서, 유저는 자신이 좋아하는 장소로 관심을 끌 수 있고 자신이 좋아하는 것을 보여주기 위해 리스트를 필터링 할 수 있어요. 이 기능을 생성하기 위해, 리스트에 스위치를 추가해 볼 거고 따라서 유저는 자신의 픽에 집중 할 수 있겠죠, 그리고 별 모양의 버튼을 추가해 유저가 자신의 픽으로서 랜드마크에 관심을 끌 수 있도록 버튼을 누를 수 있게 할거에요.

In the Landmarks app, a user can flag their favorite places, and filter the list to show just their favorites. To create this feature, you’ll start by adding a switch to the list so users can focus on just their favorites, and then you’ll add a star-shaped button that a user taps to flag a landmark as a favorite.


## Section 1 - 유저가 좋아하는 Landmark에 마킹하기 (Mark the User's favorite Landmarks)


사용자가 즐겨찾기를 한 눈에 볼 수 있도록 리스트를 개선하는 것부터 시작합니다. Landmark 구조에 프로퍼티를 추가해 랜드마크의 초기 상태를 즐겨찾기로 읽은 다음 즐겨찾는 랜드마크를 표시하는 각 LandmarkRow 에 별을 추가할게요.

Begin by enhancing the list to show users their favorites at a glance. Add a property to the Landmark structure to read the initial state of a landmark as a favorite, and then add a star to each LandmarkRow that shows a favorite landmark.

### Step 1

이전 프로젝트에 이어서 시작할게요. Landmark.swift 파일을 열어주세요.

### Step 2

isFavorite 프로퍼티를 Landmark 구조체에 추가해주세요.

landmarkData.json 파일은 각각의 랜드마크에 대한 이름을 가진 키를 가지고 있어요. Landmark 는 Codable을 준수하고 있기 때문에, 키와 같은 이름을 가진 새로운 프로퍼티를 생성함으로서 key 와 연관된 값을 읽을 수 있는 거에요. 
(The landmarkData.json file has a key with this name for each landmark. Because Landmark conforms to Codable, you can read the value associated with the key by creating a new property with the same name as the key.)

### Step 3

LandmarkRow.swift 파일을 열어주세요.


### Step 4

Spacer() 다음에 if 조건문 내에 별 이미지를 추가하해주세요. 현재의 랜드마크가 favorite 상태인지 아닌지 테스트하기 위함이죠.

SwiftUI 코드 블록에서, if 조건문을 뷰를 포함하기 위해 조건적으로 사용하는게 가능해요.


### Step 5

시스템 이미지들은 vertor 기반이어서, forgroundColor(_:) modifier 로 색상을 변경할 수 있어요.

별은 landmark 의 isFavorite 프로퍼티가 true 일 때마다 나타나요. 이번 튜토리얼에서 후에 프로퍼티를 어떻게 수정하는지 알게 될거에요.












