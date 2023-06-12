# Completed Project: Handling User Input

Explore the completed project for the [Handling User Input](https://developer.apple.com/tutorials/swiftui/handling-user-input) tutorial.

# Drawing and Animation
## Path와 Shape 그리기 (Drawing Paths and Shape)

유자가 리스트 내의 랜드마크를 방문할 떄마다 뱃지를 받습니다. 물론 뱃지를 받는 유저를 위해 우리는 뱃지를 만들어줄 필요가 있어요. 이번 튜토리얼에서는 path와 shape를 결합해 뱃지를 만드는 과정을 통해

만약 여러 랜드마크의 서로 다른 종류에 대한 뱃지들을 생성하고 싶다면, overlay가 적용된 심볼을 경험해보세요

Users receive a badge whenever they visit a landmark in their list. Of course, for a user to receive a badge, you’ll need to create one. This tutorial takes you through the process of creating a badge by combining paths and shapes, which you then overlay with another shape that represents the location.

If you want to create multiple badges for different kinds of landmarks, try experimenting with the overlaid symbol, varying the amount of repetition, or changing the various angles and scales.


## Section 1 - Badge View 에 대한 Data Drawing 을 생성하기 (Create Drawing Data for a Badge View)

뱃지를 생성하기 위해서, 데이터를 정의하고 뱃지의 배경으로 육각형 모양(hexagon shape)을 그릴 수 있는 데이터를 정의하면서 시작해볼거에요.

### Step 1 

Views 폴더를 선택하고 새로운 파일을 추가합니다. 템플릿은 Swift File 을 선택하고 다음으로 진행해주세요.

### Step 2 

HexagonParameters.swfit 파일을 생성합니다.

이 친구는 육각형 모양을 정의하는 구조체로 사용할거에요.

### Step 3

HexagonParameters 라는 이름의 구조체를 만들어주세요.

### Step 4

Segment 구조체를 정의해 주세요. 육각형의 하나의 변을 나타내는 3개의 점을 가지고 있는 친구에요.
CoreGraphics 를 Import 하면 CGPoint 를 사용할 수 있어요.

각 변은 이전의 변이 끝나는 곳에서 시작해 첫 번쨰 포인트까지 직선 라인을 따라 이동하고, 다음 모퉁이에서 Bézier 곡선을 통해 두 번쨰 점으로 움직입니다.세 번째 포인트는 곡선의 모양을 컨트를해요.

### Step 5

(육각형에 필요한) 선분을 가지는 배열을 선언합니다.

### Step 6

여섯 개의 선분에 대한 데이터를 추가합니다. 육각형의 각 변들 중 하나를 말해요.

값은 왼쪽 상단에 원점이 있고 오른쪽에 양의 x가 있고 아래쪽에 양의 y가 있는 단위 제곱의 분수로 저장됩니다. 나중에 이 분수를 사용하여 주어진 크기의 육각형의 실제 점을 찾을 것입니다.
(The values are stored as a fraction of a unit square having its origin in the upper left, with positive x to the right and positive y down. Later, you’ll use these fractions to find the actual points of a hexagon with a given size.)

### Step 7 

Adjustment 값을 추가할게요. 육각형의 모양을 조율하는 역할이에요. 


## Section 2 - 뱃지 배경 그리기 (Draw the Badge Background)

SwiftUI 의 Graphics API 를 사용해 커스텀 뱃지 모양을 그려볼게요.

### Step 1

파일을 생성할게요. SwiftUI View 템플릿을 선택해 BadgeBackground 이름으로 생성해주세요.

### Step 2

생성한 파일로 가서, 'Path' 뱃지의 모양을 추가하고 fill() modifier 를 뷰 내에서 모양을 나타내기 위해 적용해주세요.

Paths 의 용도는 선과 곡선과 뱃지의 육각형 배경과 같이 더 복잡한 모양의 형태를 만들기 위한 다른 원시적인 드로잉 요소들을 결합하는데 사용돼요. (You use paths to combine lines, curves, and other drawing primitives to form more complex shapes like the badge’s hexagonal background.)

### Step 3

Path에 시작 점을 추가해요. 컨테이너의 사이즈는 100X100 으로 가정해보죠.

move(to:) 메서드는 가상의 펜이나 연필이 해당 영역 위를 맴돌며 그리기 시작하기를 기다리는 것처럼 도형의 경계 내에서 드로잉 커서를 이동합니다.

### Step 4

러프한 육각형 모양을 생성하기 위해 모양 데이터(shape data)의 각 점에 대해 선을 그립니다.

addList(to:) 메서드는 단일 점을 가져와서 그린다. addLine(to:)에 대한 연속적인 호출은 이전 점에서 선을 시작하고 새 점으로 계속됩니다.


* 육각형이 좀 이상해도 걱정마세요. 모양의 모퉁이에서 각각의 선분(segment)의 곡선 부분을 무시했기 때문이에요.  

### Step 5

addQuadCurve(to:control:) 메서드를 사용해서 베지어 곡선을 뱃지의 모퉁이에 그려볼게요.


### Step 6

Badge가 값(100)을 하드 코딩하는 대신 크기를 정의하는 포함된 뷰의 크기를 사용할 수 있도록 GeometryReader 를 이용해 Path 코드를 래핑합니다.

기하학 2차원의 가장 작은 것을 사용하면 포함하는 뷰가 정사각형이 아닐 때 배지의 종횡비가 유지됩니다. (?????)
(Using the smallest of the geometry’s two dimensions preserves the aspect ratio of the badge when its containing view isn’t square.)


### Step 7

xScale 을 사용해 x축의 모양의 크기를 조정한 다음 xOffSet 을 추가하여 형상 내에서 모양을 중앙에 맞춥니다.
(Scale the shape on the x-axis using xScale, and then add xOffset to recenter the shape within its geometry.)

### Step 8

Fill 코드 블록을 다음과 같이 변경해 그라디언트 효과롤 부여합니다.


### Step 9

aspectRatio(_:contentMode:) modifier 를 적용해 Gradient를 가득 채워보세요.

1:1 종횡비를 유지함으로서 배지는 뷰의 중심 위치를 유지합니다. 부모 뷰가 정사각형이 아니더라도요.



