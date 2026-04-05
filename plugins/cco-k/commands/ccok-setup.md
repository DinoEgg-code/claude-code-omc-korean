---
description: CCO-K에서 OMC 설치와 연결을 도와주는 초기 설정 명령
---

사용자가 CCO-K 플러그인을 설치한 직후 실행하는 초기 설정 명령입니다.

해야 할 일:

1. 먼저 사용자의 현재 환경이 Claude Code 안인지 확인하고, OMC가 이미 설치되어 있는지 물어보지 말고 가능한 범위에서 확인하세요.
2. OMC가 아직 없다면 아래 순서로 아주 짧고 행동 중심으로 안내하세요.
   - `/plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode`
   - `/plugin install oh-my-claudecode`
   - Claude Code 재시작 또는 새 세션 시작
   - `/oh-my-claudecode:omc-setup --local`
   - `/oh-my-claudecode:omc-doctor`
3. OMC가 이미 있으면 바로 `/oh-my-claudecode:omc-setup --local` 과 `/oh-my-claudecode:omc-doctor` 만 안내하세요.
4. 마지막에는 반드시 아래 문장으로 끝내세요.

```text
설정이 끝났으면 이제 /메뉴판 만 기억하시면 됩니다.
```

중요한 안내:
- Claude Code 플러그인 구조상 다른 플러그인을 선언적으로 자동 의존성 설치하는 방식은 보이지 않으므로, CCO-K에서는 이 설정 명령으로 OMC 연결을 마무리합니다.
- 설명은 길게 하지 말고, 사용자가 그대로 복붙할 명령만 깔끔하게 보여주세요.
