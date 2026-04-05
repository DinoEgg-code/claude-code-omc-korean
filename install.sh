#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MARKETPLACE_SOURCE="https://github.com/Yeachan-Heo/oh-my-claudecode"
PLUGIN_NAME="oh-my-claudecode"
SETUP_HINT_1="/oh-my-claudecode:omc-setup --local"
SETUP_HINT_2="/oh-my-claudecode:omc-doctor"

echo "========================================"
echo "CCO-K 설치 도우미"
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
  echo "마켓플레이스 추가에 실패했습니다."
  echo "- 이미 추가된 경우일 수 있습니다."
  echo "- 인터넷 연결이 불안정할 수 있습니다."
  echo "- Claude Code 로그인이 안 되어 있을 수 있습니다."
  echo "- GitHub 주소 접근이 막혀 있을 수 있습니다."
fi

echo "3. OMC 플러그인 설치 (project scope)"
if claude plugin install "${PLUGIN_NAME}" --scope project; then
  echo "OMC 플러그인 설치 완료"
else
  echo "플러그인 설치에 실패했거나 이미 설치되어 있을 수 있습니다."
  echo "- Claude Code 로그인이 안 되어 있을 수 있습니다."
  echo "- 마켓플레이스 추가가 먼저 필요할 수 있습니다."
  echo "- 네트워크 문제로 설치가 중단되었을 수 있습니다."
  echo "- 이미 설치된 경우에는 다음 단계로 넘어가도 됩니다."
fi

echo "4. 프로젝트 전용 OMC 초기 설정 시도"
if claude -p "setup omc" --add-dir "${ROOT_DIR}" >/dev/null 2>&1; then
  echo "OMC 초기 설정 자동 실행 완료"
else
  echo "자동 실행은 건너뛰고, 수동 안내로 이어갑니다."
  echo "- Claude Code 세션 안에서 슬래시 명령 실행이 더 안정적일 수 있습니다."
  echo "- 아직 OMC 플러그인이 완전히 활성화되지 않았을 수 있습니다."
fi

echo "5. 프로젝트 전용 OMC 설정 안내"
echo
echo "아래 명령을 Claude Code 안에서 한 번 실행해 주세요."
echo
echo "  ${SETUP_HINT_1}"
echo "  ${SETUP_HINT_2}"
echo
echo "6. 한국어 메뉴 사용 시작"
echo "설정이 끝나면 이 프로젝트 폴더에서 Claude Code를 열고 아래만 입력하시면 됩니다."
echo
echo "  /메뉴판"
echo
echo "추가 안내:"
echo "- OMC 설정 파일 기본값은 ${ROOT_DIR}/.claude/omc.jsonc 에 준비되어 있습니다."
echo "- 자동 기록 폴더인 .omc 는 직접 수정하지 않는 것을 권장합니다."
echo "- 설치가 안 되면 먼저 Claude Code를 재실행한 뒤 ${SETUP_HINT_1} 을 다시 시도해 보세요."
echo "- 그래도 안 되면 ${SETUP_HINT_2} 로 진단 결과를 먼저 확인하세요."
