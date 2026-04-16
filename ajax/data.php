<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$karyawan = [
    ['nama' => 'Kim Jisoo',    'pekerjaan' => 'UI/UX Designer',    'lokasi' => 'Seoul'],
    ['nama' => 'Park Minjun',  'pekerjaan' => 'Backend Developer', 'lokasi' => 'Busan'],
    ['nama' => 'Lee Seoyeon',  'pekerjaan' => 'Product Manager',   'lokasi' => 'Incheon'],
    ['nama' => 'Choi Taehyun', 'pekerjaan' => 'Data Scientist',    'lokasi' => 'Daejeon'],
    ['nama' => 'Jung Yuna',    'pekerjaan' => 'DevOps Engineer',   'lokasi' => 'Gwangju'],
];

echo json_encode($karyawan);
?>