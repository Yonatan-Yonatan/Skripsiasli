<?php
session_start();
// Membuat koneksi database
$conn = mysqli_connect("localhost:3308","root","","db_stockcosmetic");
// Registrasi akun Owner
if(isset($_POST['registrasi'])){
    $email = $_POST['email'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $role = $_POST['role'];
    // Cocokan dengan database, cari data
    $cekdatabase = mysqli_query($conn,"INSERT INTO login (username,email,password) VALUES ('$username','$email','$password')");
    // Hitung jumlah data
    if($cekdatabase){
        header('location:login.php');
        
    }else{
        header('location:register.php');
    }
}
//Check login owner, terdaftar atau tidak
// if (isset($_POST['login'])) {
//     $email = $_POST['email'];
//     $username = $_POST['username'];
//     $password = $_POST['password'];
//     $role = $_POST['role'];
//     // Cocokan dengan database, cari data
//     $cekdatabase = mysqli_query($conn, "SELECT * FROM login where username='$username' and password='$password'");
//     // Hitung jumlah data
//     $hitung = mysqli_num_rows($cekdatabase);
//     if ($hitung > 0) {
//         // Kalau data ditemukan
//         // $_SESSION['log']= 'TRUE';
//         $ambildatrole = mysqli_fetch_array($cekdatabase);
//         $role = $ambildatrole['role'];
//         if ($role == 'owner') {
//             // Kalau dia owner
//             $_SESSION['log'] = 'Logged';
//             $_SESSION['role'] = 'owner';
//             header('location: index.php'); //halaman utama
//         } else if ($role == 'manager') {
//             // Kalau bukan owner
//             $_SESSION['log'] = 'Logged';
//             $_SESSION['role'] = 'manager';
//             header('location: homemanager.php');
//         // } else if ($role == 'kepalagudang') {
//         //     //Kalau bukan manager
//         //     $_SESSION['log'] = 'Logged';
//         //     $_SESSION['role'] = 'kepalagudang';
//         //     header('location: homegudang.php');
//         // } else {
//         //     echo 'Data tidak ada';
//         // }
//         }
//     }
// };

// Menambah Data Sales 
if(isset($_POST['buttonsales'])){
    $namasales = $_POST['sales'];
    $supplier = $_POST['distributor'];
    $contact = $_POST['kontak'];
    $salessekarang = mysqli_query($conn,"INSERT INTO sales (nama,perusahaan,kontak)VALUES('$namasales','$supplier','$contact')");
    
    if($salessekarang){
        header('location:sales.php');
        
    }else{
        header('location:index.php');
    }
}

// Barang Masuk ke Gudang
if(isset($_POST['addnewbarang'])){
    $namabarang= $_POST['namabarang'];
    $jenisbarang= $_POST['jenisbarang'];
    $stock= $_POST['stock'];
    // $keterangan= $_POST['keterangan'];

    // Fungsi Menambah Gambar
    $allowed_extensions= array('png','jpg');
    $nama= $_FILES['file']['name']; //gambilnama gambar
    $dot = explode(".",$nama);
    $ekstensi = strtolower(end($dot)); //mengambil extensinya
    $ukuran = $_FILES['file']['size']; //ngambil size filenya
    $file_tmp= $_FILES['file']['tmp_name']; //ngamil lokasi filenya

    // Penamaan file untuk di encryption
    $image = md5(uniqid($nama,true)). time().'.'.$ekstensi; //mengabungkan nama file yang di enyrip dnegna ekstensinya

    if($hitung<1){
    // // Jika belom ada
    // Proses Upload Gambar
        if(in_array($ekstensi,$allowed_extensions)===true){
            // Validasi ukuran file
            if($ukuran <15000000){
            move_uploaded_file($file_tmp,'img/'.$image);
                $addtotable = mysqli_query($conn,"INSERT INTO stock (namabarang,jenisbarang,stock,gambar) VALUES ('$namabarang','$jenisbarang','$stock','$image')");
            if($addtotable){
                header('location:indexx.php'); 
             }else{
                 echo "Error";
                 header('location:indexx.php');
                }
            }else{
                // Jika filenya >= 1,5 mb
            echo'<script>
            alert("Ukuranya terlalu besar");
            window.location.href = "indexx.php"
            </script>';
            }
        } else{
            // Kalau formatnya bukan PNG
            echo'<script>
            alert("Harus  PNG &jpg !!");
            window.location.href = "indexx.php"
            </script>';
        }

    }else{
        // Jika Sudah ada
        echo'<script>
        alert("Nama barang sudah ada !!");
        window.location.href = "indexx.php"
        </script>';
    }
    
};

//Menambah Barang Masuk

if(isset($_POST['barangmasuk'])){
    $barangnya = $_POST['barangnya'];
    $penerima = $_POST['penerima'];
    $qty = $_POST['qty'];
    $info = $_POST['keterangan'];
   
    $cekstocksekarang = mysqli_query($conn,"SELECT * FROM stock WHERE idbarang='$barangnya'"); 
    $ambildatanya = mysqli_fetch_array($cekstocksekarang);
    $stocksekarang= $ambildatanya['stock'];
    $tambahkanstocksekarangdenganquantity = $stocksekarang+$qty;

    $addtomasuk = mysqli_query($conn,"INSERT INTO masuk (idbarang,penerima,qty) VALUES ('$barangnya','$penerima','$qty')");
    $updatestokmasuk = mysqli_query($conn," UPDATE stock set stock='$tambahkanstocksekarangdenganquantity' WHERE idbarang='$barangnya'");
    if($addtomasuk && $updatestokmasuk){
        header('location:barangmasuk.php');
    } else {
        echo 'gagal';
        header('location:indexx.php');
    }
}

// if(isset($_POST['daftarbarang'])){
//     $barangnya = $_POST['barangnya'];
//     $penerima = $_POST['penerima'];
//     $harga = $_POST['harga'];
//     $qty = $_POST['qty'];
   
//     $cekstocksekarang = mysqli_query($conn,"SELECT * FROM stock WHERE idbarang='$barangnya'"); 
//     $ambildatanya = mysqli_fetch_array($cekstocksekarang);
//     $stocksekarang= $ambildatanya['stock'];
//     $tambahkanstocksekarangdenganquantity = $stocksekarang+$qty;

//     $addtomasuk = mysqli_query($conn," INSERT INTO masuk (idbarang,penerima,harga) VALUES ('$barangnya','$penerima','$harga')");
//     $updatestokmasuk = mysqli_query($conn," UPDATE stock set stock='$tambahkanstocksekarangdenganquantity' WHERE idbarang='$barangnya'");
//     if($addtomasuk && $updatestokmasuk){
//         header('location:barangmasuk.php');
//     } else {
//         echo 'gagal';
//         header('location:index.php');
//     }
// }

//Menambah Barang keluar

if(isset($_POST['barangkeluar'])){
    $barangnya = $_POST['barangnya'];
    $penerima = $_POST['penerima'];
    $qty = $_POST['qty'];
    $status = $_POST['status'];
   
    $cekstocksekarang = mysqli_query($conn,"SELECT * FROM stock WHERE idbarang='$barangnya'"); 
    $ambildatanya = mysqli_fetch_array($cekstocksekarang);
    $stocksekarang= $ambildatanya['stock'];
    
    if($stocksekarang >= $qty){
        // Jika barangnya cukup untuk keluar
        $tambahkanstocksekarangdenganquantity = $stocksekarang-$qty;
        $addtokeluar = mysqli_query($conn," INSERT INTO keluar (idbarang,penerima,qty,status) VALUES ('$barangnya','$penerima','$qty','$status')");
        $updatestokmasuk = mysqli_query($conn," UPDATE stock set stock='$tambahkanstocksekarangdenganquantity' WHERE idbarang='$barangnya'");
        if($addtokeluar && $updatestokmasuk){
            header('location:TEST.php');
        } else {
            echo 'gagal';
            header('location:indexx.php');
        }
    }else{
        // Jika barang tidak cukup untuk keluar
        echo'
        <script>
            alert("Maaf Stock barang saat tidak mencukupi, lakukan sesuatu !");
            window.location.href = "barangkeluar.php"; 
        </script>';
    }
};

// Update Info Barang

if(isset($_POST['updatebarang'])){
    $idbarang = $_POST['idbarang'];
    $namabarang =$_POST['namabarang'];
    $jenisbarang =$_POST['jenisbarang'];

    // Fungsi Menambah Gambar
    $allowed_extensions= array('png','jpg');
    $nama= $_FILES['file']['name']; //gambilnama gambar
    $dot = explode(".",$nama);
    $ekstensi = strtolower(end($dot)); //mengambil extensinya
    $ukuran = $_FILES['file']['size']; //ngambil size filenya
    $file_tmp= $_FILES['file']['tmp_name']; //ngamil lokasi filenya
    // Penamaan file untuk di encryption
    $image = md5(uniqid($nama,true)). time().'.'.$ekstensi; //mengabungkan nama file yang di enyrip dnegna ekstensinya
    if($ukuran==0){
        // Jika tidak ingin upload
        $update = mysqli_query($conn,"UPDATE stock set namabarang='$namabarang',jenisbarang='$jenisbarang' WHERE idbarang='$idbarang'");
        if($update){
        header('location:indexx.php');
        } else {
            echo 'gagal';
            header('location:indexx.php');
        }
    }else{
        // Jika ingin Upload
        move_uploaded_file($file_tmp,'img/'.$image);
        $update = mysqli_query($conn,"UPDATE stock set namabarang='$namabarang',jenisbarang='$jenisbarang',gambar='$image' WHERE idbarang='$idbarang'");
        }if($update){
            header('location:indexx.php');
            } else {
                echo 'gagal';
                header('location:indexx.php');
            }
}

// Update Harga Barang

if(isset($_POST['updatehargabarang'])){
    $idbarang = $_POST['idbarang'];
    $namabarang =$_POST['namabarang'];
    $jenisbarang =$_POST['jenisbarang'];
    $hargabarang =$_POST['Harga'];
    $update = mysqli_query($conn,"UPDATE stock set namabarang='$namabarang',jenisbarang='$jenisbarang',Harga='$hargabarang' WHERE idbarang='$idbarang'");
    if($update){
        header('location:stockharga.php');
    } else {
        echo 'gagal';
        header('location:indexx.php');
    }
}

// Update Sales
if(isset($_POST['updatesales'])){
    $idsales = $_POST['idsales'];
    $nama =$_POST['nama'];
    $usaha =$_POST['perusahaan'];
    $kontak =$_POST['kontak'];

    $update = mysqli_query($conn,"UPDATE sales set nama='$nama',perusahaan='$usaha',kontak='$kontak' WHERE idsales='$idsales'");
    if($update){
        header('location:sales.php');
    } else {
        echo 'gagal';
        header('location:index.php');
    }
}
// new Harga Barang
if(isset($_POST['hargabarang'])){
    $namabarang= $_POST['namabarang'];
    $jenisbarang= $_POST['jenisbarang'];
    $hargabarang = $_POST['Harga'];
    // $stock= $_POST['stock'];
    // $keterangan= $_POST['keterangan'];

    $addtotable = mysqli_query($conn,"INSERT INTO stock (namabarang,jenisbarang,harga) VALUES ('$namabarang','$jenisbarang','$harga')");
    if($addtotable){
       header('location:.php'); 
    }else{
        echo "Error";
        header('location:index.php');
    }
}
// Menghapus Barang stock gudang
if(isset($_POST['hapusbarang'])){
    $idbarang = $_POST['idbarang'];
    $hapus = mysqli_query($conn, "DELETE FROM stock WHERE idbarang='$idbarang'");
    $image = mysqli_query($conn, "SELECT * FROM stock WHERE idbarang='$idbarang'");
    $get   = mysqli_fetch_array($image);
    $img   = 'img/'.$get['gambar'];
    unlink($img);
    
    if($hapus){
        header('location:indexx.php');
    } else {
        echo 'gagal';
    }
}

// //Mengubah Data Barang Masuk
// if(isset($_POST['updatebarangmasuk']))
// {
//     $idbarang = $_POST ['idbarang'];
//     $idm = $_POST ['idmasuk'];
//     $namabarang = $_POST ['namabarang'];
//     $jenisbarang= $_POST ['jenisbarang'];
//     $keterangan= $_POST ['penerima'];
//     $qty = $_POST ['qty'];

//     $lihatstock = mysqli_query($conn,"SELECT * FROM stock WHERE idbarang='$idbarang'"); //lihat stock
//     $stocknya = mysqli_fetch_array($lihatstock);// ambil datanya
//     $stockskrg= $stocknya['stock']; //jumlah stock sekarang
    
//     $lihatdataskrg= mysqli_query($conn,"SELECT * FROM masuk WHERE idmasuk='$idm'");//lihat qty saat ini
//     $qtynya = mysqli_fetch_array($lihatdataskrg);
//     $qtyskrg = $qtynya['qty']; //jumlah sekarang

//     if($qty >= $qtyskrg){ 
//         //ternyata inputan baru lebih besar jumlah masuknya, maka tambahi lagi stock barang
//         $selisih= $qty - $qtyskrg;
//         $tambahinstocknya= $stockskrg + $selisih;
//         $updatenya = mysqli_query($conn, "UPDATE stock set stock='$tambahinstocknya' WHERE idbarang='$idbarang'");
//         $kurangistocknya = mysqli_query($conn,"UPDATE masuk set qty='$qty',penerima='$keterangan' WHERE idmasuk='$idm'");

//         // Check apak ini berhasil
//         if($kurangistocknya&&$updatenya){
//             header('location :barangmasuk.php');
//         }else{
//             echo 'gagal say';
//             header('location:indexx.php');
//         };

//     }else {
//         //ternyata inputan baru lebih kecil jumlah masuknya, maka kurangi lagi stock barang
//         $selisih = $qtyskrg-$qty;
//         $kurangin = $stockskrg - $selisih;
//         $kurangistocknya = mysqli_query($conn,"UPDATE stock set stock='$kurangistocknya' WHERE idbarang='$idbarang'");
//         $updatenya = mysqli_query($conn, "UPDATE masuk set qty='$qty', penerima='$keterangan' WHERE idmasuk='$idm'");

//         if($kurangistocknya&&$updatenya){
//             header(' location:barangmasuk.php');
//         }else{
//             echo 'gagal say';
//             header(' location:indexx.php');
//         };
//     };
// };


// Test Update barang masuk
if(isset($_POST['updatebarangmasuk'])){
    $idm = $_POST['idmasuk']; //iddata
    $idbarang = $_POST['idbarang']; //idbarang
    $qty = $_POST['qty'];
    $keterangan = $_POST['penerima'];
    $lihatstock = mysqli_query($conn,"select * from stock where idbarang='$idbarang'"); //lihat stock barang itu saat ini
    $stocknya = mysqli_fetch_array($lihatstock); //ambil datanya
    $stockskrg = $stocknya['stock'];//jumlah stocknya skrg

    $lihatdataskrg = mysqli_query($conn,"select * from masuk where idmasuk='$idm'"); //lihat qty saat ini
    $preqtyskrg = mysqli_fetch_array($lihatdataskrg); 
    $qtyskrg = $preqtyskrg['qty'];//jumlah skrg

    if($qty >= $qtyskrg){
        //ternyata inputan baru lebih besar jumlah masuknya, maka tambahi lagi stock barang
        $hitungselisih = $qty-$qtyskrg;
        $tambahistock = $stockskrg+$hitungselisih;

        $queryx = mysqli_query($conn,"UPDATE stock set stock='$tambahistock' WHERE idbarang='$idbarang'");
        $updatedata1 = mysqli_query($conn,"UPDATE masuk set qty='$qty',penerima='$keterangan' WHERE idmasuk='$idm'");
        
        //cek apakah berhasil
        if ($updatedata1 && $queryx){
            echo " <div class='alert alert-success'>
                <strong>Success!</strong> Redirecting you back in 1 seconds.
            </div>
            <meta http-equiv='refresh' content='1; url= barangmasuk.php'/>  ";
            } else { echo "<div class='alert alert-warning'>
                <strong>Failed!</strong> Redirecting you back in 3 seconds.
            </div>
            <meta http-equiv='refresh' content='3; url= indexx.php'/> ";
            };

    } else {
        //ternyata inputan baru lebih kecil jumlah masuknya, maka kurangi lagi stock barang
        $hitungselisih = $qtyskrg-$qty;
        $kurangistock = $stockskrg-$hitungselisih;

        $query1 = mysqli_query($conn,"UPDATE stock set stock='$kurangistock' where idbarang='$idbarang'");

        $updatedata = mysqli_query($conn,"UPDATE masuk set  qty='$qty', penerima='$keterangan' WHERE idmasuk='$idm'");
        
        //cek apakah berhasil
        if ($query1 && $updatedata){

            echo " <div class='alert alert-success'>
                <strong>Success!</strong> Redirecting you back in 1 seconds.
            </div>
            <meta http-equiv='refresh' content='1; url= barangmasuk.php'/>  ";
            } else { echo "<div class='alert alert-warning'>
                <strong>Failed!</strong> Redirecting you back in 3 seconds.
            </div>
            <meta http-equiv='refresh' content='3; url= indexx.php'/> ";
            };

    };
    
};

//Mengubah Data Barang keluar
if(isset($_POST['updatebarangkeluar']))
{
    $idbarang = $_POST ['idbarang'];
    $idk = $_POST ['idkeluar'];
    $namabarang = $_POST ['namabarang'];
    $jenisbarang= $_POST ['jenisbarang'];
    $keterangan= $_POST ['penerima'];
    $qty = $_POST ['qty'];
    $info = $_POST ['keterangan'];
    $idm = $_POST ['idmasuk'];

    $lihatstock = mysqli_query($conn,"SELECT * FROM stock where idbarang='$idbarang'"); //lihat stock
    $stocknya = mysqli_fetch_array($lihatstock);// ambil datanya
    $stockskrg=$stocknya['stock']; //jumlah stocknya sekarang
    
    $qtyskrg= mysqli_query($conn,"SELECT * FROM keluar WHERE idkeluar='$idk'");//lihat qty saat ini
    $qtynya = mysqli_fetch_array($qtyskrg);
    $qtyskrg = $qtynya['qty']; //jumlah sekarang

    if($qty>=$qtyskrg){ 
        //ternyata inputan baru lebih besar jumlah masuknya, maka tambahi lagi stock barang
        $selisih=$qty-$qtyskrg;
        $kuranginstock= $stockskrg - $selisih;
        $updatenya = mysqli_query($conn, "UPDATE stock set stock='$kuranginstock', penerima='$keterangan' WHERE idkeluar='$idk'");
        $kurangistocknya = mysqli_query($conn,"UPDATE keluar set qty='$qty',penerima='$keterangan' WHERE idbarang='$idbarang'");

        if($kurangistocknya&&$updatenya){
            header('location :TEST.php');
        }else{
            echo 'gagal say';
            header('location:indexx.php');
        } 

    }else {
        //ternyata inputan baru lebih kecil jumlah keluarnya, maka tambahin lagi stock barang
        $selisih = $qtyskrg-$qty;
        $tambahinstock = $stockskrg + $selisih;
        $kurangistocknya = mysqli_query($conn,"UPDATE stock set stock='$tambahinstock' WHERE idbarang='$idbarang'");
        $updatenya = mysqli_query($conn, "UPDATE masuk set qty='$qty', penerima='$keterangan' WHERE idkeluar='$idk'");

        if($kurangistocknya&&$updatenya){
            header(' location:TEST.php');
        }else{
            echo 'gagal say';
            header(' location:indexx.php');
        }
    }
}

// Menghapus barang masuk 
if(isset($_POST['hapusbarangmasuk'])){
    $idbarang = $_POST['idbarang'];
    $idm = $_POST['idmasuk'];

    $lihatstock = mysqli_query($conn,"select * from stock where idbarang='$idbarang'"); //lihat stock barang itu saat ini
    $stocknya = mysqli_fetch_array($lihatstock); //ambil datanya
    $stockskrg = $stocknya['stock'];//jumlah stocknya skrg

    $lihatdataskrg = mysqli_query($conn,"select * from masuk where idmasuk='$idm'"); //lihat qty saat ini
    $preqtyskrg = mysqli_fetch_array($lihatdataskrg); 
    $qtyskrg = $preqtyskrg['qty'];//jumlah skrg

    $adjuststock = $stockskrg-$qtyskrg;

    $queryx = mysqli_query($conn,"update stock set stock='$adjuststock' where idbarang='$idbarang'");
    $del = mysqli_query($conn,"delete from masuk where idmasuk='$idm'");

    
    //cek apakah berhasil
    if ($queryx && $del){

        echo " <div class='alert alert-success'>
            <strong>Success!</strong> Redirecting you back in 1 seconds.
          </div>
        <meta http-equiv='refresh' content='1; url= barangmasuk.php'/>  ";
        } else { echo "<div class='alert alert-warning'>
            <strong>Failed!</strong> Redirecting you back in 1 seconds.
          </div>
         <meta http-equiv='refresh' content='1; url= indexx.php'/> ";
        }
};
?>