#!/usr/bin/env bash
#
# create_mystery_repo.sh
# ----------------------
# Builds a Git repo whose history (messages + diffs) tells
# “The Mystery of the Missing Semicolon” in Conan-Doyle style.
#
# ── How to use ─────────────────────────────────────────────
#   chmod +x create_mystery_repo.sh
#   ./create_mystery_repo.sh
#   cd the-mystery-of-the-missing-semicolon
#   git log --reverse -p
# ───────────────────────────────────────────────────────────

set -euo pipefail

REPO="the-mystery-of-the-missing-semicolon"
rm -rf "$REPO"
mkdir  "$REPO"
cd     "$REPO"
git init -q

# Helper: commit with strictly increasing timestamps for readable history
commit () {
  local msg="$1"
  shift || true              # allow zero path arguments
  git add -A "$@"            # -A stages deletions as well
  local ts
  ts=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  GIT_AUTHOR_DATE="$ts" GIT_COMMITTER_DATE="$ts" \
    git commit -q -m "$msg"
  sleep 1                    # guarantee unique timestamps
}

###############################################################################
# 1. A serene evening at Baker Street
###############################################################################
cat <<'EOF' > detective.ts
// detective.ts
// Dr John H. Watson's private log — 12 July 1895, 8:03 pm.
// A gentle rain drums upon the windows of 221B Baker Street.
// Holmes reclines with his violin; I, with an idle TypeScript experiment.
// Nothing stirs… yet.
export class WatsonLog {
    entry(): string {
        return "All is calm at Baker Street.";
    }
}
EOF
commit "chore: A calm evening — Watson sets the scene" detective.ts

###############################################################################
# 2. The client arrives bearing a stack trace
###############################################################################
cat <<'EOF' > mystery.ts
// mystery.ts
// A breathless visitor bursts in, thrusting a crumpled stack trace:
//    at Royal Treasury.ts:13:1  ← the very line where a semicolon vanished.
// Holmes' eyes gleam; the game is afoot.
export interface Mystery {
    readonly clue: string;
}
EOF
commit "feat: A baffling exception interrupts the peace — the case begins" mystery.ts

###############################################################################
# 3. Footprints in the mud-brown code
###############################################################################
cat <<'EOF' >> detective.ts

// Footprints — size 9½ — appear in the freshly-compiled mud of our codebase.
export function footprints(distance: number): string {
    return `Footprints measure ${distance} pixels — unmistakably size 9½.`;
}
EOF
commit "feat: Footprints of a cunning function appear" detective.ts

###############################################################################
# 4. Holmes measures again
###############################################################################
# Correct the size in footprints: Holmes spots a discrepancy
sed -i '' 's/9½/10/' detective.ts
commit "fix: Holmes re-measures — prints are size 10, not 9½" detective.ts

###############################################################################
# 5. Inspector Lestrade’s red herring patch
###############################################################################
cat <<'EOF' > redHerring.ts
// redHerring.ts
// Inspector Lestrade insists the culprit is an itinerant semicolon salesman.
// Holmes smiles politely and files the notion under 'Highly Improbable'.
export const redHerring = (): never => {
    throw new Error("Lestrade's theory collapses under its own weight.");
};
EOF
commit "feat: Lestrade adds a flamboyant but flawed red herring" redHerring.ts

###############################################################################
# 6. Holmes discreetly discards the red herring
###############################################################################
git rm -q redHerring.ts
commit "revert: Holmes removes Lestrade's red herring from the investigation"

###############################################################################
# 7. The violin of insight plays in generic C♯
###############################################################################
cat <<'EOF' > deduction.ts
// deduction.ts
// As Holmes draws the bow across the strings, a theme in C♯ emerges.
// Generics swirl like musical phrases, revealing patterns in the chaos.
export function deduce<T extends { clue: string }>(mystery: T): string {
    // TODO(Detective): Treat each figure as a coded note; play the melody to uncloak the truth.
    const elementaryConclusion: string = mystery.clue;
    return `Holmes infers: “${elementaryConclusion}”`;
}
EOF
commit "feat: The violin of insight — generics reveal hidden structure" deduction.ts

###############################################################################
# 8. A unit test exposes a ciphered confession
###############################################################################
mkdir -p tests
cat <<'EOF' > tests/confession.test.ts
// tests/confession.test.ts
// The failing test prints a cipher embedded in ASCII codes: 83-69-77-73-67-79-76-79-78
// Decode it, and the traitor’s name appears.
import { deduce } from "../deduction";
import { Mystery } from "../mystery";

const secret: Mystery = { clue: "83 69 77 73 67 79 76 79 78" };
const conclusion: string = deduce(secret);
console.log(conclusion);
console.assert(
    conclusion.includes("SEMICOLON"),
    "The cipher remains unsolved!",
);
EOF
commit "test: Test reveals a numeric cipher — the missing semicolon speaks" tests/confession.test.ts

###############################################################################
# 9. Culprit unmasked in final runtime check
###############################################################################
sed -i '' 's/SEMICOLON/SEMICOLON (the butler)/' tests/confession.test.ts
commit "feat: Culprit unmasked — ‘Semicolon the butler’ apprehended at line 13" tests/confession.test.ts

###############################################################################
# 10. Watson’s closing notes
###############################################################################
cat <<'EOF' > README.md
# The Mystery of the Missing Semicolon

> *“There is nothing so deceptive as an obvious bug.”*
> — S. Holmes, 1895

### Re-enact the investigation:

```bash
git log --reverse -p
```
Each commit message and code diff forms a chapter in the case.
Decode the ASCII cipher in `tests/confession.test.ts` to see how the rogue
semicolon gave itself away.

— **Dr John H. Watson**, M.D.
EOF
commit "docs: Watson pens the case summary — a lesson in punctuation" README.md
