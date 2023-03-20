# juice-maker(SwiftUI)

# :tropical_drink: 쥬스 메이커 프로젝트

## [unchain](https://github.com/unchain123)
 
## 프로젝트 소개
- 스토리기반의 프로젝트를 SwiftUI를 사용하여 리펙토링 해보기

### 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

### 동작화면


| TapView| Storage | Alert |
|:--------: | :--------: | :--------: |
| <img src = "https://i.imgur.com/dR0DPYJ.gif" height=300, width= 300> | <img src = "https://i.imgur.com/RxLOknP.gif" height=300, width= 300> | <img src = "https://i.imgur.com/uDsN9Ro.gif" height=300, width= 300> |

## UITest, UnitTest
| 테스트 설정|
| :--------: |
|<img src = "https://i.imgur.com/O1gzT40.png" width=250>|


- 비즈니스로직 검증을 위해 유닛테스트와 UI테스트를 추가 했고 각각의 테스트는 위와 같이 체크하여 병렬로 진행되도록 하여 테스트 시간을 단축시켰고, 테스트의 순서를 무작위로 하게 하여 테스트간의 종속성이 없음을 강조 했습니다.


## trouble shooting
### List사용시 내부 뷰의 위치

? 문제점: 처음에 창고의 뷰를 만들 때 List에 넣어서 보여주려고 했는데 뷰들이 왼쪽에 붙어 있는 문제가 있었습니다.

! 해결: List를 없애고 스크롤뷰에 넣어줬습니다. 리스트는 그 자체로 셀에 대한 Inset이 기본값으로 정해져 있기 때문에 나타났던 현상인데 List의 기능이 필요한 뷰가 아니라고 판단되어 List를 제거하고 ScrollView를 넣어서 해결했습니다.

<img src = "https://i.imgur.com/gks0kw6.png" width=200, height=300>

### 데이터바인딩

?문제점: SwiftUI의 특징인 양방향 소통으로 창고에서 카운트를 바꾸면 바로 반영이 되는 문제가 있었습니다.

!해결: 양방향 소통을 하지 않도록 변경하고 Combine을 활용해서 데이터의 이동을 단방향으로 이루어 지도록 해줬습니다. 그래서 버튼을 누를 때만 재고가 저장이 되도록 하였습니다.

```swift
   func saveStock() {
        $juiceStock
            .sink { [weak self] changedStock in
                self?.service.changeStock(changedStock)
            }.store(in: &cancelable)
    }
```
