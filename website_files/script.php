<?php
    if(!empty($_GET['room'])) {
        $room = $_GET['room'];
        $conn = new mysqli('baza', 'user', 'qqGbtlAQxlnHJe4YLjLN', 'sali_libere');
        $query = "SELECT id_room FROM free_rooms WHERE room_nr=$room";
        $result = $conn->query($query);
        $result = $result->fetch_assoc();
        var_dump($result);
    }
?>