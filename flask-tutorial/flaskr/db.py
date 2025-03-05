import sqlite3
from datetime import datetime

import click
from flask import current_app, g
from werkzeug.security import generate_password_hash


def get_db():
    if 'db' not in g:
        g.db = sqlite3.connect(
            current_app.config['DATABASE'],
            detect_types=sqlite3.PARSE_DECLTYPES
        )
        g.db.row_factory = sqlite3.Row

    return g.db


def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()

def init_db():
    db = get_db()

    with current_app.open_resource('schema.sql') as f:
        db.executescript(f.read().decode('utf8'))

def block_user(db, user_id, block_status):
    """Cập nhật trạng thái khóa/mở khóa user."""
    db.execute("UPDATE user SET is_blocked = ? WHERE id = ?", (block_status, user_id))
    db.commit()

def reset_password(db, user_id, new_password):
    """Reset mật khẩu user (lưu ý cần hash mật khẩu trước khi lưu)."""
    hashed_password = generate_password_hash(new_password)
    db.execute("UPDATE user SET password = ? WHERE id = ?", (hashed_password, user_id))
    db.commit()



@click.command('init-db')
def init_db_command():
    """Clear the existing data and create new tables."""
    init_db()
    click.echo('Initialized the database.')


sqlite3.register_converter(
    "timestamp", lambda v: datetime.fromisoformat(v.decode())
)

def init_app(app):
    app.teardown_appcontext(close_db)
    app.cli.add_command(init_db_command)