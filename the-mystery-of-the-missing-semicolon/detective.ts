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

// Footprints — size 10 — appear in the freshly-compiled mud of our codebase.
export function footprints(distance: number): string {
    return `Footprints measure ${distance} pixels — unmistakably size 10.`;
}
