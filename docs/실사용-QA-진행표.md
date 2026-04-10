# CCO-K 실사용 QA 진행표

이 문서는 비전공자 기준으로 실제 명령이 의도대로 움직이는지 점검하기 위한 진행표입니다.

## QA 목표
- 처음 보는 사람이 길을 잃지 않는가.
- 메뉴판과 실제 명령이 연결되는가.
- 비슷한 명령의 차이가 이해되는가.
- OMC 연결이 `/ccok-setup` 기준으로 일관되게 안내되는가.
- 에러 수정 / 원인 추적 / 딥 분석 차이가 실제로 드러나는가.

## 1단계. 첫 진입 테스트
### 입력할 명령
- /시작하기
- /메뉴판
- /길잡이
- /추천

### 기대 결과
- /시작하기: 설치 → /ccok-setup → /메뉴판 순서가 보여야 함
- /메뉴판: 초급 시작 / 작업·마무리 / 고급 자동화 3단 구조로 보여야 함
- /길잡이: 완전 처음인 사람 기준으로 1개 명령만 추천해야 함
- /추천: 이미 작업 중인 사람 기준으로 다음 행동 1개를 추천해야 함

### 실패 시 점검할 파일
- plugins/cco-k/commands/시작하기.md
- plugins/cco-k/commands/메뉴판.md
- .claude/skills/guide.md
- .claude/skills/recommend.md
- CLAUDE.md

## 2단계. 만들기 흐름 테스트
### 입력할 명령
- /요청서 쇼핑몰 랜딩페이지 만들고 싶어
- /화면 깔끔한 회원가입 화면 만들어줘
- /기능 이메일 로그인 기능 만들어줘

### 기대 결과
- /요청서: 아이디어를 더 선명한 실행 요청으로 정리해줘야 함
- /화면: UI 생성 흐름으로 연결돼야 함
- /기능: 실제 기능 구현 흐름으로 연결돼야 함

### 실패 시 점검할 파일
- .claude/skills/request-builder.md
- .claude/skills/ui-gen.md
- .claude/skills/new-feature.md
- plugins/cco-k/commands/요청서.md
- plugins/cco-k/commands/화면.md
- plugins/cco-k/commands/기능.md

## 3단계. 문제 해결 흐름 테스트
### 입력할 명령
- /고쳐
- /원인추적 로그인 버튼 눌러도 반응이 없어요
- /딥분석 앱이 점점 느려지고 가끔 멈춰요

### 기대 결과
- /고쳐: 빠른 수정 중심으로 안내해야 함
- /원인추적: 왜 이런 일이 생겼는지 추적 중심이어야 함
- /딥분석: 구조/성능/반복 장애 분석 중심이어야 함
- 세 명령의 차이가 사용자가 읽었을 때 분명해야 함

### 실패 시 점검할 파일
- plugins/cco-k/commands/고쳐.md
- plugins/cco-k/commands/원인추적.md
- plugins/cco-k/commands/딥분석.md
- .claude/skills/omc-trace.md
- .claude/skills/omc-analyze.md

## 4단계. OMC 연결 흐름 테스트
### 입력할 명령
- /ccok-setup
- /자동개발 강의 사이트 MVP 만들어줘
- /끝까지 로그인 기능 끝날 때까지 밀어줘
- /초고속 여러 타입 오류 한꺼번에 처리해줘
- /계획모드 회원가입 구조 먼저 정리해줘
- /팀실행 관리자 페이지와 예약 기능을 나눠서 진행해줘
- /자동검수 배포 전 전체 점검해줘

### 기대 결과
- OMC 미연결 상태면 먼저 /ccok-setup 으로 유도해야 함
- `./install.sh` 만 던지고 끝나면 안 됨
- 각 OMC 명령은 언제 쓰면 좋은지와 다른 명령이 더 나을 수 있는 경우까지 짧게 설명해야 함

### 실패 시 점검할 파일
- plugins/cco-k/commands/ccok-setup.md
- .claude/skills/omc-autopilot.md
- .claude/skills/omc-ralph.md
- .claude/skills/omc-ulw.md
- .claude/skills/omc-plan.md
- .claude/skills/omc-team.md
- .claude/skills/omc-ultraqa.md
- .claude/skills/omc-trace.md
- .claude/skills/omc-analyze.md

## 5단계. 별칭 명령 테스트
### 입력할 명령
- /메뉴
- /진단
- /끝장내기 로그인 끝날 때까지 해줘
- /팀플레이 예약 기능 만들어줘

### 기대 결과
- 별칭 명령은 대표 명령으로 자연스럽게 유도해야 함
- 예:
  - /메뉴 → /메뉴판
  - /진단 → /추천
  - /끝장내기 → /끝까지
  - /팀플레이 → /팀실행

### 실패 시 점검할 파일
- plugins/cco-k/commands/메뉴.md
- plugins/cco-k/commands/진단.md
- plugins/cco-k/commands/끝장내기.md
- plugins/cco-k/commands/팀플레이.md

## 최종 체크 질문
- 초보자가 "지금 뭘 치면 되는지" 한 번에 보이나.
- 메뉴판과 실제 라우팅 문서가 같은가.
- 비슷한 명령 차이가 읽기만 해도 이해되나.
- OMC 연결이 `/ccok-setup` 기준으로 일관적인가.
- 대표 명령과 별칭 명령이 구분되나.

## 추천 QA 순서
1. /시작하기
2. /메뉴판
3. /길잡이
4. /추천
5. /요청서
6. /화면
7. /기능
8. /고쳐
9. /원인추적
10. /딥분석
11. /ccok-setup
12. /자동개발
13. /끝까지
14. /초고속
15. /계획모드
16. /팀실행
17. /자동검수
18. /메뉴
19. /진단
20. /끝장내기
21. /팀플레이
