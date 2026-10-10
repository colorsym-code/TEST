#!/usr/bin/env bash
# Generate an image with Codex (ChatGPT image generation) and save it under images/.
# Usage: scripts/gen-image.sh "a cat astronaut, watercolor" [output-name]
set -euo pipefail

prompt="${1:?usage: $0 \"prompt\" [output-name]}"
name="${2:-image-$(date +%Y%m%d-%H%M%S)}"
mkdir -p images

codex exec --full-auto --skip-git-repo-check \
  "Generate an image for this prompt using your image generation tool: ${prompt}
Save the result as images/${name}.png and reply only with the saved path."
