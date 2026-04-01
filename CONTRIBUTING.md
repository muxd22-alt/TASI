# Contributing to TASI Alpha Cell Dashboard

Thank you for your interest in contributing! This document provides guidelines for contributing.

## 🎯 How to Contribute

### Reporting Bugs

Before creating bug reports, please check existing issues. When creating a bug report, include:

- **Clear title and description**
- **Steps to reproduce** the behavior
- **Expected vs actual behavior**
- **Screenshots** if applicable
- **Environment details** (OS, browser, Python version)

**Example:**
```markdown
**Bug**: TASI chart not rendering on mobile Safari

**Steps to Reproduce:**
1. Open dashboard on iPhone Safari
2. Scroll to charts section

**Expected:** Chart displays correctly
**Actual:** Blank canvas with console error

**Environment:** iOS 17, Safari
```

### Suggesting Features

Feature suggestions are welcome! Please provide:

- **Use case**: Why is this feature needed?
- **Proposed solution**: How should it work?
- **Alternatives considered**: Other approaches you've thought about

### Pull Requests

1. Fork the repository
2. Create a branch from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Make your changes
4. Test thoroughly
5. Commit with clear messages:
   ```bash
   git commit -m "feat: add oil price tracking widget"
   ```
6. Push and create PR

## 📋 Code Style

### Python

- Follow PEP 8
- Use type hints
- Include docstrings for public functions
- Keep functions focused (< 50 lines preferred)

```python
def fetch_market_data(symbol: str, period: str = "1mo") -> dict:
    """Fetch market data for a given symbol.
    
    Args:
        symbol: Ticker symbol (e.g., "^TASI")
        period: Time period for data
        
    Returns:
        Dictionary with OHLCV data
    """
    pass
```

### JavaScript/HTML

- Use ES6+ features
- Prefer `const` over `var`
- Use template literals for strings
- Keep inline scripts minimal

```javascript
// Good
const CONFIG = {
    API_URL: 'https://api.example.com',
    TIMEOUT: 5000
};

// Avoid
var config = {
    API_URL: 'https://api.example.com',
    TIMEOUT: 5000
};
```

## 🧪 Testing

Before submitting a PR:

1. **Test data fetch locally:**
   ```bash
   python scripts/fetch_data.py
   ```

2. **Test dashboard in browser:**
   - Chrome, Firefox, Safari
   - Mobile responsive view
   - Dark/light themes

3. **Verify no console errors**

## 📝 Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting)
- `refactor:` Code refactoring
- `test:` Test additions/changes
- `chore:` Maintenance tasks

**Examples:**
```bash
feat: add TASI volume indicator
fix: resolve chart rendering on iOS
docs: update setup instructions
refactor: extract news fetching logic
```

## 🔍 Code Review

All PRs require review. Reviewers check for:

- ✅ Functionality works as expected
- ✅ No security vulnerabilities
- ✅ Code follows project style
- ✅ Tests pass (if applicable)
- ✅ Documentation updated

## 📚 Additional Resources

- [GitHub Docs](https://docs.github.com/)
- [Python Style Guide](https://peps.python.org/pep-0008/)
- [Tailwind CSS Docs](https://tailwindcss.com/docs)
- [Chart.js Docs](https://www.chartjs.org/docs/)

---

Questions? Open an issue or start a discussion!
