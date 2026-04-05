# CCO-K

CCO-K는 비전공자도 쉽게 쓸 수 있도록 만든 한국어 Claude Code + OMC 플러그인입니다.  
복잡한 영어 명령어 대신 `/메뉴판` 하나로 필요한 기능을 고르고 바로 작업을 이어갈 수 있습니다.

![CCO-K 메뉴판](docs/images/menu.png)

메뉴판 예시 화면입니다. Claude Code를 실행한 뒤 `/메뉴판` 만 입력하면 바로 시작할 수 있습니다.

이 저장소는 기본 한국어 스킬에 더해 [OMC (Oh My ClaudeCode)](https://omc.vibetip.help/) 자동화 기능까지 함께 쓰도록 설계되어 있습니다.

## 주요 기능

- `/메뉴판` 하나로 지금 필요한 기능을 바로 찾을 수 있습니다.
- `/길잡이`, `/추천`, `/요청서` 로 처음 시작할 때 막히지 않게 도와줍니다.
- `/화면`, `/기능`, `/파일찾기`, `/설명`, `/고쳐` 로 실제 작업을 쉽게 이어갈 수 있습니다.
- `/자동개발`, `/끝까지`, `/초고속`, `/계획모드`, `/팀실행` 같은 OMC 모드도 한국어 흐름으로 사용할 수 있습니다.

## 설치 방법

1. Claude Code를 실행합니다.
2. 아래 명령을 입력합니다.

```text
/plugin marketplace add DinoEgg-code/claude-code-omc-korean
/plugin install cco-k@cco-k-marketplace
```

3. 플러그인 설치 후 아래 명령을 먼저 실행합니다.

```text
/ccok-setup
```

4. 설정이 끝나면 아래만 기억하시면 됩니다.

```text
/메뉴판
```
