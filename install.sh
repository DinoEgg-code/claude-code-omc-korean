#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MARKETPLACE_SOURCE="https://github.com/Yeachan-Heo/oh-my-claudecode"
PLUGIN_NAME="oh-my-claudecode"

echo "========================================"
echo "claude code-korean + OMC 설치 도우미"
echo "========================================"
echo

if ! command -v claude >/dev/null 2>&1; then
  echo "오류: 'claude' 명령어를 찾지 못했습니다."
  echo "먼저 Claude Code를 설치한 뒤 다시 ./install.sh 를 실행해 주세요."
  exit 1
fi

echo "1. Claude Code 설치 확인 완료"

echo "2. OMC 마켓플레이스 추가"
if claude plugin marketplace add "${MARKETPLACE_SOURCE}"; then
  echo "마켓플레이스 추가 완료"
else
  echo "이미 추가되어 있거나, 네트워크/인증 상태를 확인해야 할 수 있습니다."
fi

echo "3. OMC 플러그인 설치 (project scope)"
if claude plugin install "${PLUGIN_NAME}" --scope project; then
  echo "OMC 플러그인 설치 완료"
else
  echo "플러그인 설치가 이미 되어 있거나 인증 확인이 필요할 수 있습니다."
fi

echo "4. 프로젝트 전용 OMC 초기 설정 시도"
if claude -p "setup omc" --add-dir "${ROOT_DIR}" >/dev/null 2>&1; then
  echo "OMC 초기 설정 자동 실행 완료"
else
  echo "자동 실행은 건너뛰고, 수동 안내로 이어갑니다."
fi

echo "5. 프로젝트 전용 OMC 설정 안내"
echo
echo "아래 명령을 Claude Code 안에서 한 번 실행해 주세요."
echo
echo "  /oh-my-claudecode:omc-setup --local"
echo "  /oh-my-claudecode:omc-doctor"
echo
echo "6. 한국어 메뉴 사용 시작"
echo "설정이 끝나면 이 프로젝트 폴더에서 Claude Code를 열고 아래만 입력하시면 됩니다."
echo
echo "  /메뉴판"
echo
echo "추가 안내:"
echo "- OMC 설정 파일 기본값은 ${ROOT_DIR}/.claude/omc.jsonc 에 준비되어 있습니다."
echo "- 자동 기록 폴더인 .omc 는 직접 수정하지 않는 것을 권장합니다."
