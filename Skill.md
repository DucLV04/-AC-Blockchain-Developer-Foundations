# Skill: Solidity Exercise Prompting Guide (4D Framework)

## Purpose
This skill provides a reusable framework and prompt templates to solve Solidity exercises in this repository. It applies the **4D** methodology (Define, Design, Develop, Deliver) to ensure AI generates correct `.sol` files that match each exercise's requirements and repository conventions.

## Context
- Repository: `AC_Blockchain-Developer-Foundations`
- Structure: `lessons/bai{N}/` with optional `problem.md`, `README.md`, `test.ts`, and existing `.sol` files
- Conventions observed: `// SPDX-License-Identifier: MIT`, `pragma solidity ^0.8.0;`, contract name matches filename, minimal style
- Exercises often run in Remix IDE (many `test.ts` are placeholders)

## 4D Framework

| D | Name | Goal | Application |
|---|-----|------|-------------|
| D1 | **Define** | Clarify objective, scope, target | Identify target dir/file, contract name, exact requirements from problem/README |
| D2 | **Design** | Plan solution respecting conventions | Review existing `.sol` files, state variables, functions, modifiers, events, access control |
| D3 | **Develop** | Implement strictly per requirements | Write only what's asked, follow Solidity 0.8.x, proper types/memory, visibility |
| D4 | **Deliver/Verify** | Validate and output in correct form | Check filename=contract, syntax, signatures, full coverage, consistent style |

## Core Components of a Good Prompt

| Component | Purpose | Suggested phrasing |
|---|---|---|
| Role | Focus expertise | `You are a Senior Solidity developer. Write clean, minimal, idiomatic Solidity 0.8.x code consistent with existing files.` |
| Task | Clear action | `Create ONLY the required .sol file in the correct lessons/bai{N}/ folder. Do NOT modify test.ts or other files.` |
| Context | Repo knowledge | Include problem/README content, existing `.sol` samples, paths, conventions (SPDX, pragma ^0.8.0). |
| Requirements | Explicit list | Extract each requirement verbatim: variables, structs, mappings, constructor, modifiers, events, functions (name/params/returns/visibility). |
| Constraints | Prevent extras | `No comments, no explanations, no extra functions/variables/events/modifiers not requested. Use Solidity ^0.8.0.` |
| Examples | Style anchor | Reference nearby `.sol` files (e.g. Profile.sol, VotingEligibility.sol) to mirror style. |
| Format | Output control | `Return ONLY the complete .sol file content inside a single \`\`\`solidity code block.` |
| Verify | Self-check | `Verify: filename matches contract name, syntax valid for ^0.8.0, all requirements met, style matches samples.` |

## Reusable Prompt Template

```text
# ROLE (D1)
You are a Senior Solidity developer writing minimal, correct code consistent with this repo's conventions.

# CONTEXT (D1+D2)
Repo: AC_Blockchain-Developer-Foundations
Target: lessons/bai{N}/
Conventions:
- // SPDX-License-Identifier: MIT
- pragma solidity ^0.8.0;
- Filename = ContractName.sol
- Style: short, idiomatic Solidity 0.8.x, no unnecessary comments

Review existing .sol files in lessons/bai{N}/ (and nearby) to match style. Read problem/README for exact requirements.

# TASK (D2->D3)
Create ONLY {ContractName}.sol in lessons/bai{N}/ meeting all stated requirements. Do NOT edit test.ts or any other files.

# REQUIREMENTS (D3)
Implement exactly:
- Contract name: {ContractName}
- All state vars, structs, mappings, enums as specified
- Constructor/modifiers/events/functions with exact names/params/returns/visibility
- Access control/validation (onlyOwner/require) only if explicitly required
- Logic minimal and correct

# CONSTRAINTS (D3)
- Solidity ^0.8.0 only
- No comments, no explanations, no README edits
- No extra code beyond what’s required
- No test modifications

# VERIFICATION (D4)
Self-check before output:
1. File path: lessons/bai{N}/{ContractName}.sol
2. Contract name matches filename
3. All requirements satisfied
4. Syntax valid for pragma ^0.8.0
5. Style consistent with existing samples

# INPUT
problem/README content: {paste full text}

# OUTPUT FORMAT (D4)
Return ONLY the complete .sol file inside a single ```solidity code block. No extra text.
```

## Usage
1. Identify `bai{N}` and contract name from `problem.md`/`README.md`.
2. Fill `{N}`, `{ContractName}`, and paste full problem/README into template.
3. Run with AI to generate `.sol` file.
4. Open in Remix IDE and test per exercise instructions.
5. Only create `.sol` files as requested; never modify `test.ts`.

## Notes
- Prefer to mirror existing files in same lesson (if any). 
- Keep code minimal: e.g. `return age >= minAge;` is fine.
- For access control, use `onlyOwner` modifier + `require` only when specified.
- Follow exact naming/signatures from requirements.
- This skill works for all lessons (bai1..bai7) — not limited to 3_1/3_2.