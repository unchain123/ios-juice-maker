# ios-juice-maker

# :tropical_drink: 쥬스 메이커 프로젝트

> 프로젝트 기간: 2022-04-25 ~ 2022-05-13
> 팀원: [Kiwi](https://github.com/kiwi1023), [unchain123](https://github.com/unchain123) / 리뷰어: [HARIBO](https://github.com/HARlBO)
## 목차
1. [프로젝트 구현](#프로젝트-구현)
2. [UML](#UML)
3. [STEP 1](#STEP-1)
4. [STEP 2](#STEP-2)
5. [STEP 3](#STEP-3)

## 프로젝트 소개

### 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

### 
![ezgif com-gif-maker](https://user-images.githubusercontent.com/98506825/168276705-7654cf5a-506d-4d8d-8127-8a2819dddd8d.gif)

## UML
Class diagram
![](https://i.imgur.com/6JsQFih.png)

## STEP 1

### 기능구현 및 코드설명 ✏️
- Fruits: 과일 종류를 나열한 열거형
- Juice: 쥬스 종류를 나열한 열거형
-> recipe: 쥬스별로 소모되는 과일 종류와 갯수를 나 열한 프로퍼티
- fruits: 과일데이터를 받기 위한 빈 딕셔너리
- addFruitsStock: 과일 갯수를 추가하기 위한 함수
- consumeFruitsStock: 과일 갯수를 차감하기 위한 함수
- makeJuice: recipe를 받아와서 쥬스를 만드는 함수

### [STEP 1] 고민한점 및 해결방안 🤔
- Fruits 열거형을 처음 만들 때 값을 열거형 내에서 튜플이나 딕셔너리의 형태로 초기화 하여 사용하려다 보니 열거형 내의 rawvalue가 읽기만 가능하고 변경이 불가능 해서 어떻게 할 지 고민하다가 열거형에서는 과일들만 열거해주고 CaseIterable을 사용하여 배열화 시킨 후 클래스 내에서 프로퍼티로 딕셔너리를 선언하여 초기화를 통해 기초재고 10개를 넣어주었습니다.

- 상속이 되지 않는 class에 final 키워드를 붙이면, Dynamic Dispatch 가 아닌 Static Dispatch 로 작동해 성능 향상에 이점을 주기 때문에 final 키워드를 붙여 주었습니다.

## STEP 2

### 기능구현 및 코드설명 ✏️
- checkFruitsStock(viewVontroller) : 뷰 컨트롤러에서 재고를 보이게 하기 위한 재고 확인 함수
- order(쥬스이름) : 버튼 액션 함수들로 각 버튼에 맞는 쥬스들이 제조 되게 구현
- changeStockButton : 버튼을 누르면 화면 전환이 되도록 구현
- showMakeJuiceMessage : 쥬스가 제조 되었을 경우에 띄우는 얼럿 메세지
- showCheckStockMessage : 재고가 부족하여 쥬스를 제조하지 못했을 경우 재고를 수정할지 말지를 묻는 얼럿 메세지
- decideMessage : 쥬스 제조 버튼을 눌렀을 경우 동작되게 구현, 재고가 충분하여 쥬스가 제조되면 showMakeJuiceMessage함수를 실행, 재고가 부족하여 쥬스 제조에 실패하면 showCheckStockMessage를 실행하는 함수
- checkFruitsStock(FruitStore) : 뷰 컨트롤러에서 FruitStore내부의 재고에 접근하기 위한 함수 재고를 문자열로 변환
- checkInventory : 쥬스의 레시피를 받아와서 재고가 충분하지 않으면 에러를 던지는 함수

### [STEP 2] 고민한점 및 해결방안 🤔

- 딸기바나나 쥬스 등 두가지의 맛을 내는 음료를 제조 할때 하나의 과일이 품절임에도 불구하고 다른 하나의 과일의 재고가 여전히 사용되는 경우가 발생 하였습니다. 이를 해결하기 위해 Do문 안에서 try문을 먼저 위치 시킴으로써 오류가 발생했을 시 바로 캐치문으로 넘어가게 하였습니다. 그리하여 try문 밑에 위치하던 코드는 실행이 되지않아 문제를 해결할 수 있었습니다.

- 재고 부족 alert 메세지에서 '예'를 터치할 경우 재고 수정 화면으로 넘어가게 하는 방법을 몰라 고민을 하게 되었는데, performsegue라는 기능을 알게 되어 해결을 하게 되었습니다.

- 한 파일 안에서 @IBOutlet, 변수 선언, View Life Cycle, @IBAction, 함수, @objc, extension 들의 순서들을 맞춰주는 것이 코드 가독성을 훨씬 높여줄 수 있다.

## STEP 3

### 기능구현 및 코드설명 ✏️
- didTapStepper : 스탭퍼를 눌리면 재고의 수정이 가능하게 만든 함수
- setupViews : 재고수정화면으로 넘어오는 첫 화면의 재고 레이블에 현재 재고를 반영해 주는 함수
- findFruit : 스탭퍼의 종류에 따라 연결되어 있는 과일이름을 리턴하는 함수
- findFruitStepper : 과일이름에 따라 연결되어 있는 스탭퍼의 종류를 리턴하는 함수
- setupStepper : 스탭퍼의 기본값을 각 과일들의 재고로 세팅해주는 함수
- makeVaildStepperValue : 스탭퍼의 기본값을 만들어주기 위한 과일재고를 할당 하는 함수
- selectFruitLable : 선택된 과일의 재고를 레이블에 띄워주는 함수
- changeStock : 스탭퍼의 값을 재고에 반영해 주는 함수
- viewWillAppear : 재고수정 화면에서 처음의 화면으로 돌아올 때 수정된 재고가 반영 되지 않기 때문에 첫번째 화면이 나타나는 시점에 레이블의 값을 수정된 재고로 변경하여 주는 함수.

### [STEP 3] 고민한점 및 해결방안 🤔
- 네비게이션 컨트롤러를 사용하지 않아서 계속 노란색 에러가 났었는데 재고수정 세그를 네비게이션 컨트롤러로 연결 해주어서 해결함

- 스탭퍼를 사용하는 부분에서 스텝퍼.value값을 변경하지 않고 0으로 사용했었을 때 기존의 재고에서 1씩 더하거나 빼는게 아니라 0부터 시작해서 1씩 올라가는 상황이 있었는데 스텝퍼의 벨류값을 과일의 재고값으로 변경 하고나니 해결이 되었습니다.

- 스탭퍼 자체의 플러스 마이너스 클릭의 내부 메서드를 파악하지 못하고 기존에 만들어 두었더 재고를 더하는 함수를 이용해 보려고 했더니 재고가 +1, +2, +3, +4...이런 식으로 올라가는 현상이 나타났습니다. 이후에 스탭퍼 버튼의 특성을 다시 파악하고 외부에서 만든 함수를 하는게 아니라 기존의 값에 대입만 해주는 방법을 택해서 해결 하였습니다.
