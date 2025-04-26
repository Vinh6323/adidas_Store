document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("customer-form");
    const nameInput = document.getElementById("customer-name");
    const emailInput = document.getElementById("customer-email");
    const idInput = document.getElementById("customer-id");
    const customerList = document.getElementById("customer-list");
    const searchInput = document.getElementById("search-customer");
  
    let customers = JSON.parse(localStorage.getItem("customers")) || [];
  
    function renderCustomers(data = customers) {
      customerList.innerHTML = "";
      data.forEach((customer, index) => {
        const row = document.createElement("tr");
        row.innerHTML = `
          <td>${index + 1}</td>
          <td>${customer.name}</td>
          <td>${customer.email}</td>
          <td>
            <button onclick="editCustomer(${index})">Sửa</button>
            <button onclick="deleteCustomer(${index})">Xóa</button>
          </td>`;
        customerList.appendChild(row);
      });
    }
  
    window.editCustomer = function(index) {
      const c = customers[index];
      idInput.value = index;
      nameInput.value = c.name;
      emailInput.value = c.email;
    };
  
    window.deleteCustomer = function(index) {
      if (confirm("Bạn có chắc muốn xóa khách hàng này?")) {
        customers.splice(index, 1);
        localStorage.setItem("customers", JSON.stringify(customers));
        renderCustomers();
      }
    };
  
    form.addEventListener("submit", function(e) {
      e.preventDefault();
      const newCustomer = {
        name: nameInput.value.trim(),
        email: emailInput.value.trim(),
      };
  
      const id = idInput.value;
      if (id !== "") {
        customers[id] = newCustomer;
      } else {
        customers.push(newCustomer);
      }
  
      localStorage.setItem("customers", JSON.stringify(customers));
      form.reset();
      renderCustomers();
    });
  
    searchInput.addEventListener("input", () => {
      const keyword = searchInput.value.toLowerCase();
      const filtered = customers.filter(c =>
        c.name.toLowerCase().includes(keyword) || c.email.toLowerCase().includes(keyword)
      );
      renderCustomers(filtered);
    });
  
    renderCustomers();
  });
  