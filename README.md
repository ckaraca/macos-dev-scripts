# Scripts Repository

A collection of utility scripts for development and infrastructure tasks.

## Available Scripts

### create_pg_instance.sh
Creates a PostgreSQL Docker container for development purposes.

```bash
# Usage
./create_pg_instance.sh <repo_name> [port]

# Example
./create_pg_instance.sh myproject 5433
```

This will create a PostgreSQL container with:
- Container name: `Pluggedin_myproject`
- Database name: `pluggedin_myproject_db`
- User: `pluggedin_user`
- Password: `strongpassword`
- Port: `5433` (or 5432 if not specified)

## Requirements

- Docker installed and running

## Running Scripts

1. Make scripts executable:
   ```bash
   chmod +x script_name.sh
   ```

2. Run the script:
   ```bash
   ./script_name.sh [arguments]
   ```

## Contributing

### Adding New Scripts

1. Create your script with a descriptive name using snake_case
2. Start with a shebang line: `#!/bin/bash`
3. Add comments explaining what the script does
4. Include usage examples in comments
5. Add proper error handling and input validation
6. Test your script thoroughly
7. Update this README with details about your script

### Style Guidelines

Please follow the style guidelines in [CLAUDE.md](CLAUDE.md) when contributing.

### Pull Request Process

1. Create a new branch for your changes
2. Make your changes and test them
3. Update documentation as needed
4. Submit a pull request
5. Ensure your code follows the repository's style guidelines

## License

This project is licensed under the MIT License - see the LICENSE file for details.