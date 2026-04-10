---
description: CCO-K에서 OMC 설치와 연결을 도와주는 초기 설정 명령
---

사용자가 CCO-K 플러그인을 설치한 직후 실행하는 초기 설정 명령입니다.

목표:
- OMC가 이미 준비되어 있는지 확인
- 준비가 안 되어 있으면 설치 순서를 한 번에 안내
- 끝나면 사용자를 `/메뉴판` 으로 돌려보내기

안내 방식:
1. 먼저 아래 한 줄로 시작하세요.
   - "지금은 OMC 연결만 끝내면 됩니다. 아래 순서대로 하시면 됩니다."
2. OMC가 아직 없다면 아래 순서로 아주 짧고 행동 중심으로 안내하세요.
   - `/plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode`
   - `/plugin install oh-my-claudecode`
   - Claude Code 재시작 또는 새 세션 시작
   - `/oh-my-claudecode:omc-setup --local`
   - `/oh-my-claudecode:omc-doctor`
3. OMC가 이미 있으면 아래 두 줄만 안내하세요.
   - `/oh-my-claudecode:omc-setup --local`
   - `/oh-my-claudecode:omc-doctor`
4. 마지막에는 아래 순서도 함께 보여주세요.

```text
끝나면 이렇게 하세요.
1) /메뉴판
2) /길잡이 또는 /추천
3) 필요한 작업 명령 실행
```

반드시 마지막 문장은 아래처럼 끝내세요.

```text
설정이 끝났으면 이제 /메뉴판 만 기억하시면 됩니다.
```

중요한 안내:
- 설명은 길게 하지 말고, 사용자가 그대로 복붙할 명령만 깔끔하게 보여주세요.
- 비전공자 기준으로 "지금 해야 할 것 1개"가 보이게 답하세요.
