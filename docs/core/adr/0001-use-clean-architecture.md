# ADR 0001: Use Feature-First Clean Architecture

**Date:** 2026-05-16
**Status:** Accepted

## Context
As the application scales, keeping a monolithic `lib/` directory or grouping by layers (e.g., all `models/` together, all `pages/` together) leads to poor discoverability and frequent merge conflicts. We needed a structure that allows multiple teams and AI Agents to work on isolated features without stepping on each other's toes.

## Decision
We adopted a **Feature-First Clean Architecture**. 
- `lib/core/` handles global utilities, routing, and networking.
- `lib/features/` contains isolated feature modules.
- Every feature must adhere to the Domain, Data, and Presentation separation.
- We use Mason (`clean_feature` brick) to enforce this structure automatically.

## Consequences
- **Positive:** High cohesion. A developer only needs to look inside one folder to understand a feature. AI Agents have isolated context.
- **Negative:** Initial boilerplate is high (requires Domain/Data/Presentation folders for even small features). Mitigated by Mason code generation.
