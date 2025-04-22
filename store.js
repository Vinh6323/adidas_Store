// Hàm loại bỏ dấu tiếng Việt
function removeVietnameseTones(str) {
    return str
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .replace(/đ/g, "d")
        .replace(/Đ/g, "D");
}

// Xem sản phẩm chi tiết
function viewProduct(productId) {
    window.location.href = `product.html?id=${productId}`;
}

// Thêm vào giỏ hàng
function addToCart(productName, price, event) {
    event.stopPropagation();

    const product = {
        id: event.target.getAttribute("data-id"),
        name: productName,
        price: parseInt(price),
        image: event.target.getAttribute("data-image"),
        quantity: 1
    };

    let cart = JSON.parse(localStorage.getItem("cart")) || [];
    let existingProduct = cart.find(item => item.id === product.id);

    if (existingProduct) {
        existingProduct.quantity += 1;
    } else {
        cart.push(product);
    }

    localStorage.setItem("cart", JSON.stringify(cart));
    window.location.href = "cart.html";
}

// Lọc sản phẩm theo danh mục
function filterProducts() {
    let category = document.getElementById("categoryFilter").value;
    let products = document.querySelectorAll(".product");

    products.forEach(product => {
        let productCategory = product.getAttribute("data-category");
        product.style.display = category === "all" || category === productCategory ? "block" : "none";
    });
}

// Tìm kiếm sản phẩm theo từ khóa có dấu hoặc không dấu
function searchProduct() {
    let keyword = document.getElementById("searchBar").value.toLowerCase();
    let keywordNoTone = removeVietnameseTones(keyword);

    let products = document.querySelectorAll(".product");

    products.forEach(product => {
        let name = product.querySelector("h3").innerText.toLowerCase();
        let nameNoTone = removeVietnameseTones(name);

        let match = name.includes(keyword) || nameNoTone.includes(keywordNoTone);
        product.style.display = match ? "block" : "none";
    });
}

// Sắp xếp sản phẩm theo giá
function sortProducts() {
    let sortType = document.getElementById("sortPrice").value;
    let products = Array.from(document.querySelectorAll(".product"));
    let productGrid = document.querySelector(".product-grid");

    products.sort((a, b) => {
        let priceA = parseInt(a.getAttribute("data-price"));
        let priceB = parseInt(b.getAttribute("data-price"));
        if (sortType === "asc") return priceA - priceB;
        if (sortType === "desc") return priceB - priceA;
        return 0;
    });

    productGrid.innerHTML = "";
    products.forEach(p => productGrid.appendChild(p));
}