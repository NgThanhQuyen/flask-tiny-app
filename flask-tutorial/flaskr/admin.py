from flask import Blueprint, render_template, request, redirect, url_for, flash
from flaskr.db import get_db, block_user, reset_password

bp = Blueprint('admin', __name__, url_prefix='/admin')

@bp.route('/')
def user_list():
    """Hiển thị danh sách user"""
    db = get_db()
    users = db.execute("SELECT id, username, is_blocked FROM user").fetchall()
    return render_template('admin/users.html', users=users)

@bp.route('/block/<int:user_id>')
def block(user_id):
    """Khóa hoặc mở khóa user"""
    db = get_db()
    user = db.execute("SELECT is_blocked FROM user WHERE id = ?", (user_id,)).fetchone()
    if user:
        new_status = 0 if user["is_blocked"] else 1
        block_user(db, user_id, new_status)
        flash("Cập nhật trạng thái user thành công.")
    return redirect(url_for('admin.user_list'))

@bp.route('/reset-password/<int:user_id>', methods=['POST'])
def reset(user_id):
    """Reset mật khẩu user"""
    new_password = request.form['new_password']
    db = get_db()
    reset_password(db, user_id, new_password)
    flash("Mật khẩu đã được đặt lại thành công.")
    return redirect(url_for('admin.user_list'))
