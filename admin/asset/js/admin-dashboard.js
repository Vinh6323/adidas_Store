document.addEventListener("DOMContentLoaded", function () {
    // Lấy dữ liệu thống kê từ server hoặc backend giả lập
    const totalCustomers = 3;
    const totalOrders = 5;
    const totalStock = 100;
  
    document.getElementById("total-customers").textContent = totalCustomers;
    document.getElementById("total-orders").textContent = totalOrders;
    document.getElementById("total-stock").textContent = totalStock + " sản phẩm";
  });
  