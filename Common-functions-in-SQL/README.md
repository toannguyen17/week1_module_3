<br>
[Bài tập] Luyện tập các hàm thông dụng trong SQL
<br><br><br>

Cho bảng sau:
<br>

![Bai tap](https://raw.githubusercontent.com/toannguyen2/Common-functions-in-SQL/master/Screen%20Shot%202019-11-21%20at%2010.55.16%20AM.png)


<br>
- Viết câu lệnh hiện thị tất cả các dòng có tên là Huong
    
    SELECT * FROM `table`
    WHERE `ten` = 'HUONG';
    

<br>
- Viết câu lệnh lấy ra tổng số tiền của Huong
    
    SELECT *, SUM(`sotien`) as `tong_tien` FROM `table`
    WHERE `ten` = 'HUONG';
    

<br>
- Viết câu lệnh lấy ra tên danh sách của tất cả học viên, không trùng lặp
    
    SELECT * FROM `table`
    GROUP BY `ten`;
    
