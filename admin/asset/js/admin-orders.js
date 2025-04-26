document.addEventListener("DOMContentLoaded", function () {
    const orders = [
      { id: "DH001", customer: "Nguyễn Văn A", product: "Giày Samba OG", total: 2700000, status: "Chờ xác nhận" },
      { id: "DH002", customer: "Trần Thị B", product: "Áo Khoác Colorblock Own The Run", total: 1800000, status: "Đã xác nhận" }
    ];
  
    const tbody = document.getElementById("order-list");
  
    function renderOrders() {
      tbody.innerHTML = "";
      orders.forEach((order, index) => {
        tbody.innerHTML += `
          <tr>
            <td>${order.id}</td>
            <td>${order.customer}</td>
            <td>${order.product}</td>
            <td>${order.total.toLocaleString()}₫</td>
            <td>${order.status}</td>
            <td>
              ${order.status === "Chờ xác nhận" ? `<button onclick="approveOrder(${index})">Duyệt</button>` : ""}
              <button onclick="cancelOrder(${index})">Hủy</button>
              <button onclick="exportInvoice('${order.id}')">Xuất HĐ</button>
            </td>
          </tr>`;
      });
    }
  
    window.approveOrder = function (index) {
      orders[index].status = "Đã xác nhận";
      renderOrders();
      alert("Đơn hàng đã được duyệt!");
    };
  
    window.cancelOrder = function (index) {
      if (confirm("Bạn có chắc muốn hủy đơn hàng này?")) {
        orders.splice(index, 1);
        renderOrders();
      }
    };
  
    window.exportInvoice = function (orderId) {
      alert(`Hóa đơn cho đơn hàng ${orderId} đang được xử lý...`);
    };
  
    renderOrders();
  });
  