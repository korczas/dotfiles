#!/bin/sh
# Cross-platform sound player for Claude Code hooks.
# Usage: play-sound.sh <stop|notification>
# Never blocks or fails the hook: plays in the background and always exits 0.

event="${1:-stop}"

play_windows() {
  # Media.SoundPlayer only handles .wav, which is all C:\Windows\Media ships.
  case "$event" in
    notification) wav='C:\Windows\Media\Windows Notify.wav' ;;
    *)            wav='C:\Windows\Media\Windows Ding.wav' ;;
  esac
  powershell.exe -NoProfile -Command "(New-Object Media.SoundPlayer '$wav').PlaySync()" >/dev/null 2>&1 &
}

case "$(uname -s)" in
  Darwin)
    case "$event" in
      notification) sound="/System/Library/Sounds/Frog.aiff" ;;
      *)            sound="/System/Library/Sounds/Glass.aiff" ;;
    esac
    afplay "$sound" >/dev/null 2>&1 &
    ;;
  Linux)
    if grep -qi microsoft /proc/version 2>/dev/null; then
      play_windows  # WSL: route audio through Windows
    else
      case "$event" in
        notification) sound="/usr/share/sounds/freedesktop/stereo/message-new-instant.oga" ;;
        *)            sound="/usr/share/sounds/freedesktop/stereo/complete.oga" ;;
      esac
      if command -v paplay >/dev/null 2>&1; then
        paplay "$sound" >/dev/null 2>&1 &
      elif command -v pw-play >/dev/null 2>&1; then
        pw-play "$sound" >/dev/null 2>&1 &
      elif command -v canberra-gtk-play >/dev/null 2>&1; then
        canberra-gtk-play -f "$sound" >/dev/null 2>&1 &
      fi
    fi
    ;;
  MINGW* | MSYS* | CYGWIN*)
    play_windows  # native Windows via Git Bash
    ;;
esac

exit 0
