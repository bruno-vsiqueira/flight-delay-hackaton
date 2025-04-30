# GitHub Copilot Usage Guidelines

This document provides instructions and best practices for using GitHub Copilot effectively within this project.

## Purpose

GitHub Copilot is an AI-powered code completion tool that can assist in writing code faster and with fewer errors. It is particularly useful for repetitive tasks, exploring unfamiliar libraries, and generating boilerplate code.

## Best Practices

1. **Start with Comments**: Use comments to describe what you want to achieve. Copilot can generate code based on your comments.
   - Example:
     ```dart
     // Fetch a list of airports from the API
     ```

2. **Review Suggestions**: Always review the code suggestions provided by Copilot to ensure they align with the project's requirements and coding standards.

3. **Iterative Refinement**: If the initial suggestion is not accurate, refine your comment or provide additional context to guide Copilot.

4. **Leverage Existing Code**: Copilot performs better when it has context. Ensure your files are well-structured and include relevant imports and dependencies.

5. **Avoid Sensitive Data**: Do not use Copilot to generate or handle sensitive information such as API keys, passwords, or personal data.

6. **Use for Boilerplate Code**: Copilot is excellent for generating repetitive or boilerplate code, such as model classes, API calls, or UI components.

## Examples

### Example 1: Generating a Model Class
```dart
// Create a model class for Airport with fields: airportId, airportName, city, state
```

### Example 2: Writing a Function
```dart
// Write a function to calculate the delay percentage for a given airport
```

## Limitations

- Copilot may not always generate optimal or secure code. Always validate the output.
- It may not fully understand complex project-specific logic or requirements.

## Additional Resources

- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [Copilot in Visual Studio Code](https://code.visualstudio.com/docs/editor/github-copilot)

By following these guidelines, you can maximize the benefits of GitHub Copilot while maintaining high-quality code in this project.
