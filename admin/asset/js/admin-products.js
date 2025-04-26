document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("product-form");
    const productList = document.getElementById("product-list");
  
    const idField = document.getElementById("product-id");
    const nameField = document.getElementById("product-name");
    const priceField = document.getElementById("product-price");
    const stockField = document.getElementById("product-stock");
    const statusField = document.getElementById("product-status");
    const editIndexField = document.getElementById("edit-index");
  
    let products = JSON.parse(localStorage.getItem("products")) || [];
  
    function saveToLocal() {
      localStorage.setItem("products", JSON.stringify(products));
    }
  
    function render() {
      productList.innerHTML = "";
      products.forEach((p, i) => {
        productList.innerHTML += `
          <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>${parseInt(p.price).toLocaleString()}₫</td>
            <td>${p.stock}</td>
            <td>${p.status}</td>
            <td>
              <button onclick="editProduct(${i})">Sửa</button>
              <button onclick="deleteProduct(${i})">Xóa</button>
              <button onclick="toggleStatus(${i})">Đổi trạng thái</button>
            </td>
          </tr>
        `;
      });
    }
  
    window.editProduct = function (index) {
      const p = products[index];
      idField.value = p.id;
      nameField.value = p.name;
      priceField.value = p.price;
      stockField.value = p.stock;
      statusField.value = p.status;
      editIndexField.value = index;
    };
  
    window.deleteProduct = function (index) {
      if (confirm("Xác nhận xóa sản phẩm này?")) {
        products.splice(index, 1);
        saveToLocal();
        render();
      }
    };
  
    window.toggleStatus = function (index) {
      products[index].status = products[index].status === "Còn hàng" ? "Hết hàng" : "Còn hàng";
      saveToLocal();
      render();
    };
  
    form.addEventListener("submit", e => {
      e.preventDefault();
      const newProduct = {
        id: idField.value,
        name: nameField.value,
        price: parseInt(priceField.value),
        stock: parseInt(stockField.value),
        status: statusField.value
      };
  
      const index = editIndexField.value;
      if (index === "") {
        products.push(newProduct);
      } else {
        products[index] = newProduct;
      }
  
      saveToLocal();
      form.reset();
      editIndexField.value = "";
      render();
    });
  
    render();
  });
  