document.addEventListener("DOMContentLoaded", function () {
    const cartContainer = document.getElementById("cart-items");
    const totalPriceElement = document.getElementById("total-price");
    const checkoutButton = document.getElementById("checkout-btn");

    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    // Hàm hiển thị sản phẩm trong giỏ hàng
    function renderCart() {
        cartContainer.innerHTML = "";
        let totalPrice = 0;

        if (cart.length === 0) {
            cartContainer.innerHTML = `<tr><td colspan="6" style="text-align:center;">Giỏ hàng trống</td></tr>`;
            totalPriceElement.textContent = "0₫";
            return;
        }

        cart.forEach((item, index) => {
            totalPrice += item.price * item.quantity;

            let row = document.createElement("tr");
            row.innerHTML = `
                <td><img src="${item.image}" width="50"></td>
                <td>${item.name}</td>
                <td>${formatPrice(item.price)}</td>
                <td>
                    <button class="decrease" data-index="${index}">-</button>
                    <span class="quantity">${item.quantity}</span>
                    <button class="increase" data-index="${index}">+</button>
                </td>
                <td>${formatPrice(item.price * item.quantity)}</td>
                <td><button class="remove" data-index="${index}">Xóa</button></td>
            `;
            cartContainer.appendChild(row);
        });

        totalPriceElement.textContent = formatPrice(totalPrice);
        attachEventListeners();
    }

    // Hàm cập nhật lại giỏ hàng
    function updateCart() {
        localStorage.setItem("cart", JSON.stringify(cart));
        renderCart();
    }

    // Gán sự kiện cho các nút
    function attachEventListeners() {
        document.querySelectorAll(".increase").forEach(button => {
            button.addEventListener("click", function () {
                let index = this.getAttribute("data-index");
                cart[index].quantity += 1;
                updateCart();
            });
        });

        document.querySelectorAll(".decrease").forEach(button => {
            button.addEventListener("click", function () {
                let index = this.getAttribute("data-index");
                if (cart[index].quantity > 1) {
                    cart[index].quantity -= 1;
                } else {
                    cart.splice(index, 1);
                }
                updateCart();
            });
        });

        document.querySelectorAll(".remove").forEach(button => {
            button.addEventListener("click", function () {
                let index = this.getAttribute("data-index");
                cart.splice(index, 1);
                updateCart();
            });
        });

        // Xử lý khi bấm nút "xác nhận đơn hàng"
        if (checkoutButton) {
            checkoutButton.addEventListener("click", function () {
                if (cart.length === 0) {
                    alert("Giỏ hàng của bạn đang trống!");
                    return;
                }
                window.location.href = "order.html";
            });
        }
    }

    // Hàm định dạng tiền VND
    function formatPrice(price) {
        if (!price || isNaN(price)) return "0₫";  // Nếu price null hoặc không phải số, trả về "0₫"
        return price.toLocaleString("vi-VN") + "₫";
    }
    // Khởi động hiển thị giỏ hàng
    renderCart();
});
