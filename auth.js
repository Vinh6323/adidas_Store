document.addEventListener("DOMContentLoaded", function () {
    const registerForm = document.getElementById("register-form");
    const loginForm = document.getElementById("login-form");

    // Xử lý đăng ký tài khoản
    if (registerForm) {
        registerForm.addEventListener("submit", function (e) {
            e.preventDefault();
            const fullName = document.getElementById("fullname").value;
            const email = document.getElementById("email").value;
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirm-password").value;

            if (password !== confirmPassword) {
                alert("Mật khẩu xác nhận không khớp!");
                return;
            }

            // Lấy danh sách tài khoản từ localStorage
            const users = JSON.parse(localStorage.getItem("users")) || [];
            const userExists = users.find(user => user.email === email);

            if (userExists) {
                alert("Email này đã được đăng ký!");
                return;
            }

            // Lưu thông tin tài khoản mới
            users.push({ fullName, email, password });
            localStorage.setItem("users", JSON.stringify(users));

            alert("Đăng ký thành công! Vui lòng đăng nhập.");
            window.location.href = "login.html"; // Chuyển hướng sang trang đăng nhập
        });
    }

    // Xử lý đăng nhập
    if (loginForm) {
        loginForm.addEventListener("submit", function (e) {
            e.preventDefault();
            const email = document.getElementById("login-email").value;
            const password = document.getElementById("login-password").value;

            // Lấy danh sách tài khoản từ localStorage
            const users = JSON.parse(localStorage.getItem("users")) || [];
            const validUser = users.find(user => user.email === email && user.password === password);

            if (validUser) {
                alert("Đăng nhập thành công!");
                localStorage.setItem("currentUser", JSON.stringify(validUser)); // Lưu user đăng nhập
                window.location.href = "home.html"; // Chuyển hướng sang trang chủ
            } else {
                alert("Email hoặc mật khẩu không đúng!");
            }
        });
    }
});
