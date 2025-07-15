flutter_train_app는 Flutter로 구현한 간단한 기차 예매 시뮬레이션 앱입니다. 사용자는 출발역과 도착역을 선택한 뒤, 좌석을 선택하여 예매를 진행할 수 있습니다.

주요 기능

출발역 / 도착역 선택HomePage에서 11개 역(수서, 동탄, 평택지제, 천안아산, 오송, 대전, 김천구미, 동대구, 경주, 울산, 부산) 중 출발역과 도착역을 선택할 수 있습니다.

좌석 선택 화면SeatPage에서 4열(A, B, C, D) × 20행의 좌석 배치도 중 원하는 좌석을 터치하여 선택할 수 있습니다.

예매 확인 다이얼로그선택한 좌석 정보를 요약하여 CupertinoAlertDialog로 확인 및 취소/확인 버튼을 제공합니다.


lib/
├── main.dart           // 앱 진입점, 테마 및 라우팅 설정
├── home_page.dart      // 출발/도착역 선택 HomePage
├── station_list_page.dart  // 역 리스트 화면
└── seat_page.dart      // 좌석 선택 화면


확장 및 커스터마이징

역 목록(station_list_page.dart의 _stations 리스트)을 수정하여 지원하는 역을 추가/삭제할 수 있습니다.

Table과 SizedBox를 활용해 좌석 배치도 행列 수 및 간격을 조절할 수 있습니다.

CupertinoAlertDialog 대신 AlertDialog를 사용하여 Android 스타일 다이얼로그로 변경할 수 있습니다.
