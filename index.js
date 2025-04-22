function viewProduct(productId) {
    alert(`Mở thông tin sản phẩm: ${productId}`);
    // Ở đây có thể chuyển hướng sang trang chi tiết sản phẩm
}

function addToCart(productName, price, event) {
    event.stopPropagation(); // Ngăn chặn gọi viewProduct()
    alert(`Đã thêm "${productName}" vào giỏ hàng!`);
}
// Điều hướng sang trang sản phẩm với ID sản phẩm
function viewProduct(productId) {
    window.location.href = `product.html?id=${productId}`;
}

// Thêm vào giỏ hàng
function addToCart(productName, productPrice) {
    let cart = JSON.parse(localStorage.getItem("cart")) || [];
    cart.push({ name: productName, price: productPrice });
    localStorage.setItem("cart", JSON.stringify(cart));
    alert(productName + " đã được thêm vào giỏ hàng!");
}

// Tìm kiếm sản phẩm
function searchProduct() {
    let searchInput = document.getElementById("searchInput").value.toLowerCase();
    let products = document.querySelectorAll(".product");

    products.forEach((product) => {
        let productName = product.querySelector("h3").innerText.toLowerCase();
        if (productName.includes(searchInput)) {
            product.style.display = "block";
        } else {
            product.style.display = "none";
        }
    });
}
