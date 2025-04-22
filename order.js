document.addEventListener("DOMContentLoaded", function () {
    const orderItemsContainer = document.getElementById("order-items");
    const orderTotalElement = document.getElementById("order-total");
    const completeOrderBtn = document.getElementById("complete-order-btn");

    // Lấy dữ liệu giỏ hàng từ localStorage
    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    // Hàm hiển thị hóa đơn mua hàng
    function renderOrder() {
        orderItemsContainer.innerHTML = "";
        let total = 0;

        if (cart.length === 0) {
            orderItemsContainer.innerHTML = `<tr><td colspan="5" style="text-align:center;">Giỏ hàng trống</td></tr>`;
            orderTotalElement.textContent = "0 VNĐ";
            return;
        }

        cart.forEach(item => {
            let row = document.createElement("tr");
            let itemTotal = item.price * item.quantity;
            total += itemTotal;

            row.innerHTML = `
                <td><img src="${item.image}" alt="${item.name}" width="50"></td>
                <td>${item.name}</td>
                <td>${formatPrice(item.price)}</td>
                <td>${item.quantity}</td>
                <td>${formatPrice(itemTotal)}</td>
            `;
            orderItemsContainer.appendChild(row);
        });

        orderTotalElement.textContent = formatPrice(total);
    }

    function formatPrice(price) {
        return price.toLocaleString("vi-VN") + " VNĐ";
    }

    completeOrderBtn.addEventListener("click", function () {
        if (cart.length === 0) {
            alert("Giỏ hàng của bạn trống!");
            return;
        }

        // Lấy thông tin khách hàng từ form
        const fullname = document.getElementById("fullname").value.trim();
        const phone = document.getElementById("phone").value.trim();
        const paymentMethod = document.getElementById("payment-method").value;

        if (fullname === "" || phone === "") {
            alert("Vui lòng nhập đầy đủ thông tin khách hàng!");
            return;
        }

        // Tạo đối tượng đơn hàng
        const order = {
            customer: {
                fullname: fullname,
                phone: phone,
                paymentMethod: paymentMethod
            },
            items: cart,
            total: orderTotalElement.textContent
        };

        // Lưu đơn hàng vào localStorage (hoặc gửi qua backend)
        localStorage.setItem("order", JSON.stringify(order));
        // Xóa giỏ hàng sau khi đặt hàng
        localStorage.removeItem("cart");

        alert("Đơn hàng của bạn đã được đặt thành công!");
        window.location.href = "success.html";
    });

    renderOrder();
});
