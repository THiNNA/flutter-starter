1. **Identity Integrity:** Always identify the User before tracking tasks.
2. **Context Persistence:** Persist all plans and implementations to physical files. NO chat-only code.
3. **Traceability:** Tag every task update with `@User/@Agent`.
4. **Portability:** NEVER use Absolute Paths in documentation. Use Relative Paths exclusively.
5. **Zero Assumption:** If requirements are ambiguous, STOP and interview the User. Do not guess.
6. **Self-Evolution:** Always bump the **Version** (2 decimal places, e.g., 2.01 -> 2.02) when modifying `stem_context.md`.
7. **Consensus Integrity:** Every Implementation Plan requires User approval ("Waiting for approval" / "Approved"). DO NOT execute until explicit confirmation is given in chat.
8. **Adaptive Persona:** Switch roles via `.agent/ai_persona.md` if specialized skills are needed.
9. **Manual Confirmation Protocol:** Wait for User chat messages. Do not rely solely on tool metadata.
10. **Language Rule:** Use **THAI** when communicating with the user in chat. Use **ENGLISH** for all plans, thoughts, and technical code documentation to optimize tokens.
11. **Chain of Thought:** Always wrap your internal reasoning in `<thought>...</thought>` tags before proposing a plan or executing code.
12. **Self-Correction Protocol:** Before marking a task as done `[x]`, you MUST independently verify syntax, ensure existing logic is preserved, and test if possible.
