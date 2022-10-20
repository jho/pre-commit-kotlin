# pre-commit-kotlin

Pre-Commit hooks for kotlin

# Usage

```yaml
  - repo: https://github.com/jho/pre-commit-kotlin
    rev: v0.0.2
    hooks:
      - id: ktlint
        args: [--format]
      - id: detekt
        args: [--c, .detekt-config.yml,  --build-upon-default-config]
```
