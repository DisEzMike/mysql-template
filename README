# MySQL Template

## Requirements
- Docker + Docker Compose
- Make

## Quick Start
1. Put your SQL init file in `sql/` (example: `sql/init.sql`).

2. Update `.env`:

```env
PROJECT_NAME=mysql-template
SQL_PASSWORD=password123
SQL_PORT=3306
SQL_FILE=./sql/init.sql
```

3. Start MySQL:

```bash
make up
```

## Makefile Commands
- `make up` — Start MySQL container in background.
- `make down` — Stop and remove container/network.
- `make shell` — Open MySQL shell as root.
- `make status` — Show running container status.
- `make logs` — Follow MySQL logs.
- `make clean` — Stop and remove container + volume data.

## Notes
- Default port is `3306`.
