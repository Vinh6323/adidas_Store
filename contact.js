document.getElementById("contactForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Ngăn chặn load lại trang

    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const message = document.getElementById("message").value.trim();

    if (name === "" || email === "" || message === "") {
        alert("Vui lòng điền đầy đủ thông tin!");
        return;
    }

    alert(`Cảm ơn ${name}, tin nhắn của bạn đã được gửi!`);
    document.getElementById("contactForm").reset(); // Xóa dữ liệu nhập sau khi gửi
});
