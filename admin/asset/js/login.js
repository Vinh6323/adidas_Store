
function login(e) {
  e.preventDefault();
  const user = document.getElementById('username').value;
  const pass = document.getElementById('password').value;

  if (user === 'admin' && pass === '123456') {
    window.location.href = 'admin-dashboard.html';
  } else {
    alert('❌ Sai tài khoản hoặc mật khẩu!');
  }
}
