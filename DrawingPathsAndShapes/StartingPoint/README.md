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