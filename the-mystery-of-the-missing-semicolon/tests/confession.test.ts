// tests/confession.test.ts
// The failing test prints a cipher embedded in ASCII codes: 83-69-77-73-67-79-76-79-78
// Decode it, and the traitor’s name appears.
import { deduce } from "../deduction";
import { Mystery } from "../mystery";

const secret: Mystery = { clue: "83 69 77 73 67 79 76 79 78" };
const conclusion: string = deduce(secret);
console.log(conclusion);
console.assert(
    conclusion.includes("SEMICOLON (the butler)"),
    "The cipher remains unsolved!",
);
