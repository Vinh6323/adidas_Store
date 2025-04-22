document.addEventListener("DOMContentLoaded", function () {
    // Lấy tham số sản phẩm từ URL
    let params = new URLSearchParams(window.location.search);
    let productId = params.get("id");

    // Dữ liệu mẫu sản phẩm (có thể thay thế bằng API)
    let products = {
        "shoes1": {
            name: "Giày Samba OG",
            price: 2700000,
            desc: "Ra đời trên sân bóng, giày Samba là biểu tượng kinh điển của phong cách đường phố. Phiên bản này trung thành với di sản, thể hiện qua thân giày bằng da mềm, dáng thấp, nhã nhặn, các chi tiết phủ ngoài bằng da lộn và đế gum.",
            img: "images/shoes1.jpg"
        },
        "shoes2": {
            name: "Giày Superstar",
            price: 2600000,
            desc: "Đôi giày adidas Superstar iconic nay đã tái xuất. Trải nghiệm bề dày 50 năm lịch sử thể thao và phong cách đường phố với đôi giày sneaker cổ thấp này.",
            img: "images/shoes2.jpg"
        },
        "jacket1": {
            name: "Áo Khoác Colorblock Own The Run",
            price: 1800000,
            desc: "Không gì có thể cản bước bạn tìm đến cảm giác hưng phấn khi chạy bộ. Hãy diện chiếc áo khoác chạy bộ adidas này khi bạn cần che chắn tốt hơn vào những ngày se lạnh. Áo ôm sát cơ thể để bạn không bị phân tâm khi dốc sức nỗ lực, và có một túi khóa kéo để đựng điện thoại.",
            img: "images/aokhoac.jpg"
        },
        "pants1": {
            name: "Quần Short Tập Luyện Designed for Training",
            price: 1050000,
            desc: "Với thiết kế hỗ trợ vận động, chiếc quần short tập luyện dành cho nam này làm từ vải dệt siêu nhẹ. Công nghệ AEROREADY giúp bạn luôn khô ráo khi tập cardio cường độ cao và tập tạ. Các túi khóa kéo giữ an toàn cho các vật dụng thiết yếu để bạn chú tâm chinh phục mục tiêu.",
            img: "images/quan.jpg"
        },
        "socks1": {
            name: "Bộ 3 Đôi Tất Cao Cổ Có Đệm",
            price: 400000,
            desc: "Từ tập luyện hàng ngày cho đến những dịp trọng đại, đôi tất cao cổ adidas luôn cùng bạn vận động thoải mái. Tất ôm quanh vòm bàn chân và nâng đỡ những vùng chịu áp lực cao ở gót và mũi chân. Nhờ đó, bạn chỉ việc tập trung vào kết quả, bất kể là chạy bộ, nâng tạ hay chơi thể thao.",
            img: "images/tat.jpg"
        },
        "shoes3": {
            name: "Giày Campus 00s - trắng",
            price: 2600000,
            desc: "Dù ra mắt trên sân bóng rổ nhưng dòng giày adidas Campus đã nhanh chóng được ưa chuộng ở khắp mọi nơi. Ở phiên bản này, chúng tôi biến hóa kiểu dáng biểu tượng ấy theo một hướng mới và kết hợp các chất liệu, màu sắc và tỷ lệ thiết kế hiện đại.",
            img: "images/giay.jpg"
        },
        "jacket2": {
            name: "adidas XPL 2.5L ANORAK - xám",
            price: 3500000,
            desc: "Áo khoác Adidas phong cách thể thao, giữ ấm trong mùa lạnh.",
            img: "images/aokhoac1.jpg"
        },
        "jacket3": {
            name: "Áo Thun Own the Run",
            price: 750000,
            desc: "Tự tin chạy bộ trong chiếc áo thun này. Trong khi đang nỗ lực chinh phục mốc tiếp theo, công nghệ AEROREADY đánh bay hơi ẩm sẽ giúp bạn luôn cảm thấy khô ráo và tập trung vào mục tiêu phía trước. ",
            img: "images/ao.jpg"
        },
        "pants2": {
            name: "Quần Có Túi 3 Sọc Future Icons",
            price: 1800000,
            desc: "Những ngày thảnh thơi cũng như dịp cuối tuần đều đòi hỏi diện mạo và cảm giác đơn giản mà phong cách của chiếc quần adidas này. Làm từ chất vải pha cotton mềm mại, quần có các túi khóa kéo để đựng các vật dụng thiết yếu khi di chuyển. 3 Sọc iconic vắt chéo ống quần cho phong cách thể thao đặc trưng.",
            img: "images/quan1.jpg"
        },
        "pants3": {
            name: "Quần Short Tiro 23 League - đen",
            price: 750000,
            desc: "Dành cho bộ môn thể thao vua. Chiếc quần short adidas Tiro 23 League này kết hợp chất vải mềm mại, co giãn và công nghệ AEROREADY thấm hút ẩm giúp bạn kiểm soát sân bóng vào mỗi cuối tuần. Logo 3 Bar thêu và vòng 3 Sọc đục lỗ đảm bảo bạn sẽ luôn tuyệt vời từ diện mạo cho tới cảm giác mỗi khi bước qua vạch trắng.",
            img: "images/quan2.jpg"
        },
        "socks2": {
            name: "Bộ 2 Đôi Tất Cổ Cao adidas Originals x Made by Nelson",
            price: 450000,
            desc: "Bất kể đi làm hay đi chơi, mẫu tất cổ cao adidas này sẽ mang đến cảm giác dễ chịu và nâng đỡ đôi chân bạn. Chất vải dệt kim mềm mại và linh hoạt, cùng cổ tất bo gân đảm bảo độ ôm vừa khít và cố định. Họa tiết graphic thêu sặc sỡ đến từ Made by Nelson tôn vinh tinh thần yêu thương bản thân và sự tử tế dành cho tất cả mọi người.",
            img: "images/tat1.jpg"
        },
        "socks3": {
            name: "Tất Graphic Tết",
            price: 200000,
            desc: "Thể hiện tinh thần mãnh hổ trong bạn khi tập luyện với đôi tất cao cổ adidas này. Thiết kế pha cotton co giãn với phần mũi chân và gót chân lót đệm giúp đôi chân bạn luôn dễ chịu suốt những bài tập nặng đô nhất. Họa tiết graphic táo bạo mang cảm hứng Tết Nguyên Đán hoàn thiện phong cách.",
            img: "images/tat2.jpg"
        }
    };

    // Hiển thị thông tin sản phẩm dựa trên productId
    if (products[productId]) {
        document.getElementById("product-name").innerText = products[productId].name;
        document.getElementById("product-price").innerText = products[productId].price.toLocaleString();
        document.getElementById("product-desc").innerText = products[productId].desc;
        document.getElementById("product-img").src = products[productId].img;
    }
});

// Thêm sản phẩm vào giỏ hàng từ trang chi tiết sản phẩm
function addToCartFromProduct() {
    let name = document.getElementById("product-name").innerText;
    let price = parseInt(document.getElementById("product-price").innerText.replace(/\./g, ""));
    
    addToCart(name, price);
}
