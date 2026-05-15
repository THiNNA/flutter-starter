# Contributing Guidelines

Thank you for contributing! This document acts as the source of truth for our commit and development standards.

## Conventional Commits
We strictly follow [Conventional Commits](https://www.conventionalcommits.org/). Every commit message MUST be formatted as:

`<type>[optional scope]: <description>`

### Allowed Types:
- `feat:` A new feature (e.g., `feat(auth): add google login`)
- `fix:` A bug fix (e.g., `fix(home): resolve infinite scroll bug`)
- `docs:` Documentation only changes
- `style:` Changes that do not affect the meaning of the code (white-space, formatting, etc)
- `refactor:` A code change that neither fixes a bug nor adds a feature
- `perf:` A code change that improves performance
- `test:` Adding missing tests or correcting existing tests
- `chore:` Changes to the build process or auxiliary tools/libraries

## AI Agent Workflow
If you are modifying architectural rules or generating new features:
1. Use `mason make clean_feature` to generate feature directories.
2. Ensure you act according to the personas in `.agent/personas/` when writing specs.
3. Update `docs/master_todo.md` upon completing any roadmap task.
